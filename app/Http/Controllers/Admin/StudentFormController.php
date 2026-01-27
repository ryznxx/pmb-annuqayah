<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\CustomField;
use App\Models\StudyProgram;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class StudentFormController extends Controller
{
  //
  public function show(int $id)
  {
    $user = User::with([
      'identity',
      'registration',
      'registration.studentDetails',
      'registration.studentProfile',
      'registration.studentFamily',
      'validity',
    ])->findOrFail($id);

    $isLocked = false;

    $studyPrograms = StudyProgram::query()
      ->where('is_active', true)
      ->select('id', 'name', 'faculty')
      ->get();

    $customFields = CustomField::query()
      ->where('category', 'registration')
      ->orderBy('order')
      ->get();

    return view('admin.pendaftar.form.show', compact(
      'user',
      'customFields',
      'studyPrograms',
      'isLocked'
    ));
  }


  // Tambahkan $id di parameter fungsi
  public function store(Request $request, $id)
  {
    // Cari user berdasarkan ID dari URL Route
    $user = User::findOrFail($id);

    $request->validate([
      'full_name'   => 'required|string|max:255',
      'birth_date'  => 'nullable|date',
      'graduation_year' => 'nullable|numeric',
    ]);

    return DB::transaction(function () use ($request, $user) {

      // --- LOGIKA RANDOM ANTI-DUPLICATE NIK ---
      $finalNIK = $request->nik_identity;

      // Cek apakah NIK sudah dipakai orang lain
      $isUsed = \App\Models\Identity::where('nik', $finalNIK)
        ->where('user_id', '!=', $user->id)
        ->exists();

      // Jika NIK kosong atau sudah dipakai, buatkan random
      if (!$finalNIK || $isUsed) {
        $finalNIK = '10' . mt_rand(10000000000000, 99999999999999);
      }

      // 1. Update/Create Identity
      $user->identity()->updateOrCreate(['user_id' => $user->id], [
        'full_name'   => $request->full_name ?? $user->name,
        'nik'         => $finalNIK,
        'birth_place' => $request->birth_place ?? 'Default City',
        'birth_date'  => $request->birth_date ?? '2000-01-01',
        'gender'      => $request->gender ?? 'L',
      ]);

      // --- LOGIKA RANDOM NOMOR PESERTA ---
      $participantNumber = $request->participant_number;
      if (!$participantNumber) {
        $participantNumber = 'REG-' . date('Y') . mt_rand(1000, 9999);
      }

      // 2. Update/Create Registration
      $user->registration()->updateOrCreate(['user_id' => $user->id], [
        'entry_path'         => $request->entry_path ?? 'MANDIRI',
        'participant_number' => $participantNumber,
        'school_origin'      => $request->school_origin ?? 'SMA DEFAULT',
        'graduation_year'    => $request->graduation_year ?? date('Y'),
        'study_program_id'   => $request->study_program ?? 1,
        'nim'                => $request->nim, // Tambahkan NIM jika ada inputnya
      ]);

      // Simpan custom fields jika fungsi ini ada
      if (method_exists($this, 'saveCustomFields')) {
        $this->saveCustomFields($request, 'registration');
      }

      return redirect()->route('admin.pendaftar.edit.show', $user->id)
        ->with('success', 'Data berhasil diperbarui' . ($isUsed ? ' (NIK diganti random karena duplikat)' : ''));
    });
  }
}

<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\CustomField;
use App\Models\StudyProgram;
use Illuminate\Http\Request;
use App\Models\User;

class StudentFormController extends Controller
{
  //
  public function show(int $id)
  {
    $user = User::with([
      'identity',
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


  public function store()
  {
    //
  }
}

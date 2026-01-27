<?php

namespace App\Exports;

use App\Models\Registration;
use Maatwebsite\Excel\Concerns\FromQuery; // Ubah ke FromQuery
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class CalonMahasiswaExport implements FromQuery, WithHeadings, WithMapping
{
  protected $type;
  protected $periodId;

  // Terima parameter tipe laporan dan periode dari Controller
  public function __construct($type, $periodId)
  {
    $this->type = $type;
    $this->periodId = $periodId;
  }

  public function query()
  {
    $query = Registration::query()
      ->with(['user.identity', 'studyProgram', 'user.validity', 'user.examSession'])
      ->where('registration_period_id', $this->periodId);

    return match ($this->type) {
      'acc' => $query->whereHas('user.validity', fn($q) => $q->where('is_data_valid', 1)),
      'pending_acc' => $query->whereHas('user.validity', fn($q) => $q->where('is_data_valid', 0)),
      'cbt_done' => $query->whereHas('user.examSession', fn($q) => $q->where('status', 'done')),
      'cbt_pending' => $query->whereDoesntHave('user.examSession', fn($q) => $q->where('status', 'done')),
      'diterima' => $query->whereHas('user.validity', fn($q) => $q->where('final_status', 'valid')),
      'tidak_diterima' => $query->whereHas('user.validity', fn($q) => $q->where('final_status', 'invalid')),
      default => $query,
    };
  }

  public function headings(): array
  {
    return ['No. Pendaftaran', 'Nama Lengkap', 'NIK', 'Prodi', 'Asal Sekolah', 'Tahun Lulus', 'Status Verifikasi'];
  }

  public function map($registration): array
  {
    return [
      $registration->participant_number ?? '-',
      $registration->user->identity->full_name ?? $registration->user->name,
      $registration->user->identity->nik ?? $registration->user->nik,
      $registration->studyProgram->name ?? '-',
      $registration->school_origin,
      $registration->graduation_year,
      $registration->user->validity->is_data_valid ? 'Terverifikasi' : 'Belum Verifikasi',
    ];
  }
}

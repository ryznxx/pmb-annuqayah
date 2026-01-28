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
    $this->periodId = (int) $periodId;
  }

  public function query()
  {
    $query = Registration::query()
      ->with(['user.identity', 'studyProgram', 'user.validity', 'user.examSession']);

    // Jika periodId ada isinya dan bukan 'all', baru difilter
    if (!empty($this->periodId) && $this->periodId !== 'all') {
      $query->where('registration_period_id', $this->periodId);
    }

    return match ($this->type) {
      'acc'           => $query->whereHas('user.validity', fn($q) => $q->where('is_data_valid', 1)),
      'pending_acc'   => $query->whereHas('user.validity', fn($q) => $q->where('is_data_valid', 0)),
      'cbt_done'      => $query->whereHas('user.examSession', fn($q) => $q->where('status', 'done')),
      'cbt_pending'   => $query->whereDoesntHave('user.examSession', fn($q) => $q->where('status', 'done')),
      'diterima'       => $query->where('status_kelulusan', 'lulus'),
      'tidak_diterima' => $query->where('status_kelulusan', 'tidak_lulus'),
      default         => $query,
    };
  }
  //
  public function headings(): array
  {
    return ['No. Pendaftaran', 'Nama Lengkap', 'NIK', 'Prodi', 'Asal Sekolah', 'Tahun Lulus', 'Status Verifikasi'];
  }

  public function map($registration): array
  {
    return [
      $registration->participant_number ?? '-',
      // Gunakan ?-> agar jika identity null, tidak error crash
      $registration->user->identity?->full_name ?? $registration->user->name ?? '-',
      $registration->user->identity?->nik ?? $registration->user->nik ?? '-',
      $registration->studyProgram?->name ?? '-',
      $registration->school_origin ?? '-',
      $registration->graduation_year ?? '-',
      // INI DIA TERSANGKANYA: Tambahkan ?-> sebelum is_data_valid
      ($registration->user->validity?->is_data_valid) ? 'Terverifikasi' : 'Belum Verifikasi',
    ];
  }
}

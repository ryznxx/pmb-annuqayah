<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\RegistrationPeriod;
use App\Models\Payment;

class DashboardPayment extends Controller
{
  public function index(Request $request)
  {
    $search = $request->input('search');
    $activeWave = RegistrationPeriod::where('is_active', true)->first();

    // Pastikan pakai PAGINATE, bukan GET
    $allPayments = Payment::with(['user.validity'])
      ->when($search, function ($query) use ($search) {
        $query->whereHas('user', function ($q) use ($search) {
          $q->where('name', 'like', "%{$search}%")
            ->orWhere('email', 'like', "%{$search}%");
        })->orWhere('account_name', 'like', "%{$search}%");
      })
      ->latest()
      ->paginate(10) // Ini yang membuat ->links() bisa bekerja
      ->withQueryString();

    return view('admin.pembayaran.index', compact('activeWave', 'allPayments'));
  }

  public function updateStatus(Request $request, $id)
  {
    $request->validate([
      'status' => 'required|in:valid,invalid',
      'admin_note' => 'nullable|string|max:255'
    ]);

    // Cari data pembayaran berdasarkan ID
    $payment = Payment::findOrFail($id);

    // Update atau buat status di tabel Validities lewat relasi User
    // Ini akan otomatis mengisi user_id sesuai pemilik pembayaran
    $payment->user->validity()->updateOrCreate(
      ['user_id' => $payment->user_id],
      [
        'final_status' => $request->status,
        'admin_note' => $request->admin_note,
        'verified_at' => now(),
      ]
    );

    return back()->with('success', 'Status pembayaran ' . $payment->user->name . ' berhasil diperbarui.');
  }
}

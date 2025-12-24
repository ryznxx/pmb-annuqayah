<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
  return view('welcome');
})->name('welcome');

Route::get('/pembuka', function () {
  return view('pembuka');
})->middleware(['auth', 'verified'])->name('pembuka');

Route::middleware(['auth', 'verified'])->group(function () {
  Route::get('/formulir', function () {
    return view('camaba.formulir.index');
  })->name('formulir');
  Route::get('/formulir/pembayaran', function () {
    return view('camaba.formulir.payment');
  })->name('formulir.pembayaran');
  Route::get('/formulir/isi-form', function () {
    return view('camaba.formulir.create');
  })->name('isi-formulir');
  Route::get('/formulir/isi-form/upload-dokumen', function () {
    return view('camaba.formulir.dokumen');
  })->name('isi-dokumen');
});

Route::middleware(['auth', 'verified', 'admin'])
  ->prefix('admin')
  ->name('admin.')
  ->group(function () {
    Route::get('/dashboard', function () {
      return view('admin.dashboard.index');
    })->name('dashboard');
    Route::get('/dashboard/list-pendaftar', function () {
      return view('admin.dashboard.pendaftar.index');
    })->name('dashboard.pendaftar');
  });

Route::middleware('auth')->group(function () {
  Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
  Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
  Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__ . '/auth.php';

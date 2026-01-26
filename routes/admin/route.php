<?php

use App\Http\Controllers\Admin\StudentFormController;
use Illuminate\Support\Facades\Route;

Route::get('camaba/edit/{id}', [StudentFormController::class, 'show'])
  ->whereNumber('id')
  ->name('pendaftar.edit.show');

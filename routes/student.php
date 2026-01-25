<?php

use App\Http\Controllers\Student\StudentFormController;
use Illuminate\Support\Facades\Route;

Route::resource("/formulir/isi-form", StudentFormController::class)->names("student")->only("index", "store");

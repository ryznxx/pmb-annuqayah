<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
  public function up(): void
  {
    Schema::table('registrations', function (Blueprint $table) {
      $table->enum('status_kelulusan', ['lulus', 'tidak_lulus', 'pending'])->default('pending');
    });
  }


  public function down(): void
  {
    Schema::table('registrations', function (Blueprint $table) {
      $table->dropColumn('status_kelulusan');
    });
  }
};

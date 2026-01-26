<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
  public function up(): void
  {
    Schema::table('registrations', function (Blueprint $table) {
      // Menambahkan kolom pilihan kedua setelah pilihan pertama
      $table->foreignId('study_program_id_second')
        ->nullable()
        ->after('study_program_id')
        ->constrained('study_programs') // Harus sebutkan nama tabelnya secara eksplisit
        ->onDelete('cascade');
    });
  }

  public function down(): void
  {
    Schema::table('registrations', function (Blueprint $table) {
      $table->dropForeign(['study_program_id_second']);
      $table->dropColumn('study_program_id_second');
    });
  }
};

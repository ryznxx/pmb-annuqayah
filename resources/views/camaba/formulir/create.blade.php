<x-app-layout>
  <x-subnavbarmaba />
  <div class="min-h-screen bg-slate-50 py-10 px-4">
    <div class="max-w-7xl mx-auto">

      <div class="mb-8 flex gap-4 p-4 bg-amber-50 border border-amber-200 rounded-2xl">
        <span class="material-symbols-outlined text-amber-600">info</span>
        <p class="text-sm text-amber-800">
          Pastikan data yang Anda masukkan sesuai dengan <strong>KTP/KK</strong> dan <strong>Ijazah</strong> terakhir.
          Data ini akan digunakan untuk proses verifikasi nasional.
        </p>
      </div>

      <form action="#" method="POST" class="space-y-8">
        @csrf

        <div class="bg-white rounded-3xl border border-slate-200 shadow-sm overflow-hidden">
          <div class="p-6 border-b border-slate-100 bg-slate-50/50">
            <h2 class="text-lg font-bold text-slate-800 flex items-center gap-2">
              <span class="material-symbols-outlined text-indigo-500">person</span>
              Identitas Pribadi
            </h2>
          </div>
          <div class="p-8 grid grid-cols-1 md:grid-cols-2 gap-6">
            <div class="md:col-span-2">
              <label class="block text-sm font-semibold text-slate-700 mb-2">Nama Lengkap (Sesuai Ijazah)</label>
              <input type="text" name="nama" placeholder="Masukkan nama lengkap"
                class="w-full px-4 py-3 rounded-xl border-slate-200 focus:border-indigo-500 focus:ring-indigo-500 transition-all">
            </div>

            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">NIK (Sesuai KTP)</label>
              <input type="number" name="nik" placeholder="16 digit NIK"
                class="w-full px-4 py-3 rounded-xl border-slate-200 focus:border-indigo-500 focus:ring-indigo-500 transition-all">
            </div>

            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">Tempat Lahir</label>
              <input type="text" name="tempat_lahir" placeholder="Kota Kelahiran"
                class="w-full px-4 py-3 rounded-xl border-slate-200 focus:border-indigo-500 focus:ring-indigo-500 transition-all">
            </div>

            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">Tanggal Lahir</label>
              <input type="date" name="tanggal_lahir"
                class="w-full px-4 py-3 rounded-xl border-slate-200 focus:border-indigo-500 focus:ring-indigo-500 transition-all">
            </div>

            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">Jenis Kelamin</label>
              <select name="jk"
                class="w-full px-4 py-3 rounded-xl border-slate-200 focus:border-indigo-500 focus:ring-indigo-500 transition-all">
                <option value="">Pilih Jenis Kelamin</option>
                <option value="L">Laki-laki</option>
                <option value="P">Perempuan</option>
              </select>
            </div>
          </div>
        </div>

        <div class="bg-white rounded-3xl border border-slate-200 shadow-sm overflow-hidden">
          <div class="p-6 border-b border-slate-100 bg-slate-50/50">
            <h2 class="text-lg font-bold text-slate-800 flex items-center gap-2">
              <span class="material-symbols-outlined text-indigo-500">school</span>
              Jalur Masuk & Asal Sekolah
            </h2>
          </div>
          <div class="p-8 grid grid-cols-1 md:grid-cols-2 gap-6">

            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">Jalur Pendaftaran</label>
              <select name="jalur_masuk"
                class="w-full px-4 py-3 rounded-xl border-slate-200 focus:border-indigo-500 focus:ring-indigo-500 transition-all">
                <option value="">Pilih Jalur Masuk</option>
                <option value="SNBP">SNBP (Prestasi)</option>
                <option value="SNBT">SNBT (Tes Tulis)</option>
                <option value="MANDIRI">Mandiri</option>
                <option value="PRESTASI">Jalur Prestasi Akademik/Minat</option>
                <option value="BEASISWA">Beasiswa KIP-K / Institusi</option>
              </select>
            </div>

            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">Nomor Peserta (Jika Ada)</label>
              <input type="text" name="nomor_ujian" placeholder="Contoh: 212-001-234"
                class="w-full px-4 py-3 rounded-xl border-slate-200 focus:border-indigo-500 focus:ring-indigo-500 transition-all">
            </div>

            <div class="md:col-span-2">
              <label class="block text-sm font-semibold text-slate-700 mb-2">Nama Sekolah Asal (SMA/SMK/MA)</label>
              <input type="text" name="sekolah" placeholder="Contoh: SMAN 1 Jakarta"
                class="w-full px-4 py-3 rounded-xl border-slate-200 focus:border-indigo-500 focus:ring-indigo-500 transition-all">
            </div>

            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">Tahun Lulus</label>
              <input type="number" name="tahun_lulus" placeholder="2024"
                class="w-full px-4 py-3 rounded-xl border-slate-200 focus:border-indigo-500 focus:ring-indigo-500 transition-all">
            </div>

            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">Pilihan Program Studi</label>
              <select name="prodi"
                class="w-full px-4 py-3 rounded-xl border-slate-200 focus:border-indigo-500 focus:ring-indigo-500 transition-all">
                <option value="">Pilih Jurusan</option>
                <option value="TI">Teknik Informatika</option>
                <option value="SI">Sistem Informasi</option>
                <option value="DKV">Desain Komunikasi Visual</option>
              </select>
            </div>
          </div>
        </div>

        <div class="flex flex-col md:flex-row items-center justify-end gap-4 pb-20">
          <button type="button"
            class="w-full md:w-auto px-8 py-3 text-slate-600 font-semibold hover:text-slate-800 transition">
            Simpan Draft
          </button>
          <button type="submit"
            class="w-full md:w-auto px-10 py-3 bg-slate-900 text-white font-bold rounded-2xl hover:bg-slate-800 shadow-lg shadow-slate-200 transition-all transform hover:-translate-y-1">
            Finalisasi Data
          </button>
        </div>

      </form>
    </div>
  </div>
</x-app-layout>
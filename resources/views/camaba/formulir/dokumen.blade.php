<x-app-layout>
  <x-subnavbarmaba />
  <div class="min-h-screen bg-slate-50 py-10 px-4">
    <div class="max-w-7xl mx-auto">

      <div class="mb-8 flex gap-4 p-4 bg-amber-50 border border-amber-200 rounded-2xl">
        <span class="material-symbols-outlined text-amber-600">cloud_upload</span>
        <p class="text-sm text-amber-800">
          Gunakan file format <strong>PDF atau JPG/PNG</strong> dengan ukuran maksimal <strong>2MB</strong> per file.
          Pastikan dokumen hasil scan terbaca dengan jelas.
        </p>
      </div>

      <form action="#" method="POST" enctype="multipart/form-data" class="space-y-8">
        @csrf

        <div class="bg-white rounded-3xl border border-slate-200 shadow-sm overflow-hidden">
          <div class="p-6 border-b border-slate-100 bg-slate-50/50">
            <h2 class="text-lg font-bold text-slate-800 flex items-center gap-2">
              <span class="material-symbols-outlined text-indigo-500">file_present</span>
              Dokumen Pokok (Wajib)
            </h2>
          </div>
          <div class="p-8 grid grid-cols-1 md:grid-cols-2 gap-8">

            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">Foto Pribadi Formal</label>
              <p class="text-xs text-slate-400 mb-3 text-italic">Latar belakang merah/biru, wajah menghadap depan.</p>
              <input type="file" name="foto"
                class="w-full text-sm text-slate-500 file:mr-4 file:py-2.5 file:px-4 file:rounded-xl file:border-0 file:text-sm file:font-semibold file:bg-indigo-50 file:text-indigo-700 hover:file:bg-indigo-100 border border-slate-200 rounded-xl p-1">
            </div>

            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">Scan KTP / Kartu Identitas</label>
              <p class="text-xs text-slate-400 mb-3 text-italic">Pastikan NIK dan Nama terlihat jelas.</p>
              <input type="file" name="ktp"
                class="w-full text-sm text-slate-500 file:mr-4 file:py-2.5 file:px-4 file:rounded-xl file:border-0 file:text-sm file:font-semibold file:bg-indigo-50 file:text-indigo-700 hover:file:bg-indigo-100 border border-slate-200 rounded-xl p-1">
            </div>

            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">Scan Kartu Keluarga (KK)</label>
              <p class="text-xs text-slate-400 mb-3 text-italic">File harus mencakup seluruh bagian kartu.</p>
              <input type="file" name="kk"
                class="w-full text-sm text-slate-500 file:mr-4 file:py-2.5 file:px-4 file:rounded-xl file:border-0 file:text-sm file:font-semibold file:bg-indigo-50 file:text-indigo-700 hover:file:bg-indigo-100 border border-slate-200 rounded-xl p-1">
            </div>

            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">Ijazah Terakhir / SKL</label>
              <p class="text-xs text-slate-400 mb-3 text-italic">Gunakan SKL jika Ijazah belum terbit.</p>
              <input type="file" name="ijazah"
                class="w-full text-sm text-slate-500 file:mr-4 file:py-2.5 file:px-4 file:rounded-xl file:border-0 file:text-sm file:font-semibold file:bg-indigo-50 file:text-indigo-700 hover:file:bg-indigo-100 border border-slate-200 rounded-xl p-1">
            </div>

            <div class="md:col-span-2">
              <label class="block text-sm font-semibold text-slate-700 mb-2">Scan Rapor (Semester 1 - 5)</label>
              <p class="text-xs text-slate-400 mb-3 text-italic">Gabungkan menjadi satu file PDF.</p>
              <input type="file" name="rapor"
                class="w-full text-sm text-slate-500 file:mr-4 file:py-2.5 file:px-4 file:rounded-xl file:border-0 file:text-sm file:font-semibold file:bg-indigo-50 file:text-indigo-700 hover:file:bg-indigo-100 border border-slate-200 rounded-xl p-1">
            </div>
          </div>
        </div>

        <div class="bg-white rounded-3xl border border-slate-200 shadow-sm overflow-hidden">
          <div class="p-6 border-b border-slate-100 bg-slate-50/50">
            <h2 class="text-lg font-bold text-slate-800 flex items-center gap-2">
              <span class="material-symbols-outlined text-indigo-500">military_tech</span>
              Dokumen Tambahan (Opsional)
            </h2>
          </div>
          <div class="p-8 space-y-6">
            <div>
              <label class="block text-sm font-semibold text-slate-700 mb-2">Sertifikat Prestasi / Piagam Lomba</label>
              <p class="text-xs text-slate-400 mb-3 text-italic">Dapat berupa prestasi akademik, olahraga, seni, atau
                organisasi (Gabungkan jika > 1).</p>
              <input type="file" name="sertifikat"
                class="w-full text-sm text-slate-500 file:mr-4 file:py-2.5 file:px-4 file:rounded-xl file:border-0 file:text-sm file:font-semibold file:bg-indigo-50 file:text-indigo-700 hover:file:bg-indigo-100 border border-slate-200 rounded-xl p-1">
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
            Unggah & Finalisasi
          </button>
        </div>

      </form>
    </div>
  </div>
</x-app-layout>
<x-app-layout>
  <x-subnavbarmaba />
  <div class="min-h-[80vh] bg-slate-50 py-12 px-4 flex items-center justify-center">
    <div class="max-w-7xl w-full">

      <div class="bg-white rounded-[2rem] border border-slate-200 shadow-xl shadow-slate-200/50 overflow-hidden">
        <div class="p-8 md:p-12">
          <div class="flex flex-col items-center text-center mb-10">
            <div
              class="w-20 h-20 bg-indigo-100 text-indigo-600 rounded-3xl flex items-center justify-center mb-6 rotate-3">
              <span class="material-symbols-outlined text-4xl">edit_note</span>
            </div>
            <h1 class="text-3xl font-extrabold text-slate-900 mb-3">Lengkapi Data Dirimu</h1>
            <p class="text-slate-500 text-lg max-w-md">
              Satu langkah lagi untuk menjadi bagian dari kampus kami. Pastikan data yang kamu masukkan valid.
            </p>
          </div>

          <div class="bg-slate-50 rounded-2xl p-6 mb-10 border border-slate-100">
            <h2 class="text-sm font-bold text-slate-400 uppercase tracking-widest mb-4 flex items-center gap-2">
              <span class="material-symbols-outlined text-sm">checklist</span>
              Persiapkan Dokumen Berikut:
            </h2>
            <ul class="grid grid-cols-1 md:grid-cols-2 gap-4">
              <li class="flex items-center gap-3 text-slate-700 font-medium">
                <span class="material-symbols-outlined text-emerald-500">check_circle</span>
                Scan KTP / KK
              </li>
              <li class="flex items-center gap-3 text-slate-700 font-medium">
                <span class="material-symbols-outlined text-emerald-500">check_circle</span>
                Ijazah / SKL
              </li>
              <li class="flex items-center gap-3 text-slate-700 font-medium">
                <span class="material-symbols-outlined text-emerald-500">check_circle</span>
                Pas Foto Terbaru
              </li>
              <li class="flex items-center gap-3 text-slate-700 font-medium">
                <span class="material-symbols-outlined text-emerald-500">check_circle</span>
                Data Orang Tua
              </li>
            </ul>
          </div>

          <div class="flex flex-col items-center gap-4">
            <a href="/formulir/isi-form"
              class="group relative w-full md:w-auto px-12 py-4 bg-slate-900 text-white font-bold rounded-2xl hover:bg-indigo-600 shadow-lg shadow-indigo-200 transition-all duration-300 flex items-center justify-center gap-3">
              Mulai Isi Formulir
              <span
                class="material-symbols-outlined group-hover:translate-x-1 transition-transform">arrow_forward</span>
            </a>
            <p class="text-xs text-slate-400">Estimasi waktu pengisian: 5-10 menit</p>
          </div>
        </div>

        <div class="bg-slate-100 p-4 text-center">
          <p class="text-slate-700 text-xs">
            Butuh bantuan? <a href="#" class="text-indigo-800 hover:underline">Hubungi Tim Admisi</a>
          </p>
        </div>
      </div>

      <div class="mt-8 grid grid-cols-1 md:grid-cols-3 gap-4 text-center">
        <div class="p-4">
          <span class="material-symbols-outlined text-slate-400 mb-2">lock</span>
          <h4 class="text-sm font-bold text-slate-700">Data Aman</h4>
          <p class="text-xs text-slate-500">Privasi data Anda adalah prioritas kami.</p>
        </div>
        <div class="p-4">
          <span class="material-symbols-outlined text-slate-400 mb-2">save</span>
          <h4 class="text-sm font-bold text-slate-700">Simpan Draft</h4>
          <p class="text-xs text-slate-500">Bisa disimpan dan dilanjutkan nanti.</p>
        </div>
        <div class="p-4">
          <span class="material-symbols-outlined text-slate-400 mb-2">bolt</span>
          <h4 class="text-sm font-bold text-slate-700">Proses Cepat</h4>
          <p class="text-xs text-slate-500">Verifikasi otomatis setelah data lengkap.</p>
        </div>
      </div>
    </div>
  </div>
</x-app-layout>
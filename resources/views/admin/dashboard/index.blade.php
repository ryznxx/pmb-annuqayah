<x-app-layout>
  <div class="py-5 bg-gray-100 border-b border-slate-200 ">
    <div class="max-w-7xl mx-auto flex items-center gap-5">
      <a href="{{ route('admin.dashboard.pendaftar') }}"
        class="flex items-center gap-2 text-slate-600 font-semibold hover:text-slate-900 transition px-5 py-2 border border-slate-300 bg-slate-300/30 hover:bg-slate-300/50 rounded-xl">
        <span class="material-symbols-outlined" style="font-size: medium;">
          patient_list
        </span>
        List Pendaftar</a>
      <a href="{{ route('admin.dashboard.pendaftar') }}"
        class="flex items-center gap-2 text-slate-600 font-semibold hover:text-slate-900 transition px-5 py-2 border border-slate-300 bg-slate-300/30 hover:bg-slate-300/50 rounded-xl">
        <span class="material-symbols-outlined" style="font-size: medium;">
          other_admission
        </span>
        Admisi</a>
      <a href="{{ route('admin.dashboard.pendaftar') }}"
        class="flex items-center gap-2 text-slate-600 font-semibold hover:text-slate-900 transition px-5 py-2 border border-slate-300 bg-slate-300/30 hover:bg-slate-300/50 rounded-xl">
        <span class="material-symbols-outlined" style="font-size: medium;">
          payment
        </span>
        Pembayaran</a>
    </div>
  </div>
  <div class="mx-auto max-w-7xl py-10">
    dashboard admin
  </div>
</x-app-layout>
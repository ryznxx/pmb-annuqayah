<div class="bg-white border-b border-slate-200 sticky top-[73px] z-30">
  <div class="max-w-7xl mx-auto lg:px-0 px-4">
    <div class="flex items-center gap-3 py-4 overflow-x-auto no-scrollbar outline-none">

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
      <a href="{{ route('admin.pembayaran') }}"
        class="flex items-center gap-2 text-slate-600 font-semibold hover:text-slate-900 transition px-5 py-2 border border-slate-300 bg-slate-300/30 hover:bg-slate-300/50 rounded-xl">
        <span class="material-symbols-outlined" style="font-size: medium;">
          payment
        </span>
        Pembayaran</a>

    </div>
  </div>
</div>

<style>
  /* Menghilangkan scrollbar tapi fungsi scroll tetap ada */
  .no-scrollbar::-webkit-scrollbar {
    display: none;
  }

  .no-scrollbar {
    -ms-overflow-style: none;
    /* IE and Edge */
    scrollbar-width: none;
    /* Firefox */
  }
</style>
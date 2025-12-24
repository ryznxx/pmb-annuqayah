<aside id="sidebar" {{-- Logic: Jika sidebarOpen true, geser ke posisi 0. Jika false, geser ke kiri (-full) --}}
  :class="sidebarOpen ? 'translate-x-0' : '-translate-x-full'" class="fixed inset-y-0 left-0 z-40 w-64 bg-slate-800 text-white
           transform transition-transform duration-300 ease-in-out
           lg:translate-x-0 lg:static lg:inset-0" @click.away="sidebarOpen = false">
  <div class="p-6">
    <h2 class="text-2xl font-bold">Sidebar Lu</h2>
    <nav class="mt-4">
    </nav>
  </div>
</aside>

<div x-show="sidebarOpen" x-transition:opacity @click="sidebarOpen = false"
  class="fixed inset-0 z-30 bg-black/50 lg:hidden">
</div>
<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>{{ config('app.name', 'Laravel') }}</title>
  @vite(['resources/css/app.css', 'resources/js/app.js'])
  @include('components.icon')
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap');

    body {
      font-family: 'Plus Jakarta Sans', sans-serif;
    }

    .gradient-text {
      background: linear-gradient(to right, #1e293b, #475569);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }
  </style>
</head>

<body class="antialiased overflow-hidden">
  <div class="bg-slate-50 min-h-screen relative flex items-center justify-center">

    <div class="absolute top-0 left-0 w-full h-full overflow-hidden z-0">
      <div
        class="absolute -top-24 -left-24 w-96 h-96 bg-indigo-100 rounded-full mix-blend-multiply filter blur-3xl opacity-70 animate-blob">
      </div>
      <div
        class="absolute top-1/2 -right-24 w-96 h-96 bg-slate-200 rounded-full mix-blend-multiply filter blur-3xl opacity-70 animate-blob animation-delay-2000">
      </div>
    </div>

    <div class="max-w-7xl mx-auto px-6 relative z-10 w-full">
      <div class="flex flex-col lg:flex-row items-center justify-between gap-12">

        <div class="flex-1 text-center lg:text-left">
          <img
            class="w-48 lg:w-56 mb-10 mx-auto lg:mx-0 drop-shadow-sm transition-transform hover:scale-105 duration-300"
            src="https://pmb.ua.ac.id/wp-content/uploads/2025/01/cropped-1.-Logo-Alternatif-Universitas-Annuqayah.png"
            alt="Logo Universitas">

          <h1 class="text-4xl md:text-6xl font-extrabold text-slate-800 leading-[1.15] mb-6">
            Selamat Datang di <br>
            <span class="gradient-text">{{ config('app.name', 'PMB Online') }}</span>
          </h1>

          <p class="text-slate-500 text-lg md:text-xl max-w-2xl mx-auto lg:mx-0 leading-relaxed mb-10">
            Sistem Informasi Penerimaan Mahasiswa Baru <span class="font-bold text-slate-700">Universitas
              Annuqayah</span>.
            Wujudkan mimpi akademik Anda melalui proses pendaftaran yang mudah, cepat, dan transparan.
          </p>

          <div class="flex flex-col sm:flex-row gap-4 justify-center lg:justify-start">
            @auth
              <a href="{{ auth()->user()->isAdmin() ? route('admin.dashboard') : route('pembuka') }}"
                class="group relative bg-slate-900 text-white px-8 py-4 rounded-2xl flex items-center justify-center gap-3 font-bold text-base transition-all hover:bg-indigo-600 hover:shadow-2xl hover:shadow-indigo-200 active:scale-95">
                <span class="material-symbols-outlined group-hover:rotate-12 transition-transform">dashboard</span>
                {{ auth()->user()->isAdmin() ? "Panel Dashboard Admin" : "Masuk ke Dashboard" }}
              </a>
            @endauth

            @guest
              <a href="{{ route('register') }}"
                class="group bg-slate-900 text-white px-10 py-4 rounded-2xl flex items-center justify-center gap-3 font-bold text-base transition-all hover:bg-indigo-600 hover:shadow-2xl hover:shadow-indigo-200 active:scale-95">
                <span class="material-symbols-outlined text-[20px]">person_add</span>
                Daftar Sekarang
              </a>

              <a href="{{ route('login') }}"
                class="group bg-white text-slate-700 border border-slate-200 px-10 py-4 rounded-2xl flex items-center justify-center gap-3 font-bold text-base transition-all hover:border-slate-400 hover:bg-slate-50 active:scale-95 shadow-sm">
                <span class="material-symbols-outlined text-[20px]">login</span>
                Masuk Akun
              </a>
            @endguest
          </div>

          <div
            class="mt-16 flex items-center justify-center lg:justify-start gap-6 opacity-40 grayscale hover:grayscale-0 transition-all duration-500">
            <p class="text-xs font-mono uppercase tracking-[0.2em] text-slate-500">Pendaftaran Bisa Melalui Page Ini</p>
          </div>
        </div>

        <div class="hidden lg:block flex-1 relative">
          <div
            class="relative w-full h-[500px] bg-white/40 backdrop-blur-md rounded-[3rem] border border-white/50 shadow-2xl overflow-hidden p-8">
            <div class="flex flex-col h-full justify-between">
              <div class="space-y-4">
                <div class="w-20 h-2 bg-indigo-500 rounded-full"></div>
                <div class="w-full h-32 bg-slate-100 rounded-3xl border border-slate-100 animate-pulse"></div>
                <div class="grid grid-cols-2 gap-4">
                  <div class="h-20 bg-slate-100 rounded-2xl animate-pulse delay-75"></div>
                  <div class="h-20 bg-slate-100 rounded-2xl animate-pulse delay-150"></div>
                </div>
              </div>
              <div class="bg-indigo-50 rounded-2xl p-6 border border-indigo-100">
                <p class="text-indigo-900 font-bold text-lg mb-1 italic">"Masa depan dimulai dari sini."</p>
                <p class="text-indigo-600 text-sm font-medium">#UniversitasAnnuqayah2025</p>
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
</body>

</html>
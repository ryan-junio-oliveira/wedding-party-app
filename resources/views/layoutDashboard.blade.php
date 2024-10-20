<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>@yield('title')</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>

<body class="bg-gray-100 text-gray-800 flex flex-col min-h-screen">

    <header class="bg-white shadow">
        <div class="container mx-auto py-6 px-4 flex justify-between items-center">
            <h1 class="text-3xl font-bold text-gray-900">@yield('header')</h1>
            <nav class="hidden md:flex space-x-4">
                <a href="{{ route('dashboard') }}" class="text-gray-700 hover:text-blue-600">Dasboard</a>
                <a href="{{ route('login') }}" class="text-gray-700 hover:text-blue-600">Login</a>
                <a href="" class="text-gray-700 hover:text-blue-600">Sign Up</a>
            </nav>
            <div class="md:hidden">
                <button id="menu-toggle" class="focus:outline-none">
                    <svg class="w-6 h-6 text-gray-700" fill="none" stroke="currentColor" viewBox="0 0 24 24"
                        xmlns="http://www.w3.org/2000/svg">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M4 6h16M4 12h16m-7 6h7"></path>
                    </svg>
                </button>
            </div>
        </div>
        <div id="mobile-menu" class="md:hidden hidden">
            <nav class="flex flex-col px-4 py-2 space-y-1">
                <a href="{{ route('dashboard') }}" class="text-gray-700 hover:text-blue-600">Dasboard</a>
                <a href="{{ route('login') }}" class="text-gray-700 hover:text-blue-600">Login</a>
                <a href="" class="text-gray-700 hover:text-blue-600">Sign Up</a>
            </nav>
        </div>
    </header>

    <main class="container mx-auto py-8 px-4 flex-grow">
        @yield('content')
    </main>

    <footer class="bg-white shadow mt-8 py-4 w-full">
        <div class="container mx-auto text-center text-sm text-gray-500">
            &copy; 2024 Wedding Planner. All rights reserved.
        </div>
    </footer>

    <script>
        // Script para o menu responsivo
        document.getElementById('menu-toggle').addEventListener('click', function() {
            const mobileMenu = document.getElementById('mobile-menu');
            mobileMenu.classList.toggle('hidden');
        });
    </script>
</body>

</html>
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
        <div class="container mx-auto py-6 px-4">
            <h1 class="text-3xl font-bold text-gray-900">@yield('header')</h1>
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
    
</body>
</html>

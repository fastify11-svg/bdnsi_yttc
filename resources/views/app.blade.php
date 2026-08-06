<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <base href="{{ url('/') }}/"/>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="csrf-token" content="{{ csrf_token() }}"/>
    @php
        $siteConfig = \App\Models\SiteConfig::firstCached();
        $siteName = $siteConfig?->portal_name ?? 'BDNSI';
        $favIcon = $siteConfig?->favicon ? asset($siteConfig->favicon) : asset('favicon.ico');
    @endphp
    <title>{{ $siteName }}</title>
    <link rel="icon" type="image/x-icon" href="{{ $favIcon }}">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;600;700&display=swap"/>
    <!-- Application Styles & Scripts -->
    @viteReactRefresh
    @vite(['resources/css/app.css', 'resources/js/app.jsx'])
    @inertiaHead
</head>
<body class="font-sans antialiased bg-gray-100 text-gray-900">
    @inertia
</body>
</html>
<script>window.addEventListener('error', function(e) { fetch('/log-error?msg=' + encodeURIComponent(e.message)); });</script> 

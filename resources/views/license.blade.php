<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driving License Verification - Bangladesh</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', system-ui, -apple-system, sans-serif; }
        ::-webkit-scrollbar { width: 8px; }
        ::-webkit-scrollbar-thumb { background: #16a34a; border-radius: 4px; }
        ::-webkit-scrollbar-track { background: #f1f5f9; }
    </style>
</head>
<body class="bg-white text-gray-900">

<!-- Header with green gradient and logos -->
<header class="bg-gradient-to-r from-green-500 to-green-700">
    <div class="container mx-auto px-4 py-4">
        <div class="flex justify-between items-center">
            <!-- left logo -->
            <img src="{{asset('govt.png')}}" alt="Government Logo"
                 class="h-12 w-12 sm:h-16 sm:w-16 rounded-full object-cover border-2 border-white shadow-md" />
            <!-- right logo -->
            <img src="{{asset('govt.png')}}" alt="Government Logo"
                 class="h-12 w-12 sm:h-16 sm:w-16 rounded-full object-cover border-2 border-white shadow-md" />
        </div>
    </div>
</header>

<!-- Main content -->
<main class="container mx-auto px-4 py-6">
    <!-- Title -->
    <div class="text-center mb-6">
        <h1 class="text-xl sm:text-2xl md:text-3xl font-bold text-green-800 leading-tight">
            Driving License Verification<br>
            <span class="text-sm sm:text-base text-green-600">People's Republic of Bangladesh</span>
        </h1>
    </div>

    <!-- Verification Section -->
    <section class="flex flex-col items-center space-y-4">
        <!-- Photo -->
        <div class="bg-white rounded-xl border-2 border-green-600 w-32 h-32 sm:w-40 sm:h-40 p-1 flex items-center justify-center shadow-md">
            <img src="{{ $data ? $data->image : asset('images/no-image.png') }}" alt="License Photo" class="object-cover w-full h-full rounded-lg" />
        </div>

        <!-- Verification Panel -->
        <div class="text-center">
            <h2 class="text-lg sm:text-xl font-semibold text-green-800 mb-3">Verification Panel</h2>

            <!-- Verification Code -->
            <div class="inline-flex items-center space-x-2 bg-white border-2 border-green-600 rounded-lg px-3 py-2 shadow-sm">
                <span class="text-lg sm:text-xl font-bold text-green-900 tracking-wide">{{ $data ? $data->license_number : 'N/A' }}</span>
                <div class="w-5 h-5 rounded-full bg-white border-2 border-green-600 flex items-center justify-center">
                    <img src="{{asset('blueverify.png')}}" alt="Verified" class="w-3 h-3">
                </div>
            </div>
        </div>
    </section>
    <!-- License Information Display -->
    @if($data)
    <div class="w-full max-w-xl mx-auto p-6">
        <!-- User Information -->
        <div class="text-center mb-6">
            <h2 class="text-lg font-semibold text-gray-800 mb-3">User Information</h2>
            <div class="space-y-3">
                <div class="w-full border border-green-700 rounded-md px-3 py-2 bg-white text-left">
                    <span class="font-medium text-gray-600">Name:</span> {{ $data->name }}
                </div>
                <div class="w-full border border-green-700 rounded-md px-3 py-2 bg-white text-left">
                    <span class="font-medium text-gray-600">Father's Name:</span> {{ $data->father_name }}
                </div>
                <div class="w-full border border-green-700 rounded-md px-3 py-2 bg-white text-left">
                    <span class="font-medium text-gray-600">CNIC:</span> {{ $data->cnic }}
                </div>
                <div class="w-full border border-green-700 rounded-md px-3 py-2 bg-white text-left">
                    <span class="font-medium text-gray-600">City:</span> {{ $data->city }}
                </div>
                @if($data->state)
                <div class="w-full border border-green-700 rounded-md px-3 py-2 bg-white text-left">
                    <span class="font-medium text-gray-600">State:</span> {{ $data->state }}
                </div>
                @endif
            </div>
        </div>

        <!-- License Information -->
        <div class="text-center mt-10">
            <h2 class="text-lg font-semibold text-gray-800 mb-3">License Information</h2>
            <div class="space-y-3">
                <div class="w-full border border-green-700 rounded-md px-3 py-2 bg-white text-left">
                    <span class="font-medium text-gray-600">License No:</span> <span class="font-mono">{{ $data->license_number }}</span>
                </div>
                <div class="w-full border border-green-700 rounded-md px-3 py-2 bg-white text-left">
                    <span class="font-medium text-gray-600">Issue Date:</span> {{ $data->issue_date ? $data->issue_date->format('d M Y') : 'N/A' }}
                </div>
                <div class="w-full border border-green-700 rounded-md px-3 py-2 bg-white text-left">
                    <span class="font-medium text-gray-600">Valid From:</span> {{ $data->valid_from ? $data->valid_from->format('d M Y') : 'N/A' }}
                </div>
                <div class="w-full border border-green-700 rounded-md px-3 py-2 bg-white text-left">
                    <span class="font-medium text-gray-600">Valid To:</span> {{ $data->valid_to ? $data->valid_to->format('d M Y') : 'N/A' }}
                </div>
                <div class="w-full border border-green-700 rounded-md px-3 py-2 bg-white text-left">
                    <span class="font-medium text-gray-600">License Type:</span> {{ $data->allowed_vehicles ? \App\Models\License::getVehicleOptions()[$data->allowed_vehicles] ?? $data->allowed_vehicles : 'N/A' }}
                </div>
                <div class="w-full border border-green-700 rounded-md px-3 py-2 bg-white text-left">
                    <span class="font-medium text-gray-600">Status:</span>
                    @if($data->status == 1)
                        <span class="text-green-600 font-medium">Active</span>
                    @else
                        <span class="text-red-600 font-medium">Inactive</span>
                    @endif
                </div>
            </div>
        </div>
    </div>
    @else
    <!-- No License Found -->
    <div class="max-w-2xl mx-auto mt-8">
        <div class="bg-red-50 border border-red-200 rounded-lg p-6 text-center">
            <div class="text-red-600 mb-2">
                <svg class="w-12 h-12 mx-auto" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-2.5L13.732 4c-.77-.833-1.732-.833-2.5 0L4.268 18.5c-.77.833.192 2.5 1.732 2.5z"></path>
                </svg>
            </div>
            <h3 class="text-lg font-semibold text-red-800 mb-2">License Not Found</h3>
            <p class="text-red-600">The license number you are looking for does not exist in our database.</p>
        </div>
    </div>
    @endif

</main>
<!-- Footer Section -->
<footer class="mt-12">
    <!-- Info Section -->
    <div class="bg-gradient-to-r from-green-500 to-green-700 text-center py-6 px-4">
        <p class="text-sm text-white leading-relaxed max-w-4xl mx-auto">
            Driving License Issuance Management System (DLIMS) automates the processes
            for driving license issuance, renewal and upgrades. This system provides
            quick processing service to public and up-to-date statistics to the authorities
            by using state-of-the-art technology and equipment.
        </p>
    </div>

    <!-- Bottom Bar -->
    <div class="bg-gray-900 text-white">
        <div class="container mx-auto px-4 py-3 flex flex-col sm:flex-row justify-between items-center space-y-2 sm:space-y-0">
            <div class="flex flex-wrap items-center space-x-4 text-xs">
                <a href="#" class="border border-gray-400 rounded-full px-3 py-1 hover:bg-white hover:text-gray-900 transition-colors">Terms & Support</a>
                <a href="#" class="hover:underline">Privacy Policy</a>
            </div>
            <div class="text-gray-400 text-xs">
                Designed with <span class="text-red-500">❤️</span>
            </div>
        </div>
    </div>
</footer>

</body>
</html>

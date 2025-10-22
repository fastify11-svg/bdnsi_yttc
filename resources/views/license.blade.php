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
            <img src="{{asset('govt.png')}}" alt="License Photo" class="object-cover w-full h-full rounded-lg" />
        </div>

        <!-- Verification Panel -->
        <div class="text-center">
            <h2 class="text-lg sm:text-xl font-semibold text-green-800 mb-3">Verification Panel</h2>

            <!-- Verification Code -->
            <div class="inline-flex items-center space-x-2 bg-white border-2 border-green-600 rounded-lg px-3 py-2 shadow-sm">
                <span class="text-lg sm:text-xl font-bold text-green-900 tracking-wide">A01122058</span>
                <div class="w-5 h-5 rounded-full bg-white border-2 border-green-600 flex items-center justify-center">
                    <img src="{{asset('blueverify.png')}}" alt="Verified" class="w-3 h-3">
                </div>
            </div>
        </div>
    </section>
    <!-- Information Forms -->
    <div class="max-w-2xl mx-auto mt-8 space-y-6">
        <!-- User Information -->
        <div class="bg-gray-50 rounded-lg p-4 sm:p-6">
            <h3 class="text-lg font-semibold text-gray-800 mb-4 text-center">Personal Information</h3>
            <div class="grid grid-cols-1 sm:grid-cols-2 gap-3">
                <input type="text" placeholder="Full Name" class="w-full border border-green-300 rounded-md px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent">
                <input type="text" placeholder="Father's Name" class="w-full border border-green-300 rounded-md px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent">
                <input type="text" placeholder="Mother's Name" class="w-full border border-green-300 rounded-md px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent">
                <input type="date" placeholder="Date of Birth" class="w-full border border-green-300 rounded-md px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent">
                <input type="text" placeholder="Address" class="w-full border border-green-300 rounded-md px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent sm:col-span-2">
            </div>
        </div>

        <!-- License Information -->
        <div class="bg-gray-50 rounded-lg p-4 sm:p-6">
            <h3 class="text-lg font-semibold text-gray-800 mb-4 text-center">License Details</h3>
            <div class="grid grid-cols-1 sm:grid-cols-2 gap-3">
                <input type="text" placeholder="License Number" class="w-full border border-green-300 rounded-md px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent">
                <input type="date" placeholder="Issue Date" class="w-full border border-green-300 rounded-md px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent">
                <input type="date" placeholder="Expiry Date" class="w-full border border-green-300 rounded-md px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent">
                <select class="w-full border border-green-300 rounded-md px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent">
                    <option value="">License Type</option>
                    <option value="learner">Learner</option>
                    <option value="light">Light Vehicle</option>
                    <option value="heavy">Heavy Vehicle</option>
                    <option value="motorcycle">Motorcycle</option>
                </select>
                <select class="w-full border border-green-300 rounded-md px-3 py-2 text-sm focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent sm:col-span-2">
                    <option value="">Status</option>
                    <option value="active">Active</option>
                    <option value="expired">Expired</option>
                    <option value="suspended">Suspended</option>
                    <option value="cancelled">Cancelled</option>
                </select>
            </div>
        </div>
    </div>

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

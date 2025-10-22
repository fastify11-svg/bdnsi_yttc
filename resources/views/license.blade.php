<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driving License Verification - Bangladesh</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        'primary': '#1e40af',
                        'secondary': '#3b82f6',
                        'accent': '#06b6d4',
                        'success': '#10b981',
                        'warning': '#f59e0b',
                        'danger': '#ef4444',
                    },
                    fontFamily: {
                        'sans': ['Inter', 'system-ui', 'sans-serif'],
                    }
                }
            }
        }
    </script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>Driving License - Verification Panel</title>

    <!-- Tailwind Play CDN (for quick prototyping) -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Optional: nicer font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700;800&display=swap" rel="stylesheet">

    <style>
        body { font-family: 'Poppins', system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial; }
        /* custom scroll bar to mimic the screenshot (optional) */
        ::-webkit-scrollbar { width: 10px; }
        ::-webkit-scrollbar-thumb { background: #2f855a; border-radius: 999px; }
    </style>
</head>
<body class="bg-white text-gray-900">

<!-- Header with green gradient and logos -->
<header class=" ">
    <div class="bg-gradient-to-r from-green-400 to-green-700 h-36 md:h-40 w-full flex items-center">
        <div class="container mx-auto px-6  flex justify-between">
            <!-- left logo -->
            <img src="{{asset('govt.png')}}" alt="Left Logo"
                 class="    h-20 md:w-24 md:h-24 rounded-full object-cover border-2 border-white shadow-lg" />
            <!-- right logo -->
            <img src="{{asset('govt.png')}}" alt="Right Logo"
                 class="   w-20 h-20 md:w-24 md:h-24 rounded-full object-cover border-2 border-white shadow-lg" />
        </div>
    </div>
</header>

<!-- Main content -->
<main class="container mx-auto px-6  mt-2">
    <div class="text-center">
        <h1 class="text-3xl md:text-4xl font-extrabold text-green-800">Driving License, Peoples Republic of Bangladesh</h1>
    </div>
    <section class="mt-8 flex flex-col items-center">
        <!-- photo box -->
        <div class="bg-white rounded-2xl border-4 border-green-800 w-56 h-56 md:w-72 md:h-72 p-2 flex items-center justify-center shadow-lg">
            <!-- use your uploaded image path here -->
            <img src="{{asset('govt.png')}}"
                 alt="Portrait"
                 class="object-cover w-full h-full rounded-xl" />
        </div>

        <!-- Verification panel title -->
        <h2 class="mt-6 text-2xl md:text-3xl font-extrabold text-green-800">Verification Panel</h2>

        <!-- verification code box -->
        <div class="mt-4 inline-flex items-center space-x-3">
            <div class="flex items-center border-4 border-green-800 rounded-md px-4 py-1.5 md:px-6 md:py-2 bg-white shadow-inner">
                <span class="text-xl md:text-2xl font-bold text-green-900 tracking-wider">A01122058</span>
                <!-- badge icon -->
                <div class="flex items-center justify-center w-6 h-6   rounded-full bg-white border-4 border-green-800 shadow">
                    <!-- green verified icon -->
                    <img src="{{asset('blueverify.png')}}" alt="">
                </div>
            </div>
        </div>
    </section>
    <div class=" text-center text-sm text-gray-600">
        <div class="w-full max-w-xl mx-auto p-6">

            <!-- User Information -->
            <div class="text-center mb-6">
                <h2 class="text-lg font-semibold text-gray-800 mb-3">User Information</h2>

                <div class="space-y-3">
                    <input type="text" placeholder="Full Name" class="w-full border border-green-700 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-green-500">
                    <input type="text" placeholder="Father’s Name" class="w-full border border-green-700 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-green-500">
                    <input type="text" placeholder="Mother’s Name" class="w-full border border-green-700 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-green-500">
                    <input type="text" placeholder="Date of Birth" class="w-full border border-green-700 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-green-500">
                    <input type="text" placeholder="Address" class="w-full border border-green-700 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-green-500">
                </div>
            </div>

            <!-- License Information -->
            <div class="text-center mt-10">
                <h2 class="text-lg font-semibold text-gray-800 mb-3">License Information</h2>

                <div class="space-y-3">
                    <input type="text" placeholder="License No." class="w-full border border-green-700 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-green-500">
                    <input type="text" placeholder="Issue Date" class="w-full border border-green-700 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-green-500">
                    <input type="text" placeholder="Expiry Date" class="w-full border border-green-700 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-green-500">
                    <input type="text" placeholder="License Type" class="w-full border border-green-700 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-green-500">
                    <input type="text" placeholder="Status" class="w-full border border-green-700 rounded-md px-3 py-2 focus:outline-none focus:ring-2 focus:ring-green-500">
                </div>
            </div>
        </div>
    </div>

</main>
<!-- Footer Section -->
<footer class="">
    <!-- Top Green Gradient Section -->
    <div class="w-full bg-gradient-to-r from-green-400 to-green-700 text-center text-sm text-black py-4 px-6">
        <p class="w-full   leading-relaxed">
            Driving License Issuance Management System (DLIMS) automates the processes
            for driving license issuance, renewal and upgrades. This system provides
            quick processing service to public and up-to-date statistics to the authorities
            by using state-of-the-art technology and equipment.
        </p>
    </div>

    <!-- Bottom Black Bar -->
    <div class="bg-black text-white flex justify-between items-center text-xs md:text-sm px-4 py-2">
        <div class="flex items-center space-x-3">
            <a href="#" class="border border-white rounded-full px-2 py-0.5 hover:bg-white hover:text-black transition">Terms & Support</a>
            <a href="#" class="hover:underline">Privacy Policy</a>
        </div>

        <div class="text-gray-300 italic">
            Designed with <span class="text-red-500">❤️</span>
        </div>
    </div>
</footer>

</body>
</html>

</html>

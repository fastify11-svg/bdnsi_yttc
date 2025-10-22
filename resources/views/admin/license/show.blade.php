<x-admin-app-layout>
    <x-slot name="header">
        <div class="flex justify-between">
            <div class="text-xl">{{ __('License Details') }}</div>
            <div class="flex space-x-2">
                <a
                    class="border border-slate-500 py-1 px-4 rounded text-slate-700 text-sm hover:text-white hover:bg-slate-700"
                    href="{{ route('admin.license.edit', $license->id) }}">{{ __('Edit') }}</a>
                <a
                    class="border border-slate-500 py-1 px-4 rounded text-slate-700 text-sm hover:text-white hover:bg-slate-700"
                    href="{{ route('admin.license.index') }}">{{ __('Back to List') }}</a>
            </div>
        </div>
    </x-slot>

    <div class="w-full bg-white p-6 rounded-lg shadow">
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">

            <!-- License Image -->
            <div class="md:col-span-2 lg:col-span-1">
                <div class="text-center">
                    <h3 class="text-lg font-semibold mb-4">{{ __('License Photo') }}</h3>
                    <div class="border-2 border-gray-200 rounded-lg p-4">
                        <img src="{{ $license->image }}" alt="License Photo" class="w-full h-64 object-cover rounded">
                    </div>
                </div>
            </div>

            <!-- Personal Information -->
            <div class="md:col-span-1">
                <h3 class="text-lg font-semibold mb-4">{{ __('Personal Information') }}</h3>
                <div class="space-y-3">
                    <div>
                        <label class="block text-sm font-medium text-gray-600">{{ __('CNIC') }}</label>
                        <p class="text-gray-900 font-medium">{{ $license->cnic }}</p>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-600">{{ __('Full Name') }}</label>
                        <p class="text-gray-900 font-medium">{{ $license->name }}</p>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-600">{{ __('Father\'s Name') }}</label>
                        <p class="text-gray-900 font-medium">{{ $license->father_name }}</p>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-600">{{ __('City') }}</label>
                        <p class="text-gray-900 font-medium">{{ $license->city }}</p>
                    </div>
                    @if($license->state)
                    <div>
                        <label class="block text-sm font-medium text-gray-600">{{ __('State') }}</label>
                        <p class="text-gray-900 font-medium">{{ $license->state }}</p>
                    </div>
                    @endif
                </div>
            </div>

            <!-- License Information -->
            <div class="md:col-span-1">
                <h3 class="text-lg font-semibold mb-4">{{ __('License Information') }}</h3>
                <div class="space-y-3">
                    <div>
                        <label class="block text-sm font-medium text-gray-600">{{ __('License Number') }}</label>
                        <p class="text-gray-900 font-medium">{{ $license->license_number }}</p>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-600">{{ __('Issue Date') }}</label>
                        <p class="text-gray-900 font-medium">{{ $license->issue_date ? $license->issue_date->format('d M Y') : 'N/A' }}</p>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-600">{{ __('Valid From') }}</label>
                        <p class="text-gray-900 font-medium">{{ $license->valid_from ? $license->valid_from->format('d M Y') : 'N/A' }}</p>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-600">{{ __('Valid To') }}</label>
                        <p class="text-gray-900 font-medium">{{ $license->valid_to ? $license->valid_to->format('d M Y') : 'N/A' }}</p>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-600">{{ __('Allowed Vehicles') }}</label>
                        <p class="text-gray-900 font-medium">
                            @php
                                $vehicleOptions = \App\Models\License::getVehicleOptions();
                                $vehicleType = $vehicleOptions[$license->allowed_vehicles] ?? $license->allowed_vehicles;
                            @endphp
                            {{ $vehicleType }}
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <!-- License Status -->
        <div class="mt-8 pt-6 border-t border-gray-200">
            <h3 class="text-lg font-semibold mb-4">{{ __('License Status') }}</h3>
            <div class="flex items-center space-x-4">
                @php
                    $isExpired = $license->valid_to && $license->valid_to->isPast();
                    $isExpiringSoon = $license->valid_to && $license->valid_to->isFuture() && $license->valid_to->diffInDays(now()) <= 30;
                @endphp

                @if($isExpired)
                    <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-red-100 text-red-800">
                        <svg class="w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"></path>
                        </svg>
                        {{ __('Expired') }}
                    </span>
                @elseif($isExpiringSoon)
                    <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-yellow-100 text-yellow-800">
                        <svg class="w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 1.334-.213 2.98-1.742 2.98H4.42c-1.53 0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z" clip-rule="evenodd"></path>
                        </svg>
                        {{ __('Expiring Soon') }}
                    </span>
                @else
                    <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-green-100 text-green-800">
                        <svg class="w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd"></path>
                        </svg>
                        {{ __('Valid') }}
                    </span>
                @endif

                @if($license->valid_to)
                    <span class="text-sm text-gray-600">
                        {{ $isExpired ? __('Expired on') : __('Expires on') }}: {{ $license->valid_to->format('d M Y') }}
                    </span>
                @endif
            </div>
        </div>

        <!-- Created/Updated Info -->
        <div class="mt-6 pt-6 border-t border-gray-200">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4 text-sm text-gray-600">
                <div>
                    <label class="block font-medium">{{ __('Created At') }}</label>
                    <p>{{ $license->created_at ? $license->created_at->format('d M Y, h:i A') : 'N/A' }}</p>
                </div>
                <div>
                    <label class="block font-medium">{{ __('Last Updated') }}</label>
                    <p>{{ $license->updated_at ? $license->updated_at->format('d M Y, h:i A') : 'N/A' }}</p>
                </div>
            </div>
        </div>
    </div>
</x-admin-app-layout>

<x-admin-app-layout>
    <x-slot name="header">
        <div class="w-full flex justify-between">
            <div class="text-xl">{{ __('Add License') }}</div>
            <div>
                <a
                    class="border border-slate-500 py-1 px-4 rounded text-slate-700 text-sm hover:text-white hover:bg-slate-700"
                    href="{{ route('admin.license.index') }}">{{ __('License') }}</a>
            </div>
        </div>
    </x-slot>

    <form action="{{ route('admin.license.store') }}" method="POST" enctype="multipart/form-data">
        @csrf
        <div class="flex flex-wrap justify-center w-full bg-white p-4">

            <x-labeled-input name="cnic" required class="w-full p-1 md:w-1/2 lg:w-1/3" placeholder="Enter CNIC"/>

            <x-labeled-input name="name" required class="w-full p-1 md:w-1/2 lg:w-1/3" placeholder="Enter Full Name"/>

            <x-labeled-input name="father_name" required class="w-full p-1 md:w-1/2 lg:w-1/3" placeholder="Enter Father's Name"/>

            <x-labeled-input name="city" required class="w-full p-1 md:w-1/2 lg:w-1/3" placeholder="Enter City"/>

            <x-labeled-input name="state" class="w-full p-1 md:w-1/2 lg:w-1/3" placeholder="Enter State (Optional)"/>

            <x-labeled-input name="image" type="file" accept="image/*" class="w-full p-1 md:w-1/2 lg:w-1/3"/>

            <x-labeled-input name="license_number" required class="w-full p-1 md:w-1/2 lg:w-1/3" placeholder="Enter License Number"/>

            <x-labeled-input name="issue_date" required type="date" class="w-full p-1 md:w-1/2 lg:w-1/3"/>

            <x-labeled-input name="valid_from" required type="date" class="w-full p-1 md:w-1/2 lg:w-1/3"/>

            <x-labeled-input name="valid_to" required type="date" class="w-full p-1 md:w-1/2 lg:w-1/3"/>

            <x-labeled-select name="allowed_vehicles" required class="w-full p-1 md:w-1/2 lg:w-1/3">
                <option value="">Select Vehicle Type</option>
                @foreach($vehicleOptions as $key => $value)
                    <option value="{{ $key }}">{{ $value }}</option>
                @endforeach
            </x-labeled-select>

            <div class="w-full py-8 flex justify-center">
                <x-button>{{ __('Create') }}</x-button>
            </div>
        </div>
    </form>
</x-admin-app-layout>

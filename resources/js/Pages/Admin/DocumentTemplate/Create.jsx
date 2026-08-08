import React, { useState } from 'react';
import AdminLayout from '@/Layouts/AdminLayout';
import { Head, useForm, Link } from '@inertiajs/inertia-react';
import { getUrl } from '@/utils/urlHelper';

export default function Create(props) {
    const { data, setData, post, processing, errors } = useForm({
        name: '',
        type: 'certificate',
        width: '1123px', // Default A4 Landscape pixels (96 DPI)
        height: '794px',
        background_image: null,
    });

    const presetDimensions = {
        'A4 Landscape': { width: '1123px', height: '794px' },
        'A4 Portrait': { width: '794px', height: '1123px' },
        'ID Card (CR80)': { width: '1016px', height: '648px' },
    };

    const handlePresetChange = (presetName) => {
        const dimensions = presetDimensions[presetName];
        if (dimensions) {
            setData(prev => ({
                ...prev,
                width: dimensions.width,
                height: dimensions.height
            }));
        }
    };

    const submit = (e) => {
        e.preventDefault();
        post(getUrl('/admin/document-templates'));
    };

    return (
        <AdminLayout title="Create Document Template">
            <Head title="Create Document Template" />
            
            <div className="py-12 bg-gray-50 min-h-screen">
                <div className="max-w-4xl mx-auto sm:px-6 lg:px-8">
                    
                    <div className="mb-8">
                        <Link href={getUrl('/admin/document-templates')} className="text-sm font-medium text-indigo-600 hover:text-indigo-500 flex items-center transition-colors">
                            <svg className="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path></svg>
                            Back to Library
                        </Link>
                        <h2 className="mt-4 text-3xl font-extrabold text-gray-900 tracking-tight">Create New Template</h2>
                        <p className="mt-1 text-sm text-gray-500">Configure the base canvas and properties for your dynamic document.</p>
                    </div>

                    <div className="bg-white overflow-hidden shadow-xl sm:rounded-2xl border border-gray-100">
                        <div className="p-8">
                            <form onSubmit={submit} className="space-y-8">
                                
                                <div className="grid grid-cols-1 gap-y-6 gap-x-4 sm:grid-cols-6">
                                    <div className="sm:col-span-4">
                                        <label htmlFor="name" className="block text-sm font-medium text-gray-700">Template Name</label>
                                        <div className="mt-1">
                                            <input
                                                type="text"
                                                name="name"
                                                id="name"
                                                className="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md transition-shadow"
                                                placeholder="e.g., Spring 2025 Admit Card"
                                                value={data.name}
                                                onChange={e => setData('name', e.target.value)}
                                                required
                                            />
                                        </div>
                                        {errors.name && <p className="mt-2 text-sm text-red-600" id="name-error">{errors.name}</p>}
                                    </div>

                                    <div className="sm:col-span-3">
                                        <label htmlFor="type" className="block text-sm font-medium text-gray-700">Document Type</label>
                                        <div className="mt-1">
                                            <select
                                                id="type"
                                                name="type"
                                                className="shadow-sm focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md transition-shadow"
                                                value={data.type}
                                                onChange={e => setData('type', e.target.value)}
                                            >
                                                <option value="admit_card">Admit Card</option>
                                                <option value="registration_card">Registration Card</option>
                                                <option value="transcript">Transcript</option>
                                                <option value="certificate">Certificate</option>
                                                <option value="original_certificate">Original Certificate</option>
                                                <option value="original_c_pdf">Original C-Pdf</option>
                                                <option value="certificate_pdf">Certificate PDF</option>
                                                <option value="id_card">ID Card</option>
                                            </select>
                                        </div>
                                        {errors.type && <p className="mt-2 text-sm text-red-600">{errors.type}</p>}
                                    </div>
                                </div>

                                <div className="pt-8 border-t border-gray-200">
                                    <div>
                                        <h3 className="text-lg leading-6 font-medium text-gray-900">Canvas Dimensions</h3>
                                        <p className="mt-1 text-sm text-gray-500">
                                            Set the physical or pixel dimensions of the document. You can use standard presets or custom values.
                                        </p>
                                    </div>

                                    <div className="mt-4 flex flex-wrap gap-2 mb-6">
                                        {Object.keys(presetDimensions).map(preset => (
                                            <button
                                                key={preset}
                                                type="button"
                                                onClick={() => handlePresetChange(preset)}
                                                className="inline-flex items-center px-3 py-1.5 border border-gray-300 shadow-sm text-xs font-medium rounded-full text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 transition-colors"
                                            >
                                                {preset}
                                            </button>
                                        ))}
                                    </div>

                                    <div className="grid grid-cols-1 gap-y-6 gap-x-4 sm:grid-cols-6">
                                        <div className="sm:col-span-3">
                                            <label htmlFor="width" className="block text-sm font-medium text-gray-700">Canvas Width</label>
                                            <div className="mt-1 relative rounded-md shadow-sm">
                                                <input
                                                    type="text"
                                                    name="width"
                                                    id="width"
                                                    className="focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md"
                                                    placeholder="1123px"
                                                    value={data.width}
                                                    onChange={e => setData('width', e.target.value)}
                                                    required
                                                />
                                            </div>
                                            {errors.width && <p className="mt-2 text-sm text-red-600">{errors.width}</p>}
                                        </div>

                                        <div className="sm:col-span-3">
                                            <label htmlFor="height" className="block text-sm font-medium text-gray-700">Canvas Height</label>
                                            <div className="mt-1 relative rounded-md shadow-sm">
                                                <input
                                                    type="text"
                                                    name="height"
                                                    id="height"
                                                    className="focus:ring-indigo-500 focus:border-indigo-500 block w-full sm:text-sm border-gray-300 rounded-md"
                                                    placeholder="794px"
                                                    value={data.height}
                                                    onChange={e => setData('height', e.target.value)}
                                                    required
                                                />
                                            </div>
                                            {errors.height && <p className="mt-2 text-sm text-red-600">{errors.height}</p>}
                                        </div>
                                    </div>
                                </div>

                                <div className="pt-8 border-t border-gray-200">
                                    <div>
                                        <h3 className="text-lg leading-6 font-medium text-gray-900">Background Layer</h3>
                                        <p className="mt-1 text-sm text-gray-500">
                                            Upload a high-quality empty background (JPEG/PNG) that matches your selected canvas dimensions perfectly.
                                        </p>
                                    </div>
                                    <div className="mt-6">
                                        <div className="mt-1 flex justify-center px-6 pt-5 pb-6 border-2 border-gray-300 border-dashed rounded-xl hover:bg-gray-50 transition-colors">
                                            <div className="space-y-1 text-center">
                                                <svg className="mx-auto h-12 w-12 text-gray-400" stroke="currentColor" fill="none" viewBox="0 0 48 48" aria-hidden="true">
                                                    <path d="M28 8H12a4 4 0 00-4 4v20m32-12v8m0 0v8a4 4 0 01-4 4H12a4 4 0 01-4-4v-4m32-4l-3.172-3.172a4 4 0 00-5.656 0L28 28M8 32l9.172-9.172a4 4 0 015.656 0L28 28m0 0l4 4m4-24h8m-4-4v8m-12 4h.02" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" />
                                                </svg>
                                                <div className="flex text-sm text-gray-600 justify-center">
                                                    <label htmlFor="file-upload" className="relative cursor-pointer bg-white rounded-md font-medium text-indigo-600 hover:text-indigo-500 focus-within:outline-none focus-within:ring-2 focus-within:ring-offset-2 focus-within:ring-indigo-500">
                                                        <span>Upload a file</span>
                                                        <input 
                                                            id="file-upload" 
                                                            name="file-upload" 
                                                            type="file" 
                                                            className="sr-only" 
                                                            accept="image/*"
                                                            onChange={e => setData('background_image', e.target.files[0])}
                                                        />
                                                    </label>
                                                    <p className="pl-1">or drag and drop</p>
                                                </div>
                                                <p className="text-xs text-gray-500">PNG, JPG, GIF up to 5MB</p>
                                                {data.background_image && (
                                                    <p className="mt-2 text-sm font-semibold text-green-600">Selected: {data.background_image.name}</p>
                                                )}
                                            </div>
                                        </div>
                                        {errors.background_image && <p className="mt-2 text-sm text-red-600">{errors.background_image}</p>}
                                    </div>
                                </div>

                                <div className="pt-5 border-t border-gray-200">
                                    <div className="flex justify-end space-x-3">
                                        <Link
                                            href={getUrl('/admin/document-templates')}
                                            className="bg-white py-2 px-4 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 transition-colors"
                                        >
                                            Cancel
                                        </Link>
                                        <button
                                            type="submit"
                                            disabled={processing}
                                            className="inline-flex justify-center py-2 px-6 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 transition-colors disabled:opacity-50"
                                        >
                                            {processing ? (
                                                <span className="flex items-center">
                                                    <svg className="animate-spin -ml-1 mr-3 h-5 w-5 text-white" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                                                        <circle className="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" strokeWidth="4"></circle>
                                                        <path className="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                                                    </svg>
                                                    Creating...
                                                </span>
                                            ) : 'Create & Proceed to Design'}
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </AdminLayout>
    );
}

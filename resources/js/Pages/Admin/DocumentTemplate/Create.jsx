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

    const submit = (e) => {
        e.preventDefault();
        post(getUrl('/admin/document-templates'));
    };

    return (
        <AdminLayout
            title="Create Document Template"
        >
            <div className="py-12">
                <div className="max-w-4xl mx-auto sm:px-6 lg:px-8">
                    <div className="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                        <div className="p-6 bg-white border-b border-gray-200">
                            <form onSubmit={submit} className="space-y-6">
                                
                                <div>
                                    <label className="block text-sm font-medium text-gray-700">Template Name</label>
                                    <input
                                        type="text"
                                        className="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"
                                        value={data.name}
                                        onChange={e => setData('name', e.target.value)}
                                        required
                                    />
                                    {errors.name && <div className="text-red-500 text-xs mt-1">{errors.name}</div>}
                                </div>

                                <div>
                                    <label className="block text-sm font-medium text-gray-700">Document Type</label>
                                    <select
                                        className="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
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
                                    {errors.type && <div className="text-red-500 text-xs mt-1">{errors.type}</div>}
                                </div>

                                <div className="grid grid-cols-2 gap-4">
                                    <div>
                                        <label className="block text-sm font-medium text-gray-700">Width (e.g., 1123px or 297mm)</label>
                                        <input
                                            type="text"
                                            className="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"
                                            value={data.width}
                                            onChange={e => setData('width', e.target.value)}
                                            required
                                        />
                                        {errors.width && <div className="text-red-500 text-xs mt-1">{errors.width}</div>}
                                    </div>
                                    <div>
                                        <label className="block text-sm font-medium text-gray-700">Height (e.g., 794px or 210mm)</label>
                                        <input
                                            type="text"
                                            className="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"
                                            value={data.height}
                                            onChange={e => setData('height', e.target.value)}
                                            required
                                        />
                                        {errors.height && <div className="text-red-500 text-xs mt-1">{errors.height}</div>}
                                    </div>
                                </div>

                                <div>
                                    <label className="block text-sm font-medium text-gray-700">Background Image (Blank Template)</label>
                                    <input
                                        type="file"
                                        accept="image/*"
                                        className="mt-1 block w-full text-sm text-gray-500 file:mr-4 file:py-2 file:px-4 file:rounded-md file:border-0 file:text-sm file:font-semibold file:bg-indigo-50 file:text-indigo-700 hover:file:bg-indigo-100"
                                        onChange={e => setData('background_image', e.target.files[0])}
                                    />
                                    {errors.background_image && <div className="text-red-500 text-xs mt-1">{errors.background_image}</div>}
                                    <p className="text-xs text-gray-500 mt-2">Upload a high-quality empty background (JPEG/PNG). Recommended size: match the width/height specified above.</p>
                                </div>

                                <div className="flex justify-end space-x-3">
                                    <Link
                                        href={getUrl('/admin/document-templates')}
                                        className="bg-white py-2 px-4 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-700 hover:bg-gray-50"
                                    >
                                        Cancel
                                    </Link>
                                    <button
                                        type="submit"
                                        disabled={processing}
                                        className="inline-flex justify-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 disabled:opacity-50"
                                    >
                                        {processing ? 'Saving...' : 'Create Template'}
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </AdminLayout>
    );
}

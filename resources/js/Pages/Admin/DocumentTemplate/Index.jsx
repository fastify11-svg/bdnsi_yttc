import React from 'react';
import AdminLayout from '@/Layouts/AdminLayout';
import { Head, Link } from '@inertiajs/inertia-react';

export default function Index(props) {
    const { templates } = props;

    return (
        <AdminLayout
            title="Document Templates"
        >
            <div className="py-12">
                <div className="max-w-7xl mx-auto sm:px-6 lg:px-8">
                    <div className="flex justify-end mb-4">
                        <Link
                            href={route('admin.document-templates.create')}
                            className="bg-indigo-600 hover:bg-indigo-700 text-white font-bold py-2 px-4 rounded"
                        >
                            Create New Template
                        </Link>
                    </div>

                    <div className="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                        <div className="p-6 bg-white border-b border-gray-200">
                            <table className="min-w-full divide-y divide-gray-200">
                                <thead className="bg-gray-50">
                                    <tr>
                                        <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Name</th>
                                        <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Type</th>
                                        <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Size</th>
                                        <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                                    </tr>
                                </thead>
                                <tbody className="bg-white divide-y divide-gray-200">
                                    {templates.length === 0 ? (
                                        <tr>
                                            <td colSpan="4" className="px-6 py-4 whitespace-nowrap text-center text-sm text-gray-500">
                                                No templates found. Create one!
                                            </td>
                                        </tr>
                                    ) : (
                                        templates.map((template) => (
                                            <tr key={template.id}>
                                                <td className="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">{template.name}</td>
                                                <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500 capitalize">{template.type}</td>
                                                <td className="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{template.width} x {template.height}</td>
                                                <td className="px-6 py-4 whitespace-nowrap text-sm font-medium space-x-2">
                                                    <a href={route('admin.document-templates.preview', template.id)} target="_blank" className="text-blue-600 hover:text-blue-900">Preview HTML</a>
                                                    <span>|</span>
                                                    <Link href={route('admin.document-templates.edit', template.id)} className="text-indigo-600 hover:text-indigo-900">Design Builder</Link>
                                                </td>
                                            </tr>
                                        ))
                                    )}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </Authenticated>
    );
}

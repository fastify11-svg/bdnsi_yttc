import React, { useState, useRef, useEffect, useCallback } from 'react';
import AdminLayout from '@/Layouts/AdminLayout';
import { Head, Link } from '@inertiajs/inertia-react';
import { Inertia } from '@inertiajs/inertia';
import { getUrl } from '@/utils/urlHelper';

export default function Edit(props) {
    const { template } = props;
    
    const [fields, setFields] = useState(template.fields || []);
    const [selectedFieldId, setSelectedFieldId] = useState(null);
    const [snapToGrid, setSnapToGrid] = useState(false);
    
    const availableVariables = [
        { key: 'student_name', label: 'Student Name', sample: 'John Doe', type: 'text' },
        { key: 'student_roll', label: 'Roll Number', sample: '123456', type: 'text' },
        { key: 'student_registration', label: 'Registration No', sample: 'REG-7890', type: 'text' },
        { key: 'center_name', label: 'Center Name', sample: 'Dhaka Main Campus', type: 'text' },
        { key: 'session_name', label: 'Session', sample: 'Jan-Dec 2024', type: 'text' },
        { key: 'course_name', label: 'Course Name', sample: 'Diploma in Computer Science', type: 'text' },
        { key: 'cgpa', label: 'CGPA', sample: '4.50', type: 'text' },
        { key: 'grade', label: 'Grade', sample: 'A+', type: 'text' },
        { key: 'issue_date', label: 'Issue Date', sample: '10 Oct 2024', type: 'text' },
        { key: 'qr_code', label: 'QR Code', sample: '[QR]', type: 'image' },
        { key: 'student_image', label: 'Student Photo', sample: '[PHOTO]', type: 'image' },
    ];

    const canvasRef = useRef(null);

    const [draggingId, setDraggingId] = useState(null);
    const [dragOffset, setDragOffset] = useState({ x: 0, y: 0 });

    const handleMouseDown = (e, field) => {
        if (e.target.tagName.toLowerCase() === 'input' || e.target.tagName.toLowerCase() === 'select') return;
        
        e.preventDefault();
        setDraggingId(field.id);
        setSelectedFieldId(field.id);
        
        const rect = e.target.getBoundingClientRect();
        setDragOffset({
            x: e.clientX - rect.left,
            y: e.clientY - rect.top
        });
    };

    const handleMouseMove = useCallback((e) => {
        if (!draggingId || !canvasRef.current) return;
        
        const canvasRect = canvasRef.current.getBoundingClientRect();
        
        let newX = e.clientX - canvasRect.left - dragOffset.x;
        let newY = e.clientY - canvasRect.top - dragOffset.y;
        
        if (snapToGrid) {
            newX = Math.round(newX / 10) * 10;
            newY = Math.round(newY / 10) * 10;
        }

        if (newX < 0) newX = 0;
        if (newY < 0) newY = 0;
        
        setFields(fields.map(f => {
            if (f.id === draggingId) {
                return { ...f, position_x: `${newX}px`, position_y: `${newY}px` };
            }
            return f;
        }));
    }, [draggingId, dragOffset, snapToGrid, fields]);

    const handleMouseUp = useCallback(() => {
        setDraggingId(null);
    }, []);

    useEffect(() => {
        if (draggingId) {
            window.addEventListener('mousemove', handleMouseMove);
            window.addEventListener('mouseup', handleMouseUp);
        } else {
            window.removeEventListener('mousemove', handleMouseMove);
            window.removeEventListener('mouseup', handleMouseUp);
        }
        return () => {
            window.removeEventListener('mousemove', handleMouseMove);
            window.removeEventListener('mouseup', handleMouseUp);
        };
    }, [draggingId, handleMouseMove, handleMouseUp]);

    // Keyboard Nudging
    useEffect(() => {
        const handleKeyDown = (e) => {
            if (!selectedFieldId) return;
            if (['ArrowUp', 'ArrowDown', 'ArrowLeft', 'ArrowRight'].includes(e.key)) {
                e.preventDefault(); // Prevent scrolling
                const step = e.shiftKey ? 10 : 1; // Shift+Arrow moves by 10px
                
                setFields(prevFields => prevFields.map(f => {
                    if (f.id === selectedFieldId) {
                        let curX = parseInt(f.position_x) || 0;
                        let curY = parseInt(f.position_y) || 0;
                        
                        if (e.key === 'ArrowUp') curY -= step;
                        if (e.key === 'ArrowDown') curY += step;
                        if (e.key === 'ArrowLeft') curX -= step;
                        if (e.key === 'ArrowRight') curX += step;
                        
                        return { ...f, position_x: `${curX}px`, position_y: `${curY}px` };
                    }
                    return f;
                }));
            }
        };

        window.addEventListener('keydown', handleKeyDown);
        return () => window.removeEventListener('keydown', handleKeyDown);
    }, [selectedFieldId]);

    const addField = (variable) => {
        const newField = {
            id: 'temp_' + Date.now(),
            variable_key: variable.key,
            position_x: '50px',
            position_y: '50px',
            font_size: '16px',
            font_family: 'Arial',
            font_weight: 'normal',
            color: '#000000',
            text_align: 'left',
            width: variable.type === 'image' ? '100px' : null,
            height: variable.type === 'image' ? '100px' : null,
            isNew: true,
            sample: variable.sample
        };
        setFields([...fields, newField]);
        setSelectedFieldId(newField.id);
    };

    const removeField = (id) => {
        setFields(fields.filter(f => f.id !== id));
        if (selectedFieldId === id) setSelectedFieldId(null);
    };

    const updateSelectedField = (key, value) => {
        setFields(fields.map(f => {
            if (f.id === selectedFieldId) {
                return { ...f, [key]: value };
            }
            return f;
        }));
    };

    const selectedField = fields.find(f => f.id === selectedFieldId);
    
    // Determine if selected field is an image type based on available variables
    const isImageField = selectedField ? availableVariables.find(v => v.key === selectedField.variable_key)?.type === 'image' : false;

    const [isSaving, setIsSaving] = useState(false);
    
    const saveLayout = () => {
        setIsSaving(true);
        Inertia.put(getUrl(`/admin/document-templates/${template.id}`), {
            fields: fields
        }, {
            preserveScroll: true,
            onSuccess: () => {
                setIsSaving(false);
                // Notification handled by global flash message usually
            },
            onError: () => setIsSaving(false)
        });
    };

    return (
        <AdminLayout title={`Edit Template: ${template.name}`}>
            <Head title={`Design: ${template.name}`} />
            
            <div className="py-6 bg-gray-50 min-h-screen">
                <div className="max-w-[1600px] mx-auto px-4 sm:px-6 lg:px-8">
                    
                    <div className="flex justify-between items-center mb-4">
                        <div>
                            <Link href={getUrl('/admin/document-templates')} className="text-sm font-medium text-indigo-600 hover:text-indigo-500 flex items-center">
                                <svg className="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M10 19l-7-7m0 0l7-7m-7 7h18"></path></svg>
                                Back
                            </Link>
                            <h2 className="mt-2 text-2xl font-bold text-gray-900 leading-tight">Design Builder: {template.name}</h2>
                        </div>
                        <div className="flex space-x-3">
                            <a 
                                href={getUrl(`/admin/document-templates/${template.id}/preview`)}
                                target="_blank"
                                rel="noreferrer"
                                className="inline-flex items-center px-4 py-2 border border-gray-300 shadow-sm text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                            >
                                <svg className="-ml-1 mr-2 h-5 w-5 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path></svg>
                                Live Preview
                            </a>
                            <button 
                                onClick={saveLayout}
                                disabled={isSaving}
                                className="inline-flex justify-center items-center py-2 px-4 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 disabled:opacity-50"
                            >
                                {isSaving ? 'Saving...' : 'Save Layout'}
                            </button>
                        </div>
                    </div>

                    <div className="flex flex-col lg:flex-row gap-6 h-[calc(100vh-160px)]">
                        
                        {/* Left Panel: Toolbox */}
                        <div className="w-full lg:w-80 flex-shrink-0 flex flex-col gap-4">
                            
                            {/* Insert Elements */}
                            <div className="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden flex-1 flex flex-col">
                                <div className="px-4 py-3 bg-gray-50 border-b border-gray-200 flex justify-between items-center">
                                    <h3 className="font-bold text-gray-800">Insert Elements</h3>
                                    <span className="text-xs bg-indigo-100 text-indigo-800 px-2 py-0.5 rounded-full font-semibold">{fields.length} added</span>
                                </div>
                                <div className="p-4 overflow-y-auto space-y-2 flex-1">
                                    {availableVariables.map(v => (
                                        <button 
                                            key={v.key}
                                            onClick={() => addField(v)}
                                            className="w-full flex items-center justify-between px-3 py-2 text-sm bg-white border border-gray-200 rounded-lg shadow-sm hover:border-indigo-500 hover:shadow transition-all group"
                                        >
                                            <span className="font-medium text-gray-700 group-hover:text-indigo-700">{v.label}</span>
                                            <svg className="w-4 h-4 text-gray-400 group-hover:text-indigo-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M12 4v16m8-8H4"></path></svg>
                                        </button>
                                    ))}
                                </div>
                            </div>

                            {/* Properties Panel */}
                            <div className="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden flex-1 flex flex-col">
                                <div className="px-4 py-3 bg-gray-50 border-b border-gray-200">
                                    <h3 className="font-bold text-gray-800">Properties</h3>
                                </div>
                                <div className="p-4 overflow-y-auto flex-1">
                                    {!selectedField ? (
                                        <div className="h-full flex flex-col items-center justify-center text-center text-gray-400">
                                            <svg className="w-12 h-12 mb-3 text-gray-300" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="1" d="M15 15l-2 5L9 9l11 4-5 2zm0 0l5 5M7.188 2.239l.777 2.897M5.136 7.965l-2.898-.777M13.95 4.05l-2.122 2.122m-5.657 5.656l-2.12 2.122"></path></svg>
                                            <p className="text-sm font-medium">Select an element on the canvas to edit its properties.</p>
                                        </div>
                                    ) : (
                                        <div className="space-y-4">
                                            <div className="pb-3 border-b border-gray-100 flex justify-between items-center">
                                                <span className="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-blue-100 text-blue-800">
                                                    {selectedField.variable_key}
                                                </span>
                                                <button 
                                                    onClick={() => removeField(selectedField.id)}
                                                    className="text-red-500 hover:text-red-700 text-sm font-medium transition-colors"
                                                    title="Delete Element"
                                                >
                                                    <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16"></path></svg>
                                                </button>
                                            </div>

                                            {/* Position */}
                                            <div className="grid grid-cols-2 gap-3">
                                                <div>
                                                    <label className="block text-xs font-medium text-gray-500 mb-1">X Position</label>
                                                    <input 
                                                        type="text" 
                                                        value={selectedField.position_x || ''} 
                                                        onChange={e => updateSelectedField('position_x', e.target.value)}
                                                        className="w-full text-sm rounded border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500"
                                                    />
                                                </div>
                                                <div>
                                                    <label className="block text-xs font-medium text-gray-500 mb-1">Y Position</label>
                                                    <input 
                                                        type="text" 
                                                        value={selectedField.position_y || ''} 
                                                        onChange={e => updateSelectedField('position_y', e.target.value)}
                                                        className="w-full text-sm rounded border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500"
                                                    />
                                                </div>
                                            </div>

                                            {/* Image Specific Dimensions */}
                                            {isImageField && (
                                                <div className="grid grid-cols-2 gap-3 border-t border-gray-100 pt-3">
                                                    <div>
                                                        <label className="block text-xs font-medium text-gray-500 mb-1">Width</label>
                                                        <input 
                                                            type="text" 
                                                            value={selectedField.width || '100px'} 
                                                            onChange={e => updateSelectedField('width', e.target.value)}
                                                            className="w-full text-sm rounded border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500"
                                                        />
                                                    </div>
                                                    <div>
                                                        <label className="block text-xs font-medium text-gray-500 mb-1">Height</label>
                                                        <input 
                                                            type="text" 
                                                            value={selectedField.height || '100px'} 
                                                            onChange={e => updateSelectedField('height', e.target.value)}
                                                            className="w-full text-sm rounded border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500"
                                                        />
                                                    </div>
                                                </div>
                                            )}

                                            {/* Typography */}
                                            {!isImageField && (
                                                <>
                                                    <div className="border-t border-gray-100 pt-3">
                                                        <label className="block text-xs font-medium text-gray-500 mb-1">Typography</label>
                                                        <div className="flex items-center space-x-2 mb-3">
                                                            <input 
                                                                type="color" 
                                                                value={selectedField.color || '#000000'} 
                                                                onChange={e => updateSelectedField('color', e.target.value)}
                                                                className="w-8 h-8 rounded border-0 cursor-pointer shadow-sm"
                                                                title="Text Color"
                                                            />
                                                            <select 
                                                                value={selectedField.font_family || 'Arial'} 
                                                                onChange={e => updateSelectedField('font_family', e.target.value)}
                                                                className="flex-1 text-sm rounded border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500"
                                                            >
                                                                <option value="Arial">Arial</option>
                                                                <option value="'Times New Roman'">Times New Roman</option>
                                                                <option value="'Courier New'">Courier New</option>
                                                                <option value="'Brush Script MT'">Brush Script MT (Cursive)</option>
                                                            </select>
                                                        </div>

                                                        <div className="grid grid-cols-2 gap-3 mb-3">
                                                            <div>
                                                                <label className="block text-[10px] uppercase text-gray-400 mb-1">Size</label>
                                                                <input 
                                                                    type="text" 
                                                                    value={selectedField.font_size || ''} 
                                                                    onChange={e => updateSelectedField('font_size', e.target.value)}
                                                                    placeholder="e.g. 16px"
                                                                    className="w-full text-sm rounded border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500"
                                                                />
                                                            </div>
                                                            <div>
                                                                <label className="block text-[10px] uppercase text-gray-400 mb-1">Weight</label>
                                                                <select 
                                                                    value={selectedField.font_weight || 'normal'} 
                                                                    onChange={e => updateSelectedField('font_weight', e.target.value)}
                                                                    className="w-full text-sm rounded border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500"
                                                                >
                                                                    <option value="normal">Normal</option>
                                                                    <option value="bold">Bold</option>
                                                                    <option value="600">Semi-Bold</option>
                                                                    <option value="800">Extra-Bold</option>
                                                                </select>
                                                            </div>
                                                        </div>

                                                        <div>
                                                            <label className="block text-[10px] uppercase text-gray-400 mb-1">Alignment</label>
                                                            <div className="flex bg-gray-100 p-1 rounded-md">
                                                                {['left', 'center', 'right'].map(align => (
                                                                    <button
                                                                        key={align}
                                                                        onClick={() => updateSelectedField('text_align', align)}
                                                                        className={`flex-1 py-1 text-sm rounded ${selectedField.text_align === align || (!selectedField.text_align && align === 'left') ? 'bg-white shadow text-indigo-600 font-medium' : 'text-gray-500 hover:text-gray-700'}`}
                                                                    >
                                                                        {align.charAt(0).toUpperCase() + align.slice(1)}
                                                                    </button>
                                                                ))}
                                                            </div>
                                                        </div>
                                                    </div>
                                                </>
                                            )}

                                            <div className="border-t border-gray-100 pt-3">
                                                <p className="text-xs text-gray-400">Tip: Select an element and use <kbd className="font-mono bg-gray-100 border border-gray-300 rounded px-1 text-gray-600">Arrow Keys</kbd> to nudge precisely.</p>
                                            </div>
                                        </div>
                                    )}
                                </div>
                            </div>
                        </div>

                        {/* Right Panel: Canvas Environment */}
                        <div className="flex-1 bg-gray-200 rounded-xl overflow-hidden shadow-inner border border-gray-300 flex flex-col relative">
                            {/* Canvas Toolbar */}
                            <div className="h-12 bg-white border-b border-gray-300 flex items-center justify-between px-4 z-10">
                                <div className="flex items-center space-x-4">
                                    <label className="flex items-center text-sm text-gray-700 font-medium cursor-pointer">
                                        <input 
                                            type="checkbox" 
                                            checked={snapToGrid} 
                                            onChange={e => setSnapToGrid(e.target.checked)} 
                                            className="mr-2 rounded text-indigo-600 focus:ring-indigo-500 border-gray-300"
                                        />
                                        Snap to Grid (10px)
                                    </label>
                                </div>
                                <div className="text-xs text-gray-500 font-mono">
                                    Canvas: {template.width} × {template.height}
                                </div>
                            </div>

                            {/* Scrollable Canvas Area */}
                            <div className="flex-1 overflow-auto p-8 relative flex justify-center items-start custom-scrollbar">
                                <div 
                                    ref={canvasRef}
                                    className="relative bg-white shadow-2xl border border-gray-300 transform-gpu transition-shadow"
                                    style={{ 
                                        width: template.width, 
                                        height: template.height,
                                        backgroundImage: template.background_image ? `url(/storage/${template.background_image})` : 'none',
                                        backgroundSize: '100% 100%',
                                        backgroundRepeat: 'no-repeat',
                                        minWidth: template.width,
                                        minHeight: template.height,
                                        backgroundPosition: 'center'
                                    }}
                                >
                                    {/* Grid Overlay if enabled */}
                                    {snapToGrid && (
                                        <div className="absolute inset-0 pointer-events-none opacity-20" style={{
                                            backgroundImage: `linear-gradient(to right, #ccc 1px, transparent 1px), linear-gradient(to bottom, #ccc 1px, transparent 1px)`,
                                            backgroundSize: '10px 10px'
                                        }}></div>
                                    )}

                                    {fields.map(field => {
                                        const isSelected = selectedFieldId === field.id;
                                        const isImage = availableVariables.find(v => v.key === field.variable_key)?.type === 'image';
                                        
                                        const sampleText = field.sample || availableVariables.find(v => v.key === field.variable_key)?.sample || `[${field.variable_key}]`;
                                        
                                        return (
                                            <div
                                                key={field.id}
                                                onMouseDown={(e) => handleMouseDown(e, field)}
                                                className={`absolute cursor-move select-none transition-shadow ${isSelected ? 'ring-2 ring-indigo-500 ring-offset-2 z-20 shadow-lg' : 'hover:ring-2 hover:ring-gray-300 hover:ring-offset-1 z-10'}`}
                                                style={{
                                                    left: field.position_x,
                                                    top: field.position_y,
                                                    ...(isImage ? {
                                                        width: field.width || '100px',
                                                        height: field.height || '100px',
                                                        backgroundColor: 'rgba(99, 102, 241, 0.1)',
                                                        border: '2px dashed #6366f1',
                                                        display: 'flex',
                                                        alignItems: 'center',
                                                        justifyContent: 'center',
                                                        color: '#6366f1',
                                                        fontSize: '12px',
                                                        fontWeight: 'bold'
                                                    } : {
                                                        fontSize: field.font_size || '16px',
                                                        fontFamily: field.font_family || 'Arial',
                                                        fontWeight: field.font_weight || 'normal',
                                                        color: field.color || '#000000',
                                                        textAlign: field.text_align || 'left',
                                                        whiteSpace: 'nowrap',
                                                        padding: '2px 4px',
                                                        border: isSelected ? '1px dashed transparent' : '1px dashed transparent',
                                                    })
                                                }}
                                            >
                                                {sampleText}
                                            </div>
                                        );
                                    })}
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            
            <style jsx>{`
                .custom-scrollbar::-webkit-scrollbar {
                    width: 14px;
                    height: 14px;
                }
                .custom-scrollbar::-webkit-scrollbar-track {
                    background: #f1f5f9;
                }
                .custom-scrollbar::-webkit-scrollbar-thumb {
                    background-color: #cbd5e1;
                    border-radius: 10px;
                    border: 3px solid #f1f5f9;
                }
                .custom-scrollbar::-webkit-scrollbar-thumb:hover {
                    background-color: #94a3b8;
                }
            `}</style>
        </AdminLayout>
    );
}

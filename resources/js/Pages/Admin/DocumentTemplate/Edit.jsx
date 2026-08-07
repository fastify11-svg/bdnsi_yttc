import React, { useState, useRef, useEffect } from 'react';
import AdminLayout from '@/Layouts/AdminLayout';
import { Head, Link } from '@inertiajs/inertia-react';
import { Inertia } from '@inertiajs/inertia';

export default function Edit(props) {
    const { template } = props;
    
    // State for the fields placed on the canvas
    const [fields, setFields] = useState(template.fields || []);
    
    // State for currently selected field for styling
    const [selectedFieldId, setSelectedFieldId] = useState(null);
    
    // Available dummy variables to add to the canvas
    const availableVariables = [
        { key: 'student_name', label: 'Student Name', sample: 'John Doe' },
        { key: 'student_roll', label: 'Roll Number', sample: '123456' },
        { key: 'student_registration', label: 'Registration No', sample: 'REG-7890' },
        { key: 'center_name', label: 'Center Name', sample: 'Dhaka Main Campus' },
        { key: 'session_name', label: 'Session', sample: 'Jan-Dec 2024' },
        { key: 'course_name', label: 'Course Name', sample: 'Diploma in Computer Science' },
        { key: 'cgpa', label: 'CGPA', sample: '4.50' },
        { key: 'grade', label: 'Grade', sample: 'A+' },
        { key: 'issue_date', label: 'Issue Date', sample: '10 Oct 2024' },
    ];

    const canvasRef = useRef(null);

    // Dragging state
    const [draggingId, setDraggingId] = useState(null);
    const [dragOffset, setDragOffset] = useState({ x: 0, y: 0 });

    const handleMouseDown = (e, field) => {
        if (e.target.tagName.toLowerCase() === 'input' || e.target.tagName.toLowerCase() === 'select') return;
        
        e.preventDefault();
        setDraggingId(field.id);
        setSelectedFieldId(field.id);
        
        const rect = e.target.getBoundingClientRect();
        // Calculate offset from top-left of the field
        setDragOffset({
            x: e.clientX - rect.left,
            y: e.clientY - rect.top
        });
    };

    const handleMouseMove = (e) => {
        if (!draggingId || !canvasRef.current) return;
        
        const canvasRect = canvasRef.current.getBoundingClientRect();
        
        // Calculate new position relative to canvas
        let newX = e.clientX - canvasRect.left - dragOffset.x;
        let newY = e.clientY - canvasRect.top - dragOffset.y;
        
        // Prevent dragging outside canvas
        if (newX < 0) newX = 0;
        if (newY < 0) newY = 0;
        
        setFields(fields.map(f => {
            if (f.id === draggingId) {
                return { ...f, position_x: `${newX}px`, position_y: `${newY}px` };
            }
            return f;
        }));
    };

    const handleMouseUp = () => {
        setDraggingId(null);
    };

    // Attach global mouse listeners for dragging smoothly even if mouse leaves the element
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
    }, [draggingId, dragOffset]);

    const addField = (variable) => {
        const newField = {
            id: 'temp_' + Date.now(), // temporary ID until saved
            variable_key: variable.key,
            position_x: '50px',
            position_y: '50px',
            font_size: '16px',
            font_family: 'Arial',
            font_weight: 'normal',
            color: '#000000',
            text_align: 'left',
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

    const saveLayout = () => {
        Inertia.put(route('admin.document-templates.update', template.id), {
            fields: fields
        }, {
            preserveScroll: true,
            onSuccess: () => alert('Layout saved successfully!')
        });
    };

    return (
        <AdminLayout
            title={`Edit Template: ${template.name}`}
        >
            <div className="py-6">
                <div className="max-w-7xl mx-auto sm:px-6 lg:px-8 flex flex-col md:flex-row gap-6">
                    
                    {/* Left Panel: Toolbox */}
                    <div className="w-full md:w-1/4 bg-white rounded-lg shadow-sm p-4 space-y-4">
                        <div>
                            <h3 className="font-bold text-gray-700 mb-2">Available Variables</h3>
                            <div className="space-y-2 max-h-60 overflow-y-auto pr-2">
                                {availableVariables.map(v => (
                                    <button 
                                        key={v.key}
                                        onClick={() => addField(v)}
                                        className="w-full text-left px-3 py-2 text-sm bg-gray-50 border border-gray-200 rounded hover:bg-indigo-50 hover:border-indigo-300 transition-colors"
                                    >
                                        + {v.label}
                                    </button>
                                ))}
                            </div>
                        </div>

                        {selectedField && (
                            <div className="pt-4 border-t border-gray-200 space-y-3">
                                <h3 className="font-bold text-gray-700">Style: {selectedField.variable_key}</h3>
                                
                                <div>
                                    <label className="block text-xs text-gray-500">Font Size (e.g., 16px)</label>
                                    <input 
                                        type="text" 
                                        value={selectedField.font_size || ''} 
                                        onChange={e => updateSelectedField('font_size', e.target.value)}
                                        className="mt-1 w-full text-sm rounded border-gray-300"
                                    />
                                </div>
                                
                                <div>
                                    <label className="block text-xs text-gray-500">Color</label>
                                    <input 
                                        type="color" 
                                        value={selectedField.color || '#000000'} 
                                        onChange={e => updateSelectedField('color', e.target.value)}
                                        className="mt-1 w-full h-8 p-0 border-0 rounded cursor-pointer"
                                    />
                                </div>

                                <div>
                                    <label className="block text-xs text-gray-500">Font Weight</label>
                                    <select 
                                        value={selectedField.font_weight || 'normal'} 
                                        onChange={e => updateSelectedField('font_weight', e.target.value)}
                                        className="mt-1 w-full text-sm rounded border-gray-300"
                                    >
                                        <option value="normal">Normal</option>
                                        <option value="bold">Bold</option>
                                    </select>
                                </div>
                                
                                <div>
                                    <label className="block text-xs text-gray-500">Font Family</label>
                                    <select 
                                        value={selectedField.font_family || 'Arial'} 
                                        onChange={e => updateSelectedField('font_family', e.target.value)}
                                        className="mt-1 w-full text-sm rounded border-gray-300"
                                    >
                                        <option value="Arial">Arial</option>
                                        <option value="'Times New Roman'">Times New Roman</option>
                                        <option value="'Courier New'">Courier New</option>
                                        <option value="'Brush Script MT'">Brush Script MT (Cursive)</option>
                                    </select>
                                </div>

                                <button 
                                    onClick={() => removeField(selectedField.id)}
                                    className="w-full mt-2 bg-red-100 text-red-600 py-1.5 text-sm rounded hover:bg-red-200"
                                >
                                    Remove Field
                                </button>
                            </div>
                        )}
                        
                        <div className="pt-4 border-t border-gray-200">
                            <button 
                                onClick={saveLayout}
                                className="w-full bg-indigo-600 text-white font-bold py-2 px-4 rounded hover:bg-indigo-700"
                            >
                                Save Layout
                            </button>
                        </div>
                    </div>

                    {/* Right Panel: Canvas */}
                    <div className="w-full md:w-3/4 overflow-auto border border-gray-300 bg-gray-100 rounded-lg flex justify-center p-4">
                        <div 
                            ref={canvasRef}
                            className="relative bg-white shadow-lg overflow-hidden border border-gray-200"
                            style={{ 
                                width: template.width, 
                                height: template.height,
                                backgroundImage: template.background_image ? `url(/storage/${template.background_image})` : 'none',
                                backgroundSize: '100% 100%',
                                backgroundRepeat: 'no-repeat',
                                // CSS scale to fit on screen if it's too big, e.g. A4
                                // For simplicity, we just use raw pixels and scrollbars
                            }}
                        >
                            {fields.map(field => {
                                const isSelected = selectedFieldId === field.id;
                                // Display sample text for visual preview
                                const sampleText = field.sample || availableVariables.find(v => v.key === field.variable_key)?.sample || `[${field.variable_key}]`;
                                
                                return (
                                    <div
                                        key={field.id}
                                        onMouseDown={(e) => handleMouseDown(e, field)}
                                        className={`absolute cursor-move whitespace-nowrap px-1 select-none ${isSelected ? 'ring-2 ring-blue-500 ring-offset-1 z-10' : 'hover:ring-1 hover:ring-gray-300 z-0'}`}
                                        style={{
                                            left: field.position_x,
                                            top: field.position_y,
                                            fontSize: field.font_size || '16px',
                                            fontFamily: field.font_family || 'Arial',
                                            fontWeight: field.font_weight || 'normal',
                                            color: field.color || '#000000',
                                            textAlign: field.text_align || 'left',
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
        </AdminLayout>
    );
}

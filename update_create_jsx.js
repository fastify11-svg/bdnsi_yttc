const fs = require('fs');
let content = fs.readFileSync('resources/js/Pages/Admin/Result/Create.jsx', 'utf8');

// We need to add state for semesters
const stateCode = `    const [semesters, setSemesters] = useState(student?.semester_results || []);

    React.useEffect(() => {
        if (student) {
            setSemesters(student.semester_results || []);
        }
    }, [student]);

    const handleAddSemester = () => {
        setSemesters([...semesters, { semester_name: '', written: 0, practical: 0, viva: 0 }]);
    };

    const handleRemoveSemester = (index) => {
        const newSemesters = [...semesters];
        newSemesters.splice(index, 1);
        setSemesters(newSemesters);
    };

    const handleSemesterChange = (index, field, value) => {
        const newSemesters = [...semesters];
        newSemesters[index][field] = value;
        setSemesters(newSemesters);
    };`;

content = content.replace('    // Update marks when student changes', stateCode + '\n\n    // Update marks when student changes');

// Update publish payload
content = content.replace('viva: marks.viva', 'viva: marks.viva,\n                semesters: semesters');

// Add semester section UI before the submit button div
const uiCode = `
                            {/* Semesters Section */}
                            <div className="p-4 bg-slate-50 border-t border-slate-200">
                                <div className="flex justify-between items-center mb-4">
                                    <h3 className="font-bold text-slate-800 flex items-center gap-2">
                                        <i className="fa-solid fa-layer-group text-indigo-600"></i> Semester Results (Optional)
                                    </h3>
                                    <button 
                                        type="button"
                                        onClick={handleAddSemester}
                                        className="bg-emerald-100 text-emerald-700 hover:bg-emerald-600 hover:text-white transition px-3 py-1 rounded-md text-xs font-bold flex items-center gap-2"
                                    >
                                        <i className="fa-solid fa-plus"></i> Add Semester
                                    </button>
                                </div>
                                {semesters.length > 0 && (
                                    <div className="space-y-3">
                                        {semesters.map((sem, index) => (
                                            <div key={index} className="flex items-center gap-3 bg-white p-3 rounded-lg border border-slate-200 shadow-sm flex-wrap sm:flex-nowrap">
                                                <div className="flex-1 min-w-[150px]">
                                                    <input 
                                                        type="text" 
                                                        placeholder="Semester Name (e.g. 1st Semester)"
                                                        value={sem.semester_name}
                                                        onChange={(e) => handleSemesterChange(index, 'semester_name', e.target.value)}
                                                        className="w-full px-3 py-1.5 border border-slate-300 rounded focus:outline-none text-sm"
                                                        required
                                                    />
                                                </div>
                                                <div className="w-full sm:w-24">
                                                    <input 
                                                        type="number" 
                                                        placeholder="Written"
                                                        value={sem.written}
                                                        onChange={(e) => handleSemesterChange(index, 'written', e.target.value)}
                                                        className="w-full px-3 py-1.5 border border-slate-300 rounded focus:outline-none text-sm"
                                                        required
                                                    />
                                                </div>
                                                <div className="w-full sm:w-24">
                                                    <input 
                                                        type="number" 
                                                        placeholder="Practical"
                                                        value={sem.practical}
                                                        onChange={(e) => handleSemesterChange(index, 'practical', e.target.value)}
                                                        className="w-full px-3 py-1.5 border border-slate-300 rounded focus:outline-none text-sm"
                                                        required
                                                    />
                                                </div>
                                                <div className="w-full sm:w-24">
                                                    <input 
                                                        type="number" 
                                                        placeholder="Viva"
                                                        value={sem.viva}
                                                        onChange={(e) => handleSemesterChange(index, 'viva', e.target.value)}
                                                        className="w-full px-3 py-1.5 border border-slate-300 rounded focus:outline-none text-sm"
                                                        required
                                                    />
                                                </div>
                                                <button 
                                                    type="button"
                                                    onClick={() => handleRemoveSemester(index)}
                                                    className="text-rose-500 hover:text-rose-700 p-2"
                                                >
                                                    <i className="fa-solid fa-trash"></i>
                                                </button>
                                            </div>
                                        ))}
                                    </div>
                                )}
                            </div>
`;

content = content.replace('<div className="p-4 bg-slate-50 border-t border-slate-200 flex justify-between items-center">', uiCode + '<div className="p-4 bg-slate-50 border-t border-slate-200 flex justify-between items-center">');

fs.writeFileSync('resources/js/Pages/Admin/Result/Create.jsx', content);
console.log('Updated Create.jsx successfully.');

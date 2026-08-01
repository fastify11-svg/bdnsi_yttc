import React, { useState, useEffect } from 'react';
import { Link, usePage } from '@inertiajs/inertia-react';
import FrontendLayout from '../Layouts/FrontendLayout';
import { getUrl } from '../utils/urlHelper';

const FALLBACK_SLIDERS = [
    { id: 1, photo: '/images/about.jpg', title: 'Technical Education Training Banner 1' }
];

const FALLBACK_NOTICES = [
    { id: 1, displayTitle: 'এমন শিক্ষার্থীদের জন্য যারা [পরীক্ষার নাম] পরীক্ষায় অংশগ্রহণ করেছেন, জানানো যাচ্ছে যে পরীক্ষা...', displayDate: '11 Aug 2025' },
    { id: 2, displayTitle: 'এমন শিক্ষার্থীদের জন্য যারা [কোর্সের নাম] কোর্সে অংশগ্রহণ করতে চান, জানানো যাচ্ছে যে কোর্স...', displayDate: '11 Aug 2025' },
    { id: 3, displayTitle: 'শিক্ষার্থীদের জানানো যাচ্ছে যে, আমাদের প্রতিষ্ঠানে ইলেকট্রিশিয়ান কোর্স আগামী [তারিখ] থেকে...', displayDate: '11 Aug 2025' },
];

const FALLBACK_COURSES = [
    { id: 1, name: '3g 4g 6g Arc Welder', duration: '3-Month, 6-Month, 1-Year, 2-Year', image: '/images/driving.png' },
    { id: 2, name: '3g 4g Mig Welder', duration: '3-Month, 6-Month, 1-Year, 2-Year', image: '/images/blueverify.png' },
    { id: 3, name: '3g 4g Mig Welder & Gas Cutting', duration: '2 Years', image: '/images/driving.png' },
    { id: 4, name: '3G,4G Welder', duration: '2 Years', image: '/images/blueverify.png' },
    { id: 5, name: '4G, 6G, TIG, and MIG Welding', duration: '3-Month, 6-Month, 1-Year, 2-Year', image: '/images/driving.png' },
    { id: 6, name: '4G,6G, TIG, MIG Welding', duration: '6-Month, 1-Year, 2-Year', image: '/images/blueverify.png' },
    { id: 7, name: '6g Tig Welder', duration: '3-Month, 6-Month, 1-Year, 2-Year', image: '/images/driving.png' },
];

const FALLBACK_VIDEOS = [
    { video_id: 'dQw4w9WgXcQ', title: 'BDNSI Technical Orientation Video 1' },
    { video_id: 'dQw4w9WgXcQ', title: 'BDNSI Technical Orientation Video 2' },
    { video_id: 'dQw4w9WgXcQ', title: 'BDNSI Technical Orientation Video 3' },
    { video_id: 'dQw4w9WgXcQ', title: 'BDNSI Technical Orientation Video 4' }
];

const FALLBACK_CENTERS = [
    { id: 1, name: 'Hotel Management & Tourism Training Institute' },
    { id: 2, name: 'Shyamoli Ideal Polytechnic Institute' },
    { id: 3, name: 'Chef Training Institute Bangladesh' },
    { id: 4, name: 'Central Technical Training Institute' },
    { id: 5, name: 'Trust Technical Training Institute' },
    { id: 6, name: 'Agriculture Training Institute Bangladesh' },
    { id: 7, name: 'Institute Of Health Technology Sylhet' },
    { id: 8, name: 'Medhabikash Technical institute of Technology' },
];

const FALLBACK_STUDENTS = [
    { id: 1, name: 'Sabina Yesmin' },
    { id: 2, name: 'Aleya Begum' },
    { id: 3, name: 'Johirul Islam' },
    { id: 4, name: 'Md Emon Hossain' },
    { id: 5, name: 'Md Emon Hossain' },
    { id: 6, name: 'Sakhawet Hosssain' },
    { id: 7, name: 'Md. Annisul Haque' },
    { id: 8, name: 'Bayjit Miah' },
    { id: 9, name: 'Md Shahin Alam' },
    { id: 10, name: 'Mohammad Nayem Ahm...' },
    { id: 11, name: 'Sohel Mia' },
    { id: 12, name: 'Mohammad Jual Hossain' },
];

const FALLBACK_GALLERY = [
    '/images/about.jpg',
    '/images/driving.png',
    '/images/blueverify.png',
    '/images/govt.png',
    '/images/about.jpg',
    '/images/driving.png',
    '/images/blueverify.png',
    '/images/govt.png',
    '/images/about.jpg',
    '/images/driving.png',
];

const FALLBACK_SPONSORS = [
    '/images/govt.png',
    '/images/blueverify.png',
    '/images/driving.png',
    '/images/govt.png',
    '/images/blueverify.png',
    '/images/driving.png'
];

export default function Welcome({
    sliders = [],
    sponsors = [],
    photo_gallery = [],
    courses = [],
    teams = [],
    youtube_videos = [],
    notices = [],
    centers = [],
    success_students = [],
    notice = '',
    about_us = '',
    counts = {},
    site_config = {}
}) {
    const { app_url, site_config: pageConfig = {} } = usePage().props;
    const config = { ...pageConfig, ...site_config };
    const [aboutExpanded, setAboutExpanded] = useState(false);
    const [selectedImage, setSelectedImage] = useState(null);
    const [currentSlide, setCurrentSlide] = useState(0);
    const [clickedSponsors, setClickedSponsors] = useState({});

    const activeSliders = sliders.length > 0 ? sliders : FALLBACK_SLIDERS;

    useEffect(() => {
        if (activeSliders.length <= 1) return;
        const timer = setInterval(() => {
            setCurrentSlide((prev) => (prev + 1) % activeSliders.length);
        }, 5000);
        return () => clearInterval(timer);
    }, [activeSliders.length]);

    const cleanNotice = notice ? notice.replace(/<[^>]*>?/gm, '').trim() : '';

    const formatDate = (dateStr) => {
        if (!dateStr) return '11 Aug 2025';
        try {
            const date = new Date(dateStr);
            return isNaN(date.getTime()) ? '11 Aug 2025' : date.toLocaleDateString('en-GB', { day: '2-digit', month: 'short', year: 'numeric' });
        } catch {
            return '11 Aug 2025';
        }
    };

    const formattedNotices = notices.length > 0 ? notices.map(n => ({
        ...n,
        displayTitle: n.title || (n.details ? n.details.replace(/<[^>]*>?/gm, '').trim() : '') || 'গুরুত্বপূর্ণ বিজ্ঞপ্তি প্রকাশ করা হয়েছে',
        displayDate: formatDate(n.created_at)
    })) : FALLBACK_NOTICES;

    const courseList = courses.length > 0 ? courses : FALLBACK_COURSES;
    const videoList = youtube_videos && youtube_videos.length > 0 ? youtube_videos : FALLBACK_VIDEOS;

    const groupInPairs = (arr) => {
        const pairs = [];
        for (let i = 0; i < arr.length; i += 2) {
            pairs.push(arr.slice(i, i + 2));
        }
        return pairs;
    };

    const coursePairs = groupInPairs(courseList);
    const videoPairs = groupInPairs(videoList);

    const verifiedInstitutes = centers.length > 0 ? centers : FALLBACK_CENTERS;
    const successStudentList = success_students.length > 0 ? success_students : FALLBACK_STUDENTS;

    const galleryImages = photo_gallery && photo_gallery.length > 0
        ? photo_gallery.map(g => g.photo || g.image || '/images/about.jpg')
        : FALLBACK_GALLERY;

    const sponsorList = sponsors.length > 0 ? sponsors.map(s => s.image || s.photo || '/images/govt.png') : FALLBACK_SPONSORS;

    return (
        <FrontendLayout>
            {/* Continuous Marquee Animation Styles */}
            <style>{`
                @keyframes notice-marquee {
                    0% { transform: translateX(0%); }
                    100% { transform: translateX(-50%); }
                }
                .animate-notice-marquee {
                    display: flex;
                    width: max-content;
                    animation: notice-marquee 25s linear infinite;
                }
                .animate-notice-marquee:hover {
                    animation-play-state: paused;
                }

                @keyframes photo-marquee {
                    0% { transform: translateX(0%); }
                    100% { transform: translateX(-50%); }
                }
                .animate-photo-marquee {
                    display: flex;
                    width: max-content;
                    animation: photo-marquee 30s linear infinite;
                }
                .animate-photo-marquee:hover {
                    animation-play-state: paused;
                }

                @keyframes center-marquee {
                    0% { transform: translateX(0%); }
                    100% { transform: translateX(-50%); }
                }
                .animate-center-marquee {
                    display: flex;
                    width: max-content;
                    animation: center-marquee 35s linear infinite;
                }
                .animate-center-marquee:hover {
                    animation-play-state: paused;
                }

                @keyframes student-marquee {
                    0% { transform: translateX(0%); }
                    100% { transform: translateX(-50%); }
                }
                .animate-student-marquee {
                    display: flex;
                    width: max-content;
                    animation: student-marquee 25s linear infinite;
                }
                .animate-student-marquee:hover {
                    animation-play-state: paused;
                }

                @keyframes sponsor-marquee {
                    0% { transform: translateX(0%); }
                    100% { transform: translateX(-50%); }
                }
                .animate-sponsor-marquee {
                    display: flex;
                    width: max-content;
                    animation: sponsor-marquee 20s linear infinite;
                }
                .animate-sponsor-marquee:hover {
                    animation-play-state: paused;
                }

                @keyframes course-marquee {
                    0% { transform: translateX(0%); }
                    100% { transform: translateX(-50%); }
                }
                .animate-course-marquee {
                    display: flex;
                    width: max-content;
                    animation: course-marquee 30s linear infinite;
                }
                .animate-course-marquee:hover {
                    animation-play-state: paused;
                }

                @keyframes video-marquee {
                    0% { transform: translateX(0%); }
                    100% { transform: translateX(-50%); }
                }
                .animate-video-marquee {
                    display: flex;
                    width: max-content;
                    animation: video-marquee 35s linear infinite;
                }
                .animate-video-marquee:hover {
                    animation-play-state: paused;
                }
            `}</style>

            {/* 1. Scrolling Notice Ticker (Right to Left Continuous News Ticker) */}
            {(config.toggle_notice_board ?? true) && (
                <div className="bg-white border border-rose-200 rounded-md overflow-hidden flex items-center shadow-sm relative z-20">
                    <span className="bg-[#BE123C] text-white font-black px-3 sm:px-4 py-2 text-[11px] sm:text-xs uppercase tracking-wider shrink-0 z-30 shadow-sm relative">
                        NOTICE
                    </span>
                    <div className="overflow-hidden flex-1 flex items-center px-3 py-2">
                        <div className="animate-notice-marquee">
                            <div className="flex gap-16 shrink-0 min-w-full pr-16 items-center">
                                <p className="text-[13px] font-semibold text-slate-800">
                                    {cleanNotice || 'মানসম্মত প্রশিক্ষণ গ্রহণ করে অনেক শিক্ষিত কিংবা অশিক্ষিত বেকার কর্মসংস্থান করতে পেরেছে। দেশের প্রায় সকল পাবলিক ও প্রাইভেট বিশ্ববিদ্যালয়ের সংশ্লিষ্ট ডিপার্টমেন্টের ছাত্র-ছাত্রী প্রশিক্ষণ গ্রহণ করছেন।'}
                                </p>
                            </div>
                            <div className="flex gap-16 shrink-0 min-w-full pr-16 items-center" aria-hidden="true">
                                <p className="text-[13px] font-semibold text-slate-800">
                                    {cleanNotice || 'মানসম্মত প্রশিক্ষণ গ্রহণ করে অনেক শিক্ষিত কিংবা অশিক্ষিত বেকার কর্মসংস্থান করতে পেরেছে। দেশের প্রায় সকল পাবলিক ও প্রাইভেট বিশ্ববিদ্যালয়ের সংশ্লিষ্ট ডিপার্টমেন্টের ছাত্র-ছাত্রী প্রশিক্ষণ গ্রহণ করছেন।'}
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            )}

            {/* 2. Hero Section (Grid: Left 8 cols Slider, Right 4 cols Leadership & E-Services) */}
            <div className="grid grid-cols-1 lg:grid-cols-12 gap-4 sm:gap-6 items-start">
                {/* Left 8 Cols: Banner Carousel */}
                <div className="lg:col-span-8 bg-white rounded-md border border-slate-200 overflow-hidden shadow-sm flex flex-col">
                    <div className="relative w-full h-56 sm:h-[340px] lg:h-[388px] bg-slate-950 flex items-center justify-center overflow-hidden rounded-md group">
                        <img
                            src={activeSliders[currentSlide]?.photo || activeSliders[currentSlide]?.image ? getUrl(activeSliders[currentSlide].photo || activeSliders[currentSlide].image) : getUrl('/images/about.jpg')}
                            alt={activeSliders[currentSlide]?.title || "Technical Education Training Banner"}
                            className="absolute inset-0 w-full h-full object-cover transition-transform duration-700 group-hover:scale-105"
                            onError={(e) => {
                                e.target.onerror = null;
                                e.target.src = getUrl('/images/govt.png');
                            }}
                        />
                        {/* Overlay text */}
                        <div className="absolute inset-0 bg-black/40 z-0"></div>
                        <div className="absolute inset-0 flex flex-col items-center justify-center text-center p-4 z-10">
                            {activeSliders[currentSlide]?.title && (
                                <h2 className="text-xl sm:text-3xl lg:text-4xl font-black text-white drop-shadow-lg mb-2">{activeSliders[currentSlide].title}</h2>
                            )}
                            {activeSliders[currentSlide]?.subtitle && (
                                <p className="text-sm sm:text-lg text-white/90 drop-shadow-md mb-6 max-w-2xl">{activeSliders[currentSlide].subtitle}</p>
                            )}
                            {activeSliders[currentSlide]?.button_text && (
                                <Link 
                                    href={activeSliders[currentSlide].button_link || '#'} 
                                    className="px-6 py-2.5 bg-[#7024A8] hover:bg-[#581C87] text-white font-bold rounded-lg shadow-lg transition-transform transform hover:scale-105"
                                >
                                    {activeSliders[currentSlide].button_text}
                                </Link>
                            )}
                        </div>
                        {/* Navigation Arrows */}
                        {activeSliders.length > 1 && (
                            <>
                                <button
                                    onClick={() => setCurrentSlide((prev) => (prev - 1 + activeSliders.length) % activeSliders.length)}
                                    className="absolute left-3 top-1/2 -translate-y-1/2 bg-black/40 hover:bg-black/70 text-white w-9 h-9 rounded-full flex items-center justify-center opacity-0 group-hover:opacity-100 transition-all duration-300"
                                    aria-label="Previous Banner"
                                >
                                    <i className="fa-solid fa-chevron-left text-sm"></i>
                                </button>
                                <button
                                    onClick={() => setCurrentSlide((prev) => (prev + 1) % activeSliders.length)}
                                    className="absolute right-3 top-1/2 -translate-y-1/2 bg-black/40 hover:bg-black/70 text-white w-9 h-9 rounded-full flex items-center justify-center opacity-0 group-hover:opacity-100 transition-all duration-300"
                                    aria-label="Next Banner"
                                >
                                    <i className="fa-solid fa-chevron-right text-sm"></i>
                                </button>
                            </>
                        )}
                        {/* Indicator Dots */}
                        {activeSliders.length > 1 && (
                            <div className="absolute bottom-4 left-1/2 -translate-x-1/2 flex items-center gap-2 bg-black/50 backdrop-blur-sm px-4 py-1.5 rounded-full border border-white/20 z-10 max-w-[90%] overflow-x-auto no-scrollbar">
                                {activeSliders.map((_, idx) => (
                                    <button
                                        key={`dot-${idx}`}
                                        onClick={() => setCurrentSlide(idx)}
                                        className={`w-2.5 h-2.5 rounded-full transition-all duration-300 shrink-0 ${currentSlide === idx ? 'bg-amber-400 scale-125 shadow-sm' : 'bg-white/50 hover:bg-white'}`}
                                        aria-label={`Go to slide ${idx + 1}`}
                                    />
                                ))}
                            </div>
                        )}
                    </div>
                </div>

                {/* Right 4 Cols: Leadership Card & Internal E-Services */}
                <div className="lg:col-span-4 space-y-4 sm:space-y-6">
                    {/* LEADERSHIP Card */}
                    <div className="bg-white rounded-md border border-slate-200 overflow-hidden shadow-sm">
                        <div className="bg-[#7024A8] text-white font-extrabold px-4 py-2.5 text-xs text-center uppercase tracking-wider">
                            LEADERSHIP
                        </div>
                        <div className="p-4 grid grid-cols-2 gap-4 text-center bg-white">
                            {(teams.length > 0 ? teams.slice(0, 2) : [{name: "Mrs. Shiuli Akhter", designation: "Advisor", image: null}, {name: "Mohammad Zafarullah", designation: "President", image: null}]).map((team, idx) => (
                                <div key={`team-${team.id || idx}`} className="space-y-1">
                                    <div className="w-20 h-24 bg-slate-100 border border-slate-200 rounded overflow-hidden mx-auto shadow-sm group">
                                        <img
                                            src={team.image ? getUrl(team.image) : getUrl('/images/govt.png')}
                                            alt={team.name}
                                            className="w-full h-full object-cover group-hover:scale-105 transition-transform"
                                            onError={(e) => {
                                                e.target.onerror = null;
                                                e.target.src = getUrl('/images/avatar.png');
                                            }}
                                        />
                                    </div>
                                    <p className="font-extrabold text-slate-900 text-xs mt-1 truncate" title={team.name}>{team.name}</p>
                                    <p className="text-[10px] text-slate-500 font-semibold uppercase tracking-wider">{team.designation}</p>
                                    <div className="flex items-center justify-center gap-2 mt-1.5">
                                        {team.facebook_link && <a href={team.facebook_link} target="_blank" rel="noreferrer" className="text-slate-400 hover:text-blue-600 transition"><i className="fa-brands fa-facebook"></i></a>}
                                        {team.twitter_link && <a href={team.twitter_link} target="_blank" rel="noreferrer" className="text-slate-400 hover:text-blue-400 transition"><i className="fa-brands fa-twitter"></i></a>}
                                        {team.linkedin_link && <a href={team.linkedin_link} target="_blank" rel="noreferrer" className="text-slate-400 hover:text-blue-700 transition"><i className="fa-brands fa-linkedin"></i></a>}
                                        {team.phone && <a href={`tel:${team.phone}`} className="text-slate-400 hover:text-emerald-600 transition"><i className="fa-solid fa-phone"></i></a>}
                                        {team.email && <a href={`mailto:${team.email}`} className="text-slate-400 hover:text-rose-600 transition"><i className="fa-solid fa-envelope"></i></a>}
                                    </div>
                                </div>
                            ))}
                        </div>
                    </div>

                    {/* INTERNAL E-SERVICES Card */}
                    <div className="bg-white rounded-md border border-slate-200 overflow-hidden shadow-sm">
                        <div className="bg-[#7024A8] text-white font-extrabold px-4 py-2.5 text-xs text-center uppercase tracking-wider">
                            INTERNAL E-SERVICES
                        </div>
                        <div className="divide-y divide-slate-100 text-[13px] font-semibold">
                            {(config.toggle_result_verify ?? true) && (
                                <Link href={getUrl('/result')} className="px-4 py-2.5 flex justify-between items-center text-slate-700 hover:bg-purple-50 hover:text-[#7024A8] transition">
                                    <span className="flex items-center gap-2"><i className="fa-solid fa-graduation-cap text-[#7024A8] w-4 text-center"></i>Student Result</span>
                                    <i className="fa-solid fa-chevron-right text-[10px] text-slate-400"></i>
                                </Link>
                            )}
                            {(config.toggle_center_apply ?? true) && (
                                <Link href={getUrl('/center-request/create')} className="px-4 py-2.5 flex justify-between items-center text-slate-700 hover:bg-purple-50 hover:text-[#7024A8] transition">
                                    <span className="flex items-center gap-2"><i className="fa-solid fa-building text-[#7024A8] w-4 text-center"></i>Center Apply</span>
                                    <i className="fa-solid fa-chevron-right text-[10px] text-slate-400"></i>
                                </Link>
                            )}
                            <Link href={getUrl('/login')} className="px-4 py-2.5 flex justify-between items-center text-slate-700 hover:bg-purple-50 hover:text-[#7024A8] transition">
                                <span className="flex items-center gap-2"><i className="fa-solid fa-lock text-[#7024A8] w-4 text-center"></i>Center Login</span>
                                <i className="fa-solid fa-chevron-right text-[10px] text-slate-400"></i>
                            </Link>
                            {(config.toggle_notice_board ?? true) && (
                                <Link href={getUrl('/all-notice-list')} className="px-4 py-2.5 flex justify-between items-center text-slate-700 hover:bg-purple-50 hover:text-[#7024A8] transition">
                                    <span className="flex items-center gap-2"><i className="fa-solid fa-bell text-[#7024A8] w-4 text-center"></i>Notice Board</span>
                                    <i className="fa-solid fa-chevron-right text-[10px] text-slate-400"></i>
                                </Link>
                            )}
                        </div>
                    </div>
                </div>
            </div>

            {/* 3. Middle Content Layout (2 Columns: Left 8 cols, Right 4 cols) */}
            <div className="grid grid-cols-1 lg:grid-cols-12 gap-4 sm:gap-6 items-start">
                {/* Left 8 Cols Container */}
                <div className="lg:col-span-8 space-y-4 sm:space-y-6">
                    {/* NOTICE BOARD Card */}
                    <div className="bg-white rounded-md border border-slate-200 overflow-hidden shadow-sm">
                        <div className="bg-[#7024A8] text-white px-4 py-2.5 text-xs font-bold flex justify-between items-center">
                            <div className="flex items-center gap-2 text-white">
                                <i className="fa-solid fa-bell text-white"></i>
                                <span className="uppercase tracking-wider font-extrabold text-white">NOTICE BOARD</span>
                            </div>
                            <Link href={getUrl('/all-notice-list')} className="bg-[#581C87] hover:bg-purple-900 text-white px-3 py-1 rounded text-[10px] uppercase font-black tracking-wider shadow-sm transition">
                                SHOW ALL
                            </Link>
                        </div>
                        <div className="divide-y divide-slate-100 p-2">
                            {formattedNotices.map((n, idx) => (
                                <Link key={`notice-${n.id || idx}`} href={getUrl(`/all-notice-list/${n.id}`)} className="p-3 flex items-center gap-3 hover:bg-purple-50/50 transition group">
                                    <span className="bg-amber-100 text-amber-900 font-extrabold px-2.5 py-1 rounded text-[10px] shrink-0 font-mono">
                                        {n.displayDate}
                                    </span>
                                    <p className="text-[13px] font-medium text-slate-800 group-hover:text-[#7024A8] transition truncate">
                                        {n.displayTitle}
                                    </p>
                                </Link>
                            ))}
                        </div>
                    </div>

                    {/* ABOUT US Card */}
                    <div className="bg-white rounded-md border border-slate-200 overflow-hidden shadow-sm">
                        <div className="bg-[#7024A8] text-white px-4 py-2.5 text-xs font-bold flex items-center gap-2">
                            <i className="fa-solid fa-building-columns text-white"></i>
                            <span className="uppercase tracking-wider font-extrabold text-white">ABOUT US</span>
                        </div>
                        <div className="p-4 flex flex-col sm:flex-row gap-5 items-start">
                            <img
                                src={getUrl('/images/about.jpg')}
                                alt="About BDNSI Institute"
                                className="w-full sm:w-48 h-36 object-cover rounded border border-slate-200 shrink-0 shadow-sm"
                                onError={(e) => {
                                    e.target.onerror = null;
                                    e.target.src = getUrl('/images/govt.png');
                                }}
                            />
                            <div className="space-y-3 text-[13px] text-slate-700 leading-relaxed font-medium w-full">
                                {aboutExpanded ? (
                                    <div 
                                        className="prose max-w-none text-[13px] text-slate-700 space-y-2 leading-relaxed"
                                        dangerouslySetInnerHTML={{ __html: about_us || 'মানসম্মত প্রশিক্ষণ প্রদান করে বেকার কর্মসংস্থান সৃষ্টিতে আমরা প্রতিশ্রুতিবদ্ধ।' }} 
                                    />
                                ) : (
                                    <p className="line-clamp-4 sm:line-clamp-5">
                                        {about_us ? about_us.replace(/<[^>]*>?/gm, '') : 'মানসম্মত প্রশিক্ষণ প্রদান করে বেকার কর্মসংস্থান সৃষ্টিতে আমরা প্রতিশ্রুতিবদ্ধ। দেশের বিভিন্ন স্থানের বেকার যুবকদের কারিগরি প্রশিক্ষণ দিয়ে দক্ষ জনশক্তিতে রূপান্তর করা হচ্ছে।'}
                                    </p>
                                )}
                                {about_us && about_us.length > 200 && (
                                    <button
                                        onClick={() => setAboutExpanded(!aboutExpanded)}
                                        className="text-[#7024A8] font-bold hover:underline inline-block text-xs"
                                    >
                                        {aboutExpanded ? '« Read less' : 'Read more »'}
                                    </button>
                                )}
                            </div>
                        </div>
                    </div>

                    {/* STATISTICS COUNTER GRID (4 Columns) */}
                    <div className="grid grid-cols-2 sm:grid-cols-4 gap-3 sm:gap-4">
                        <div className="bg-white rounded-md p-4 sm:p-5 border border-slate-200 text-center shadow-sm">
                            <h3 className="text-2xl sm:text-3xl font-black text-[#7024A8]">{counts.total_centers ?? 216}+</h3>
                            <p className="text-[10px] sm:text-[11px] font-bold text-slate-500 uppercase mt-1 tracking-wider">CENTERS</p>
                        </div>
                        <div className="bg-white rounded-md p-4 sm:p-5 border border-slate-200 text-center shadow-sm">
                            <h3 className="text-2xl sm:text-3xl font-black text-[#7024A8]">{counts.total_courses ?? 532}+</h3>
                            <p className="text-[10px] sm:text-[11px] font-bold text-slate-500 uppercase mt-1 tracking-wider">COURSES</p>
                        </div>
                        <div className="bg-white rounded-md p-4 sm:p-5 border border-slate-200 text-center shadow-sm">
                            <h3 className="text-2xl sm:text-3xl font-black text-[#7024A8]">{counts.total_exams ?? 176}+</h3>
                            <p className="text-[10px] sm:text-[11px] font-bold text-slate-500 uppercase mt-1 tracking-wider">EXAMS</p>
                        </div>
                        <div className="bg-[#7024A8] text-white rounded-md p-4 sm:p-5 border border-[#581C87] text-center shadow-sm">
                            <h3 className="text-2xl sm:text-3xl font-black text-amber-300">{counts.total_students ? counts.total_students.toLocaleString() : '54,512'}+</h3>
                            <p className="text-[10px] sm:text-[11px] font-bold text-purple-200 uppercase mt-1 tracking-wider">STUDENTS</p>
                        </div>
                    </div>

                    {/* PHOTO GALLERY Card (Clickable Lightbox Trigger) */}
                    {(config.toggle_photo_gallery ?? true) && (
                        <div className="bg-white rounded-md border border-slate-200 overflow-hidden shadow-sm">
                            <div className="bg-[#7024A8] text-white px-4 py-2.5 text-xs font-bold flex items-center justify-between">
                                <div className="flex items-center gap-2 text-white">
                                    <i className="fa-solid fa-camera text-white"></i>
                                    <span className="uppercase tracking-wider font-extrabold text-white">PHOTO GALLERY</span>
                                </div>
                                <span className="text-[10px] bg-[#581C87] text-white px-2.5 py-0.5 rounded font-black tracking-wider uppercase shadow-sm">
                                    LIVE SLIDER
                                </span>
                            </div>
                            <div className="p-4 overflow-hidden relative">
                                <div className="animate-photo-marquee">
                                    <div className="flex gap-4 pr-4 shrink-0">
                                        {galleryImages.map((imgUrl, idx) => (
                                            <div
                                                key={`gallery-a-${idx}`}
                                                onClick={() => setSelectedImage(getUrl(imgUrl))}
                                                className="w-56 h-36 rounded-md border border-slate-200 overflow-hidden bg-slate-900 shrink-0 shadow-sm group cursor-pointer relative"
                                            >
                                                <img
                                                    src={getUrl(imgUrl)}
                                                    alt={`Gallery Activity ${idx}`}
                                                    className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500"
                                                    onError={(e) => {
                                                        e.target.onerror = null;
                                                        e.target.src = getUrl('/images/govt.png');
                                                    }}
                                                />
                                                <div className="absolute inset-0 bg-purple-900/0 group-hover:bg-purple-900/40 transition-colors flex items-center justify-center">
                                                    <i className="fa-solid fa-magnifying-glass-plus text-white text-2xl opacity-0 group-hover:opacity-100 transition-opacity transform group-hover:scale-110"></i>
                                                </div>
                                            </div>
                                        ))}
                                    </div>
                                    <div className="flex gap-4 pr-4 shrink-0" aria-hidden="true">
                                        {galleryImages.map((imgUrl, idx) => (
                                            <div
                                                key={`gallery-b-${idx}`}
                                                onClick={() => setSelectedImage(getUrl(imgUrl))}
                                                className="w-56 h-36 rounded-md border border-slate-200 overflow-hidden bg-slate-900 shrink-0 shadow-sm group cursor-pointer relative"
                                            >
                                                <img
                                                    src={getUrl(imgUrl)}
                                                    alt={`Gallery Activity ${idx}`}
                                                    className="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500"
                                                    onError={(e) => {
                                                        e.target.onerror = null;
                                                        e.target.src = getUrl('/images/govt.png');
                                                    }}
                                                />
                                                <div className="absolute inset-0 bg-purple-900/0 group-hover:bg-purple-900/40 transition-colors flex items-center justify-center">
                                                    <i className="fa-solid fa-magnifying-glass-plus text-white text-2xl opacity-0 group-hover:opacity-100 transition-opacity transform group-hover:scale-110"></i>
                                                </div>
                                            </div>
                                        ))}
                                    </div>
                                </div>
                            </div>
                        </div>
                    )}
                </div>

                {/* Right 4 Cols: IMPORTANT LINKS, HELPLINE Box & STACKED SERVICES SIDEBAR */}
                <div className="lg:col-span-4 space-y-4 sm:space-y-6">
                    {/* IMPORTANT LINKS Card */}
                    <div className="bg-white rounded-md border border-slate-200 overflow-hidden shadow-sm">
                        <div className="bg-[#7024A8] text-white font-extrabold px-4 py-2.5 text-xs text-center uppercase tracking-wider">
                            IMPORTANT LINKS
                        </div>
                        <div className="p-3 space-y-2 text-[13px] font-semibold text-slate-700">
                            <Link href={getUrl('/all-course')} className="block hover:text-[#7024A8] transition hover:translate-x-1">&rsaquo; All Courses</Link>
                            {(config.toggle_verified_centers ?? true) && (
                                <Link href={getUrl('/verified-center')} className="block hover:text-[#7024A8] transition hover:translate-x-1">&rsaquo; Verified Center</Link>
                            )}
                            {(config.toggle_success_students ?? true) && (
                                <Link href={getUrl('/success-student')} className="block hover:text-[#7024A8] transition hover:translate-x-1">&rsaquo; Success Students</Link>
                            )}
                            {(config.toggle_contact_form ?? true) && (
                                <Link href={getUrl('/contact-us')} className="block hover:text-[#7024A8] transition hover:translate-x-1">&rsaquo; Contact Us</Link>
                            )}
                        </div>
                    </div>

                    {/* HELPLINE Box */}
                    <div className="bg-white border-2 border-rose-600 rounded-md p-5 text-center shadow-sm">
                        <p className="text-xs font-extrabold text-rose-600 uppercase tracking-widest">HELPLINE</p>
                        <p className="text-2xl font-black text-[#7024A8] font-mono mt-1">{config.site_phone || '09649700002'}</p>
                    </div>

                    {/* STACKED SERVICES SIDEBAR */}
                    <div className="space-y-4 sm:space-y-6">
                        {/* ACADEMIC SERVICES */}
                        <div className="bg-white rounded-md border border-slate-200 overflow-hidden shadow-sm">
                            <div className="bg-[#7024A8] text-white px-3 py-2 text-xs font-bold flex items-center gap-2">
                                <i className="fa-solid fa-book-open text-white"></i>
                                <span className="uppercase tracking-wider text-white">ACADEMIC SERVICES</span>
                            </div>
                            <div className="p-3 space-y-2 text-[13px] font-semibold text-slate-700">
                                <Link href={getUrl('/all-course')} className="block hover:text-[#7024A8] transition hover:translate-x-1">&rsaquo; All Courses</Link>
                                {(config.toggle_result_verify ?? true) && (
                                    <Link href={getUrl('/result')} className="block hover:text-[#7024A8] transition hover:translate-x-1">&rsaquo; Student Result</Link>
                                )}
                                {(config.toggle_success_students ?? true) && (
                                    <Link href={getUrl('/success-student')} className="block hover:text-[#7024A8] transition hover:translate-x-1">&rsaquo; Success Students</Link>
                                )}
                            </div>
                        </div>

                        {/* CENTER SERVICES */}
                        <div className="bg-white rounded-md border border-slate-200 overflow-hidden shadow-sm">
                            <div className="bg-[#7024A8] text-white px-3 py-2 text-xs font-bold flex items-center gap-2">
                                <i className="fa-solid fa-building text-white"></i>
                                <span className="uppercase tracking-wider text-white">CENTER SERVICES</span>
                            </div>
                            <div className="p-3 space-y-2 text-[13px] font-semibold text-slate-700">
                                {(config.toggle_verified_centers ?? true) && (
                                    <Link href={getUrl('/verified-center')} className="block hover:text-[#7024A8] transition hover:translate-x-1">&rsaquo; Verified Centers</Link>
                                )}
                                {(config.toggle_center_apply ?? true) && (
                                    <Link href={getUrl('/center-request/create')} className="block hover:text-[#7024A8] transition hover:translate-x-1">&rsaquo; Center Apply</Link>
                                )}
                                <Link href={getUrl('/login')} className="block hover:text-[#7024A8] transition hover:translate-x-1">&rsaquo; Center Login</Link>
                            </div>
                        </div>

                        {/* INFORMATION */}
                        <div className="bg-white rounded-md border border-slate-200 overflow-hidden shadow-sm">
                            <div className="bg-[#7024A8] text-white px-3 py-2 text-xs font-bold flex items-center gap-2">
                                <i className="fa-solid fa-circle-info text-white"></i>
                                <span className="uppercase tracking-wider text-white">INFORMATION</span>
                            </div>
                            <div className="p-3 space-y-2 text-[13px] font-semibold text-slate-700">
                                {(config.toggle_notice_board ?? true) && (
                                    <Link href={getUrl('/all-notice-list')} className="block hover:text-[#7024A8] transition hover:translate-x-1">&rsaquo; Notice Board</Link>
                                )}
                                <Link href={getUrl('/')} className="block hover:text-[#7024A8] transition hover:translate-x-1">&rsaquo; About Us</Link>
                                {(config.toggle_contact_form ?? true) && (
                                    <Link href={getUrl('/contact-us')} className="block hover:text-[#7024A8] transition hover:translate-x-1">&rsaquo; Contact Us</Link>
                                )}
                            </div>
                        </div>

                        {/* POLICIES */}
                        <div className="bg-white rounded-md border border-slate-200 overflow-hidden shadow-sm">
                            <div className="bg-[#7024A8] text-white px-3 py-2 text-xs font-bold flex items-center gap-2">
                                <i className="fa-solid fa-file-contract text-white"></i>
                                <span className="uppercase tracking-wider text-white">POLICIES</span>
                            </div>
                            <div className="p-3 space-y-2 text-[13px] font-semibold text-slate-700">
                                <Link href={getUrl('/page/terms')} className="block hover:text-[#7024A8] transition hover:translate-x-1">&rsaquo; Terms & Condition</Link>
                                <Link href={getUrl('/page/privacy')} className="block hover:text-[#7024A8] transition hover:translate-x-1">&rsaquo; Privacy Policy</Link>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            {/* 4. OUR COURSES Card (Desktop Grid & Mobile 2-Row Horizontal Auto-Slider) */}
            <div className="bg-white rounded-md border border-slate-200 overflow-hidden shadow-sm">
                <div className="bg-[#7024A8] text-white px-4 py-2.5 text-xs font-bold flex justify-between items-center">
                    <div className="flex items-center gap-2 text-white">
                        <i className="fa-solid fa-graduation-cap text-white"></i>
                        <span className="uppercase tracking-wider font-extrabold text-white">OUR COURSES</span>
                    </div>
                    <Link href={getUrl('/all-course')} className="bg-[#581C87] text-white hover:bg-purple-900 px-3 py-1 rounded text-[10px] uppercase font-black tracking-wider shadow-sm transition">
                        VIEW ALL
                    </Link>
                </div>

                {/* Desktop View: Grid */}
                <div className="hidden sm:grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 p-6">
                    {courseList.map((course) => (
                        <Link key={`course-desk-${course.id}`} href={getUrl(`/course-details/${course.id}`)} className="border border-slate-200 rounded-md overflow-hidden bg-white shadow-sm group hover:shadow-md transition block">
                            <div className="h-40 bg-slate-900 overflow-hidden">
                                <img
                                    src={course.photo || course.image ? getUrl(course.photo || course.image) : getUrl('/images/about.jpg')}
                                    alt={course.name}
                                    className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
                                    onError={(e) => {
                                        e.target.onerror = null;
                                        e.target.src = getUrl('/images/govt.png');
                                    }}
                                />
                            </div>
                            <div className="p-3.5 space-y-1">
                                <h4 className="font-extrabold text-slate-900 text-sm group-hover:text-[#7024A8] transition-colors">{course.name}</h4>
                                <p className="text-xs text-slate-500">{course.duration || '3-Month, 6-Month, 1-Year, 2-Year'}</p>
                            </div>
                        </Link>
                    ))}
                </div>

                {/* Mobile View: 2-Row Horizontal Continuous Auto-Slider */}
                <div className="block sm:hidden p-4 overflow-hidden relative">
                    <div className="animate-course-marquee">
                        <div className="flex gap-4 pr-4 shrink-0">
                            {coursePairs.map((pair, pIdx) => (
                                <div key={`course-pair-a-${pIdx}`} className="w-[280px] shrink-0 space-y-4">
                                    {pair.map((course) => (
                                        <Link key={`course-mob-a-${course.id}-${pIdx}`} href={getUrl(`/course-details/${course.id}`)} className="border border-slate-200 rounded-md overflow-hidden bg-white shadow-sm block">
                                            <div className="h-32 bg-slate-900 overflow-hidden">
                                                <img
                                                    src={course.photo || course.image ? getUrl(course.photo || course.image) : getUrl('/images/about.jpg')}
                                                    alt={course.name}
                                                    className="w-full h-full object-cover"
                                                    onError={(e) => {
                                                        e.target.onerror = null;
                                                        e.target.src = getUrl('/images/govt.png');
                                                    }}
                                                />
                                            </div>
                                            <div className="p-3 space-y-1 text-center">
                                                <h4 className="font-extrabold text-slate-900 text-[13px] truncate">{course.name}</h4>
                                                <p className="text-[11px] text-slate-500">{course.duration || '3-Month, 6-Month, 1-Year'}</p>
                                            </div>
                                        </Link>
                                    ))}
                                </div>
                            ))}
                        </div>
                        <div className="flex gap-4 pr-4 shrink-0" aria-hidden="true">
                            {coursePairs.map((pair, pIdx) => (
                                <div key={`course-pair-b-${pIdx}`} className="w-[280px] shrink-0 space-y-4">
                                    {pair.map((course) => (
                                        <Link key={`course-mob-b-${course.id}-${pIdx}`} href={getUrl(`/course-details/${course.id}`)} className="border border-slate-200 rounded-md overflow-hidden bg-white shadow-sm block">
                                            <div className="h-32 bg-slate-900 overflow-hidden">
                                                <img
                                                    src={course.photo || course.image ? getUrl(course.photo || course.image) : getUrl('/images/about.jpg')}
                                                    alt={course.name}
                                                    className="w-full h-full object-cover"
                                                    onError={(e) => {
                                                        e.target.onerror = null;
                                                        e.target.src = getUrl('/images/govt.png');
                                                    }}
                                                />
                                            </div>
                                            <div className="p-3 space-y-1 text-center">
                                                <h4 className="font-extrabold text-slate-900 text-[13px] truncate">{course.name}</h4>
                                                <p className="text-[11px] text-slate-500">{course.duration || '3-Month, 6-Month, 1-Year'}</p>
                                            </div>
                                        </Link>
                                    ))}
                                </div>
                            ))}
                        </div>
                    </div>
                </div>
            </div>

            {/* 5. VERIFIED CENTERS Card (Continuous Auto-Slider) */}
            {(config.toggle_verified_centers ?? true) && (
                <div className="bg-white rounded-md border border-slate-200 overflow-hidden shadow-sm">
                    <div className="bg-[#7024A8] text-white px-4 py-2.5 text-xs font-bold flex justify-between items-center">
                        <div className="flex items-center gap-2 text-white">
                            <i className="fa-solid fa-building-columns text-white"></i>
                            <span className="uppercase tracking-wider font-extrabold text-white">VERIFIED CENTERS</span>
                        </div>
                        <div className="flex items-center gap-2">
                            <span className="text-[10px] bg-[#581C87] text-white px-2.5 py-0.5 rounded font-black tracking-wider uppercase shadow-sm">
                                LIVE SLIDER
                            </span>
                            <Link href={getUrl('/verified-center')} className="bg-[#581C87] text-white hover:bg-purple-900 px-3 py-1 rounded text-[10px] uppercase font-black tracking-wider shadow-sm transition">
                                VIEW ALL
                            </Link>
                        </div>
                    </div>
                    <div className="p-4 overflow-hidden relative">
                        <div className="animate-center-marquee">
                            <div className="flex gap-4 pr-4 shrink-0">
                                {verifiedInstitutes.map((inst, idx) => (
                                    <div key={`center-a-${inst.id || idx}`} className="w-80 p-3 border border-slate-200 rounded-md flex items-center gap-3 bg-white hover:border-purple-300 transition shrink-0 shadow-sm group">
                                        <div className="w-12 h-12 border border-slate-200 rounded overflow-hidden shrink-0 flex items-center justify-center bg-slate-50">
                                            <img
                                                src={inst.photo || inst.center_logo || inst.logo ? getUrl(inst.photo || inst.center_logo || inst.logo) : getUrl('/images/govt.png')}
                                                alt={inst.name}
                                                className="w-10 h-10 object-contain"
                                                onError={(e) => {
                                                    e.target.onerror = null;
                                                    e.target.src = getUrl('/images/govt.png');
                                                }}
                                            />
                                        </div>
                                        <div className="min-w-0">
                                            <p className="font-extrabold text-slate-800 text-[13px] truncate group-hover:text-[#7024A8] transition-colors">{inst.name}</p>
                                            <span className="text-[10px] font-bold text-emerald-700 bg-emerald-50 border border-emerald-100 px-2 py-0.5 rounded uppercase mt-0.5 inline-block">Verified Center</span>
                                        </div>
                                    </div>
                                ))}
                            </div>
                            <div className="flex gap-4 pr-4 shrink-0" aria-hidden="true">
                                {verifiedInstitutes.map((inst, idx) => (
                                    <div key={`center-b-${inst.id || idx}`} className="w-80 p-3 border border-slate-200 rounded-md flex items-center gap-3 bg-white hover:border-purple-300 transition shrink-0 shadow-sm group">
                                        <div className="w-12 h-12 border border-slate-200 rounded overflow-hidden shrink-0 flex items-center justify-center bg-slate-50">
                                            <img
                                                src={inst.photo || inst.center_logo || inst.logo ? getUrl(inst.photo || inst.center_logo || inst.logo) : getUrl('/images/govt.png')}
                                                alt={inst.name}
                                                className="w-10 h-10 object-contain"
                                                onError={(e) => {
                                                    e.target.onerror = null;
                                                    e.target.src = getUrl('/images/govt.png');
                                                }}
                                            />
                                        </div>
                                        <div className="min-w-0">
                                            <p className="font-extrabold text-slate-800 text-[13px] truncate group-hover:text-[#7024A8] transition-colors">{inst.name}</p>
                                            <span className="text-[10px] font-bold text-emerald-700 bg-emerald-50 border border-emerald-100 px-2 py-0.5 rounded uppercase mt-0.5 inline-block">Verified Center</span>
                                        </div>
                                    </div>
                                ))}
                            </div>
                        </div>
                    </div>
                </div>
            )}

            {/* 6. SUCCESS STUDENTS Card (Continuous Auto-Slider) */}
            {(config.toggle_success_students ?? true) && (
                <div className="bg-white rounded-md border border-slate-200 overflow-hidden shadow-sm">
                    <div className="bg-[#7024A8] text-white px-4 py-2.5 text-xs font-bold flex justify-between items-center">
                        <div className="flex items-center gap-2 text-white">
                            <i className="fa-solid fa-users text-white"></i>
                            <span className="uppercase tracking-wider font-extrabold text-white">SUCCESS STUDENTS</span>
                        </div>
                        <div className="flex items-center gap-2">
                            <span className="text-[10px] bg-[#581C87] text-white px-2.5 py-0.5 rounded font-black tracking-wider uppercase shadow-sm">
                                LIVE SLIDER
                            </span>
                            <Link href={getUrl('/success-student')} className="bg-[#581C87] text-white hover:bg-purple-900 px-3 py-1 rounded text-[10px] uppercase font-black tracking-wider shadow-sm transition">
                                VIEW ALL
                            </Link>
                        </div>
                    </div>
                    <div className="p-5 overflow-hidden relative">
                        <div className="animate-student-marquee">
                            <div className="flex gap-6 pr-6 shrink-0">
                                {successStudentList.map((st, idx) => (
                                    <div key={`student-a-${st.id || idx}`} className="w-32 shrink-0 space-y-2 text-center group cursor-pointer">
                                        <div className="w-20 h-20 rounded-full border-[3px] border-[#7024A8] overflow-hidden mx-auto bg-slate-100 shadow-sm group-hover:scale-110 group-hover:shadow-md transition-all duration-300">
                                            <img
                                                src={st.photo || st.picture ? getUrl(st.photo || st.picture) : getUrl('/images/avatar.png')}
                                                alt={st.name}
                                                className="w-full h-full object-cover"
                                                onError={(e) => {
                                                    e.target.onerror = null;
                                                    e.target.src = getUrl('/images/avatar.png');
                                                }}
                                            />
                                        </div>
                                        <p className="font-extrabold text-slate-800 text-[13px] truncate group-hover:text-[#7024A8] transition-colors">{st.name}</p>
                                    </div>
                                ))}
                            </div>
                            <div className="flex gap-6 pr-6 shrink-0" aria-hidden="true">
                                {successStudentList.map((st, idx) => (
                                    <div key={`student-b-${st.id || idx}`} className="w-32 shrink-0 space-y-2 text-center group cursor-pointer">
                                        <div className="w-20 h-20 rounded-full border-[3px] border-[#7024A8] overflow-hidden mx-auto bg-slate-100 shadow-sm group-hover:scale-110 group-hover:shadow-md transition-all duration-300">
                                            <img
                                                src={st.photo || st.picture ? getUrl(st.photo || st.picture) : getUrl('/images/avatar.png')}
                                                alt={st.name}
                                                className="w-full h-full object-cover"
                                                onError={(e) => {
                                                    e.target.onerror = null;
                                                    e.target.src = getUrl('/images/avatar.png');
                                                }}
                                            />
                                        </div>
                                        <p className="font-extrabold text-slate-800 text-[13px] truncate group-hover:text-[#7024A8] transition-colors">{st.name}</p>
                                    </div>
                                ))}
                            </div>
                        </div>
                    </div>
                </div>
            )}

            {/* 7. VIDEO GALLERY Card (Clickable Link Redirection to Video Gallery Page) */}
            {(config.toggle_video_gallery ?? true) && (
                <div className="bg-white rounded-md border border-slate-200 overflow-hidden shadow-sm">
                    <div className="bg-[#7024A8] text-white px-4 py-2.5 text-xs font-bold flex justify-between items-center">
                        <div className="flex items-center gap-2 text-white">
                            <i className="fa-brands fa-youtube text-red-500 bg-white rounded p-[3px] text-[11px]"></i>
                            <span className="uppercase tracking-wider font-extrabold text-white">VIDEO GALLERY</span>
                        </div>
                        <Link href={getUrl('/video-gallery')} className="bg-[#581C87] text-white hover:bg-purple-900 px-3 py-1 rounded text-[10px] uppercase font-black tracking-wider shadow-sm transition">
                            VIEW ALL
                        </Link>
                    </div>

                    {/* Desktop View: Grid (Clickable Thumbnails Redirecting to Video Gallery) */}
                    <div className="hidden sm:grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6 p-6">
                        {videoList.map((video, idx) => (
                            <Link
                                key={`video-desk-${video.video_id || idx}-${idx}`}
                                href={getUrl('/video-gallery')}
                                className="bg-white rounded border border-slate-200 overflow-hidden shadow-sm flex flex-col group cursor-pointer hover:shadow-md transition"
                            >
                                <div className="aspect-video w-full bg-slate-950 relative overflow-hidden">
                                    <img
                                        src={`https://img.youtube.com/vi/${video.video_id}/hqdefault.jpg`}
                                        alt={video.title || `Video ${idx}`}
                                        className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500"
                                        onError={(e) => {
                                            e.target.onerror = null;
                                            e.target.src = getUrl('/images/about.jpg');
                                        }}
                                    />
                                    <div className="absolute inset-0 bg-black/30 group-hover:bg-black/10 transition-colors flex items-center justify-center">
                                        <div className="w-14 h-14 rounded-full bg-rose-600 group-hover:bg-rose-500 text-white flex items-center justify-center shadow-lg group-hover:scale-110 transition-transform">
                                            <i className="fa-solid fa-play ml-1 text-xl"></i>
                                        </div>
                                    </div>
                                </div>
                                <div className="p-3.5 bg-white border-t border-slate-100 flex items-center justify-between">
                                    <h4 className="font-extrabold text-slate-900 text-[13px] group-hover:text-[#7024A8] transition-colors truncate">
                                        {video.title}
                                    </h4>
                                    <i className="fa-solid fa-arrow-right text-[11px] text-slate-400 group-hover:text-[#7024A8] transition-colors ml-2 shrink-0"></i>
                                </div>
                            </Link>
                        ))}
                    </div>

                    {/* Mobile View: 2-Row Horizontal Continuous Auto-Slider (Clickable Thumbnails Redirecting) */}
                    <div className="block sm:hidden p-4 overflow-hidden relative">
                        <div className="animate-video-marquee">
                            <div className="flex gap-4 pr-4 shrink-0">
                                {videoPairs.map((pair, pIdx) => (
                                    <div key={`video-pair-a-${pIdx}`} className="w-[280px] shrink-0 space-y-4">
                                        {pair.map((video, idx) => (
                                            <Link
                                                key={`video-mob-a-${video.video_id || idx}-${idx}`}
                                                href={getUrl('/video-gallery')}
                                                className="bg-white rounded border border-slate-200 overflow-hidden shadow-sm flex flex-col group cursor-pointer"
                                            >
                                                <div className="aspect-video w-full bg-slate-950 relative overflow-hidden">
                                                    <img
                                                        src={`https://img.youtube.com/vi/${video.video_id}/hqdefault.jpg`}
                                                        alt={video.title || `Video ${idx}`}
                                                        className="w-full h-full object-cover"
                                                        onError={(e) => {
                                                            e.target.onerror = null;
                                                            e.target.src = getUrl('/images/about.jpg');
                                                        }}
                                                    />
                                                    <div className="absolute inset-0 bg-black/30 flex items-center justify-center">
                                                        <div className="w-12 h-12 rounded-full bg-rose-600 text-white flex items-center justify-center shadow-lg">
                                                            <i className="fa-solid fa-play ml-1 text-lg"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div className="p-3 bg-white border-t border-slate-100 flex items-center justify-between">
                                                    <h4 className="font-extrabold text-slate-900 text-[13px] truncate">
                                                        {video.title}
                                                    </h4>
                                                    <i className="fa-solid fa-arrow-right text-[11px] text-slate-400 ml-2 shrink-0"></i>
                                                </div>
                                            </Link>
                                        ))}
                                    </div>
                                ))}
                            </div>
                            <div className="flex gap-4 pr-4 shrink-0" aria-hidden="true">
                                {videoPairs.map((pair, pIdx) => (
                                    <div key={`video-pair-b-${pIdx}`} className="w-[280px] shrink-0 space-y-4">
                                        {pair.map((video, idx) => (
                                            <Link
                                                key={`video-mob-b-${video.video_id || idx}-${idx}`}
                                                href={getUrl('/video-gallery')}
                                                className="bg-white rounded border border-slate-200 overflow-hidden shadow-sm flex flex-col group cursor-pointer"
                                            >
                                                <div className="aspect-video w-full bg-slate-950 relative overflow-hidden">
                                                    <img
                                                        src={`https://img.youtube.com/vi/${video.video_id}/hqdefault.jpg`}
                                                        alt={video.title || `Video ${idx}`}
                                                        className="w-full h-full object-cover"
                                                        onError={(e) => {
                                                            e.target.onerror = null;
                                                            e.target.src = getUrl('/images/about.jpg');
                                                        }}
                                                    />
                                                    <div className="absolute inset-0 bg-black/30 flex items-center justify-center">
                                                        <div className="w-12 h-12 rounded-full bg-rose-600 text-white flex items-center justify-center shadow-lg">
                                                            <i className="fa-solid fa-play ml-1 text-lg"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div className="p-3 bg-white border-t border-slate-100 flex items-center justify-between">
                                                    <h4 className="font-extrabold text-slate-900 text-[13px] truncate">
                                                        {video.title}
                                                    </h4>
                                                    <i className="fa-solid fa-arrow-right text-[11px] text-slate-400 ml-2 shrink-0"></i>
                                                </div>
                                            </Link>
                                        ))}
                                    </div>
                                ))}
                            </div>
                        </div>
                    </div>
                </div>
            )}

            {/* 8. CERTIFIED Card (Continuous Auto-Slider) */}
            {(config.toggle_sponsors ?? true) && (
                <div className="bg-white rounded-md border border-slate-200 overflow-hidden shadow-sm">
                    <div className="bg-[#7024A8] text-white px-4 py-2.5 text-xs font-bold flex items-center justify-between">
                        <div className="flex items-center gap-2 text-white">
                            <i className="fa-solid fa-certificate text-white"></i>
                            <span className="uppercase tracking-wider font-extrabold text-white">CERTIFIED</span>
                        </div>
                        <span className="text-[10px] bg-[#581C87] text-white px-2.5 py-0.5 rounded font-black tracking-wider uppercase shadow-sm">
                            REGISTERED
                        </span>
                    </div>
                    <div className="p-4 overflow-hidden relative">
                        <div className="animate-sponsor-marquee items-center">
                            <div className="flex gap-8 pr-8 items-center shrink-0">
                                {sponsorList.map((logoUrl, idx) => (
                                    <div key={`sponsor-a-${idx}`} 
                                        onClick={() => setClickedSponsors(prev => ({...prev, [idx]: !prev[idx]}))}
                                        className={`h-16 w-40 bg-slate-50 border border-slate-100 rounded-md p-2 flex items-center justify-center shrink-0 shadow-sm transition cursor-pointer group ${clickedSponsors[idx] ? 'grayscale border-purple-200 shadow-md' : 'hover:border-purple-200 hover:shadow-md'}`}>
                                        <img
                                            src={getUrl(logoUrl)}
                                            alt={`Certified Partner ${idx}`}
                                            className={`h-full w-full object-contain transition-all duration-300 ${clickedSponsors[idx] ? 'grayscale' : 'group-hover:grayscale'}`}
                                            onError={(e) => {
                                                e.target.onerror = null;
                                                e.target.src = getUrl('/images/govt.png');
                                            }}
                                        />
                                    </div>
                                ))}
                            </div>
                            <div className="flex gap-8 pr-8 items-center shrink-0" aria-hidden="true">
                                {sponsorList.map((logoUrl, idx) => (
                                    <div key={`sponsor-b-${idx}`} 
                                        onClick={() => setClickedSponsors(prev => ({...prev, [idx]: !prev[idx]}))}
                                        className={`h-16 w-40 bg-slate-50 border border-slate-100 rounded-md p-2 flex items-center justify-center shrink-0 shadow-sm transition cursor-pointer group ${clickedSponsors[idx] ? 'grayscale border-purple-200 shadow-md' : 'hover:border-purple-200 hover:shadow-md'}`}>
                                        <img
                                            src={getUrl(logoUrl)}
                                            alt={`Certified Partner ${idx}`}
                                            className={`h-full w-full object-contain transition-all duration-300 ${clickedSponsors[idx] ? 'grayscale' : 'group-hover:grayscale'}`}
                                            onError={(e) => {
                                                e.target.onerror = null;
                                                e.target.src = getUrl('/images/govt.png');
                                            }}
                                        />
                                    </div>
                                ))}
                            </div>
                        </div>
                    </div>
                </div>
            )}

            {/* Photo Lightbox Modal */}
            {selectedImage && (
                <div
                    className="fixed inset-0 z-[100] bg-black/95 backdrop-blur-sm flex items-center justify-center p-4"
                    onClick={() => setSelectedImage(null)}
                >
                    <button
                        onClick={() => setSelectedImage(null)}
                        className="absolute top-5 right-5 text-white/80 hover:text-white bg-white/10 hover:bg-white/30 p-3 rounded-full text-2xl transition z-[110]"
                        aria-label="Close Lightbox"
                    >
                        <i className="fa-solid fa-xmark w-6 h-6 flex items-center justify-center"></i>
                    </button>
                    <img
                        src={selectedImage}
                        alt="Enlarged Gallery Photo"
                        className="max-w-full max-h-[90vh] object-contain rounded-xl shadow-2xl transition-transform duration-300"
                        onClick={(e) => e.stopPropagation()}
                    />
                </div>
            )}
        </FrontendLayout>
    );
}

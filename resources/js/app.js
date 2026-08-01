require('./bootstrap');
import '@fortawesome/fontawesome-free/css/all.min.css';

import React from 'react';
import { createRoot } from 'react-dom/client';
import { createInertiaApp } from '@inertiajs/inertia-react';

createInertiaApp({
    title: title => title ? `${title} - BDNSI` : 'BDNSI',
    resolve: name => require(`./Pages/${name}`),
    setup({ el, App, props }) {
        createRoot(el).render(<App {...props} />);
    },
});

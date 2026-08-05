<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;


class CheckModuleEnabled
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @param  string  $moduleName
     * @return mixed
     */
    public function handle(Request $request, Closure $next, $moduleName)
    {
        $settings = \App\Models\SiteConfig::firstCached();
        $val = $settings ? ($settings->{$moduleName} ?? true) : true;
        $isEnabled = filter_var($val, FILTER_VALIDATE_BOOLEAN);

        if (!$isEnabled) {
            abort(403, 'This module is currently disabled by the administrator.');
        }

        return $next($request);
    }
}

<?php

namespace App\Http\Middleware;

use App\Models\SiteConfig;
use Closure;
use Illuminate\Http\Request;

class CheckModuleEnabled
{
    /**
     * Handle an incoming request.
     *
     * @param  string  $moduleName
     * @return mixed
     */
    public function handle(Request $request, Closure $next, $moduleName)
    {
        if (! SiteConfig::isEnabled($moduleName)) {
            abort(403, 'This module is currently disabled by the administrator.');
        }

        return $next($request);
    }
}

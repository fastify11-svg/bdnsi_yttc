<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use App\Models\ConfigDictionary;

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
        $settings = ConfigDictionary::allCached();
        $isEnabled = ($settings[$moduleName] ?? '1') !== '0';

        if (!$isEnabled) {
            abort(403, 'This module is currently disabled by the administrator.');
        }

        return $next($request);
    }
}

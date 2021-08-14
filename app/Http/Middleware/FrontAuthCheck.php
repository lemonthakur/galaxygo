<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Contracts\Auth\Guard;
use Illuminate\Http\Request;

class FrontAuthCheck
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    protected $auth;

    public function __construct(Guard $auth)
    {
        $this->auth = $auth;
    }

    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next, $guard = null)
    {
        if ($this->auth->guest()) {
            if ($request->ajax()) {
                return response('Unauthorized.', 401);
            } else {
                return redirect()->route('login');
            }
        }else{
            if($this->auth->user() != null && $this->auth->user()->role_id == 0){
                return $next($request);
            }
            else {
                return redirect()->route('login');
            }
        }
    }
}

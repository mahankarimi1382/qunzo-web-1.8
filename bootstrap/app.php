<?php

use App\Http\Controllers\Frontend\PageController;
use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;
use Illuminate\Support\Facades\Route;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__ . '/../routes/web.php',
        api: __DIR__ . '/../routes/api.php',
        channels: __DIR__ . '/../routes/channels.php',
        then: function () {
            // Admin Routes
            Route::prefix(setting('site_admin_prefix', 'global'))
                ->name('admin.')
                ->middleware(['web', 'auth:admin'])
                ->group(base_path('routes/admin.php'));

            // Payment Routes
            Route::middleware(['web'])
                ->group(base_path('routes/payment.php'));

            // User api
            Route::prefix('api/user')
                ->middleware(['api', 'auth:sanctum'])
                ->name('api.user.')
                ->group(base_path('routes/api/user.php'));

            // Agent api
            Route::prefix('api/agent')
                ->middleware(['api', 'auth:sanctum'])
                ->name('api.agent.')
                ->group(base_path('routes/api/agent.php'));

            // Merchant api
            Route::prefix('api/merchant')
                ->middleware(['api', 'auth:sanctum'])
                ->name('api.merchant.')
                ->group(base_path('routes/api/merchant.php'));

            // Dyanmic Page
            Route::middleware('web')
                ->get('/{page}', PageController::class)
                ->name('page');
        },
    )
    ->withExceptions(function (Exceptions $exceptions) {
        $exceptions->renderable(function (Throwable $e, $request) {
            if ($request->expectsJson()) {
                return response()->json([
                    'status' => 'error',
                    'message' => $e->getMessage(),
                ], 400);
            }
        });
    })
    ->withMiddleware(function (Middleware $middleware) {
        $middleware->web(append: [
            \App\Http\Middleware\Localization::class,
            'install_check',
            'trans',
            \App\Http\Middleware\XSS::class,
            \App\Http\Middleware\IsMaintenance::class,
        ]);

        $middleware->preventRequestsDuringMaintenance(['/admin*']);

        $middleware->alias([
            'role' => \Spatie\Permission\Middleware\RoleMiddleware::class,
            'permission' => \Spatie\Permission\Middleware\PermissionMiddleware::class,
            'role_or_permission' => \Spatie\Permission\Middleware\RoleOrPermissionMiddleware::class,
            'agent_authorize' => \App\Http\Middleware\AgentStatusAuthorizeMiddleware::class,
            'merchant.activated' => \App\Http\Middleware\MerchantActivationChecker::class,
            'auth' => \App\Http\Middleware\Authenticate::class,
            'guest' => \App\Http\Middleware\RedirectIfAuthenticated::class,
            'merchant.verified' => \App\Http\Middleware\EnsureMerchantEmailVerified::class,
            'agent.verified' => \App\Http\Middleware\EnsureAgentEmailVerified::class,
            '2fa' => \App\Http\Middleware\TwoFaCheck::class,
            'merchant_system' => \App\Http\Middleware\EnsureMerchantSystem::class,
            'agent_system' => \App\Http\Middleware\EnsureAgentSystem::class,
            'api_role' => \App\Http\Middleware\RoleChecker::class,
        ]);

        $middleware->api([
            \Laravel\Sanctum\Http\Middleware\EnsureFrontendRequestsAreStateful::class,
            \Illuminate\Session\Middleware\StartSession::class,
        ]);

        $middleware->validateCsrfTokens(except: [
            '*gateway/coingate/callback',
            '*ipn*',
            'api/*',
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions) {
        //
    })->create();

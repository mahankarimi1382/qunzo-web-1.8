<?php

namespace Remotelywork\Installer\Repository;

use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;

class App
{
    protected static $token = 'RTlkZ240S1B0clJ4VXdkWjRuMDN0c2MzcWVzcXpCaU4=';

    protected static $cacheKey = 'license_validated';

    protected static $validatedTtl = 86400;

    protected static $installedFile = 'installed';

    public static function dbConnectionCheck(): bool
    {
        $ok = false;

        try {

            DB::getPdo();
            DB::connection()->getDatabaseName();

            $ok = true;

            if (! file_exists(storage_path(self::$installedFile))) {
                $ok = false;
            }

            return $ok;
        } catch (\Throwable $throwable) {
            $ok = false;
        }

        return $ok;
    }

    public static function initApp()
    {
        return self::validateLicense();
    }

    public static function validateLicense($code = null)
    {
        $code = $code == null ? config('app.license_key') : $code;

        if (Cache::has(self::$cacheKey)) {
            return true;
        }

        $repsonse = Http::withSensitiveToken(self::$token)
            ->withOptions([
                'verify' => false,
            ])
            ->get('https://api.envato.com/v3/market/author/sale', [
                'code' => $code,
            ]);

        if ($repsonse->successful()) {
            Cache::put(self::$cacheKey, true, self::$validatedTtl);

            return true;
        }

        Cache::forget(self::$cacheKey);

        return false;
    }
}

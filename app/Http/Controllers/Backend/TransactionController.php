<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Transaction;
use Illuminate\Http\Request;
use Illuminate\Routing\Controllers\HasMiddleware;
use Illuminate\Routing\Controllers\Middleware;

class TransactionController extends Controller implements HasMiddleware
{
    public static function middleware()
    {
        return [
            new Middleware('permission:transaction-list'),
        ];
    }

    public function transactions(Request $request, $id = null)
    {
        $perPage = $request->perPage ?? 15;

        $status = $request->status ?? 'all';
        $search = $request->search ?? null;
        $type = $request->type ?? 'all';
        $transactions = Transaction::with('user')
            ->search($search)
            ->status($status)
            ->type($type)
            ->when(in_array(request('sort_field'), ['created_at', 'final_amount', 'type', 'description']), function ($query) {
                $query->orderBy(request('sort_field'), request('sort_dir'));
            })
            ->when(request('sort_field') == 'user', function ($query) {
                $query->whereHas('user', function ($userQuery) {
                    $userQuery->orderBy('username', request('sort_dir'));
                });
            })
            ->when(! request()->has('sort_field'), function ($query) {
                $query->latest();
            })
            ->paginate($perPage)
            ->withQueryString();

        return view('backend.transaction.index', ['transactions' => $transactions]);
    }
}

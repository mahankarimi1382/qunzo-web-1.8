<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Page;
use App\Traits\NotifyTrait;
use Illuminate\Support\Fluent;

class PageController extends Controller
{
    use NotifyTrait;

    public function __invoke()
    {
        $url = request()->segment(1);

        $page = Page::currentTheme()->where('code', $url)->where('locale', app()->getLocale())->first();

        if (! $page) {
            $page = Page::currentTheme()->where('url', $url)->where('locale', defaultLocale())->firstOrFail();
        }

        $data = new Fluent(json_decode($page->data, true));

        return view('frontend::pages.'.$page->url, ['data' => $data]);
    }

    public function getPage($section)
    {
        $page = Page::currentTheme()->where('code', $section)->where('type', 'dynamic')->where('status', true)->where('locale', app()->getLocale())->first();

        if (! $page) {
            $page = Page::currentTheme()->where('code', $section)->where('type', 'dynamic')->where('status', true)->where('locale', defaultLocale())->firstOrFail();
        }

        $title = $page->title;
        $data = new Fluent(json_decode($page->data, true));

        return view('frontend::pages.dynamic_page', ['data' => $data, 'title' => $title]);
    }
}

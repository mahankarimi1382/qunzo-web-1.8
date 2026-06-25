<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Blog;
use App\Models\Currency;
use App\Models\LandingPage;
use App\Models\Subscriber;
use App\Models\Theme;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class HomeController extends Controller
{
    public function home()
    {
        return view('frontend::home');
    }

    public function blogDetails($id)
    {
        $blog = Blog::where('locale', app()->getLocale())->where('id', $id)->first();
        $recentBlogs = Blog::where('locale', app()->getLocale())->where('id', '!=', $id)->limit(5)->get();

        return view('frontend::pages.blog_details', ['blog' => $blog, 'recentBlogs' => $recentBlogs]);
    }

    public function languageUpdate($locale)
    {
        session()->put('locale', $locale);

        return redirect()->back();
    }

    public function session(Request $request)
    {
        $key = $request->input('key');

        $value = $request->input('value');

        session([$key => $value]);

        return response()->json(['success' => true]);
    }

    public function documentation()
    {
        // Get all currencies
        $currencies = Currency::all();

        return view('frontend::api.documentation', [
            'currencies' => $currencies,
        ]);
    }

    public function subscribeNow(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => ['required', 'string', 'email', 'max:255', 'unique:subscribers'],
        ]);

        if ($validator->fails()) {
            notify()->error($validator->errors()->first(), 'Error');

            return redirect()->back();
        }

        Subscriber::create([
            'email' => $request->email,
        ]);

        notify()->success(__('Subscribed Successfully'));

        return redirect()->back();
    }
}

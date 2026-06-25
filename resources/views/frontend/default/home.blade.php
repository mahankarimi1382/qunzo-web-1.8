<!doctype html>
<html class="no-js" lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>{{ __('Home') }} | {{ setting('site_title') }}</title>
    <meta name="keywords" content="@yield('meta_keywords')">
    <meta name="description" content="@yield('meta_description')">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="{{ asset(setting('site_favicon')) }}">
    <link rel="stylesheet" href="{{ asset('frontend/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="{{ asset('frontend/css/fontawesome-pro.css') }}">
    <link rel="stylesheet" href="{{ asset('frontend/css/select2.css') }}">
    <link rel="stylesheet" href="{{ asset('frontend/css/atom-one-dark.min.css') }}">
    <link rel="stylesheet" href="{{ asset('frontend/css/styles.css') }}">
</head>

<body>

    <!--[if lte IE 9]>
   <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
   <![endif]-->

    <!-- Body main wrapper start -->
    <main>

        <!-- Comming soon section start -->
        <section class="comming-soon-section fix p-relative shapes-wrap">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-xxl-9 col-xl-10 col-lg-8">
                        <div class="comming-soon-wrapper">
                            <div class="comming-soon-contents">
                                <div class="site-logo">
                                    <img src="{{ asset(setting('site_logo')) }}" alt="Site Logo">
                                </div>
                                <div class="intro">
                                    <h1 class="title-text">{{ __("We're Coming Soon!") }}</h1>
                                    <p class="description">
                                        {{ __('We are working hard to launch our new website. Stay tuned with us.') }}
                                    </p>
                                </div>
                            </div>
                            <div class="btn-wrapper btn-wrap justify-content-center">
                                <a href="{{ setting('user_panel_url', 'global') }}" class="td-btn primary-btn"
                                    target="_blank">
                                    <span class="btn-text">User Dashboard</span>
                                </a>
                                <a href="{{ setting('agent_panel_url', 'global') }}" class="td-btn secondary-btn"
                                    target="_blank">
                                    <span class="btn-text">Agent Dashboard</span>
                                </a>
                                <a href="{{ setting('merchant_panel_url', 'global') }}" class="td-btn tertiary-btn"
                                    target="_blank">
                                    <span class="btn-text">Merchant Dashboard</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="shape-item shape-1">
                <img class="layer" src="{{ asset('frontend/') }}/images/comming-soon/shape-circle-half-1.svg"
                    alt="Shape Image">
            </div>
            <div class="shape-item shape-2">
                <img class="layer" src="{{ asset('frontend/') }}/images/comming-soon/shape-circle-1.svg"
                    alt="Shape Image">
            </div>
            <div class="shape-item shape-4">
                <img class="layer" src="{{ asset('frontend/') }}/images/comming-soon/shape-circle-half-1.svg"
                    alt="Shape Image">
            </div>
            <div class="shape-item shape-5">
                <img src="{{ asset('frontend/') }}/images/comming-soon/shape-circle-2.svg" alt="Shape Image">
            </div>
        </section>
        <!-- Comming soon section end -->

    </main>
    <!-- Body main wrapper end -->

    <!-- JS here -->
    <script src="{{ asset('frontend/js/jquery-3.7.1.min.js') }}"></script>
    <script src="{{ asset('frontend/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('frontend/js/select2.js') }}"></script>
    <script src="{{ asset('frontend/js/highlight.min.js') }}"></script>
    <script src="{{ asset('frontend/js/main.js') }}"></script>
    @stack('script')
</body>

</html>

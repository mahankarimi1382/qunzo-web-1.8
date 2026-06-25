@extends('frontend::layouts.app')

@section('title')
    {{ $data->title }}
@endsection
@section('meta_keywords')
    {{ $data['meta_keywords'] }}
@endsection

@section('meta_description')
    {{ $data['meta_description'] }}
@endsection

@section('content')
    @php
        $currencies = App\Models\Currency::all();
    @endphp
    <!-- api documentation section start -->
    <section class="td-api-documentation-section p-relative zi-11 section_space">
        <div class="container">
            <div class="api-documentation-grid">
                <!-- Main Content Area -->
                <div class="api-documentation-main">

                    <!-- Introduction item -->
                    <div class="single-doc-item" id="introduction">
                        <div class="heading">
                            <h4 class="title">Introduction</h4>
                        </div>
                        <div class="contents">
                            <p>
                                The <a href="#">{{ setting('site_title') }}</a> is your
                                go-to solution for seamless payment integration into your
                                business applications. Designed for simplicity, it uses clean
                                URLs, accepts cURL requests, and delivers responses in JSON
                                format for easy parsing.

                                You can run tests in sandbox mode to ensure everything works
                                perfectly before switching to live transactions. Your API key
                                serves as the key to security, validating each request to ensure
                                it's authorized and trustworthy.

                                For testing, use the sandbox environment, and when you're ready
                                for real transactions, move to the live URL as explained in the
                                <a href="#makePayment">Make
                                    Payment</a> section.
                            </p>
                        </div>
                    </div>

                    <!-- Currencies item -->
                    <div class="single-doc-item" id="currencies">
                        <div class="heading">
                            <h4 class="title">Currencies</h4>
                        </div>
                        <div class="contents">
                            <p>
                                <a href="#">{{ setting('site_title') }}</a> allows making
                                transactions with supports transactions in the currencies listed
                                below.
                            </p>
                            <div class="api-table-box table-responsive">
                                <table class="api-table">
                                    <thead>
                                        <tr>
                                            <th>Currency Name</th>
                                            <th>Currency Symbol</th>
                                            <th>Currency Code</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Main Currency</td>
                                            <td>{{ setting('currency_symbol') }}</td>
                                            <td>{{ setting('site_currency') }}</td>
                                        </tr>
                                        @foreach ($currencies as $currency)
                                            <tr>
                                                <td>{{ $currency->name }}</td>
                                                <td>{{ $currency->symbol }}</td>
                                                <td>{{ $currency->code }}</td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- API Key item -->
                    <div class="single-doc-item" id="apiKey">
                        <div class="heading">
                            <h4>Obtain API Key</h4>
                        </div>
                        <div class="contents">
                            <p>
                                Login to your <a href="#">{{ setting('site_title') }}</a>
                                merchant account.
                                If you don't have
                                any? <a target="_blank">Merchant App > API Access Key</a>.
                                Log in to your {{ setting('site_title') }} merchant account. Don't have an
                                account yet? <a target="_blank">
                                    Register From App</a> to
                                create one.
                            </p>
                            <p>
                                You can find your API keys <a href="#">Public Key</a> and
                                <a href="#">Secret Key</a> in <a href="#">API Access
                                    Key</a> menu from merchant dashboard. These keys are
                                required to call API requests. If
                                needed, you can generate a new API key anytime by clicking the
                                <a href="#">Regenerate</a> button. Make sure to keep these
                                keys private
                                and never share them with anyone.
                            </p>
                        </div>
                    </div>

                    <!-- Access Token item -->
                    <div class="single-doc-item" id="accessToken">
                        <div class="heading">
                            <h4>Access Token</h4>
                            <span class="td-badge badge-outline-primary">POST</span>
                        </div>
                        <div class="contents">
                            <p>
                                <a href="#">Access Token</a> is required to make
                                payment requests through the API. It serves as a secure key to
                                authorize and validate your transactions. You can generate the
                                Access Token using your API credentials Public Key and include
                                it in the header of every payment request.
                                Ensure the token is kept secure and updated regularly to
                                maintain the security of your transactions.
                            </p>
                            <p>
                                <strong>Live URL:</strong>&nbsp;<a href="javascript:void(0)"
                                    target="_blank">{{ url('api/access-token') }}</a>
                            </p>
                            <p>
                                <strong>Test URL:</strong>&nbsp;<a href="javascript:void(0)"
                                    target="_blank">{{ url('api/sandbox/access-token') }}</a>
                            </p>
                            <p>
                                <strong>Test Mode Mail:</strong>&nbsp;test_mode@mail.com
                            </p>
                            <p>
                                <strong>Test Mode Verification Code:</strong>&nbsp;222666
                            </p>
                            <p>
                                <strong>Request Method:</strong>&nbsp;POST
                            </p>
                        </div>
                        {{-- Example Code --}}
                        <div class="developer-code-preview mt-4">
                            <!-- Code Block with Topbar -->
                            <div class="codes-container">
                                <div class="code-topbar">
                                    <span class="title">Example Code</span>
                                    <div class="right-options">
                                        <div class="api-documentation-filter">
                                            <div class="td-small-select has-right-show">
                                                <select id="languageSelector"
                                                    onchange="changeLanguage('access-token-example-preview')">
                                                    <option value="php" selected>PHP</option>
                                                    <option value="laravel">Laravel (PHP)</option>
                                                    <option value="curl">CURL</option>
                                                    <option value="dotnet">.NET</option>
                                                    <option value="java">Java</option>
                                                    <option value="nodejs">Node.js</option>
                                                    <option value="python">Python</option>
                                                    <option value="ruby">Ruby</option>
                                                </select>
                                            </div>
                                        </div>
                                        <button class="copy-button" onclick="copyCode(this)" aria-label="Copy Code">
                                            <svg width="16" height="16" viewBox="0 0 16 16" fill="none"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M5.75 10.25C5.75 8.12868 5.75 7.06802 6.40901 6.40901C7.06802 5.75 8.12868 5.75 10.25 5.75L11 5.75C13.1213 5.75 14.182 5.75 14.841 6.40901C15.5 7.06802 15.5 8.12868 15.5 10.25V11C15.5 13.1213 15.5 14.182 14.841 14.841C14.182 15.5 13.1213 15.5 11 15.5H10.25C8.12868 15.5 7.06802 15.5 6.40901 14.841C5.75 14.182 5.75 13.1213 5.75 11L5.75 10.25Z"
                                                    stroke="white" stroke-linecap="round" stroke-linejoin="round" />
                                                <path
                                                    d="M11.7499 5.75C11.7482 3.53218 11.7146 2.38341 11.069 1.59682C10.9444 1.44492 10.8051 1.30563 10.6532 1.18097C9.82342 0.5 8.59061 0.5 6.125 0.5C3.65939 0.5 2.42658 0.5 1.59682 1.18097C1.44492 1.30563 1.30563 1.44492 1.18097 1.59682C0.5 2.42658 0.5 3.65939 0.5 6.125C0.5 8.59061 0.5 9.82342 1.18097 10.6532C1.30563 10.8051 1.44492 10.9444 1.59682 11.069C2.38341 11.7146 3.53218 11.7482 5.75 11.7499"
                                                    stroke="white" stroke-linecap="round" stroke-linejoin="round" />
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                                <pre id="access-token-example-preview">
                                        @include('frontend::api.include.access_token.example_code')
                              </pre>
                            </div>
                        </div>
                        {{-- Example Response (Success) --}}
                        <div class="developer-code-preview mt-4">
                            <!-- Code Block with Topbar -->
                            <div class="codes-container">
                                <div class="code-topbar">
                                    <span class="title">Example Response <div class="td-badge badge-outline-success ms-2">
                                            Success
                                            (200)
                                        </div>
                                    </span>
                                </div>
                                <pre>
                                        @include('frontend::api.include.access_token.example_success_response')
                                    </pre>
                            </div>
                        </div>
                        {{-- Example Response (Error) --}}
                        <div class="developer-code-preview mt-4">
                            <!-- Code Block with Topbar -->
                            <div class="codes-container">
                                <div class="code-topbar">
                                    <span class="title">Example Response <div class="td-badge badge-outline-danger ms-2">
                                            Error
                                            (401)
                                        </div>
                                    </span>
                                </div>
                                <pre>
                                        @include('frontend::api.include.access_token.example_error_response')
                                    </pre>
                            </div>
                        </div>
                    </div>

                    <!-- Make Payment item -->
                    <div class="single-doc-item" id="makePayment">
                        <div class="heading">
                            <h4 class="title">Make Payment</h4>
                            <span class="td-badge badge-outline-primary">POST</span>
                        </div>
                        <div class="contents">
                            <p>
                                To get started with the payment process, simply follow the
                                example code and ensure the parameters are set correctly. Be
                                sure to use the provided API endpoints for your requests.
                            </p>
                        </div>
                        <div class="initiate-payment-info mt-20">
                            <p>
                                <strong>Live URL:</strong>&nbsp;<a href="javascript:void(0)"
                                    target="_blank">{{ url('/api/make/payment') }}</a>
                            </p>
                            <p>
                                <strong>Test URL:</strong>&nbsp;<a href="javascript:void(0)"
                                    target="_blank">{{ url('/api/sandbox/make/payment') }}</a>
                            </p>
                            <p>
                                <strong>Request Method:</strong>&nbsp;<span
                                    class="td-badge badge-outline-primary ms-2">POST</span>
                            </p>
                            <p>
                                <strong>Sandbox Customer Credentials:</strong>
                            </p>
                            <p>
                                <strong>UID:</strong>&nbsp;12344567890
                            </p>
                            <p>
                                <strong>Password:</strong>&nbsp;12345678
                            </p>
                        </div>
                        <div class="contents mt-4">
                            <p>Request to the endpoint with the following parameters:</p>

                            <div class="api-table-box table-responsive">
                                <table class="api-table">
                                    <thead>
                                        <tr>
                                            <th>Param Name</th>
                                            <th>Param Type</th>
                                            <th>Description</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>amount</td>
                                            <td>float|integer <span
                                                    class="td-badge badge-outline-danger ms-2">Required</span>
                                            </td>
                                            <td class="description">
                                                The amount to be charged for the transaction.
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>currency</td>
                                            <td>string (4) <span class="td-badge badge-outline-danger ms-2">Required</span>
                                            </td>
                                            <td class="description">
                                                Currency Code (e.g., USD, EUR)
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>transaction_id</td>
                                            <td>string (12) <span
                                                    class="td-badge badge-outline-danger ms-2">Required</span>
                                            </td>
                                            <td class="description">
                                                A unique identifier for the transaction,
                                                consisting of 12 alphanumeric characters.
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>description</td>
                                            <td>string (20) <span
                                                    class="td-badge badge-outline-danger ms-2">Required</span>
                                            </td>
                                            <td class="description">
                                                A brief description of the transaction.
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>ipn_url</td>
                                            <td>string (255) <span
                                                    class="td-badge badge-outline-success ms-2">Optional</span>
                                            </td>
                                            <td class="description">
                                                Send the notification URL where you want to
                                                receive the notification.
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>callback_url</td>
                                            <td>string (255) <span
                                                    class="td-badge badge-outline-success ms-2">Optional</span>
                                            </td>
                                            <td class="description">
                                                Redirecting the user to the specified URL after
                                                the transaction is completed.
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>customer_name</td>
                                            <td>string (50) <span
                                                    class="td-badge badge-outline-success ms-2">Optional</span>
                                            </td>
                                            <td class="description">
                                                Provide your customer name.
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>customer_email</td>
                                            <td>string (50) <span
                                                    class="td-badge badge-outline-success ms-2">Optional</span>
                                            </td>
                                            <td class="description">
                                                Provide your customer email.
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="developer-code-preview mt-4">
                            <!-- Code Block with Topbar -->
                            <div class="codes-container">
                                <div class="code-topbar">
                                    <span class="title">Example PHP code</span>
                                    <div class="right-options">
                                        <div class="api-documentation-filter">
                                            <div class="td-small-select has-right-show">
                                                <select id="languageSelector2"
                                                    onchange="changeLanguage('make-payment-example-preview','languageSelector2')">
                                                    <option value="php" selected>PHP</option>
                                                    <option value="laravel">PHP (Laravel)</option>
                                                    <option value="curl">CURL</option>
                                                    <option value="dotnet">.NET</option>
                                                    <option value="java">Java</option>
                                                    <option value="nodejs">Node.js</option>
                                                    <option value="python">Python</option>
                                                    <option value="ruby">Ruby</option>
                                                </select>
                                            </div>
                                        </div>
                                        <button class="copy-button"
                                            onclick="copyCode(this,'make-payment-example-preview')"
                                            aria-label="Copy Code">
                                            <svg width="16" height="16" viewBox="0 0 16 16" fill="none"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M5.75 10.25C5.75 8.12868 5.75 7.06802 6.40901 6.40901C7.06802 5.75 8.12868 5.75 10.25 5.75L11 5.75C13.1213 5.75 14.182 5.75 14.841 6.40901C15.5 7.06802 15.5 8.12868 15.5 10.25V11C15.5 13.1213 15.5 14.182 14.841 14.841C14.182 15.5 13.1213 15.5 11 15.5H10.25C8.12868 15.5 7.06802 15.5 6.40901 14.841C5.75 14.182 5.75 13.1213 5.75 11L5.75 10.25Z"
                                                    stroke="white" stroke-linecap="round" stroke-linejoin="round" />
                                                <path
                                                    d="M11.7499 5.75C11.7482 3.53218 11.7146 2.38341 11.069 1.59682C10.9444 1.44492 10.8051 1.30563 10.6532 1.18097C9.82342 0.5 8.59061 0.5 6.125 0.5C3.65939 0.5 2.42658 0.5 1.59682 1.18097C1.44492 1.30563 1.30563 1.44492 1.18097 1.59682C0.5 2.42658 0.5 3.65939 0.5 6.125C0.5 8.59061 0.5 9.82342 1.18097 10.6532C1.30563 10.8051 1.44492 10.9444 1.59682 11.069C2.38341 11.7146 3.53218 11.7482 5.75 11.7499"
                                                    stroke="white" stroke-linecap="round" stroke-linejoin="round" />
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                                <pre id="make-payment-example-preview">
                                        @include('frontend::api.include.make_payment.example_code')
                                    </pre>
                            </div>
                        </div>
                        {{-- Example Response (Success) --}}
                        <div class="developer-code-preview mt-4">
                            <!-- Code Block with Topbar -->
                            <div class="codes-container">
                                <div class="code-topbar">
                                    <span class="title">Example Response <div
                                            class="td-badge badge-outline-success ms-2">
                                            Success (200)
                                        </div>
                                    </span>
                                </div>
                                <pre>
                                        @include('frontend::api.include.make_payment.example_success_response')
                                    </pre>
                            </div>
                        </div>
                        {{-- Example Response (Error) --}}
                        <div class="developer-code-preview mt-4">
                            <!-- Code Block with Topbar -->
                            <div class="codes-container">
                                <div class="code-topbar">
                                    <span class="title">Example Response <div class="td-badge badge-outline-danger ms-2">
                                            Error
                                            (400/401)
                                        </div>
                                    </span>
                                </div>
                                <pre>
                                        @include('frontend::api.include.make_payment.example_error_response')
                                    </pre>
                            </div>
                        </div>
                    </div>

                    <!-- IPN section -->
                    <div class="single-doc-item" id="Ipn">
                        <div class="heading">
                            <h4>IPN
                                <span class="td-badge badge-outline-success ms-2">POST</span>
                            </h4>
                        </div>
                        <div class="contents mb-20">
                            <p>
                                An IPN is a POST request sent to your business application URL
                                to notify about a payment status update. It provides real-time
                                data for identifying and verifying transactions. The key
                                parameters include:
                            </p>
                        </div>
                        <div class="initiate-payment-info mt-20 mb-35">
                            <p>
                                <strong>URL:</strong>&nbsp;Your IPN URL.
                            </p>
                            <p>
                                <strong>Method:</strong>&nbsp;GET
                            </p>
                        </div>
                        <p>You will get following parameters below.</p>
                        <div class="api-table-box table-responsive mt-4 mb-30">
                            <table class="api-table">
                                <thead>
                                    <tr>
                                        <th>Param Name</th>
                                        <th>Description</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>status</td>
                                        <td class="description">Payment success status.</td>
                                    </tr>
                                    <tr>
                                        <td>signature</td>
                                        <td class="description">
                                            At your end, a hash signature is used to verify the
                                            payment.
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>data</td>
                                        <td class="description">The data includes charges,
                                            amount, currency, payment transaction ID, and other
                                            relevant details.</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        {{-- Example Code --}}
                        <div class="developer-code-preview mt-4">
                            <!-- Code Block with Topbar -->
                            <div class="codes-container">
                                <div class="code-topbar">
                                    <span class="title">Example Code</span>
                                    <div class="right-options">
                                        <div class="api-documentation-filter">
                                            <div class="td-small-select has-right-show">
                                                <select id="languageSelector3"
                                                    onchange="changeLanguage('ipn-example-preview','languageSelector3')">
                                                    <option value="php" selected>PHP</option>
                                                    <option value="laravel">Laravel (PHP)</option>
                                                    <option value="dotnet">.NET</option>
                                                    <option value="java">Java</option>
                                                    <option value="nodejs">Node.js</option>
                                                    <option value="python">Python</option>
                                                    <option value="ruby">Ruby</option>
                                                </select>
                                            </div>
                                        </div>
                                        <button class="copy-button" onclick="copyCode(this,'ipn-example-preview')"
                                            aria-label="Copy Code">
                                            <svg width="16" height="16" viewBox="0 0 16 16" fill="none"
                                                xmlns="http://www.w3.org/2000/svg">
                                                <path
                                                    d="M5.75 10.25C5.75 8.12868 5.75 7.06802 6.40901 6.40901C7.06802 5.75 8.12868 5.75 10.25 5.75L11 5.75C13.1213 5.75 14.182 5.75 14.841 6.40901C15.5 7.06802 15.5 8.12868 15.5 10.25V11C15.5 13.1213 15.5 14.182 14.841 14.841C14.182 15.5 13.1213 15.5 11 15.5H10.25C8.12868 15.5 7.06802 15.5 6.40901 14.841C5.75 14.182 5.75 13.1213 5.75 11L5.75 10.25Z"
                                                    stroke="white" stroke-linecap="round" stroke-linejoin="round" />
                                                <path
                                                    d="M11.7499 5.75C11.7482 3.53218 11.7146 2.38341 11.069 1.59682C10.9444 1.44492 10.8051 1.30563 10.6532 1.18097C9.82342 0.5 8.59061 0.5 6.125 0.5C3.65939 0.5 2.42658 0.5 1.59682 1.18097C1.44492 1.30563 1.30563 1.44492 1.18097 1.59682C0.5 2.42658 0.5 3.65939 0.5 6.125C0.5 8.59061 0.5 9.82342 1.18097 10.6532C1.30563 10.8051 1.44492 10.9444 1.59682 11.069C2.38341 11.7146 3.53218 11.7482 5.75 11.7499"
                                                    stroke="white" stroke-linecap="round" stroke-linejoin="round" />
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                                <pre id="ipn-example-preview">
                                        @include('frontend::api.include.ipn.example_code')
                                    </pre>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="api-sidebar-wrapper-wrapper api-sticky-top">
                    <aside class="api-sidebar-wrapper">
                        <ul class="api-sidebar">
                            <li class="active"><a href="#introduction">Introduction</a></li>
                            <li><a href="#currencies">Currencies</a></li>
                            <li><a href="#apiKey">Obtain Api Key</a></li>
                            <li><a href="#accessToken">Access Token</a></li>
                            <li><a href="#makePayment">Make Payment</a></li>
                            <li><a href="#Ipn">IPN</a></li>
                        </ul>
                    </aside>
                </div>
            </div>
        </div>
    </section>
    <!-- api documentation section end -->
@endsection
@push('script')
    <script>
        "use strict";
        document.addEventListener('DOMContentLoaded', (event) => {
            document.querySelectorAll('pre code').forEach((block) => {
                hljs.highlightElement(block);
            });
        });
    </script>
    <script>
        "use strict";

        function updateActiveClass(activeLink) {
            menuLinks.forEach(link => link.parentElement.classList.remove('active'));
            activeLink.parentElement.classList.add('active');
        }

        function changeLanguage(targetElement, languageSelector = 'languageSelector') {
            const selectedLanguage = document.getElementById(languageSelector).value;
            const allCodeBlocks = document.querySelectorAll(`#${targetElement} > code`);

            console.log(selectedLanguage);
            allCodeBlocks.forEach((block) => {
                block.classList.add('d-none');
            });

            const selectedCodeBlock = document.querySelector(`#${targetElement} > code#${selectedLanguage}`);
            if (selectedCodeBlock) {
                selectedCodeBlock.classList.remove('d-none');
            }
        }

        function copyCode(button, targetElement = 'access-token-example-preview') {
            const visibleCodeBlock = document.querySelector(`#${targetElement} code:not(.d-none)`);
            if (visibleCodeBlock) {
                navigator.clipboard.writeText(visibleCodeBlock.innerText)
                    .then(() => {
                        const svgContent = button.innerHTML;
                        button.innerHTML = "Copied!";
                        button.disabled = true;

                        setTimeout(() => {
                            button.innerHTML = svgContent;
                            button.disabled = false;
                        }, 2000);
                    })
                    .catch((err) => console.error('Failed to copy text: ', err));
            }
        }
    </script>
    <script>
        "use strict";

        function activeNavLink() {
            const scrollFromTop = $(window).scrollTop();
            const menuOffsetTop = 100;

            $('.api-sidebar a[href^="#"]').each(function() {
                const sectionID = $(this).attr('href');
                const section = $(sectionID);

                if (section.length) {
                    const sectionOffsetTop = section.offset().top;
                    const sectionHeight = section.outerHeight();

                    if (scrollFromTop + menuOffsetTop >= sectionOffsetTop &&
                        scrollFromTop + menuOffsetTop < sectionOffsetTop + sectionHeight) {
                        $(this).parent().addClass('active');
                        $(this).parent().siblings().removeClass('active');
                    }
                }
            });
        }

        activeNavLink();

        $(window).on('scroll', function() {
            activeNavLink();
        });
    </script>
@endpush

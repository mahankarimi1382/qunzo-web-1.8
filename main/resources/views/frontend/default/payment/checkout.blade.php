<div wire:init='loadPay'>
    @if ($isLoaded && !$isSuccess && !$isCancelled)
        <div class="payment-card-box">
            <div class="payment-card">
                <div class="payment-card-header d-flex justify-content-between align-items-center">
                    <div class="payment-card-logo">
                        <img src="{{ asset(setting('site_logo')) }}" alt="App Logo">
                    </div>
                    <div class="currency">{{ $transaction->pay_currency }}</div>
                </div>
                <main class="payment-card-body">
                    <div class="merchant-info">
                        <div class="merchant-info-details">
                            <div class="merchant-info-logo">
                                <img src="{{ asset('frontend/images//icons/shopping-basket-01.png') }}"
                                    alt="Payment Logo">
                            </div>
                            <div class="contents">
                                <h6 class="merchant-info-name">{{ $transaction->user?->full_name ?? __('N/A') }}</h6>
                                <span class="merchant-info-invoice">{{ __('Transaction ID') }}:
                                    {{ $transaction->tnx }}</span>
                            </div>
                        </div>
                        <span
                            class="merchant-info-amount">{{ formatAmount($transaction->final_amount, $transaction->pay_currency, true) }}</span>
                    </div>
                    @if ($errors->any())

                        <div class="payment-status-card warning mb-3">
                            @foreach ($errors->all() as $error)
                                <div class="icon">
                                    <svg width="36" height="36" viewBox="0 0 36 36" fill="none"
                                        xmlns="http://www.w3.org/2000/svg">
                                        <circle cx="18" cy="18" r="18" fill="#FFB7B7"></circle>
                                        <path fill-rule="evenodd" clip-rule="evenodd"
                                            d="M23.7372 12.2631C24.144 12.6699 24.144 13.3294 23.7372 13.7362L13.7372 23.7362C13.3304 24.143 12.6709 24.143 12.2641 23.7362C11.8573 23.3294 11.8573 22.6699 12.2641 22.2631L22.2641 12.2631C22.6709 11.8563 23.3304 11.8563 23.7372 12.2631Z"
                                            fill="white"></path>
                                        <path fill-rule="evenodd" clip-rule="evenodd"
                                            d="M12.2641 12.2631C12.6709 11.8563 13.3304 11.8563 13.7372 12.2631L23.7372 22.2631C24.144 22.6699 24.144 23.3294 23.7372 23.7362C23.3304 24.143 22.6709 24.143 22.2641 23.7362L12.2641 13.7362C11.8573 13.3294 11.8573 12.6699 12.2641 12.2631Z"
                                            fill="white"></path>
                                    </svg>
                                </div>
                                <div class="contents">
                                    <p class="title">{{ $error }}</p>
                                </div>
                            @endforeach
                        </div>
                    @endif

                    <div class="account-info">
                        @if ($step === 1)
                            <label for="account-number" class="account-info-label">{{ __('UID') }}</label>
                            <div class="account-info-input-group">
                                <input class="account-info-input" type="text" wire:model='account_number'
                                    id="account-number" placeholder="{{ __('Enter UID') }}" autofocus />
                            </div>
                        @elseif($step === 2)
                            <label for="account-pass" class="account-info-label">{{ __('Password') }}</label>
                            <div class="account-info-input-group">
                                <input class="account-info-input" type="password" wire:model='account_password'
                                    maxlength="8" id="account-pass" placeholder="{{ __('Enter Password') }}" />
                            </div>
                        @endif
                    </div>
                </main>
                <div class="payment-card-footer d-flex justify-content-between flex-wrap gap-2">
                    <button type="button" class="td-btn btn-gray gateway-btn" wire:click='cancelPayment'>
                        <span><svg width="18" height="18" viewBox="0 0 18 18" fill="none"
                                xmlns="http://www.w3.org/2000/svg">
                                <g clip-path="url(#clip0_1468_8912)">
                                    <path d="M11.2495 11.25L6.75 6.75M6.75048 11.25L11.25 6.75" stroke="red"
                                        stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                                    <path
                                        d="M16.5 9C16.5 4.85786 13.1421 1.5 9 1.5C4.85786 1.5 1.5 4.85786 1.5 9C1.5 13.1421 4.85786 16.5 9 16.5C13.1421 16.5 16.5 13.1421 16.5 9Z"
                                        stroke="red" stroke-width="1.5" />
                                </g>
                                <defs>
                                    <clipPath id="clip0_1468_8912">
                                        <rect width="18" height="18" fill="white" />
                                    </clipPath>
                                </defs>
                            </svg>
                        </span>
                        {{ __('Cancel') }}
                    </button>
                    @if ($step === 1)
                        <button wire:click='nextStep' wire:loading.attr='disabled' wire:loading.remove
                            wire:target='nextStep' type="button" class="td-btn bg-grad-1 gateway-btn">
                            <span>
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                    viewBox="0 0 24 24">
                                    <g fill="none" stroke="currentColor" stroke-linecap="round"
                                        stroke-linejoin="round" stroke-width="1.5" color="currentColor">
                                        <circle cx="12" cy="12" r="10" />
                                        <path
                                            d="M12.915 15s2.585-2.21 2.585-3s-2.585-3-2.585-3M8.5 15s2.585-2.21 2.585-3S8.5 9 8.5 9" />
                                    </g>
                                </svg>
                            </span>
                            <span>
                                {{ __('Next') }}
                            </span>
                        </button>
                        <button type="button" wire:loading wire:target='nextStep' class="td-btn bg-grad-1 gateway-btn">
                            <span>
                                <i class="spinner-icon fa-spin">
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                        <path
                                            d="M304 48a48 48 0 1 0 -96 0 48 48 0 1 0 96 0zm0 416a48 48 0 1 0 -96 0 48 48 0 1 0 96 0zM48 304a48 48 0 1 0 0-96 48 48 0 1 0 0 96zm464-48a48 48 0 1 0 -96 0 48 48 0 1 0 96 0zM142.9 437A48 48 0 1 0 75 369.1 48 48 0 1 0 142.9 437zm0-294.2A48 48 0 1 0 75 75a48 48 0 1 0 67.9 67.9zM369.1 437A48 48 0 1 0 437 369.1 48 48 0 1 0 369.1 437z">
                                        </path>
                                    </svg>
                                </i>
                            </span>
                            <span>
                                {{ __('Processing') }}
                            </span>
                        </button>
                    @elseif($step === 2)
                        <button wire:click='payNow' wire:loading.attr='disabled' wire:loading.remove
                            wire:target='payNow' type="button" class="td-btn bg-grad-1 gateway-btn">
                            <span>
                                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
                                    viewBox="0 0 24 24" wire:loading.remove wire:target='payNow'>
                                    <g fill="none" stroke="currentColor" stroke-linecap="round"
                                        stroke-linejoin="round" stroke-width="1.5" color="currentColor">
                                        <path
                                            d="M17 3.338A9.95 9.95 0 0 0 12 2C6.477 2 2 6.477 2 12s4.477 10 10 10s10-4.477 10-10q-.002-1.03-.2-2" />
                                        <path d="M8 12.5s1.5 0 3.5 3.5c0 0 5.559-9.167 10.5-11" />
                                    </g>
                                </svg>
                                <i class="spinner-icon fa-spin" wire:loading wire:target='payNow'>
                                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                        <path
                                            d="M304 48a48 48 0 1 0 -96 0 48 48 0 1 0 96 0zm0 416a48 48 0 1 0 -96 0 48 48 0 1 0 96 0zM48 304a48 48 0 1 0 0-96 48 48 0 1 0 0 96zm464-48a48 48 0 1 0 -96 0 48 48 0 1 0 96 0zM142.9 437A48 48 0 1 0 75 369.1 48 48 0 1 0 142.9 437zm0-294.2A48 48 0 1 0 75 75a48 48 0 1 0 67.9 67.9zM369.1 437A48 48 0 1 0 437 369.1 48 48 0 1 0 369.1 437z">
                                        </path>
                                    </svg>
                                </i>
                            </span>
                            <span>
                                {{ __('Confirm') }}
                            </span>
                        </button>
                    @endif
                </div>
            </div>
        </div>
    @elseif ($isSuccess)
        <div class="payment-card-box">
            <div class="payment-card">
                <div class="payment-card-header">
                    <div class="payment-card-logo text-center">
                        <img src="{{ asset(setting('site_logo')) }}" alt="App Logo">
                    </div>
                </div>
                <div class="payment-card-body text-center">
                    <div class="payment-status-wrapper">
                        <div class="icon-wrapper">
                            <svg width="83" height="82" viewBox="0 0 83 82" fill="none"
                                xmlns="http://www.w3.org/2000/svg">
                                <circle cx="41.625" cy="41" r="41" fill="#EBF8E8"></circle>
                                <circle cx="41.625" cy="41" r="30" fill="#C5EBBA"></circle>
                                <path opacity="0.99"
                                    d="M38.1019 48.5052C37.8665 48.5055 37.6335 48.4582 37.4161 48.366C37.1987 48.2738 37.0013 48.1386 36.8351 47.9681L31.7961 42.8119C31.4636 42.4674 31.2778 42.0023 31.2793 41.5181C31.2808 41.0339 31.4694 40.57 31.804 40.2276C32.1386 39.8852 32.5919 39.6922 33.0651 39.6907C33.5383 39.6891 33.9928 39.8792 34.3295 40.2194L38.1018 44.0795L47.9211 34.0319C48.2578 33.6917 48.7123 33.5016 49.1855 33.5032C49.6587 33.5047 50.112 33.6977 50.4466 34.0401C50.7812 34.3825 50.9698 34.8464 50.9713 35.3306C50.9728 35.8148 50.787 36.2799 50.4545 36.6244L39.3686 47.9681C39.2024 48.1386 39.005 48.2739 38.7876 48.366C38.5702 48.4582 38.3372 48.5055 38.1019 48.5052Z"
                                    fill="white"></path>
                                <path
                                    d="M41.1257 22.6667C37.5821 22.6667 34.1181 23.742 31.1717 25.7565C28.2253 27.771 25.9289 30.6342 24.5728 33.9842C23.2167 37.3342 22.8619 41.0204 23.5533 44.5767C24.2446 48.1331 25.951 51.3997 28.4567 53.9637C30.9624 56.5277 34.1548 58.2737 37.6303 58.9811C41.1058 59.6885 44.7082 59.3255 47.9821 57.9379C51.2559 56.5503 54.0541 54.2004 56.0228 51.1855C57.9915 48.1706 59.0423 44.6261 59.0423 41.0001C59.0369 36.1395 57.1475 31.4796 53.7887 28.0426C50.4298 24.6056 45.8758 22.6723 41.1257 22.6667V22.6667ZM50.4549 36.6244L39.3689 47.9682C39.2026 48.1385 39.0051 48.2735 38.7878 48.3657C38.5704 48.4579 38.3374 48.5053 38.1022 48.5053C37.8669 48.5053 37.6339 48.4579 37.4166 48.3657C37.1992 48.2735 37.0017 48.1385 36.8354 47.9682L31.7965 42.8119C31.464 42.4674 31.2782 42.0023 31.2797 41.5181C31.2811 41.034 31.4698 40.57 31.8043 40.2277C32.1389 39.8853 32.5923 39.6923 33.0655 39.6907C33.5386 39.6892 33.9932 39.8793 34.3299 40.2195L38.1022 44.0795L47.9215 34.032C48.2581 33.6918 48.7127 33.5017 49.1859 33.5032C49.659 33.5048 50.1124 33.6978 50.447 34.0402C50.7816 34.3825 50.9702 34.8465 50.9716 35.3306C50.9731 35.8148 50.7873 36.2799 50.4549 36.6244Z"
                                    fill="#53C330"></path>
                            </svg>
                        </div>

                        <h3 class="status-title">{{ __('SUCCESS') }}</h3>

                        <h4 class="message-title">{{ __('Payment has been completed.') }}</h4>
                        @if ($isRedirection)
                            <p class="info-text" x-data="redirectCountdown">
                                {!! __('Redirecting in :seconds seconds...', ['seconds' => '<span x-text="countdown"></span>']) !!}
                            </p>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    @elseif ($isCancelled)
        <div class="payment-card-box">
            <div class="payment-card">
                <div class="payment-card-header">
                    <div class="payment-card-logo text-center">
                        <img src="{{ asset(setting('site_logo')) }}" alt="App Logo">
                    </div>
                </div>

                <div class="payment-card-body text-center">
                    <div class="payment-status-wrapper">
                        <div class="icon-wrapper">
                            <svg width="83" height="82" viewBox="0 0 83 82" fill="none"
                                xmlns="http://www.w3.org/2000/svg">
                                <circle cx="41.5" cy="41" r="41" fill="#FFEDED" />
                                <circle cx="41.5" cy="41" r="30" fill="#FFB7B7" />
                                <path opacity="0.99"
                                    d="M37.9769 48.5052C37.7415 48.5055 37.5085 48.4582 37.2911 48.366C37.0737 48.2738 36.8763 48.1386 36.7101 47.9681L31.6711 42.8119C31.3386 42.4674 31.1528 42.0023 31.1543 41.5181C31.1558 41.0339 31.3444 40.57 31.679 40.2276C32.0136 39.8852 32.4669 39.6922 32.9401 39.6907C33.4133 39.6891 33.8678 39.8792 34.2045 40.2194L37.9768 44.0795L47.7961 34.0319C48.1328 33.6917 48.5873 33.5016 49.0605 33.5032C49.5337 33.5047 49.987 33.6977 50.3216 34.0401C50.6562 34.3825 50.8448 34.8464 50.8463 35.3306C50.8478 35.8148 50.662 36.2799 50.3295 36.6244L39.2436 47.9681C39.0774 48.1386 38.88 48.2739 38.6626 48.366C38.4452 48.4582 38.2122 48.5055 37.9769 48.5052Z"
                                    fill="white" />
                                <circle cx="41" cy="41" r="18" fill="#F21B1B" />
                                <path fill-rule="evenodd" clip-rule="evenodd"
                                    d="M46.7372 35.2631C47.144 35.6699 47.144 36.3294 46.7372 36.7362L36.7372 46.7362C36.3304 47.143 35.6709 47.143 35.2641 46.7362C34.8573 46.3294 34.8573 45.6699 35.2641 45.2631L45.2641 35.2631C45.6709 34.8563 46.3304 34.8563 46.7372 35.2631Z"
                                    fill="white" />
                                <path fill-rule="evenodd" clip-rule="evenodd"
                                    d="M35.2641 35.2631C35.6709 34.8563 36.3304 34.8563 36.7372 35.2631L46.7372 45.2631C47.144 45.6699 47.144 46.3294 46.7372 46.7362C46.3304 47.143 45.6709 47.143 45.2641 46.7362L35.2641 36.7362C34.8573 36.3294 34.8573 35.6699 35.2641 35.2631Z"
                                    fill="white" />
                            </svg>
                        </div>

                        <h3 class="status-title">{{ __('CANCELLED') }}</h3>

                        <h4 class="message-title"> {{ __('Your payment was not completed.') }}</h4>
                    </div>
                </div>
            </div>
        </div>
    @else
        <div class="payment-card-box">
            <div class="payment-card">
                <header class="payment-card-header placeholder-glow">
                    <div class="placeholder col-6 rounded-1 height-40"></div>
                    <div class="currency placeholder col-4"></div>
                </header>
                <main class="payment-card-body placeholder-glow">
                    <div class="merchant-info">
                        <div class="merchant-info-details">
                            <div class="merchant-info-logo placeholder col-2 rounded-1 height-40"></div>
                            <div class="contents">
                                <span class="merchant-info-invoice placeholder col-12 rounded-1">Invoice:
                                    demo_checkout_NusMHJR5i0</span>
                            </div>
                        </div>
                        <span class="merchant-info-amount placeholder col-1 rounded-1"></span>
                    </div>
                    <div class="account-info">
                        <label for="account-otp" class="account-info-label placeholder col-2 rounded-1"></label>
                        <div class="account-info-input-group placeholder col-12 rounded-1 height-40"></div>
                    </div>
                </main>
                <footer class="payment-card-footer d-flex justify-content-between flex-wrap gap-2  placeholder-glow">
                    <button type="button" class="td-btn cancel-btn gateway-btn placeholder col-4"></button>
                    <a href="" class="td-btn bg-grad-1 placeholder col-4"></a>
                </footer>
            </div>
        </div>
    @endif
    <script>
        "use strict";
        document.addEventListener('alpine:init', function() {
            Alpine.data('redirectCountdown', () => ({
                countdown: 5, // Initial countdown time
                init() {
                    const interval = setInterval(() => {
                        this.countdown--;

                        if (this.countdown <= 0) {
                            clearInterval(interval);
                            // Perform the redirection
                            window.location.href = '{{ $redirectUrl }}';
                        }
                    }, 1000);
                },
            }));
        });
    </script>
</div>

<div class="side-nav">
    <div class="side-nav-inside">
        <ul class="side-nav-menu">
            <li class="side-nav-item {{ isActive('admin.dashboard') }}">
                <a href="{{ route('admin.dashboard') }}">
                    <i data-lucide="layout-dashboard"></i>
                    <span>
                        {{ __('Dashboard') }}
                    </span>
                </a>
            </li>

            @canany(['customer-list', 'customer-login', 'customer-basic-manage', 'customer-balance-add-or-subtract',
                'customer-change-password', 'all-type-status'])
                <li class="side-nav-item category-title">
                    <span>
                        {{ __('Users Management') }}
                    </span>
                </li>
                <li
                    class="side-nav-item side-nav-dropdown {{ isActive([
                        'admin.user.index',
                        'admin.user.active',
                        'admin.user.disabled',
                        'admin.user.new',
                        'admin.user.mail-send.all',
                        'admin.notification.all',
                    ]) }}">
                    <a href="javascript:void(0);" class="dropdown-link">
                        <i data-lucide="users"></i>
                        <span>
                            {{ __('Customers') }}
                        </span>
                        <span class="right-arrow">
                            <i data-lucide="chevron-down"></i>
                        </span>
                    </a>
                    <ul class="dropdown-items">
                        @canany(['customer-list', 'customer-login', 'customer-basic-manage',
                            'customer-balance-add-or-subtract', 'customer-change-password', 'all-type-status'])
                            <li class="{{ isActive('admin.user.index') }}">
                                <a href="{{ route('admin.user.index') }}">
                                    <i data-lucide="users"></i>
                                    {{ __('All Customers') }}
                                </a>
                            </li>
                            <li class="{{ isActive('admin.user.active') }}">
                                <a href="{{ route('admin.user.active') }}">
                                    <i data-lucide="user-check"></i>
                                    {{ __('Active Customers') }}
                                </a>
                            </li>
                            <li class="{{ isActive('admin.user.disabled') }}">
                                <a href="{{ route('admin.user.disabled') }}">
                                    <i data-lucide="user-x"></i>
                                    {{ __('Disabled Customers') }}
                                </a>
                            </li>
                        @endcanany

                        <li class="{{ isActive('admin.notification.all') }}">
                            <a href="{{ route('admin.notification.all') }}">
                                <i data-lucide="megaphone"></i>
                                {{ __('Notifications') }}
                            </a>
                        </li>
                    </ul>
                </li>
            @endcanany

            @if (merchantSystemEnabled())
                @canany(['merchant-list', 'merchant-requests'])
                    <li class="side-nav-item side-nav-dropdown {{ isActive(['admin.merchant.*']) }}">
                        <a href="javascript:void(0);" class="dropdown-link">
                            <i data-lucide="contact-round"></i>
                            <span>
                                {{ __('Merchants') }}
                            </span>
                            <span class="right-arrow">
                                <i data-lucide="chevron-down"></i>
                            </span>
                        </a>
                        <ul class="dropdown-items">
                            @canany(['merchant-list'])
                                @can('merchant-list')
                                    <li class="{{ isActive('admin.merchant.index', 'all') }}">
                                        <a href="{{ route('admin.merchant.index', 'all') }}">
                                            <i data-lucide="users"></i>
                                            {{ __('All Merchants') }}
                                        </a>
                                    </li>
                                    <li class="{{ isActive('admin.merchant.index', 'pending') }}">
                                        <a href="{{ route('admin.merchant.index', 'pending') }}">
                                            <i data-lucide="user-plus"></i>
                                            {{ __('Pending Merchants') }}
                                        </a>
                                    </li>
                                    <li class="{{ isActive('admin.merchant.index', 'approved') }}">
                                        <a href="{{ route('admin.merchant.index', 'approved') }}">
                                            <i data-lucide="user-check"></i>
                                            {{ __('Approved Merchants') }}
                                        </a>
                                    </li>
                                    <li class="{{ isActive('admin.merchant.index', 'rejected') }}">
                                        <a href="{{ route('admin.merchant.index', 'rejected') }}">
                                            <i data-lucide="x-circle"></i>
                                            {{ __('Rejected Merchants') }}
                                        </a>
                                    </li>
                                @endcan
                            @endcanany
                        </ul>
                    </li>
                @endcanany
            @endif

            @if (agentSystemEnabled())
                @canany(['agent-list', 'agent-requests'])
                    <li class="side-nav-item side-nav-dropdown {{ isActive(['admin.agent.*']) }}">
                        <a href="javascript:void(0);" class="dropdown-link">
                            <i data-lucide="contact-round"></i>
                            <span>
                                {{ __('Agents') }}
                            </span>
                            <span class="right-arrow">
                                <i data-lucide="chevron-down"></i>
                            </span>
                        </a>
                        @canany(['agent-list', 'agent-requests'])
                            <ul class="dropdown-items">
                                @can('agent-list')
                                    <li class="{{ isActive('admin.agent.index', 'all') }}">
                                        <a href="{{ route('admin.agent.index', 'all') }}">
                                            <i data-lucide="users"></i>
                                            {{ __('All Agents') }}
                                        </a>
                                    </li>
                                    <li class="{{ isActive('admin.agent.index', 'approved') }}">
                                        <a href="{{ route('admin.agent.index', 'approved') }}">
                                            <i data-lucide="user-check"></i>
                                            {{ __('Approved Agents') }}
                                        </a>
                                    </li>
                                    <li class="{{ isActive('admin.agent.index', 'pending') }}">
                                        <a href="{{ route('admin.agent.index', 'pending') }}">
                                            <i data-lucide="user-plus"></i>
                                            {{ __('Pending Agents') }}
                                        </a>
                                    </li>
                                    <li class="{{ isActive('admin.agent.index', 'rejected') }}">
                                        <a href="{{ route('admin.agent.index', 'rejected') }}">
                                            <i data-lucide="x-circle"></i>
                                            {{ __('Rejected Agents') }}
                                        </a>
                                    </li>
                                @endcan
                            </ul>
                        @endcanany
                    </li>
                @endcanany
            @endif

            @canany(['verification-list', 'verification-action', 'verification-form-manage'])
                <li class="side-nav-item category-title">
                    <span>
                        {{ __('Verification Management') }}
                    </span>
                </li>
                <li class="side-nav-item side-nav-dropdown {{ isActive(['admin.verification*']) }}">
                    <a href="javascript:void(0);" class="dropdown-link">
                        <i data-lucide="check-square"></i>
                        <span>
                            {{ __('Verification Center') }}
                        </span>
                        <span class="right-arrow">
                            <i data-lucide="chevron-down"></i>
                        </span>
                    </a>
                    <ul class="dropdown-items">
                        @canany(['verification-list', 'verification-action'])
                            <li class="{{ isActive('admin.verification.pending') }}">
                                <a href="{{ route('admin.verification.pending') }}">
                                    <i data-lucide="airplay"></i>
                                    {{ __('Pending Verifications') }}
                                </a>
                            </li>
                            <li class="{{ isActive('admin.verification.rejected') }}">
                                <a href="{{ route('admin.verification.rejected') }}">
                                    <i data-lucide="file-warning"></i>
                                    {{ __('Rejected Verifications') }}
                                </a>
                            </li>
                            <li class="{{ isActive('admin.verification.all') }}">
                                <a href="{{ route('admin.verification.all') }}">
                                    <i data-lucide="contact"></i>
                                    {{ __('All Verifications') }}
                                </a>
                            </li>
                        @endcanany
                        @can('verification-form-manage')
                            <li class="{{ isActive('admin.verification-form*') }}">
                                <a href="{{ route('admin.verification-form.index') }}">
                                    <i data-lucide="check-square"></i>
                                    {{ __('Verification Forms') }}
                                </a>
                            </li>
                        @endcan
                    </ul>
                </li>
            @endcanany

            @canany(['role-list', 'role-create', 'role-edit', 'staff-list', 'staff-create', 'staff-edit'])
                <li class="side-nav-item category-title">
                    <span>
                        {{ __('Access Management') }}
                    </span>
                </li>
                <li class="side-nav-item side-nav-dropdown {{ isActive(['admin.roles*', 'admin.staff*']) }}">
                    <a href="javascript:void(0);" class="dropdown-link">
                        <i data-lucide="users"></i>
                        <span>
                            {{ __('System Access') }}
                        </span>
                        <span class="right-arrow">
                            <i data-lucide="chevron-down"></i>
                        </span>
                    </a>
                    <ul class="dropdown-items">
                        @canany(['role-list', 'role-create', 'role-edit'])
                            <li class="{{ isActive('admin.roles*') }}">
                                <a href="{{ route('admin.roles.index') }}">
                                    <i data-lucide="contact"></i>
                                    <span>
                                        {{ __('Manage Roles') }}
                                    </span>
                                </a>
                            </li>
                        @endcanany
                        @canany(['staff-list', 'staff-create', 'staff-edit'])
                            <li class="{{ isActive('admin.staff*') }}">
                                <a href="{{ route('admin.staff.index') }}">
                                    <i data-lucide="user-cog"></i>
                                    <span>
                                        {{ __('Manage Staffs') }}
                                    </span>
                                </a>
                            </li>
                        @endcanany
                    </ul>
                </li>
            @endcanany

            @canany(['automatic-gateway-manage', 'transaction-list', 'manual-gateway-manage', 'deposit-list',
                'deposit-action', 'withdraw-list', 'withdraw-method-manage', 'withdraw-action', 'referral-create',
                'manage-referral', 'referral-edit', 'referral-delete'])

                <li class="side-nav-item category-title">
                    <span>
                        {{ __('Essentials') }}
                    </span>
                </li>
                @can('transaction-list')
                    <li class="side-nav-item {{ isActive('admin.transactions') }}">
                        <a href="{{ route('admin.transactions') }}">
                            <i data-lucide="cast"></i>
                            <span>
                                {{ __('Transactions') }}
                            </span>
                        </a>
                    </li>
                @endcan
                @canany(['automatic-gateway-manage', 'manual-gateway-manage', 'deposit-list', 'deposit-action'])
                    @can('automatic-gateway-manage')
                        <li class="side-nav-item {{ isActive('admin.gateway*') }}">
                            <a href="{{ route('admin.gateway.automatic') }}">
                                <i data-lucide="door-open"></i>
                                <span>
                                    {{ __('Automatic Gateways') }}
                                </span>
                            </a>
                        </li>
                    @endcan

                    <li class="side-nav-item side-nav-dropdown {{ isActive(['admin.deposit*']) }}">
                        <a href="javascript:void(0);" class="dropdown-link">
                            <i data-lucide="arrow-down-circle"></i>
                            <span>
                                {{ __('Deposits') }}
                            </span>
                            <span class="right-arrow">
                                <i data-lucide="chevron-down"></i>
                            </span>
                        </a>
                        <ul class="dropdown-items">

                            @can('automatic-gateway-manage')
                                <li class="{{ isActive('admin.deposit.method.list', 'auto') }}">
                                    <a href="{{ route('admin.deposit.method.list', 'auto') }}">
                                        <i data-lucide="workflow"></i>
                                        {{ __('Automatic Methods') }}
                                    </a>
                                </li>
                            @endcan

                            @can('manual-gateway-manage')
                                <li class="{{ isActive('admin.deposit.method.list', 'manual') }}">
                                    <a href="{{ route('admin.deposit.method.list', 'manual') }}">
                                        <i data-lucide="compass"></i>
                                        {{ __('Manual Methods') }}
                                    </a>
                                </li>
                            @endcan

                            @canany(['deposit-list', 'deposit-action'])
                                <li class="{{ isActive('admin.deposit.manual.pending') }}">
                                    <a href="{{ route('admin.deposit.manual.pending') }}">
                                        <i data-lucide="columns"></i>
                                        {{ __('Pending Manual Deposits') }}
                                    </a>
                                </li>
                                <li class="{{ isActive('admin.deposit.history') }}">
                                    <a href="{{ route('admin.deposit.history') }}">
                                        <i data-lucide="clipboard-check"></i>
                                        {{ __('Deposit History') }}
                                    </a>
                                </li>
                            @endcanany
                        </ul>
                    </li>
                @endcanany

                @canany(['withdraw-list', 'withdraw-method-manage', 'withdraw-action', 'withdraw-schedule'])
                    <li class="side-nav-item side-nav-dropdown  {{ isActive(['admin.withdraw*']) }}">
                        <a href="javascript:void(0);" class="dropdown-link">
                            <i data-lucide="landmark"></i>
                            <span>
                                {{ __('Withdraw') }}
                            </span>
                            <span class="right-arrow">
                                <i data-lucide="chevron-down"></i>
                            </span>
                        </a>
                        <ul class="dropdown-items">
                            @can('withdraw-method-manage')
                                <li class="{{ isActive('admin.withdraw.method.list', 'auto') }}">
                                    <a href="{{ route('admin.withdraw.method.list', 'auto') }}">
                                        <i data-lucide="workflow"></i>
                                        {{ __('Automatic Methods') }}
                                    </a>
                                </li>
                                <li class="{{ isActive('admin.withdraw.method.list', 'manual') }}">
                                    <a href="{{ route('admin.withdraw.method.list', 'manual') }}">
                                        <i data-lucide="compass"></i>
                                        {{ __('Manual Methods') }}
                                    </a>
                                </li>
                            @endcan
                            @canany(['withdraw-list', 'withdraw-action'])
                                <li class="{{ isActive('admin.withdraw.pending') }}">
                                    <a href="{{ route('admin.withdraw.pending') }}">
                                        <i data-lucide="wallet"></i>
                                        {{ __('Pending Withdraws') }}
                                    </a>
                                </li>
                            @endcanany
                            @can('withdraw-schedule')
                                <li class="{{ isActive('admin.withdraw.schedule') }}">
                                    <a href="{{ route('admin.withdraw.schedule') }}">
                                        <i data-lucide="alarm-clock"></i>
                                        {{ __('Withdraw Schedule') }}
                                    </a>
                                </li>
                            @endcan
                            @can('withdraw-list')
                                <li class="{{ isActive('admin.withdraw.history') }}">
                                    <a href="{{ route('admin.withdraw.history') }}">
                                        <i data-lucide="piggy-bank"></i>
                                        {{ __('Withdraw History') }}
                                    </a>
                                </li>
                            @endcan
                        </ul>
                    </li>
                @endcanany

                @canany(['referral-create', 'manage-referral', 'referral-edit', 'referral-delete'])
                    <li class="side-nav-item {{ isActive('admin.referral.*') }}">
                        <a href="{{ route('admin.referral.index') }}">
                            <i data-lucide="align-end-horizontal"></i>
                            <span>
                                {{ __('Referral') }}
                            </span>
                        </a>
                    </li>
                @endcanany

            @endcanany
            <li class="side-nav-item category-title">
                <span>
                    {{ __('Appearance & Pages') }}
                </span>
            </li>

            @canany(['site-setting', 'email-setting', 'plugin-setting', 'page-manage', 'language-setting',
                'sms-setting', 'push-notification-setting', 'notification-tune-setting'])
                @canany(['site-setting', 'email-setting', 'plugin-setting', 'page-manage', 'language-setting',
                    'sms-setting', 'push-notification-setting', 'notification-tune-setting'])
                    <li
                        class="side-nav-item side-nav-dropdown {{ isActive(['admin.settings*', 'admin.language*', 'admin.page.setting', 'admin.currency*', 'admin.settings.transactions']) }}">
                        <a href="javascript:void(0);" class="dropdown-link">
                            <i data-lucide="settings"></i>
                            <span>
                                {{ __('Settings') }}
                            </span>
                            <span class="right-arrow">
                                <i data-lucide="chevron-down"></i>
                            </span>
                        </a>
                        <ul class="dropdown-items">
                            @can('site-setting')
                                <li class="{{ isActive('admin.settings.site') }}">
                                    <a href="{{ route('admin.settings.site') }}">
                                        <i data-lucide="settings-2"></i>
                                        {{ __('General Settings') }}
                                    </a>
                                </li>
                                <li class="{{ isActive('admin.settings.transactions') }}">
                                    <a href="{{ route('admin.settings.transactions') }}">
                                        <i data-lucide="arrow-right-left"></i>
                                        {{ __('Transaction Fees & Limits') }}
                                    </a>
                                </li>

                                @can('plugin-setting')
                                    <li class="{{ isActive('admin.settings.plugin', 'system') }}">
                                        <a href="{{ route('admin.settings.plugin', 'system') }}"><i
                                                data-lucide="toy-brick"></i>{{ __('Plugin Settings') }}</a>
                                    </li>
                                @endcan
                                @if (setting('multiple_currency', 'permission'))
                                    <li class="{{ isActive('admin.currency*') }}">
                                        <a href="{{ route('admin.currency.index') }}">
                                            <i data-lucide="banknote"></i>
                                            {{ __('Currencies') }}
                                        </a>
                                    </li>
                                @endif
                            @endcan
                            @can('email-setting')
                                <li class="{{ isActive('admin.settings.mail') }}">
                                    <a href="{{ route('admin.settings.mail') }}">
                                        <i data-lucide="inbox"></i>
                                        {{ __('Email Settings') }}
                                    </a>
                                </li>
                            @endcan
                            @can('language-setting')
                                <li class="{{ isActive('admin.language*') }}">
                                    <a href="{{ route('admin.language.index') }}">
                                        <i data-lucide="languages"></i>
                                        <span>
                                            {{ __('Language Settings') }}
                                        </span>
                                    </a>
                                </li>
                            @endcan
                            @can('page-manage')
                                <li class="side-nav-item {{ isActive('admin.page.setting') }}">
                                    <a href="{{ route('admin.page.setting') }}">
                                        <i data-lucide="layout"></i>
                                        <span>
                                            {{ __('Register Field Settings') }}
                                        </span>
                                    </a>
                                </li>
                            @endcan
                        </ul>
                    </li>
                @endcanany
            @endcanany

            @canany(['page-manage', 'custom-css'])
                @can('page-manage')
                    <li class="side-nav-item side-nav-dropdown {{ isActive(['admin.page.edit*', 'admin.page.create']) }}">
                        <a href="javascript:void(0);" class="dropdown-link">
                            <i data-lucide="layout-grid"></i>
                            <span>
                                {{ __('Pages') }}
                            </span>
                            <span class="right-arrow">
                                <i data-lucide="chevron-down"></i>
                            </span>
                        </a>
                        <ul class="dropdown-items">
                            @foreach ($pages as $page)
                                <li class="@if (request()->is('admin/page/edit/' . $page->code)) active @endif">
                                    <a href="{{ route('admin.page.edit', $page->code) }}">
                                        <i data-lucide="egg"></i>
                                        {{ $page->title }}
                                    </a>
                                </li>
                            @endforeach
                        </ul>
                    </li>
                @endcan
                @can('custom-css')
                    <li class="side-nav-item {{ isActive('admin.custom-css') }}">
                        <a href="{{ route('admin.custom-css') }}">
                            <i data-lucide="braces"></i>
                            <span>
                                {{ __('Custom CSS') }}
                            </span>
                        </a>
                    </li>
                @endcan
            @endcanany

            @canany(['subscriber-list', 'subscriber-mail-send', 'support-ticket-list', 'support-ticket-action',
                'email-template', 'sms-template', 'sms-template', 'push-notification-template'])
                <li class="side-nav-item category-title">
                    <span>
                        {{ __('Support & Newsletter') }}
                    </span>
                </li>

                @canany(['support-ticket-list', 'support-ticket-action'])
                    <li class="side-nav-item {{ isActive('admin.mail.send.all') }}">
                        <a href="{{ route('admin.mail.send.all') }}">
                            <i data-lucide="send"></i>
                            <span>
                                {{ __('Mail Send to All') }}
                            </span>
                        </a>
                    </li>
                @endcanany

                @canany(['template-list', 'template-edit', 'template-update', 'template-delete'])
                    <li class="side-nav-item {{ isActive('admin.template*') }}">
                        <a href="{{ route('admin.template.index') }}">
                            <i data-lucide="mail"></i>
                            <span>
                                {{ __('Templates') }}
                            </span>
                        </a>
                    </li>
                @endcanany
                @canany(['support-ticket-list', 'support-ticket-action'])
                    <li class="side-nav-item {{ isActive('admin.ticket*') }}">
                        <a href="{{ route('admin.ticket.index') }}">
                            <i data-lucide="wrench"></i>
                            <span>
                                {{ __('Support Tickets') }}
                            </span>
                        </a>
                    </li>
                @endcanany
            @endcanany

            @canany(['manage-cron-job', 'cron-job-create', 'cron-job-edit', 'cron-job-logs', 'cron-job-run',
                'cron-job-delete', 'clear-cache', 'application-details'])
                <li class="side-nav-item category-title">
                    <span>
                        {{ __('System') }}
                    </span>
                </li>
                <li
                    class="side-nav-item side-nav-dropdown {{ isActive(['admin.clear-cache', 'admin.application-info', 'admin.cron.jobs.*']) }}">
                    <a href="javascript:void(0);" class="dropdown-link">
                        <i data-lucide="power"></i>
                        <span>
                            {{ __('System') }}
                        </span>
                        <span class="right-arrow">
                            <i data-lucide="chevron-down"></i>
                        </span>
                    </a>
                    <ul class="dropdown-items">
                        @can('manage-cron-job')
                            <li class="{{ isActive('admin.cron.jobs.*') }}">
                                <a href="{{ route('admin.cron.jobs.index') }}">
                                    <i data-lucide="alarm-clock"></i>
                                    <span>
                                        {{ __('Cron Jobs') }}
                                    </span>
                                </a>
                            </li>
                        @endcan
                        @can('clear-cache')
                            <li class="{{ isActive('admin.clear-cache') }}">
                                <a href="{{ route('admin.clear-cache') }}">
                                    <i data-lucide="trash-2"></i>
                                    <span>
                                        {{ __('Clear Cache') }}
                                    </span>
                                </a>
                            </li>
                        @endcan
                        @can('application-details')
                            <li class="{{ isActive('admin.application-info') }}">
                                <a href="{{ route('admin.application-info') }}">
                                    <i data-lucide="app-window"></i>
                                    <span>
                                        {{ __('Application Details') }}
                                    </span>
                                    <span class="badge yellow-color">
                                        {{ config('app.version') }}
                                    </span>
                                </a>
                            </li>
                        @endcan
                    </ul>
                </li>
            @endcanany
        </ul>
    </div>
</div>

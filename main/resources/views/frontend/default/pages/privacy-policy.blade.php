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
    <section class="td-terms-conditions-section section_space">
        <div class="container">
            <div class="td-page-contents">
                {!! $data->content !!}
            </div>
        </div>
    </section>
@endsection

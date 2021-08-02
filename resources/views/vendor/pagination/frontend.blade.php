<ul>
    @if (!$paginator->onFirstPage())
        <li><a class="previous" href="{{ $paginator->previousPageUrl() }}" rel="prev">Previous</a></li>
    @endif


@foreach ($elements as $element)

    @if (is_string($element))
        <li class="disabled"><span>{{ $element }}</span></li>
    @endif



    @if (is_array($element))
        @foreach ($element as $page => $url)
            @if ($page == $paginator->currentPage())
                    <li><a href="#" class="active">{{ $page }}</a></li>
            @else
                <li><a href="{{ $url }}">{{ $page }}</a></li>
            @endif
        @endforeach
    @endif
@endforeach

        @if ($paginator->hasMorePages())
            <li><a class="next" href="{{ $paginator->nextPageUrl() }}" rel="next">Next</a></li>
        @endif
</ul>


<form method="post" action="{{ route('contest.destroy',$id) }}">
    @if(!empty($aclList[12][3]))
        <a class="btn btn-xs btn-info text-white" href="{{route('contest.answer',$id)}}" title="Answer Submit">
            <i class="fas fa-question"></i>
        </a>
    @endif

    @if(strtotime($time_end) > strtotime(date("y-m-d H:i")))
        @if(!empty($aclList[12][3]))
            <a class="btn btn-xs btn-warning text-white" href="{{route('contest.edit',$id)}}" title="Edit">
                <i class="fas fa-pencil-alt"></i>
            </a>
        @endif
        @method('delete')
        @if(!empty($aclList[12][4]))
            @csrf
            <button type="submit" class="btn btn-xs btn-danger text-white delete" title="Delete">
                <i class="fas fa-trash-alt"></i>
            </button>
        @endif
    @endif
</form>

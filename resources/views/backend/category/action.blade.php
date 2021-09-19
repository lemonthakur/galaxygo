@if(!empty($aclList[14][3]) || !empty($aclList[14][4]))
    <form method="post" action="{{ route('category.destroy',$id) }}">
        @if(!empty($aclList[14][3]))
            <a class="btn btn-xs btn-warning text-white" href="{{route('category.edit',$id)}}" title="Edit">
                <i class="fas fa-pencil-alt"></i>
            </a>
        @endif
        @if(!empty($aclList[14][4]))
            @method('delete')
            @csrf

            @if($status == 1)
                <button type="submit" class="btn btn-xs btn-danger text-white delete" title="Inactive">
                    <i class="fas fa-times"></i>
                </button>
            @else
                <button type="submit" class="btn btn-xs btn-success text-white delete" title="Active">
                    <i class="fas fa-check"></i>
                </button>
            @endif
        @endif
    </form>
@endif

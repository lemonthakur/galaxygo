@if(!empty($aclList[1][3]) || !empty($aclList[1][4]))
    <form method="post" action="{{ route('product.destroy',$id) }}">
        @if(!empty($aclList[1][3]))
            <a class="btn btn-xs btn-warning text-white" href="{{route('product.edit',$id)}}" title="Edit">
                <i class="fas fa-pencil-alt"></i>
            </a>
        @endif
        @if(!empty($aclList[1][4]))
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
        @if(!empty($aclList[1][3]))
            <a class="btn btn-xs btn-success text-white" target="_blank" href="{{route('product.show',$id)}}" title="View">
                <i class="fas fa-eye"></i>
            </a>
        @endif
    </form>
@endif

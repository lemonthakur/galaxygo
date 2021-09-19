@if(!empty($aclList[17][8]))
    <form method="post" action="{{ route('product.destroy',$id) }}">
            <a class="btn btn-xs btn-warning text-white" href="{{route('bid.users.list', $id)}}" title="User List">
                <i class="fas fa-list"></i>
            </a>
    </form>
@endif

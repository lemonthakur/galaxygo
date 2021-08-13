@if(!empty($aclList[1][3]) || !empty($aclList[1][4]))
    <a class="btn btn-xs btn-primary text-white" href="{{route('backend.order.details',$id)}}" title="Details" target="_blank">
        <i class="fas fa-eye"></i>
    </a>
@endif

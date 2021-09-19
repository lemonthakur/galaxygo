@if(!empty($aclList[20][3]))
@if($status == 0)
    <div class="row">
        <div class="col-6">
            <form method="post" action="{{route('withdraw.update',$id)}}">
                @method('put')
                @csrf
                <input type="hidden" name="status" value="1">
                <input type="hidden" name="id" value="{{$id}}">
                <button type="submit" class="btn btn-xs btn-success text-white change" title="Approved">
                    <input type="hidden" name="status" value="1">
                    <i class="fas fa-check-circle"></i>
                </button>
            </form>
        </div>
        <div class="col-6 ml-0 pl-0">
            <form method="post" action="{{route('withdraw.update',$id)}}">
                @method('put')
                @csrf
                <input type="hidden" name="status" value="2">
                <input type="hidden" name="id" value="{{$id}}">
                <button type="submit" class="btn btn-xs btn-danger text-white change" title="Canceled">
                    <i class="fas fa-times-circle"></i>
                </button>
            </form>
        </div>
    </div>
@endif

@endif


    <form method="post" action="{{ route('players.destroy',$id) }}">
            <a class="btn btn-xs btn-warning text-white" href="{{route('players.edit',$id)}}" title="Edit">
                <i class="fas fa-pencil-alt"></i>
            </a>
            @method('delete')
            @csrf
            <button type="submit" class="btn btn-xs btn-danger text-white delete" title="Delete">
                <i class="fas fa-trash-alt"></i>
            </button>

            @if($image)
                <a class="btn btn-xs btn-success text-white" href="{{route('players.show',$id)}}" title="Download Photo">
                    <i class="fas fa-download"></i>
                </a>
            @endif    
    </form>


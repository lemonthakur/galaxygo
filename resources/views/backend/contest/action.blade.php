
    <form method="post" action="{{ route('contest.destroy',$id) }}">
            <a class="btn btn-xs btn-warning text-white" href="{{route('contest.edit',$id)}}" title="Edit">
                <i class="fas fa-pencil-alt"></i>
            </a>

            @method('delete')
            @csrf
            <button type="submit" class="btn btn-xs btn-danger text-white delete" title="Delete">
                <i class="fas fa-trash-alt"></i>
            </button>
    </form>

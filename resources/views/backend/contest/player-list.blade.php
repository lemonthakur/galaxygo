@php
    $sl = 1;
@endphp
@foreach(Cart::content() as $row)
 <tr>
     <td class="text-center">{{$sl++}}</td>
    <td>
        <img src="{{$row->options['player_image']}}" style="width: 100px;" />
    </td>
    <td>
        Name: {{ucwords($row->name)}} <br />
{{--        Location: {{strtoupper($row->options['location'])}} <br/>--}}
        Played On: {{$row->options['played_on']}}
    </td>
    <td>
        Versus: {{strtoupper($row->options['versus'])}} <br />
        Score: {{$row->options['score']}}
    </td>
    <td class="text-center align-middle">
        <button rowId="{{$row->rowId}}" type="button" class="btn btn-danger btn-xs removeCart">
            <i class="fas fa-trash"></i>
        </button>
        <button editRowId="{{$row->rowId}}" type="button" class="btn btn-success btn-xs editCart"
        attr-player="{{$row->name}}" attr-player-id="{{$row->id}}" attr-played-on="{{$row->options['played_on']}}"
                attr-versus="{{$row->options['versus']}}" attr-score="{{$row->options['score']}}"
                attr-player-image="{{$row->options['player_image']}}">
            <i class="fas fa-edit"></i>
        </button>
    </td>
</tr>
@endforeach

@php
    $sl = 1;
@endphp
@foreach(Cart::content() as $row)
 <tr>
     <td class="text-center">{{$sl++}}</td>
    <td>
        <img src="{{asset($row->options['player_image'])}}" style="width: 50px;height:50px;border-radius:50%;" />
    </td>
    <td>
        Name: {{ucwords($row->name)}} <br />
        Location: {{strtoupper($row->options['location'])}} <br/>
        Played On: {{$row->options['played_on']}}
    </td>
    <td>
        Versus: {{strtoupper($row->options['versus'])}} <br />
        Score: {{$row->options['score']}}
    </td>
    <td class="text-center align-middle">
        <button rowId="{{$row->rowId}}" type="button" class="btn btn-danger btn-xs removeCart">                                                <i class="fas fa-trash"></i>                                                     </button>
    </td>
</tr>
@endforeach

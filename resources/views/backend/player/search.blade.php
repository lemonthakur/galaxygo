@forelse($players as $player)
    <div class="d-flex flex-row align-content-center player" pid="{{$player->id}}" name="{{$player->name}}" imgUrl="{{asset($player->image)}}">
        <div class="w-25">
            <img class="img-fluid" src="{{asset($player->image)}}" alt="">
        </div>
        <div class="name">
            {{$player->name}}
        </div>
    </div>
@empty
    <h6 class="text-center p-2">No player found. Please add first</h6>
@endforelse

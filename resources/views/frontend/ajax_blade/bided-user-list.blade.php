@if($product_bid_list)

    @foreach ($product_bid_list as $apk => $apv)
        <tr>
            <td>{{ date("d M, Y", strtotime($apv->created_at)) }} / {{ date("h:i A", strtotime($apv->created_at)) }}</td>
            <td>${{ $apv->bid_amount }}</td>
        </tr>
    @endforeach

@else
<tr>
    <td colspan="2">No bid yet</td>
</tr>
@endif
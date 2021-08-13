<div class="form-group select2-parent">
    <select name="order_status" class="form-control single-select2 order_status" data-id={{ $id }} style="width: 100%;">
        <option selected disabled>Select One</option>
        <option value="Pending" @if($status=='Pending') selected @endif>Pending</option>
        <option value="Fulfilment" @if($status=='Fulfilment') selected @endif>Fulfilment</option>
        <option value="Cancle" @if($status=='Cancle') selected @endif>Cancle</option>
    </select>
</div>

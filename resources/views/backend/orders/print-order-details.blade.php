@php
    $total_column = 5;
    $site_title = config('app.name');
    $report_name = 'Order Details';
@endphp
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <title>@yield("page-title") | {{env("APP_NAME")}}</title>

    <style type="text/css">
        #printArea {
            width:1024px !important;
            margin:auto !important;
        }
        body, table {
            font-family:tahoma !important;
            font-size:13px !important;
        }
        .data_table {
            border-collapse:collapse !important;
        }
        .data_table th, .data_table td {
            padding:2px 15px 2px 4px !important; font-size:80% !important;
        }
        table td {
            padding:8px !important;
        }

        .text-right{
            text-align: right;
        }
    </style>

        <link rel="stylesheet" href="{{asset("/admin-lte/dist/css/adminlte.min.css")}}">
        <link rel="stylesheet" href="{{asset("/admin-lte/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css")}}">

        <link rel="stylesheet" href="{{asset("/custom/backend-custom.css")}}">
        <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

        <script src="{{asset("/admin-lte/plugins/jquery/jquery.min.js")}}"></script>
        <script src="{{asset("/admin-lte/plugins/bootstrap/js/bootstrap.bundle.min.js")}}"></script>
        <script src="{{asset("/admin-lte/dist/js/adminlte.min.js")}}"></script>
        <script src="{{asset("/custom/jquery.jqprint.js")}}"></script>

        <script type="text/javascript">
            $(document).ready(function(){
                $('#printArea').jqprint();
                  setTimeout(function () {
                    window.close();
                  }, 1000);
            });
        </script>
</head>
    <body class="">

        <div id="printArea">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="center" colspan="<?php echo $total_column; ?>">
                        <div style="font-size:24px; font-weight:bold; color:#111842; text-align:center; padding:2px;">{!! $site_title !!}</div>
                    </td>
                </tr>
            </table>

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr style="border-top:1px solid #ccc;">
                    <td colspan="<?php echo $total_column; ?>" align="center" style="font-size:17px; font-weight:bold; color:#d04e2a; text-align:center; padding:0px;">{!! $report_name !!}</td>
                </tr>
                <tr>
                    <td colspan="<?php echo $total_column; ?>" align="center" style="text-align:center; padding:0px;">Report Date: <?php echo date("d F, Y"); ?>&nbsp;</td>
                </tr>
                <tr><td style="padding:0px;">&nbsp;</td></tr>
            </table>

            <table id="" class="table data_table table-borderless" width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="34%">
                    <strong class="text-lg">Customer</strong><br>
                    <strong>{{ $order_shipping->user_inf->name.' '.$order_shipping->user_inf->last_name }}</strong><br>
                    <span>{{ $order_shipping->shipping_first_name.' '.$order_shipping->shipping_last_name }}</span><br>
                    <span>{{ $order_shipping->shipping_phone }}</span><br>
                    <span>{{ $order_shipping->shipping_email }}</span><br>
                    <span>{{ $order_shipping->shipping_adrress_line_1 }}</span>,
                    <span>{{ $order_shipping->shipping_adrress_line_2 }}</span><br>
                    <span>{{ $order_shipping->shipping_post_code }}</span>,
                    <span>{{ $order_shipping->shipping_city }}</span>,
                    <span>{{ $order_shipping->country_name->name }}</span><br>
                </td>
                <td width="33%" style="text-align: center;">
                    <span class="text-xlg">Invoice</span><br>
                    <strong>{{ $orders->tran_id }}</strong>
                </td>
                <td width="33%" style="text-align: right;">
                    <strong class="text-lg">Order</strong><br>
                    Date: {!! $orders->created_at->format('m/d/Y') !!}<br>
                    Time: {!! $orders->created_at->format('h:i A') !!}<br>
                    Status: {!! $orders->status !!}<br>
                    Payment: {!! 'Paid' !!}<br>
                </td>
            </tr>
            </table><br>
            @if($order_details)
                <table id="" class="table data_table" width="100%" border="1" cellpadding="0" cellspacing="0">
                    <thead>
                    <tr>
                        <th>SL</th>
                        <th>Image</th>
                        <th>Name</th>
                        <th>Quantity</th>
                        <th>Cost</th>
                        <th>Total Cost</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php
                        $i = 1;
                        $total_sub = 0;
                    ?>
                    @forelse($order_details as $od)
                        <tr>
                            <td>{{ $i++ }}</td>
                            <td style="vertical-align: middle;">
                                <img src="{{asset('upload/product-thumbnail-82-82/'.$od->product_det->feature_image) }}" alt="" style="height: 50px;width: 50px;">
                            </td>
                            <td>{{ $od->product_det->name }}</td>
                            <td class="text-right">{{ $od->quantity }}</td>
                            <td class="text-right">${{ $od->price }}</td>
                            <td class="text-right">${{ $od->price*$od->quantity }}</td>
                        </tr>
                        @php
                            $total_sub += $od->price*$od->quantity;
                        @endphp
                    @empty
                        <tr>
                            <td colspan="6" class="text-center">Nothing Found</td>
                        </tr>
                    @endforelse
                    @if($orders->delivery_charge OR $orders->vat_tax OR $orders->discount)
                        <tr>
                            <td colspan="5" class="text-right"><b>Sub Total</b></td>
                            <td class="text-right"><b>${{ $total_sub }}</b></td>
                        </tr>

                        @if($orders->vat_tax)
                            <tr>
                                <td colspan="5" class="text-right">VAT</td>
                                <td class="text-right">${{ $orders->vat_tax }}</td>
                            </tr>
                            @php
                                $total_sub += $orders->vat_tax;
                            @endphp
                        @endif
                        @if($orders->delivery_charge)
                            <tr>
                                <td colspan="5" class="text-right">Delivery Charge</td>
                                <td class="text-right">${{ $orders->delivery_charge }}</td>
                            </tr>
                            @php
                                $total_sub += $orders->delivery_charge;
                            @endphp
                        @endif
                        @if($orders->delivery_charge OR $orders->vat_tax)
                            <tr>
                                <td colspan="5" class="text-right"><b>Total</b></td>
                                <td class="text-right"><b>${{ $total_sub }}</b></td>
                            </tr>
                        @endif
                        @if($orders->discount)
                            <tr>
                                <td colspan="5" class="text-right">(Discoun)</td>
                                <td class="text-right">${{ $orders->discount }}</td>
                            </tr>
                            @php
                                $total_sub -= $orders->discount;
                            @endphp
                            <tr>
                                @if($orders->delivery_charge OR $orders->vat_tax)
                                    <td colspan="5" class="text-right"><b>Grand total</b></td>
                                @else
                                    <td colspan="5" class="text-right"><b>Total</b></td>
                                @endif
                                <td class="text-right"><b>${{ $total_sub }}</b></td>
                            </tr>
                        @endif

                    @else
                        <tr>
                            <td colspan="5" class="text-right"><b>Total</b></td>
                            <td class="text-right"><b>${{ $total_sub }}</b></td>
                        </tr>
                    @endif

                    </tbody>
                </table>
            @endif

        </div>

    </body>
</html>


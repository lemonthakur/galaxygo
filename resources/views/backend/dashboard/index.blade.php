@extends("backend.master.main-layout")
@section("page-title","Dashboard")
@section("main-content")
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Dashboard</h1>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h3 style="font-size: 25px;" id="wc" class="card-title h3 text-center w-100">Welcome To Galaxy DashBoard</h3>
                            </div>

                            <div class="card-body">
                                <div class="row">
                                    <!-- ./col -->
                                    <div class="col-lg-3 col-6">
                                        <!-- small box -->
                                        <div class="small-box bg-primary">
                                            <div class="inner">
                                                <h3>{{ number_format($total_user, 0, ".", ",") }}</h3>
                                                <p>Total Register User</p>
                                            </div>
                                            <div class="icon">
                                                <i class="fas fa-tags"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ./col -->

                                    <!-- ./col -->
                                    <div class="col-lg-3 col-6">
                                        <!-- small box -->
                                        <div class="small-box bg-success">
                                            <div class="inner">
                                                <h3>{{ number_format($total_guest_user, 0, ".", ",") }}</h3>
                                                <p>Total Guest User</p>
                                            </div>
                                            <div class="icon">
                                                <i class="fas fa-tags"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ./col -->

                                    <!-- ./col -->
                                    <div class="col-lg-3 col-6">
                                        <!-- small box -->
                                        <div class="small-box bg-warning">
                                            <div class="inner">
                                                <h3>{{ number_format($total_product, 0, ".", ",") }}</h3>
                                                <p>Total Product</p>
                                            </div>
                                            <div class="icon">
                                                <i class="fas fa-tags"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ./col -->
                                    <!-- ./col -->
                                    <div class="col-lg-3 col-6">
                                        <!-- small box -->
                                        <div class="small-box bg-danger">
                                            <div class="inner">
                                                <h3>{{ number_format($order_today, 0, ".", ",") }}</h3>
                                                <p>Today's Order</p>
                                            </div>
                                            <div class="icon">
                                                <i class="fas fa-tags"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ./col -->
                                    <!-- ./col -->
                                    <div class="col-lg-3 col-6">
                                        <!-- small box -->
                                        <div class="small-box bg-success">
                                            <div class="inner">
                                                <?php $total_ord = isset($total_order[0]['order_count']) ? $total_order[0]['order_count']:0; ?>
                                                <h3>{{ number_format($total_ord, 0, ".", ",") }}</h3>
                                                <p>Total Order</p>
                                            </div>
                                            <div class="icon">
                                                <i class="fas fa-tags"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ./col -->
                                    <!-- ./col -->
                                    <div class="col-lg-3 col-6">
                                        <!-- small box -->
                                        <div class="small-box bg-primary">
                                            <div class="inner">
                                                <?php
                                                    $var_array = array('general', 'auction');
                                                    $total_auc_ord = 0;
                                                    $total_pending_order = 0;

                                                    foreach ($total_order as $dv){
                                                        if($dv->order_type == 'general')
                                                            $total_auc_ord = $dv->order_count;

                                                        if($dv->order_type == 'auction')
                                                            $total_pending_order = $dv->order_count;
                                                    }
                                                ?>
                                                <h3>{{ number_format($total_auc_ord, 0, ".", ",") }}</h3>
                                                <p>Total Auction Order</p>
                                            </div>
                                            <div class="icon">
                                                <i class="fas fa-tags"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ./col -->
                                    <!-- ./col -->
                                    <div class="col-lg-3 col-6">
                                        <!-- small box -->
                                        <div class="small-box bg-danger">
                                            <div class="inner">
                                                <?php
                                                $pending_ord = 0;
                                                $cancel_order = 0;
                                                $fulfilment_order = 0;

                                                foreach ($order_status as $dsv){
                                                    if($dsv->status == 'Pending')
                                                        $pending_ord = $dsv->order_status_count;
                                                    if($dsv->status == 'Cancle')
                                                        $cancel_order = $dsv->order_status_count;
                                                    if($dsv->status == 'Fulfilment')
                                                        $fulfilment_order = $dsv->order_status_count;
                                                }
                                                ?>

                                                <h3>{{ number_format($pending_ord, 0, ".", ",") }}</h3>
                                                <p>Total Pending Order</p>
                                            </div>
                                            <div class="icon">
                                                <i class="fas fa-tags"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ./col -->
                                    <!-- ./col -->
                                    <div class="col-lg-3 col-6">
                                        <!-- small box -->
                                        <div class="small-box bg-warning">
                                            <div class="inner">
                                                <h3>{{ number_format($cancel_order, 0, ".", ",") }}</h3>
                                                <p>Total Canceled Order</p>
                                            </div>
                                            <div class="icon">
                                                <i class="fas fa-tags"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ./col -->

                                    <!-- ./col -->
                                    <div class="col-lg-3 col-6">
                                        <!-- small box -->
                                        <div class="small-box bg-danger">
                                            <div class="inner">
                                                <h3>{{ number_format($fulfilment_order, 0, ".", ",") }}</h3>
                                                <p>Total Fulfilment Order</p>
                                            </div>
                                            <div class="icon">
                                                <i class="fas fa-tags"></i>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- ./col -->

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content -->
    </div>
    @endsection
@section('js');
<script>
    setInterval(
        function() {
            let randomColor = "#" + Math.floor(Math.random() * 16777215).toString(16);
            $('#wc').css("color",randomColor);
        }, 1500);
</script>
    @endsection

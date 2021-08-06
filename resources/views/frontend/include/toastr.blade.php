@if(Session::has('success'))
    <script>
        toastr.options =
            {
                "closeButton" : true,
                "progressBar" : true.
                "positionClass": "toast-top-center",
            }
        toastr.success("{{ session('success') }}");
    </script>
@endif

@if(Session::has('error'))
    <script>
        toastr.options =
            {
                "closeButton" : true,
                "progressBar" : true,
                "positionClass": "toast-top-center",
            }
        toastr.error("{{ session('error') }}");
    </script>
@endif

@if(Session::has('info'))
    <script>
        toastr.options =
            {
                "closeButton" : true,
                "progressBar" : true,
                "positionClass": "toast-top-center",
            }
        toastr.error("{{ session('info') }}");
    </script>
@endif

@if(Session::has('warning'))
    <script>
        toastr.options =
            {
                "closeButton" : true,
                "progressBar" : true,
                "positionClass": "toast-top-center",
            }
        toastr.error("{{ session('warning') }}");
    </script>
@endif



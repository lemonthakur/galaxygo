// Cancel Button
$(".cancel").click(function () {
    history.back();
});

// Delete Confirm
$(document).ready(function() {
    $(document).on('click', '.delete', function (e) {
        e.preventDefault();
        var form = $(this).parents('form');
        Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            type: 'warning',
            cancelButtonColor: '#d33',
            confirmButtonColor: '#3085d6',
            confirmButtonText: 'Yes, delete it!',
            showCancelButton: true,
        }).then((result) => {
            if (result.value) {
                form.submit();
            }
        });
    });
});

// Minimal Select 2
$(document).ready(function() {
    $('.single-select2').select2();
});

// Image Upload
$(document).ready(function() {
    $('.image').change(function () {
        var image = document.getElementById('output');
        image.src = URL.createObjectURL(event.target.files[0]);
    });
});

// date time picker
 $('.datetimepicker').datetimepicker({
    ignoreReadonly: true,
    toolbarPlacement:'top',
    keepOpen:false,
    buttons:{
        showToday: true,
        showClear: true,
        showClose: true
    },
    useCurrent:false,
    icons: {
        time: "fas fa-clock",
        date: "fas fa-calendar",
        up: "fas fa-arrow-up",
        down: "fas fa-arrow-down",
        previous: "fas fa-chevron-left",
        next: "fas fa-chevron-right",
        today: "fas fa-calendar-check",
        clear: "fas fa-trash"
    }
});

// Date picker
$('.datepicker').datetimepicker({
    ignoreReadonly: true,
    toolbarPlacement:'top',
    keepOpen:false,
    buttons:{
        showToday: true,
        showClear: true,
        showClose: true
    },
    useCurrent:false,
    format: 'L',
    icons: {
        time: "fas fa-clock",
        date: "fas fa-calendar",
        up: "fas fa-arrow-up",
        down: "fas fa-arrow-down",
        previous: "fas fa-chevron-left",
        next: "fas fa-chevron-right",
        today: "fas fa-calendar-check",
        clear: "fas fa-trash"
    }
});

// Time Picker
$('.timepicker').datetimepicker({
    ignoreReadonly: true,
    format: 'LT',
    toolbarPlacement:'top',
    keepOpen:false,
    buttons:{
        showToday: true,
        showClear: true,
        showClose: true
    },
});
// Date tiem picker close on blur
$('.datetimepicker,.datepicker,.timepicker').on('blur', function(){
    $(this).data('datetimepicker').hide();
});



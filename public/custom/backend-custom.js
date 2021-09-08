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

    $(document).on('click', '.change', function (e) {
        e.preventDefault();
        var form = $(this).parents('form');
        Swal.fire({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            type: 'warning',
            cancelButtonColor: '#d33',
            confirmButtonColor: '#3085d6',
            confirmButtonText: 'Accept',
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

$(document).ready(function() {
    $('.logo').change(function () {
        var image = document.getElementById('outputLogo');
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
     format: 'DD-MM-YYYY hh:mm A',
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
    format: 'DD-MM-YYYY',
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
$(document).ready(function() {
    // Time Picker
    $('.timepicker').datetimepicker({
        ignoreReadonly: true,
        Default: false,
        format: 'hh:mm A',
        toolbarPlacement:'top',
        keepOpen:false,
        buttons:{
            showClear: true,
            showClose: true
        },
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
});
// Date tiem picker close on blur
$('.datetimepicker,.datepicker,.timepicker').on('blur', function(){
    $(this).data('datetimepicker').hide();
});

function tinymceInitial(){
    tinymce.init({
        selector: '.txt-editor',
        menubar: true,
        plugins: [
            "link image code fullscreen",
            'advlist autolink lists link charmap print preview hr anchor pagebreak',
            'searchreplace wordcount visualblocks visualchars code fullscreen',
            'insertdatetime media nonbreaking save table directionality',
            'emoticons template paste textpattern imagetools codesample toc'
        ],
        toolbar1: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify |forecolor backcolor|bullist numlist outdent indent | link image',

        images_upload_url: 'postAcceptor.php',
        automatic_uploads: false,
        file_picker_types: 'file image media',
        image_caption: true,
        min_height: 300,
        max_height: 550,
        lineheight_formats: "8pt 9pt 10pt 11pt 12pt 14pt 16pt 18pt 20pt 22pt 24pt 26pt 36pt",
        importcss_append: true,
        fullpage_hide_in_source_view: true
    });
}



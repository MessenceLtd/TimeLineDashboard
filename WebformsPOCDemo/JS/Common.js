

$(function () {

    $(".InitializeDatePicker").datepicker(
        {
            showWeek: false,
            dateFormat: "dd/mm/yy",
            changeMonth: true,
            changeYear: true,
            yearRange: "-120:+0",
            regional: 'he'
        }); 

    var prm = Sys.WebForms.PageRequestManager.getInstance();

    prm.add_endRequest(function () {

        $(".InitializeDatePicker").datepicker(
            {
                showWeek: false,
                dateFormat: "dd/mm/yy",
                changeMonth: true,
                changeYear: true,
                yearRange: "-120:+0",
                regional: 'he'
            }); 

    });

});


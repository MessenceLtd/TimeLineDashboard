

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

function Run_Auto_Complete_Helper_On_Uploaded_File_Name( input_Upload_File_Element ) {

    var l_File_Fake_Path = input_Upload_File_Element.value;
    if (l_File_Fake_Path.length > 0)
    {
        var l_file_Name_For_Process = l_File_Fake_Path.substring(l_File_Fake_Path.lastIndexOf('\\') + 1);

        $('#hidden_Uploading_FileName_For_AutoComplete_Helper').val(l_file_Name_For_Process);
        $('#button_Run_Auto_Complete_Based_On_Selected_FileName').click();
    }
}

function Get_Uploaded_File_Info_From_File_Name(file_Name)
{
    /*  Few supported file name examples: 
        15.05.2017 - Total 330.02 nis - Electricity bill for 14.03.2017 - 14.05.2017.pdf
        03.02.2013 1348 - Total 37.3 nis - Israel fast post mail service - hertzelia pituah - receipt tax invoice 13-0487977835-054928.pdf
    */

    var file_Info_Structure_To_Return =
    {
        FileName        : null,
        Date            : null,
        Time            : null,
        Total_Value     : null,
        Currency        : null,
        Entity_Of_File  : null,
        Description     : null
    };

    file_Info_Structure_To_Return.FileName = file_Name;

    // Try to extract a date 
    var l_Date_Format_Extracted = file_Name.substring(0, file_Name.indexOf('-'));
    var l_Date_Parts_Processed_From_Extracted_Format = Get_Date_From_Formatted_String(l_Date_Format_Extracted);

    var l_Total_Amount_Fromat_Extracted =
        file_Name.substring(file_Name.indexOf('-') + 2, file_Name.indexOf('-', file_Name.indexOf('-') + 1));
    if (l_Total_Amount_Fromat_Extracted.indexOf('Total') > -1) {
        l_Total_Amount_Fromat_Extracted = l_Total_Amount_Fromat_Extracted.toLowerCase().replace('total', '');
    }

    if (l_Total_Amount_Fromat_Extracted.startsWith(' ')) {
        l_Total_Amount_Fromat_Extracted = l_Total_Amount_Fromat_Extracted.trimLeft();
    }

    var l_Final_Total_Amount_Extracted_From_Fromat =
        l_Total_Amount_Fromat_Extracted.substring(0, l_Total_Amount_Fromat_Extracted.indexOf(' '));

    if (l_Date_Parts_Processed_From_Extracted_Format.Formatted_Date) {
        // Date (+ maybe time) successfully extracted from file name
        Update_Date_Parts_For_Page_Controls_Following_Uploaded_File_Name_Content_Auto_Complete_Parsing(l_Date_Parts_Processed_From_Extracted_Format);
        if (l_Final_Total_Amount_Extracted_From_Fromat.length > 0) {
            // try to parse the total amount and see if it is larger then 0
            var parsed_Total_Amount = parseFloat(l_Final_Total_Amount_Extracted_From_Fromat);
            if (parsed_Total_Amount > 0)
            {
                parsed_Total_Amount = parsed_Total_Amount;
                document.getElementById('textbox_Total_Amount').value = parsed_Total_Amount;
            }
        }
    }
}

function Get_Date_From_Formatted_String(formatted_String)
{
    // format example: 03.02.2013 1348
    var day = formatted_String.substring(0, formatted_String.indexOf('.'));
    var month = formatted_String.substring(3, formatted_String.lastIndexOf('.'));
    var year = formatted_String.substring(formatted_String.lastIndexOf('.') + 1, formatted_String.lastIndexOf('.') + 1 +  4);

    var hours = 0;
    var minutes = 0;
    if (formatted_String.length > 12)
    {
        // formatted string has time stamp
        var hours = formatted_String.substring(formatted_String.lastIndexOf('.') + 6, formatted_String.lastIndexOf('.') + 6+2);
        var minutes = formatted_String.substring(formatted_String.lastIndexOf('.') + 8, formatted_String.lastIndexOf('.') + 8+2);
    }

    var l_Formatted_Date = day + '/' + month + '/' + year;

    var date_Parts_From_Formatted_String_To_Return =
    {
        Day: day,
        Month: month,
        Year: year,
        Hours: hours,
        Minutes: minutes,
        Formatted_Date: l_Formatted_Date
    };

    return date_Parts_From_Formatted_String_To_Return;
}

function Update_Date_Parts_For_Page_Controls_Following_Uploaded_File_Name_Content_Auto_Complete_Parsing(
    date_Parts_From_Formatted_String_To_Return )
{
    // check the current page url to know which controls should recieve auto complete
    var l_Page_Name = Get_Current_Requested_Page_Name();
    // Run auto complete logic based on the current page and the extracted parts from the file name
    if (l_Page_Name)
    {
        var l_Hours_Format_For_AutoComplete = date_Parts_From_Formatted_String_To_Return.Hours.toString();
        if (l_Hours_Format_For_AutoComplete.length > 0) {
            if (l_Hours_Format_For_AutoComplete.length < 2) {
                l_Hours_Format_For_AutoComplete = '0' + l_Hours_Format_For_AutoComplete;
            }
        }
        var l_Minutes_Format_For_AutoComplete = date_Parts_From_Formatted_String_To_Return.Minutes.toString();
        if (l_Minutes_Format_For_AutoComplete.length > 0) {
            if (l_Minutes_Format_For_AutoComplete.length < 2) {
                l_Minutes_Format_For_AutoComplete = '0' + l_Minutes_Format_For_AutoComplete;
            }
        }

        if (l_Page_Name == 'add_expense.aspx')
        {
            $('#textbox_Expense_Invoice_DateTime').val(date_Parts_From_Formatted_String_To_Return.Formatted_Date);
            
            $('#dropdown_Invoice_Time_Hours').val(l_Hours_Format_For_AutoComplete);
            $('#dropdown_Invoice_Time_Minutes').val(l_Minutes_Format_For_AutoComplete);
        }
    }
}

function Get_Current_Requested_Page_Name()
{
    var pageName = window.location.href.substring(window.location.href.lastIndexOf('/') + 1);
    if (pageName.indexOf('?') > -1) {
        pageName = pageName.substring(0, pageName.indexOf('?'));
    }

    if (pageName.indexOf('#') > -1) {
        pageName = pageName.substring(0, pageName.indexOf('#'));
    }

    pageName = pageName.toLowerCase();

    return pageName;
}

function Update_Totals_Based_On_Total_Amount_Entry()
{
    // Get the vat value, And the Total amount value 
    total_Amount = document.getElementById('textbox_Total_Amount').value;
    vat_Percentage = document.getElementById('textbox_Vat_Percentage').value;

    f_Total_Amount = parseFloat(total_Amount);
    f_Vat_Percentage = parseFloat(vat_Percentage);

    if (vat_Percentage > 0) {
        var total_Without_Vat = (f_Total_Amount / ((f_Vat_Percentage + 100) / 100));
        var total_Vat_Value = f_Total_Amount - total_Without_Vat;

        total_Without_Vat = Math.round(total_Without_Vat)
        total_Vat_Value = Math.round(total_Vat_Value);

        document.getElementById('textbox_Total_Without_Vat').value = total_Without_Vat;
        document.getElementById('textbox_Total_Vat').value = total_Vat_Value;
    }
    else {
        document.getElementById('textbox_Total_Without_Vat').value = total_Amount;
        document.getElementById('textbox_Total_Vat').value = '0';
    }
}


function Swap_Sys_Language(language)
{
    var l_Current_Language = document.getElementById('hidden_Current_Language').value;
    if (language != l_Current_Language)
    {
        document.getElementById('hidden_New_Language_To_Swap').value = language;
        document.getElementById('button_Language_Swap_Event').click();
    }
}

function Refresh_Suppliers() {
    document.getElementById('button_Refresh_Suppliers').click();
}

function Refresh_Clients() {
    document.getElementById('button_Refresh_Clients').click();
}





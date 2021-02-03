using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using TimeLineDashboard.BusinessLogicLayer;

namespace WebformsPOCDemo
{
    internal class Common_Tools
    {
        private Common_Tools() { }

        private static readonly string[] k_Hours_Array = { "00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11",
                                                             "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23" };

        private static readonly string[] k_Minutes_Array = { "00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11",
                                                             "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23",
                                                             "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35",
                                                             "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47",
                                                             "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59"};

        private static readonly string[] k_Seconds_Array = { "00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11",
                                                             "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23",
                                                             "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35",
                                                             "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47",
                                                             "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59"};

        internal static void Initialize_DropDown_Countries(DropDownList dropdown_Country)
        {
            dropdown_Country.DataSource = Business_Logic_Layer_Facade.Instance.Countries_GetAll();
            dropdown_Country.DataTextField = "Country_English_Name";
            dropdown_Country.DataValueField = "Country_Id";
            dropdown_Country.DataBind();
            dropdown_Country.Items.Insert(0, new ListItem("-- Select -- ", ""));
        }

        internal static void Initialize_DropDown_Hours(DropDownList dropdown_Hours_Selection)
        {
            dropdown_Hours_Selection.ClearSelection();
            dropdown_Hours_Selection.Items.Clear();
            dropdown_Hours_Selection.Items.Add(new ListItem("", ""));

            for (int i = 0; i < k_Hours_Array.Length; i++)
            {
                dropdown_Hours_Selection.Items.Add(new ListItem(k_Hours_Array[i], k_Hours_Array[i]));
            }
        }

        internal static void Initialize_DropDown_Minutes(DropDownList dropdown_Minutes_Selection)
        {
            dropdown_Minutes_Selection.ClearSelection();
            dropdown_Minutes_Selection.Items.Clear();
            dropdown_Minutes_Selection.Items.Add(new ListItem("", ""));

            for (int i = 0; i < k_Minutes_Array.Length; i++)
            {
                dropdown_Minutes_Selection.Items.Add(new ListItem(k_Minutes_Array[i], k_Minutes_Array[i]));
            }
        }

        internal static void Initialize_DropDown_Seconds(DropDownList dropdown_Seconds_Selection)
        {
            dropdown_Seconds_Selection.ClearSelection();
            dropdown_Seconds_Selection.Items.Clear();
            dropdown_Seconds_Selection.Items.Add(new ListItem("", ""));

            for (int i = 0; i < k_Seconds_Array.Length; i++)
            {
                dropdown_Seconds_Selection.Items.Add(new ListItem(k_Seconds_Array[i], k_Seconds_Array[i]));
            }
        }

        internal static void Initialize_DropDown_Currencies(DropDownList dropdown_Currency_Selection)
        {
            dropdown_Currency_Selection.DataSource = Business_Logic_Layer_Facade.Instance.Currencies_Get_List();
            dropdown_Currency_Selection.DataTextField = "Formatted_Currency_Display_For_Selection";
            dropdown_Currency_Selection.DataValueField = "Currency_Id";
            dropdown_Currency_Selection.DataBind();
            dropdown_Currency_Selection.Items.Insert(0, new ListItem("-- Select -- ", ""));
        }

        internal static void Initialize_DropDown_Client_Types(DropDownList dropdown_Client_Type_Selection)
        {
            dropdown_Client_Type_Selection.DataSource = Business_Logic_Layer_Facade.Instance.ClientTypes_Get_All();
            dropdown_Client_Type_Selection.DataTextField = "Type_Name";
            dropdown_Client_Type_Selection.DataValueField = "Client_Type_Id";
            dropdown_Client_Type_Selection.DataBind();
            dropdown_Client_Type_Selection.Items.Insert(0, new ListItem("-- Select -- ", ""));
        }

        internal static void Initialize_DropDown_Supplier_Types(DropDownList dropdown_Supplier_Type_Selection)
        {
            dropdown_Supplier_Type_Selection.DataSource = Business_Logic_Layer_Facade.Instance.SupplierTypes_Get_All();
            dropdown_Supplier_Type_Selection.DataTextField = "Type_Name";
            dropdown_Supplier_Type_Selection.DataValueField = "Supplier_Type_Id";
            dropdown_Supplier_Type_Selection.DataBind();
            dropdown_Supplier_Type_Selection.Items.Insert(0, new ListItem("-- Select -- ", ""));
        }

        internal static void Initialize_DropDown_Document_Types(DropDownList dropdown_Document_Type_Selection)
        {
            dropdown_Document_Type_Selection.DataSource = Business_Logic_Layer_Facade.Instance.DocumentTypes_Get_All();
            dropdown_Document_Type_Selection.DataTextField = "Document_Type_Name";
            dropdown_Document_Type_Selection.DataValueField = "General_Document_Type_Id";
            dropdown_Document_Type_Selection.DataBind();
            dropdown_Document_Type_Selection.Items.Insert(0, new ListItem("-- Select -- ", ""));
        }

        internal static void Initialize_DropDown_Expense_Types(DropDownList dropdown_Expense_Type)
        {
            dropdown_Expense_Type.DataSource = Business_Logic_Layer_Facade.Instance.ExpenseTypes_Get_All();
            dropdown_Expense_Type.DataTextField = "Expense_Type_Name";
            dropdown_Expense_Type.DataValueField = "Expense_Type_Id";
            dropdown_Expense_Type.DataBind();
            dropdown_Expense_Type.Items.Insert(0, new ListItem("-- Select -- ", ""));
        }

        internal static void Initialize_DropDown_Invoice_Types(DropDownList dropdown_Invoice_Type)
        {
            dropdown_Invoice_Type.DataSource = Business_Logic_Layer_Facade.Instance.InvoiceTypes_Get_All();
            dropdown_Invoice_Type.DataTextField = "Invoice_Type_Name";
            dropdown_Invoice_Type.DataValueField = "Invoice_Type_Id";
            dropdown_Invoice_Type.DataBind();
            dropdown_Invoice_Type.Items.Insert(0, new ListItem("-- Select -- ", ""));
        }

        internal static void Initialize_DropDown_App_Permission_Types(DropDownList dropdown_App_Permission_Type)
        {
            dropdown_App_Permission_Type.DataSource = Business_Logic_Layer_Facade.Instance.App_Permission_Types_Get_All();
            dropdown_App_Permission_Type.DataTextField = "App_Permission_Type_Name";
            dropdown_App_Permission_Type.DataValueField = "App_Permission_Type_Id";
            dropdown_App_Permission_Type.DataBind();
            dropdown_App_Permission_Type.Items.Insert(0, new ListItem("-- Select -- ", ""));
        }

        internal static DateTime Get_DateTime_From_ComboBoxes(
            TextBox p_Date_TextBox,
            DropDownList p_Hours_ComboBox,
            DropDownList p_Minutes_ComboBox,
            DropDownList p_Seconds_ComboBox)
        {
            DateTime date_Parsed = new DateTime();
            try
            {
                date_Parsed = DateTime.ParseExact(p_Date_TextBox.Text, "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None);
            }
            catch { }

            short hours = 0;
            short minutes = 0;
            short seconds = 0;

            short.TryParse(p_Hours_ComboBox.SelectedValue, out hours);
            short.TryParse(p_Minutes_ComboBox.SelectedValue, out minutes);
            short.TryParse(p_Seconds_ComboBox.SelectedValue, out seconds);

            DateTime date_To_Return = new DateTime(date_Parsed.Year, date_Parsed.Month, date_Parsed.Day, hours, minutes, seconds);

            return date_To_Return;
        }
    }
}
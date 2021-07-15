using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI.WebControls;
using TimeLineDashboard.BusinessLogicLayer;
using WebformsPOCDemo.AppShared;

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

        private static readonly string k_Language_Cookie_Name = "UserLang";

        internal static void Initialize_DropDown_Countries(DropDownList dropdown_Country)
        {
            dropdown_Country.DataSource = Business_Logic_Layer_Facade.Instance.Countries_GetAll();
            dropdown_Country.DataTextField = "Country_English_Name";
            dropdown_Country.DataValueField = "Country_Id";
            dropdown_Country.DataBind();
            dropdown_Country.Items.Insert(0, new ListItem("-- Select Country -- ", ""));
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
            dropdown_Currency_Selection.Items.Insert(0, new ListItem("-- Select Currency -- ", ""));
        }

        internal static void Initialize_DropDown_Client_Types(DropDownList dropdown_Client_Type_Selection)
        {
            dropdown_Client_Type_Selection.DataSource = Business_Logic_Layer_Facade.Instance.ClientTypes_Get_All();
            dropdown_Client_Type_Selection.DataTextField = "Type_Name";
            dropdown_Client_Type_Selection.DataValueField = "Client_Type_Id";
            dropdown_Client_Type_Selection.DataBind();
            dropdown_Client_Type_Selection.Items.Insert(0, new ListItem("-- Select Type -- ", ""));
        }

        internal static void Initialize_DropDown_Supplier_Types(DropDownList dropdown_Supplier_Type_Selection)
        {
            dropdown_Supplier_Type_Selection.DataSource = Business_Logic_Layer_Facade.Instance.SupplierTypes_Get_All();
            dropdown_Supplier_Type_Selection.DataTextField = "Type_Name";
            dropdown_Supplier_Type_Selection.DataValueField = "Supplier_Type_Id";
            dropdown_Supplier_Type_Selection.DataBind();
            dropdown_Supplier_Type_Selection.Items.Insert(0, new ListItem("-- Select Type -- ", ""));
        }

        internal static void Initialize_DropDown_Document_Types(DropDownList dropdown_Document_Type_Selection)
        {
            dropdown_Document_Type_Selection.DataSource = Business_Logic_Layer_Facade.Instance.DocumentTypes_Get_All();
            dropdown_Document_Type_Selection.DataTextField = "Document_Type_Name";
            dropdown_Document_Type_Selection.DataValueField = "General_Document_Type_Id";
            dropdown_Document_Type_Selection.DataBind();
            dropdown_Document_Type_Selection.Items.Insert(0, new ListItem("-- Select Type -- ", ""));
        }

        internal static void Initialize_DropDown_Expense_Types(DropDownList dropdown_Expense_Type)
        {
            dropdown_Expense_Type.DataSource = Business_Logic_Layer_Facade.Instance.ExpenseTypes_Get_All();
            dropdown_Expense_Type.DataTextField = "Expense_Type_Name";
            dropdown_Expense_Type.DataValueField = "Expense_Type_Id";
            dropdown_Expense_Type.DataBind();
            dropdown_Expense_Type.Items.Insert(0, new ListItem("-- Select Type -- ", ""));
        }

        internal static void Initialize_DropDown_Invoice_Types(DropDownList dropdown_Invoice_Type)
        {
            dropdown_Invoice_Type.DataSource = Business_Logic_Layer_Facade.Instance.InvoiceTypes_Get_All();
            dropdown_Invoice_Type.DataTextField = "Invoice_Type_Name";
            dropdown_Invoice_Type.DataValueField = "Invoice_Type_Id";
            dropdown_Invoice_Type.DataBind();
            dropdown_Invoice_Type.Items.Insert(0, new ListItem("-- Select Type -- ", ""));
        }

        internal static void Initialize_DropDown_App_Permission_Types(DropDownList dropdown_App_Permission_Type)
        {
            dropdown_App_Permission_Type.DataSource = Business_Logic_Layer_Facade.Instance.App_Permission_Types_Get_All();
            dropdown_App_Permission_Type.DataTextField = "App_Permission_Type_Name";
            dropdown_App_Permission_Type.DataValueField = "App_Permission_Type_Id";
            dropdown_App_Permission_Type.DataBind();
            dropdown_App_Permission_Type.Items.Insert(0, new ListItem("-- Select Type -- ", ""));
        }

        internal static void Initialize_DropDown_Bank_Accounts(
            BasePage p_Requested_Page,
            DropDownList dropDown_Bank_Accounts)
        {
            var bank_Accounts = Business_Logic_Layer_Facade.Instance.BankAccounts_Get_Search(
                    p_Requested_Page.Authenticated_User_ID);

            dropDown_Bank_Accounts.DataSource = bank_Accounts;
            dropDown_Bank_Accounts.DataTextField = "Bank_Name";
            dropDown_Bank_Accounts.DataValueField = "Bank_Account_Id";
            dropDown_Bank_Accounts.DataBind();
            dropDown_Bank_Accounts.Items.Insert(0, new ListItem("-- Select Type -- ", ""));

            if (bank_Accounts.Count > 0  && bank_Accounts.Count < 2)
            {
                dropDown_Bank_Accounts.SelectedValue = bank_Accounts[0].Bank_Account_Id.ToString();
            }
        }

        internal static void Initialize_DropDown_Credit_Cards(
            BasePage p_Requested_Page,
            DropDownList dropDown_Credit_Cards)
        {
            dropDown_Credit_Cards.DataSource = Business_Logic_Layer_Facade.Instance.CreditCards_Get_Credit_Cards(
                p_Requested_Page.Authenticated_User_ID,
                p_Requested_Page.Authenticated_User_ID,
                p_Requested_Page.Authenticated_Permission_Type );

            dropDown_Credit_Cards.DataTextField = "Card_Name";
            dropDown_Credit_Cards.DataValueField = "Credit_Card_Id";
            dropDown_Credit_Cards.DataBind();
            dropDown_Credit_Cards.Items.Insert(0, new ListItem("-- Select Type -- ", ""));
        }

        internal static DateTime? Get_DateTime_From_ComboBoxes(
            TextBox p_Date_TextBox,
            DropDownList p_Hours_ComboBox,
            DropDownList p_Minutes_ComboBox,
            DropDownList p_Seconds_ComboBox)
        {
            DateTime? date_To_Return = new DateTime?();

            DateTime date_Parsed = new DateTime();
            bool parsed_Successfully = false;
            try
            {
                parsed_Successfully =  DateTime.TryParseExact(p_Date_TextBox.Text, "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out date_Parsed);
            }
            catch {
                parsed_Successfully = false;
            }

            short hours = 0;
            short minutes = 0;
            short seconds = 0;

            short.TryParse(p_Hours_ComboBox.SelectedValue, out hours);
            short.TryParse(p_Minutes_ComboBox.SelectedValue, out minutes);
            short.TryParse(p_Seconds_ComboBox.SelectedValue, out seconds);

            if (parsed_Successfully)
            {
                date_To_Return = new DateTime(date_Parsed.Year, date_Parsed.Month, date_Parsed.Day, hours, minutes, seconds);
            }

            return date_To_Return;
        }

        internal static void Set_DateTime_To_ComboBoxes_And_Label(
            DateTime? dateTimeToSet, 
            TextBox p_TextBox_Date,
            Label p_Label_Date,
            DropDownList p_Hours_ComboBox,
            DropDownList p_Minutes_ComboBox,
            DropDownList p_Seconds_ComboBox, 
            Label p_Label_Time)
        {
            if (dateTimeToSet.HasValue)
            { 
                p_TextBox_Date.Text = dateTimeToSet.Value.ToString("dd/MM/yyyy");
                p_Label_Date.Text = dateTimeToSet.Value.ToString("dd/MM/yyyy");
                p_Hours_ComboBox.SelectedValue = dateTimeToSet.Value.Hour.ToString("00");
                p_Minutes_ComboBox.SelectedValue = dateTimeToSet.Value.Minute.ToString("00");
                p_Seconds_ComboBox.SelectedValue = dateTimeToSet.Value.Second.ToString("00");
                p_Label_Time.Text = dateTimeToSet.Value.ToString("HH:mm:ss");
            }
        }

        internal static void Set_DateTime_To_ComboBoxes(
            DateTime? dateTimeToSet,
            TextBox p_TextBox_Date,
            DropDownList p_Hours_ComboBox,
            DropDownList p_Minutes_ComboBox,
            DropDownList p_Seconds_ComboBox)
        {
            if (dateTimeToSet.HasValue)
            {
                p_TextBox_Date.Text = dateTimeToSet.Value.ToString("dd/MM/yyyy");
                p_Hours_ComboBox.SelectedValue = dateTimeToSet.Value.Hour.ToString("00");
                p_Minutes_ComboBox.SelectedValue = dateTimeToSet.Value.Minute.ToString("00");
                p_Seconds_ComboBox.SelectedValue = dateTimeToSet.Value.Second.ToString("00");
            }
        }

        internal static void Set_DateTime_To_TextBox_And_Label(
            DateTime? dateTimeToSet,
            TextBox p_TextBox_Date,
            Label p_Label_Date)
        {
            if (dateTimeToSet.HasValue)
            {
                p_TextBox_Date.Text = dateTimeToSet.Value.ToString("dd/MM/yyyy");
                p_Label_Date.Text = dateTimeToSet.Value.ToString("dd/MM/yyyy");
            }
        }

        internal static void Set_DateTime_To_Label(
            DateTime? dateTimeToSet,
            Label p_Label_Date)
        {
            if (dateTimeToSet.HasValue)
            {
                p_Label_Date.Text = dateTimeToSet.Value.ToString("dd/MM/yyyy");
            }
        }

        internal static DateTime? Try_Parse_DateTime_By_Current_Culture(string input)
        {
            DateTime? returnValue = new DateTime?();

            DateTime date_Parsed = new DateTime();
            bool parsed_Successfully = false;
            try
            {
                parsed_Successfully = DateTime.TryParseExact(input, "dd/MM/yyyy", null, System.Globalization.DateTimeStyles.None, out date_Parsed);
            }
            catch
            {
                parsed_Successfully = false;
            }

            if (parsed_Successfully)
            {
                returnValue = date_Parsed;
            }

            return returnValue;
        }

        internal static void Set_ComboBox_Selected_Value_And_Label_Text(
            string value_To_Set_Selected, 
            DropDownList p_ComboBox_To_Set_Selected_Value,
            Label p_Label_To_Set_Selected_Text
            )
        {
            if (p_ComboBox_To_Set_Selected_Value.Items.Count > 0)
            {
                if (!string.IsNullOrEmpty(value_To_Set_Selected))
                {
                    ListItem item_To_Set_Selected = p_ComboBox_To_Set_Selected_Value.Items.FindByValue(value_To_Set_Selected);
                    if (item_To_Set_Selected != null)
                    {
                        p_ComboBox_To_Set_Selected_Value.SelectedValue = value_To_Set_Selected;
                        p_Label_To_Set_Selected_Text.Text = item_To_Set_Selected.Text;
                    }
                }
            }
        }

        internal static void Set_Number_Text_Value_To_TextBox(
            decimal? numeric_Value,
            TextBox p_TextBox_To_Set_Value)
        {
            if (numeric_Value.HasValue)
            {
                p_TextBox_To_Set_Value.Text = numeric_Value.Value.ToString("#,0.##");
            }
        }

        internal static void Set_Number_Text_Value_To_Label(
            decimal? numeric_Value,
            Label p_Label_To_Set_Value)
        {
            if (numeric_Value.HasValue)
            {
                p_Label_To_Set_Value.Text = numeric_Value.Value.ToString("#,0.##");
            }
        }

        internal static string Get_Number_Formatted(decimal? numeric_Value)
        {
            string l_Return_Value = string.Empty;

            if (numeric_Value.HasValue)
            {
                l_Return_Value = numeric_Value.Value.ToString("#,0.##");
            }

            return l_Return_Value;
        }

        internal static void Set_Number_Text_Value_To_TextBox_Label_Text(
            decimal? numeric_Value,
            TextBox p_TextBox_To_Set_Value,
            Label p_Label_To_Set_Value
            )
        {
            if (numeric_Value.HasValue)
            { 
                p_TextBox_To_Set_Value.Text = numeric_Value.Value.ToString("#,0.##");
                p_Label_To_Set_Value.Text = numeric_Value.Value.ToString("#,0.##");
            }
        }

        internal static void Set_Language_Cookie(string languageCode)
        {
            
            if ( HttpContext.Current.Request.Cookies.Get(k_Language_Cookie_Name) != null )
            {
                HttpContext.Current.Response.Cookies.Get(k_Language_Cookie_Name).Value = languageCode;
            }
            else
            {
                HttpContext.Current.Response.Cookies.Add(new HttpCookie(k_Language_Cookie_Name, languageCode));
            }
        }

        internal static void Change_Current_Thread_Culture_By_Language_Cookie()
        {
            if (HttpContext.Current.Request.Cookies.Get(k_Language_Cookie_Name) != null)
            {
                string user_Selected_Langauge = HttpContext.Current.Request.Cookies.Get(k_Language_Cookie_Name).Value;

                switch(user_Selected_Langauge.ToLower())
                {
                    case "en":
                        Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture("en-US");
                        Thread.CurrentThread.CurrentUICulture = new CultureInfo("en-US");
                        break;
                    case "he":
                        Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture("he-IL");
                        Thread.CurrentThread.CurrentUICulture = new CultureInfo("he-IL");
                        break;
                }
            }
        }



    }
}
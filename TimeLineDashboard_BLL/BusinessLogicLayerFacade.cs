using System;
using System.Collections.Generic;
using TimeLineDashboard.DAL;
using TimeLineDashboard.Shared.Models;
using System.Text;
using TimeLineDashboard_BLL;

namespace TimeLineDashboard.BusinessLogicLayer
{
    public class Business_Logic_Layer_Facade
    {
        /***************** -- SINGLETON -- START  ********************/
        private static readonly Business_Logic_Layer_Facade instance = new Business_Logic_Layer_Facade();
        // Explicit static constructor to tell C# compiler  
        // not to mark type as beforefieldinit  
        static Business_Logic_Layer_Facade()
        {
        }

        private Business_Logic_Layer_Facade()
        {
        }

        public static Business_Logic_Layer_Facade Instance
        {
            get
            {
                return instance;
            }
        }
        /***************** -- SINGLETON -- END  ********************/

        public List<Countries> Countries_GetAll()
        {
            // Todo: add caching here or on the data access layer

            return Data_Access_Layer_Facade.Instance.Countries_GetAll();
        }

        public Countries Countries_Get_By_Country_Id(short p_Country_Id)
        {
            // Todo: add caching here or on the data access layer
            return Data_Access_Layer_Facade.Instance.Countries_Get_By_Country_Id(p_Country_Id);
        }

        public List<Documents> Documents_Get_Search(string p_Search_Criteria, int p_User_Id)
        {
            throw new NotImplementedException();
        }

        public List<Document_Types> DocumentTypes_Get_All()
        {
            return Data_Access_Layer_Facade.Instance.DocumentTypes_Get_All();
        }

        public List<Invoices> Invoices_Get_Search(string text)
        {
            throw new NotImplementedException();
        }

        public List<States> States_GetAll()
        {
            // Todo: add caching here or on the data access layer
            return Data_Access_Layer_Facade.Instance.States_GetAll();
        }

        public List<Users> Users_Get_Administration_List(int p_User_Id_Authorized_Employee_Searching_Users)
        {
            return Data_Access_Layer_Facade.Instance.Users_Get_Administration_List(p_User_Id_Authorized_Employee_Searching_Users);
        }


        public Users Users_Get_Details_By_User_Id(int User_Id)
        {
            throw new NotImplementedException();
        }

        public Users Users_Update_User_Details(Users p_New_User_Details, int p_Updating_User_Id)
        {
            throw new NotImplementedException();
        }

        public Users Users_Insert_New_User_Administrative_Registration_Process(
            string p_Username, string p_Password, string p_First_Name, string p_Middle_Name,
            string p_Last_Name, string p_Email, short p_Country_Id, short? p_State_Id,
            string p_City, string p_Address, string p_ZipCode, string p_Mobile_Phone, string p_Additional_Phone_Number,
            DateTime p_BirthDate, byte p_Gender, string p_Heard_About_Application_From, string p_Our_Administrative_Side_Notes,
            int p_Logged_In_Administrative_User_Id)
        {
            Users new_Registered_User_To_Return = null;

            const byte k_Random_Salt_String_Length_For_Encryption_Process = 30;

            // ToDo: Validation of the parameters goes here (Length / Password strength / Required fields ect.. )
            string l_Encryption_Random_Salt = Cryptography_Processor.CreateSalt(k_Random_Salt_String_Length_For_Encryption_Process);
            string l_Encrypted_Password = Cryptography_Processor.GenerateHash(p_Password, l_Encryption_Random_Salt);

            new_Registered_User_To_Return = Data_Access_Layer_Facade.Instance.Users_Insert_New_User_Administrative_Registration_Process(
                p_Username, l_Encrypted_Password, l_Encryption_Random_Salt, p_First_Name, p_Middle_Name,
                p_Last_Name, p_Email, p_Country_Id, p_State_Id, p_City, p_Address, p_ZipCode, p_Mobile_Phone, p_Additional_Phone_Number,
                p_BirthDate, p_Gender, p_Heard_About_Application_From, p_Our_Administrative_Side_Notes,
                p_Logged_In_Administrative_User_Id);

            return new_Registered_User_To_Return;
        }

        public List<Currencies> Currencies_Get_List()
        {
            return Data_Access_Layer_Facade.Instance.Currencies_Get_All();
        }

        public List<Users> Users_Get_Search(string p_Search_Criteria)
        {
            return Data_Access_Layer_Facade.Instance.Users_Get_Search(p_Search_Criteria);
        }

        public bool Users_Delete_By_User_Id(int User_Id)
        {
            throw new NotImplementedException();
        }

        public List<States> States_GetStates_By_Country_Id(short Country_Id)
        {
            // Todo: add caching here or on the data access layer
            return Data_Access_Layer_Facade.Instance.States_Get_By_Country_Id(Country_Id);
        }

        public List<ClientType> ClientTypes_Get_All()
        {
            return Data_Access_Layer_Facade.Instance.ClientTypes_Get_All();
        }

        public List<Clients> Clients_Get_Search(string p_Search_Criteria, int p_User_Id)
        {
            return Data_Access_Layer_Facade.Instance.Clients_Get_Search(p_Search_Criteria, p_User_Id);
        }

        public Clients Clients_Insert_New_Client_Administrative_Registration_Process(
            int p_User_Id, string p_Company_Name, string p_Website_URL , short p_Country_Id,
            short? p_State_Id, string p_City, string p_Address, string p_ZipCode,
            string p_Telephone, string p_Mobile_Phone,
            short p_Client_Type_Id, string p_Client_Tax_Reference_Number, string p_Main_Contact_FullName,
            string p_Main_Contact_Email_Address, string p_Main_Contact_Phone_Number,
            DateTime? p_Client_From_Date, DateTime? p_Client_To_Date , DateTime? p_First_Contract_Date ,
            string p_First_Contract_Signed_With_Contact_Full_Name, string p_First_Contract_Signed_In_Location_Description,
            bool p_Is_Active, int p_Logged_In_Administrative_User_Id)
        {
            return Data_Access_Layer_Facade.Instance.Clients_Insert_New_Client_Administrative_Registration_Process(
                p_User_Id, p_Company_Name, p_Website_URL, p_Country_Id,
                p_State_Id, p_City, p_Address, p_ZipCode,
                p_Telephone, p_Mobile_Phone, p_Client_Type_Id,
                p_Client_Tax_Reference_Number, p_Main_Contact_FullName,
                p_Main_Contact_Email_Address, p_Main_Contact_Phone_Number,
                p_Client_From_Date, p_Client_To_Date, p_First_Contract_Date,
                p_First_Contract_Signed_With_Contact_Full_Name, p_First_Contract_Signed_In_Location_Description,
                p_Is_Active, p_Logged_In_Administrative_User_Id);
        }

        public List<ExpenseType> ExpenseTypes_Get_All()
        {
            return Data_Access_Layer_Facade.Instance.ExpenseTypes_Get_All();
        }

        public List<InvoiceType> InvoiceTypes_Get_All()
        {
            return Data_Access_Layer_Facade.Instance.InvoiceTypes_Get_All();
        }

        public Suppliers Suppliers_Insert_New_Supplier_Administrative_Registration_Process(
            int p_User_Id, string p_Company_Name, string p_Website_URL, short p_Country_Id, 
            short? p_State_Id, string p_City, string p_Address, string p_ZipCode, byte? p_Default_Currency,
            string p_Telephone, string p_Mobile_Phone, short p_Supplier_Type_Id, 
            string p_Supplier_Tax_Reference_Number, string p_Main_Contact_FullName, 
            string p_Main_Contact_Email_Address, string p_Main_Contact_Phone_Number, 
            DateTime? p_Supplier_From_Date, DateTime? p_Supplier_To_Date, DateTime? p_First_Contract_Date, 
            string p_First_Contract_Signed_With_Contact_Full_Name, string p_First_Contract_Signed_In_Location_Description, 
            bool p_Is_Active, int p_Logged_In_Administrative_User_Id)
        {
            return Data_Access_Layer_Facade.Instance.Suppliers_Insert_New_Client_Administrative_Registration_Process(
                p_User_Id, p_Company_Name, p_Website_URL, p_Country_Id,
                p_State_Id, p_City, p_Address, p_ZipCode, p_Default_Currency,
                p_Telephone, p_Mobile_Phone, p_Supplier_Type_Id,
                p_Supplier_Tax_Reference_Number, p_Main_Contact_FullName,
                p_Main_Contact_Email_Address, p_Main_Contact_Phone_Number,
                p_Supplier_From_Date, p_Supplier_To_Date, p_First_Contract_Date,
                p_First_Contract_Signed_With_Contact_Full_Name, p_First_Contract_Signed_In_Location_Description,
                p_Is_Active, p_Logged_In_Administrative_User_Id);
        }

        public Suppliers Suppliers_Get_By_Supplier_Id( int p_Supplier_Id, int p_User_Id_Searching_For_Supplier_Details)
        {
            return Data_Access_Layer_Facade.Instance.Suppliers_Get_By_Supplier_Id(p_Supplier_Id, p_User_Id_Searching_For_Supplier_Details);
        }

        public List<Suppliers> Suppliers_Get_Search(string p_Search_Criteria, int p_User_Id)
        {
            return Data_Access_Layer_Facade.Instance.Suppliers_Get_Search(p_Search_Criteria, p_User_Id);
        }

        public List<Suppliers> Suppliers_Get_All_By_User_Id(int p_User_Id, int p_Searching_User_Id)
        {
            return Data_Access_Layer_Facade.Instance.Suppliers_Get_All_By_User_Id(p_User_Id, p_Searching_User_Id);
        }

        public List<SupplierType> SupplierTypes_Get_All()
        {
            return Data_Access_Layer_Facade.Instance.SupplierTypes_Get_All();
        }

        public List<Expenses> Expenses_Get_Search(string text)
        {
            throw new NotImplementedException();
        }

        public Expenses Expenses_Get_Auto_Complete_Expense_Based_On_Supplier_And_DateTime_Selection(int p_Supplier_Id, DateTime p_Expense_Invoice_DateTime, int p_User_Id_LoggedIn_Creating_Expense)
        {
            Expenses expense_To_Return = new Expenses();

            if (p_Supplier_Id >0 && p_User_Id_LoggedIn_Creating_Expense > 0)
            {
                // try to get the latest supplier's expense to auto fillup the relevant details of the page
                // ToDo -- Add data range search for possinle users who wants to slowly update/upload information and they should pick the datetime first
                var latest_Expense = this.Expenses_Get_Expense_Latest_Entry_Based_On_Supplier_Id_Selection(p_Supplier_Id, p_User_Id_LoggedIn_Creating_Expense);
                if (latest_Expense != null)
                {
                    // A latest expense was found for the current supplier. Return the basic needed information from the latest expense
                    // If the expense has been created BEFORE the datetime the user has selected for the new expense then the last expense of the supplier can be used for the autocomplete 
                    if (latest_Expense.Expense_Invoice_DateTime < p_Expense_Invoice_DateTime)
                    {
                        expense_To_Return = latest_Expense;
                    }
                    else
                    {
                        // The expense the user is trying to create is older then the last expense for the current supplier 
                        // Try to find any expense that can suit the auto complete accoring to the selected datetime of the user
                        var lastest_Expense_By_DateTime = Expenses_Get_Expense_Latest_Entry_Based_On_Supplier_Id_And_Expense_DateTime_Selection(p_Supplier_Id, p_Expense_Invoice_DateTime, p_User_Id_LoggedIn_Creating_Expense);
                        if (lastest_Expense_By_DateTime.Expense_Record_Id > 0)
                        {
                            expense_To_Return = lastest_Expense_By_DateTime;
                        }
                        else
                        {
                            expense_To_Return = latest_Expense;
                        }
                    }
                }
                else
                {
                    // no latest expense was found in the database. Set the auto complete expense to basic supplier's details
                    // Get the supplier details from the database 
                    var supplier_Details = this.Suppliers_Get_By_Supplier_Id(p_Supplier_Id, p_User_Id_LoggedIn_Creating_Expense);
                    if (supplier_Details!= null)
                    {
                        //expense_To_Return.
                        expense_To_Return.Invoice_Supplier_Company_Details = supplier_Details.Company_Name;
                        expense_To_Return.Invoice_Supplier_Tax_Reference = supplier_Details.Supplier_Tax_Reference_Number;
                        expense_To_Return.Invoice_Supplier_Country_Id = supplier_Details.Country_Id;
                        expense_To_Return.Invoice_Supplier_State_Id = supplier_Details.State_Id;
                        expense_To_Return.Invoice_Supplier_City = supplier_Details.City;
                        expense_To_Return.Invoice_Supplier_Address_Description = supplier_Details.Address;
                        expense_To_Return.Invoice_Supplier_ZipCode = supplier_Details.ZipCode;
                        expense_To_Return.Invoice_Supplier_WebAddress = supplier_Details.Website_URL;
                        expense_To_Return.Invoice_Supplier_Phone_Number = supplier_Details.Main_Contact_Phone_Number;
                        expense_To_Return.Invoice_Supplier_Contact_FullName = supplier_Details.Main_Contact_FullName;

                        if (supplier_Details.Default_Currency_Id.HasValue)
                        {
                            expense_To_Return.Currency_Id = supplier_Details.Default_Currency_Id.Value;
                        }

                        if (supplier_Details.Country_Id > 0)
                        {
                            //var latest_Vat_History_Of_Country = Data_Access_Layer_Facade.Countries_Vat_History_Get_By_Country
                            var latest_Vat_History_Of_Country = Data_Access_Layer_Facade.Instance.Countries_Vat_History_Get_By_Country_And_Date(supplier_Details.Country_Id, p_Expense_Invoice_DateTime);
                            expense_To_Return.Vat_Percentage = latest_Vat_History_Of_Country.Vat_Percentage;
                        }
                    }
                }
            }

            return expense_To_Return;
        }

        public Expenses Expenses_Get_Expense_Latest_Entry_Based_On_Supplier_Id_Selection(int p_Supplier_Id, int p_User_Id_LoggedIn_Creating_Expense)
        {
            return Data_Access_Layer_Facade.Instance.Expenses_Get_Expense_Latest_Entry_Based_On_Supplier_Id_Selection(p_Supplier_Id, p_User_Id_LoggedIn_Creating_Expense);
        }

        public Expenses Expenses_Get_Expense_Latest_Entry_Based_On_Supplier_Id_And_Expense_DateTime_Selection(int p_Supplier_Id , DateTime p_Expense_DateTime, int p_User_Id_LoggedIn_Creating_Expense)
        {
            return Data_Access_Layer_Facade.Instance.Expenses_Get_Expense_Latest_Entry_Based_On_Supplier_Id_And_Expense_DateTime_Selection(
                p_Supplier_Id,
                p_Expense_DateTime,
                p_User_Id_LoggedIn_Creating_Expense);
        }
    }
}

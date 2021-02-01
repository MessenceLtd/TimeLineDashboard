using System;
using System.Collections.Generic;
using TimeLineDashboard.Shared.Models;
using TimeLineDashboard.DAL.Operations;
using System.Data;

namespace TimeLineDashboard.DAL
{
    public class Data_Access_Layer_Facade
    {
        #region Singleton
        private static readonly Data_Access_Layer_Facade instance = new Data_Access_Layer_Facade();
        // Explicit static constructor to tell C# compiler  
        // not to mark type as beforefieldinit  
        static Data_Access_Layer_Facade()
        {
        }
        private Data_Access_Layer_Facade()
        {
        }
        public static Data_Access_Layer_Facade Instance
        {
            get
            {
                return instance;
            }
        }
        #endregion

        public List<Countries> Countries_GetAll()
        {
            return Countries_Operations.Instance.GetAll();
        }

        public Countries Countries_Get_By_Country_Id(short p_Country_Id)
        {
            return Countries_Operations.Instance.Get_By_Country_Id(p_Country_Id);
        }

        public List<States> States_GetAll()
        {
            return States_Operations.Instance.Get_All();
        }

        public List<States> States_Get_By_Country_Id(short Country_Id)
        {
            return States_Operations.Instance.Get_By_Country_Id(Country_Id);
        }

        public List<Users> Users_Get_Search(string search_Criteria)
        {
            return Users_Operations.Instance.Get_Users_Search(search_Criteria);
        }

        public Users Users_Insert_New_User_Administrative_Registration_Process(
            string p_Username, 
            string p_Encrypted_Password, 
            string p_Encryption_Random_Salt, 
            string p_First_Name, 
            string p_Middle_Name, 
            string p_Last_Name, 
            string p_Email, 
            short  p_Country_Id, 
            short? p_State_Id, 
            string p_City, 
            string p_Address, 
            string p_ZipCode, 
            string p_Mobile_Phone, 
            string p_Additional_Phone_Number,
            DateTime p_BirthDate, 
            byte p_Gender, 
            string p_Heard_About_Application_From, 
            string p_Our_Administrative_Side_Notes,
            int p_Logged_In_Administrative_User_Id)
        {
            return Users_Operations.Instance.Insert_New_User_Administrative_Registration_Process(
                p_Username, 
                p_Encrypted_Password,
                p_Encryption_Random_Salt,
                p_First_Name,
                p_Middle_Name,
                p_Last_Name,
                p_Email,
                p_Country_Id,
                p_State_Id,
                p_City,
                p_Address,
                p_ZipCode,
                p_Mobile_Phone,
                p_Additional_Phone_Number,
                p_BirthDate,
                p_Gender,
                p_Heard_About_Application_From,
                p_Our_Administrative_Side_Notes,
                p_Logged_In_Administrative_User_Id);
        }

        public List<Document_Types> DocumentTypes_Get_All()
        {
            return Document_Types_Operations.Instance.Get_Document_Types();
        }

        public List<Users> Users_Get_Administration_List(int p_User_Id_Authorized_Employee_Searching_Users)
        {
            return Users_Operations.Instance.Get_Users_Administration_List(p_User_Id_Authorized_Employee_Searching_Users);
        }

        public List<Clients> Clients_Get_Search(string p_Search_Criteria, int p_User_Id)
        {
            return Clients_Operations.Instance.Get_Search(p_Search_Criteria, p_User_Id);
        }

        public List<ClientType> ClientTypes_Get_All()
        {
            return ClientTypes_Operations.Instance.Get_Client_Types();
        }

        public Clients Clients_Insert_New_Client_Administrative_Registration_Process(
            int p_User_Id, string p_Company_Name, string p_Website_URL, short p_Country_Id,
            short? p_State_Id, string p_City, string p_Address, string p_ZipCode,
            string p_Telephone, string p_Mobile_Phone,
            short p_Client_Type_Id, string p_Client_Tax_Reference_Number, string p_Main_Contact_FullName,
            string p_Main_Contact_Email_Address, string p_Main_Contact_Phone_Number,
            DateTime? p_Client_From_Date, DateTime? p_Client_To_Date, DateTime? p_First_Contract_Date,
            string p_First_Contract_Signed_With_Contact_Full_Name, string p_First_Contract_Signed_In_Location_Description,
            bool p_Is_Active, int p_Logged_In_Administrative_User_Id)
        {
            return Clients_Operations.Instance.Insert_New_Client_Administrative_Registration_Process(
                p_User_Id, p_Company_Name, p_Website_URL, p_Country_Id,
                p_State_Id, p_City, p_Address, p_ZipCode,
                p_Telephone, p_Mobile_Phone, p_Client_Type_Id,
                p_Client_Tax_Reference_Number, p_Main_Contact_FullName,
                p_Main_Contact_Email_Address, p_Main_Contact_Phone_Number,
                p_Client_From_Date, p_Client_To_Date, p_First_Contract_Date,
                p_First_Contract_Signed_With_Contact_Full_Name, p_First_Contract_Signed_In_Location_Description,
                p_Is_Active, p_Logged_In_Administrative_User_Id
                );
        }

        public List<Currencies> Currencies_Get_All()
        {
            return Currencies_Operations.Instance.Get_Currecies();
        }

        public Suppliers Suppliers_Insert_New_Client_Administrative_Registration_Process(
            int p_User_Id, string p_Company_Name, string p_Website_URL, short p_Country_Id, 
            short? p_State_Id, string p_City, string p_Address, string p_ZipCode, byte? p_Default_Currency_Id, 
            string p_Telephone, string p_Mobile_Phone, short p_Supplier_Type_Id, string p_Supplier_Tax_Reference_Number, 
            string p_Main_Contact_FullName, string p_Main_Contact_Email_Address, string p_Main_Contact_Phone_Number, 
            DateTime? p_Supplier_From_Date, DateTime? p_Supplier_To_Date, DateTime? p_First_Contract_Date, 
            string p_First_Contract_Signed_With_Contact_Full_Name, string p_First_Contract_Signed_In_Location_Description, 
            bool p_Is_Active, int p_Logged_In_Administrative_User_Id)
        {
            return Suppliers_Operations.Instance.Insert_New_Supplier_Administrative_Registration_Process(
                p_User_Id, p_Company_Name, p_Website_URL, p_Country_Id,
                p_State_Id, p_City, p_Address, p_ZipCode, p_Default_Currency_Id,
                p_Telephone, p_Mobile_Phone, p_Supplier_Type_Id,
                p_Supplier_Tax_Reference_Number, p_Main_Contact_FullName,
                p_Main_Contact_Email_Address, p_Main_Contact_Phone_Number,
                p_Supplier_From_Date, p_Supplier_To_Date, p_First_Contract_Date,
                p_First_Contract_Signed_With_Contact_Full_Name, p_First_Contract_Signed_In_Location_Description,
                p_Is_Active, p_Logged_In_Administrative_User_Id
                );
        }

        public List<ExpenseType> ExpenseTypes_Get_All()
        {
            return ExpenseTypes_Operations.Instance.Get_Expense_Types();
        }

        public List<InvoiceType> InvoiceTypes_Get_All()
        {
            return InvoiceTypes_Operations.Instance.Get_Invoice_Types();
        }

        public List<Suppliers> Suppliers_Get_Search(string p_Search_Criteria, int p_User_Id)
        {
            return Suppliers_Operations.Instance.Get_Search(p_Search_Criteria, p_User_Id);
        }

        public List<SupplierType> SupplierTypes_Get_All()
        {
            return SupplierTypes_Operations.Instance.Get_Supplier_Types();
        }

        public List<Suppliers> Suppliers_Get_All_By_User_Id(int p_User_Id, int p_Searching_User_Id)
        {
            return Suppliers_Operations.Instance.Get_All_By_User_Id(p_User_Id, p_Searching_User_Id);
        }

        public Expenses Expenses_Get_Expense_Latest_Entry_Based_On_Supplier_Id_Selection(int p_Supplier_Id, int p_User_Id_LoggedIn_Creating_Expense)
        {
            return Expenses_Operations.Instance.Get_Latest_Expense_By_Supplier_Id(p_Supplier_Id, p_User_Id_LoggedIn_Creating_Expense);
        }

        public Expenses Expenses_Get_Expense_Latest_Entry_Based_On_Supplier_Id_And_Expense_DateTime_Selection(
            int p_Supplier_Id,
            DateTime p_Expense_DateTime,
            int p_User_Id_LoggedIn_Creating_Expense)
        {
            return Expenses_Operations.Instance.Expenses_Get_Expense_Latest_Entry_Based_On_Supplier_Id_And_Expense_DateTime_Selection(
                p_Supplier_Id,
                p_Expense_DateTime,
                p_User_Id_LoggedIn_Creating_Expense);
        }

        public Suppliers Suppliers_Get_By_Supplier_Id(int p_Supplier_Id, int p_User_Id_Searching_For_Supplier_Details)
        {
            return Suppliers_Operations.Instance.Get_Supplier_Details_By_Supplier_Id(p_Supplier_Id, p_User_Id_Searching_For_Supplier_Details);
        }

        public List<Countries_Vat_History> Countries_Vat_History_Get_All()
        {
            return Countries_Vat_History_Operations.Instance.GetAll();
        }

        public List<Countries_Vat_History> Countries_Vat_History_Get_By_Country(short p_Country_Id)
        {
            return Countries_Vat_History_Operations.Instance.Get_All_By_Country(p_Country_Id);
        }

        public Countries_Vat_History Countries_Vat_History_Get_By_Country_And_Date(short p_Country_Id, DateTime p_Approximate_DateTime_For_Searches)
        {
            return Countries_Vat_History_Operations.Instance.Get_Latest_Vat_History_By_Country_And_Date(p_Country_Id, p_Approximate_DateTime_For_Searches);
        }
    }
}

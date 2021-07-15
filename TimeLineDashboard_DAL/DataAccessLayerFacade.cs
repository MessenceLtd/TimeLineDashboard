using System;
using System.Collections.Generic;
using TimeLineDashboard.Shared.Models;
using TimeLineDashboard.DAL.Operations;
using System.Data;
using TimeLineDashboard.Shared.Responses;

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
            byte p_App_Permission_Type_Id,
            string p_First_Name,
            string p_Middle_Name,
            string p_Last_Name,
            string p_Email,
            short p_Country_Id,
            short? p_State_Id,
            string p_City,
            string p_Address,
            string p_ZipCode,
            byte? p_Default_Currency_Id,
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
                p_App_Permission_Type_Id,
                p_First_Name,
                p_Middle_Name,
                p_Last_Name,
                p_Email,
                p_Country_Id,
                p_State_Id,
                p_City,
                p_Address,
                p_ZipCode,
                p_Default_Currency_Id,
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

        public List<Clients> Clients_Get_Search(
            int p_User_Id,
            short? p_Filter_By_Type,
            short? p_Filter_By_Country,
            short? p_Filter_By_State,
            string p_Filter_By_City_Or_Address_Or_ZipCode,
            string p_Filter_By_CompanyName_Or_Person_Fullname)
        {
            return Clients_Operations.Instance.Get_Search(
                p_User_Id,
                p_Filter_By_Type,
                p_Filter_By_Country,
                p_Filter_By_State,
                p_Filter_By_City_Or_Address_Or_ZipCode,
                p_Filter_By_CompanyName_Or_Person_Fullname);
        }

        public Users Users_Get_Details_By_User_Id(int p_User_Id, int p_Authenticated_User_Id)
        {
            return Users_Operations.Instance.Get_User_Details_By_User_Id(p_User_Id, p_Authenticated_User_Id);
        }

        public List<Clients> Clients_Get_All_By_User_Id(int p_User_Id_To_Return_Clients, int p_Authenticated_User_ID)
        {
            return Clients_Operations.Instance.Get_All_By_User_Id(p_User_Id_To_Return_Clients, p_Authenticated_User_ID);
        }

        public List<ClientType> ClientTypes_Get_All()
        {
            return ClientTypes_Operations.Instance.Get_Client_Types();
        }

        public Clients Clients_Insert_New_Client_Administrative_Registration_Process(
            int p_User_Id, string p_Company_Name, string p_Website_URL, short p_Country_Id,
            short? p_State_Id, string p_City, string p_Address, string p_ZipCode,
            byte? p_Default_Currency, decimal? p_Default_Vat_Percentage,
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
                p_Default_Currency, p_Default_Vat_Percentage,
                p_Telephone, p_Mobile_Phone, p_Client_Type_Id,
                p_Client_Tax_Reference_Number, p_Main_Contact_FullName,
                p_Main_Contact_Email_Address, p_Main_Contact_Phone_Number,
                p_Client_From_Date, p_Client_To_Date, p_First_Contract_Date,
                p_First_Contract_Signed_With_Contact_Full_Name, p_First_Contract_Signed_In_Location_Description,
                p_Is_Active, p_Logged_In_Administrative_User_Id
                );
        }

        public General_Documents GeneralDocuments_Get_By_Id(int p_General_Document_Record_Id, int p_User_Id_Document_Owner)
        {
            return General_Documents_Operations.Instance.Get_Document_Details_By_Record_Id(p_General_Document_Record_Id, p_User_Id_Document_Owner, p_User_Id_Document_Owner);
        }

        public Invoices Invoices_Get_By_Id(int invoice_Record_Id, int user_Id_Invoice_Owner)
        {
            return Invoices_Operations.Instance.Get_Invoice_Details_By_Invoice_Id(invoice_Record_Id, user_Id_Invoice_Owner, user_Id_Invoice_Owner);
        }

        public Currencies Currencies_Get_By_Code(string p_Currency_Code)
        {
            return Currencies_Operations.Instance.Get_By_Code(p_Currency_Code);
        }

        public Currencies Currencies_Get_By_Id(byte p_Currency_Id)
        {
            return Currencies_Operations.Instance.Get_By_Id(p_Currency_Id);
        }

        public SupplierType SupplierTypes_Get_By_Id(short p_Supplier_Type_Id)
        {
            return SupplierTypes_Operations.Instance.Get_By_Id(p_Supplier_Type_Id);
        }

        public ClientType ClientTypes_Get_By_Id(short p_Client_Type_Id)
        {
            return ClientTypes_Operations.Instance.Get_By_Id(p_Client_Type_Id);
        }

        public States States_Get_By_State_Id(short p_State_Id)
        {
            return States_Operations.Instance.Get_By_State_Id(p_State_Id);
        }

        public Users Users_Get_User_Details_By_Username_For_Authentication(string p_Username_For_Authentication)
        {
            return Users_Operations.Instance.Get_User_Details_By_Username_For_Authentication(p_Username_For_Authentication);
        }

        public bool Users_Are_There_Any_Users_In_Database()
        {
            return Users_Operations.Instance.Are_There_Any_Users_In_Database();
        }

        public List<Currencies> Currencies_Get_All()
        {
            return Currencies_Operations.Instance.Get_Currecies();
        }

        public Suppliers Suppliers_Insert_New_Client_Administrative_Registration_Process(
            int p_User_Id, string p_Company_Name, string p_Website_URL, short p_Country_Id,
            short? p_State_Id, string p_City, string p_Address, string p_ZipCode, byte? p_Default_Currency_Id, decimal? p_Default_Vat_Percentage,
            string p_Telephone, string p_Mobile_Phone, short p_Supplier_Type_Id, string p_Supplier_Tax_Reference_Number,
            string p_Main_Contact_FullName, string p_Main_Contact_Email_Address, string p_Main_Contact_Phone_Number,
            DateTime? p_Supplier_From_Date, DateTime? p_Supplier_To_Date, DateTime? p_First_Contract_Date,
            string p_First_Contract_Signed_With_Contact_Full_Name, string p_First_Contract_Signed_In_Location_Description,
            bool p_Is_Active, int p_Logged_In_Administrative_User_Id)
        {
            return Suppliers_Operations.Instance.Insert_New_Supplier_Administrative_Registration_Process(
                p_User_Id, p_Company_Name, p_Website_URL, p_Country_Id,
                p_State_Id, p_City, p_Address, p_ZipCode, p_Default_Currency_Id, p_Default_Vat_Percentage,
                p_Telephone, p_Mobile_Phone, p_Supplier_Type_Id,
                p_Supplier_Tax_Reference_Number, p_Main_Contact_FullName,
                p_Main_Contact_Email_Address, p_Main_Contact_Phone_Number,
                p_Supplier_From_Date, p_Supplier_To_Date, p_First_Contract_Date,
                p_First_Contract_Signed_With_Contact_Full_Name, p_First_Contract_Signed_In_Location_Description,
                p_Is_Active, p_Logged_In_Administrative_User_Id
                );
        }

        public bool Clients_Update_Client_Details(
            int p_Client_Id, string p_Company_Name, string p_Website_URL, short p_Country_Id,
            short? p_State_Id, string p_City, string p_Address, string p_ZipCode,
            byte? p_Default_Currency, decimal? p_Default_Vat_Percentage,
            string p_Telephone, string p_Mobile_Phone,
            short p_Client_Type_Id, string p_Client_Tax_Reference_Number, string p_Main_Contact_FullName,
            string p_Main_Contact_Email_Address, string p_Main_Contact_Phone_Number,
            DateTime? p_Client_From_Date, DateTime? p_Client_To_Date, DateTime? p_First_Contract_Date,
            string p_First_Contract_Signed_With_Contact_Full_Name, string p_First_Contract_Signed_In_Location_Description,
            bool p_Is_Active, int p_Authenticated_User_ID)
        {
            bool updated_Successfully = false;

            updated_Successfully = Clients_Operations.Instance.Update_Client_Details(
                p_Client_Id, p_Company_Name, p_Website_URL, p_Country_Id,
                p_State_Id, p_City, p_Address, p_ZipCode,
                p_Default_Currency, p_Default_Vat_Percentage,
                p_Telephone, p_Mobile_Phone, p_Client_Type_Id,
                p_Client_Tax_Reference_Number, p_Main_Contact_FullName,
                p_Main_Contact_Email_Address, p_Main_Contact_Phone_Number,
                p_Client_From_Date, p_Client_To_Date, p_First_Contract_Date,
                p_First_Contract_Signed_With_Contact_Full_Name, p_First_Contract_Signed_In_Location_Description,
                p_Is_Active, p_Authenticated_User_ID
            );

            return updated_Successfully;
        }

        public App_Permission_Type App_Permission_Types_Get_By_Permission_Type_Code(string p_Permission_Type_Code)
        {
            return App_Permission_Type_Operations.Instance.Get_App_Permission_Type_By_Permission_Type_Code(p_Permission_Type_Code);
        }

        public List<App_Permission_Type> App_Permission_Types_Get_All()
        {
            return App_Permission_Type_Operations.Instance.Get_App_Permission_Types();
        }

        public App_Permission_Type App_Permission_Types_Get_By_Type_Id(byte p_Permission_Type_Id)
        {
            return App_Permission_Type_Operations.Instance.Get_App_Permission_Type_By_Type_Id(p_Permission_Type_Id);
        }

        public List<ExpenseType> ExpenseTypes_Get_All()
        {
            return ExpenseTypes_Operations.Instance.Get_Expense_Types();
        }

        public List<InvoiceType> InvoiceTypes_Get_All()
        {
            return InvoiceTypes_Operations.Instance.Get_Invoice_Types();
        }

        public InvoiceType InvoiceTypes_Get_By_Id(byte p_Invoice_Type_Id)
        {
            return InvoiceTypes_Operations.Instance.Get_By_Id(p_Invoice_Type_Id);
        }

        public Clients Clients_Get_By_Id(int p_Client_Id, int p_User_Id_Client_Owner)
        {
            return Clients_Operations.Instance.Get_Client_Details_By_Client_Id(p_Client_Id, p_User_Id_Client_Owner);
        }

        public List<Suppliers> Suppliers_Get_Search(
            int p_User_Id,
            short? p_Filter_By_Type,
            short? p_Filter_By_Country,
            short? p_Filter_By_State,
            string p_Filter_By_City_Or_Address_Or_ZipCode,
            string p_Filter_By_CompanyName_Or_Person_Fullname)
        {
            return Suppliers_Operations.Instance.Get_Search(
                p_User_Id,
                p_Filter_By_Type,
                p_Filter_By_Country,
                p_Filter_By_State,
                p_Filter_By_City_Or_Address_Or_ZipCode,
                p_Filter_By_CompanyName_Or_Person_Fullname);
        }

        public bool Users_Update_User_Details(
            int p_User_Id, string p_Username, string p_First_Name, string p_Middle_Name,
            string p_Last_Name, string p_Email, short p_Country_Id, short? p_State_Id,
            string p_City, string p_Address, string p_ZipCode, byte? p_Default_Currency_Id, string p_Mobile_Phone,
            string p_Additional_Phone_Number, DateTime? p_Birth_Date, byte? p_Gender,
            DateTime? p_Registration_Date, string p_Azure_Container_Ref,
            string p_Heard_About_Application_From, string p_Our_Administrative_Side_Notes,
            bool p_Is_Active, int p_Authenticated_User_ID)
        {
            return Users_Operations.Instance.Update_User_Details(
                p_User_Id, p_Username, p_First_Name, p_Middle_Name,
                p_Last_Name, p_Email, p_Country_Id, p_State_Id,
                p_City, p_Address, p_ZipCode, p_Default_Currency_Id, p_Mobile_Phone,
                p_Additional_Phone_Number, p_Birth_Date, p_Gender,
                p_Registration_Date, p_Azure_Container_Ref,
                p_Heard_About_Application_From, p_Our_Administrative_Side_Notes,
                p_Is_Active, p_Authenticated_User_ID);
        }

        public List<SupplierType> SupplierTypes_Get_All()
        {
            return SupplierTypes_Operations.Instance.Get_Supplier_Types();
        }

        public List<Suppliers> Suppliers_Get_All_By_User_Id(int p_User_Id, int p_Searching_User_Id)
        {
            return Suppliers_Operations.Instance.Get_All_By_User_Id(p_User_Id, p_Searching_User_Id);
        }

        public List<Expenses> Expenses_Get_Search(
            int p_User_Id,
            short? p_Filter_By_Type,
            short? p_Filter_By_Country,
            short? p_Filter_By_State,
            string p_Filter_By_City_Or_Address_Or_ZipCode,
            string p_Filter_By_CompanyName_Or_Person_Fullname)
        {
            return Expenses_Operations.Instance.Get_Search(
                p_User_Id,
                p_Filter_By_Type,
                p_Filter_By_Country,
                p_Filter_By_State,
                p_Filter_By_City_Or_Address_Or_ZipCode,
                p_Filter_By_CompanyName_Or_Person_Fullname);
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

        public Expenses Expenses_Insert_New_Expense(
            int p_User_Id, int p_Supplier_Id, DateTime? p_Expense_Invoice_DateTime,
            byte p_Currency_Id, decimal p_Total_Amount, decimal p_Vat_Percentage,
            decimal p_Total_Without_Vat, decimal p_Total_Vat,
            int? p_Invoiced_Client_On_User_Location_Id,
            string p_Invoiced_Client_To_CompanyName, string p_Invoiced_Client_To_Tax_Reference,
            string p_Invoiced_Client_To_PersonName, string p_Invoiced_Client_To_PhoneNumber,
            short? p_Invoiced_Client_To_Country_Id, short? p_Invoiced_Client_To_State_Id, string p_Invoiced_Client_To_City,
            string p_Invoiced_Client_To_Address, string p_Invoiced_Client_To_Zip, string p_Invoiced_Client_To_EmailAddress,
            byte p_Expense_Type_Id,
            string p_Invoice_Number, string p_Invoice_Reference_Number,
            string p_Invoice_Supplier_Company_Details, string p_Invoice_Supplier_Tax_Reference, short? p_Invoice_Supplier_Country_Id,
            short? p_Invoice_Supplier_State_Id, string p_Invoice_Supplier_City, string p_Invoice_Supplier_Address_Description,
            string p_Invoice_Supplier_ZipCode, string p_Invoice_Supplier_WebAddress, string p_Invoice_Supplier_Phone_Number,
            string p_Invoice_Supplier_Contact_FullName,
            string p_Invoice_Content_Long_Description,
            string p_User_Description,
            string p_User_Comments,
            string p_Original_File_Name, string p_Azure_Block_Blob_Reference,
            bool p_Is_Visible_To_Anonymous_Users, bool p_Is_Available_For_Download_For_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users, bool p_Is_Available_For_Download_For_Followers_Users,
            int p_Record_Created_By_User_Id,
            bool p_Is_Active
            )
        {
            return Expenses_Operations.Instance.Insert_New_Expense_Administrative_Registration_Process(
                p_User_Id, p_Supplier_Id, p_Expense_Invoice_DateTime, p_Currency_Id, p_Total_Amount, p_Vat_Percentage,
                p_Total_Without_Vat, p_Total_Vat, p_Invoiced_Client_On_User_Location_Id, p_Invoiced_Client_To_CompanyName,
                p_Invoiced_Client_To_Tax_Reference, p_Invoiced_Client_To_PersonName, p_Invoiced_Client_To_PhoneNumber, p_Invoiced_Client_To_Country_Id,
                p_Invoiced_Client_To_State_Id, p_Invoiced_Client_To_City, p_Invoiced_Client_To_Address, p_Invoiced_Client_To_Zip,
                p_Invoiced_Client_To_EmailAddress, p_Expense_Type_Id, p_Invoice_Number, p_Invoice_Reference_Number,
                p_Invoice_Supplier_Company_Details, p_Invoice_Supplier_Tax_Reference, p_Invoice_Supplier_Country_Id,
                p_Invoice_Supplier_State_Id, p_Invoice_Supplier_City, p_Invoice_Supplier_Address_Description,
                p_Invoice_Supplier_ZipCode, p_Invoice_Supplier_WebAddress, p_Invoice_Supplier_Phone_Number,
                p_Invoice_Supplier_Contact_FullName, p_Invoice_Content_Long_Description, p_User_Description,
                p_User_Comments, p_Original_File_Name, p_Azure_Block_Blob_Reference,
                p_Is_Visible_To_Anonymous_Users, p_Is_Available_For_Download_For_Anonymous_Users,
                p_Is_Visible_To_Followers_Users, p_Is_Available_For_Download_For_Followers_Users,
                p_Record_Created_By_User_Id,
                p_Is_Active
                );
        }

        public bool Suppliers_Update_Supplier_Details(
            int p_Supplier_Id, string p_Company_Name, string p_Website_URL,
            short p_Country_Id, short? p_State_Id, string p_City, string p_Address, string p_ZipCode,
            byte? p_Default_Currency_Id, decimal? p_Default_Vat_Percentage, string p_Telephone, string p_Mobile_Phone,
            short p_Supplier_Type_Id, string p_Supplier_Tax_Reference_Number, string p_Main_Contact_FullName,
            string p_Main_Contact_Email_Address, string p_Main_Contact_Phone_Number,
            DateTime? p_Supplier_From_Date, DateTime? p_Supplier_To_Date, DateTime? p_First_Contract_Date,
            string p_First_Contract_Signed_With_Contact_Full_Name, string p_First_Contract_Signed_In_Location_Description,
            bool p_Is_Active, int p_Updating_User_Id)
        {
            return Suppliers_Operations.Instance.Update_Supplier_Details(
                p_Supplier_Id, p_Company_Name, p_Website_URL, p_Country_Id,
                p_State_Id, p_City, p_Address, p_ZipCode, p_Default_Currency_Id, p_Default_Vat_Percentage,
                p_Telephone, p_Mobile_Phone, p_Supplier_Type_Id,
                p_Supplier_Tax_Reference_Number, p_Main_Contact_FullName,
                p_Main_Contact_Email_Address, p_Main_Contact_Phone_Number,
                p_Supplier_From_Date, p_Supplier_To_Date, p_First_Contract_Date,
                p_First_Contract_Signed_With_Contact_Full_Name, p_First_Contract_Signed_In_Location_Description,
                p_Is_Active, p_Updating_User_Id);
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

        public List<Invoices> Invoices_Get_Search(
            int p_User_Id,
            short? p_Filter_By_Type,
            short? p_Filter_By_Country,
            short? p_Filter_By_State,
            string p_Filter_By_City_Or_Address_Or_ZipCode,
            string p_Filter_By_CompanyName_Or_Person_Fullname)
        {
            return Invoices_Operations.Instance.Get_Search(
                p_User_Id,
                p_Filter_By_Type,
                p_Filter_By_Country,
                p_Filter_By_State,
                p_Filter_By_City_Or_Address_Or_ZipCode,
                p_Filter_By_CompanyName_Or_Person_Fullname);
        }

        public Invoices Invoices_Insert_New_Invoice_Details(
            int p_User_Id, int p_Client_Id, DateTime? p_Invoice_DateTime,
            byte p_Currency_Id, decimal p_Total_Amount, decimal p_Vat_Percentage,
            decimal p_Total_Without_Vat, decimal p_Total_Vat,
            DateTime? p_Creation_DateTime,
            int? p_Invoiced_Client_On_User_Location_Id,
            string p_Invoiced_Client_To_CompanyName, string p_Invoiced_Client_To_Tax_Reference,
            string p_Invoiced_Client_To_PersonName, string p_Invoiced_Client_To_PhoneNumber,
            short? p_Invoiced_Client_To_Country_Id, short? p_Invoiced_Client_To_State_Id, string p_Invoiced_Client_To_City,
            string p_Invoiced_Client_To_Address, string p_Invoiced_Client_To_Zip, string p_Invoiced_Client_To_EmailAddress,
            byte p_Invoice_Type_Id, string p_Invoice_Number, string p_Invoice_Reference_Number,
            string p_Invoice_Content_Long_Description, string p_User_Description,
            string p_User_Comments, string p_Original_File_Name, string p_Azure_Block_Blob_Reference,
            bool p_Is_Visible_To_Anonymous_Users, bool p_Is_Available_For_Download_For_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users, bool p_Is_Available_For_Download_For_Followers_Users,
            int p_Record_Created_By_User_Id,
            bool p_Is_Active)
        {
            return Invoices_Operations.Instance.Insert_New_Invoice_Details(p_User_Id, p_Client_Id, p_Invoice_DateTime, p_Currency_Id, p_Total_Amount, p_Vat_Percentage,
                p_Total_Without_Vat, p_Total_Vat, p_Creation_DateTime, p_Invoiced_Client_On_User_Location_Id, p_Invoiced_Client_To_CompanyName,
                p_Invoiced_Client_To_Tax_Reference, p_Invoiced_Client_To_PersonName,
                p_Invoiced_Client_To_PhoneNumber, p_Invoiced_Client_To_Country_Id,
                p_Invoiced_Client_To_State_Id, p_Invoiced_Client_To_City, p_Invoiced_Client_To_Address, p_Invoiced_Client_To_Zip,
                p_Invoiced_Client_To_EmailAddress, p_Invoice_Type_Id, p_Invoice_Number, p_Invoice_Reference_Number,
                p_Invoice_Content_Long_Description, p_User_Description,
                p_User_Comments, p_Original_File_Name, p_Azure_Block_Blob_Reference,
                p_Is_Visible_To_Anonymous_Users, p_Is_Available_For_Download_For_Anonymous_Users,
                p_Is_Visible_To_Followers_Users, p_Is_Available_For_Download_For_Followers_Users,
                p_Record_Created_By_User_Id, p_Is_Active);
        }

        public General_Documents GeneralDocuments_Insert_New_General_Document_Details(
            int p_User_Id, short p_General_Document_Type, string p_Title,
            string p_Description, DateTime? p_Document_Creation_DateTime,

            string p_Sent_By_Entity_Name, short? p_Sent_By_Entity_Country_Id,
            short? p_Sent_By_Entity_State_Id, string p_Sent_By_Entity_City,
            string p_Sent_By_Entity_Address, string p_Sent_By_Entity_ZipCode,
            DateTime? p_Sent_By_Entity_DateTime, string p_Sent_By_Entity_Email_Address,

            string p_Sent_To_Entity_Name, short? p_Sent_To_Entity_Country_Id,
            short? p_Sent_To_Entity_State_Id, string p_Sent_To_Entity_City,
            string p_Sent_To_Entity_Address, string p_Sent_To_Entity_ZipCode,
            string p_Sent_To_Entity_Email_Address,

            DateTime? p_Recieved_Document_DateTime,
            short? p_Recieved_In_Country_Id, short? p_Recieved_In_State_Id,
            string p_Recieved_In_City, string p_Recieved_In_Address,
            string p_Recieved_In_ZipCode, string p_Recieved_In_Email_Address,

            string p_User_Comments, int? p_Recieved_By_User_Id, DateTime? p_Recieved_DateTime,
            string p_Original_File_Name, string p_Azure_Block_Blob_Reference,
            bool p_Is_Visible_To_Anonymous_Users, bool p_Is_Available_For_Download_For_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users, bool p_Is_Available_For_Download_For_Followers_Users,
            int p_Record_Created_By_User_Id, DateTime p_Record_Creation_DateTime_UTC,
            int p_Record_Last_Updated_By_User_Id, DateTime p_Record_Last_Updated_DateTime_UTC,
            bool p_Is_Active
            )
        {
            return General_Documents_Operations.Instance.Insert_New_General_Document_Details(
                p_User_Id, p_General_Document_Type, p_Title,
                p_Description, p_Document_Creation_DateTime,

                p_Sent_By_Entity_Name, p_Sent_By_Entity_Country_Id,
                p_Sent_By_Entity_State_Id, p_Sent_By_Entity_City,
                p_Sent_By_Entity_Address, p_Sent_By_Entity_ZipCode,
                p_Sent_By_Entity_DateTime, p_Sent_By_Entity_Email_Address,

                p_Sent_To_Entity_Name, p_Sent_To_Entity_Country_Id,
                p_Sent_To_Entity_State_Id, p_Sent_To_Entity_City,
                p_Sent_To_Entity_Address, p_Sent_To_Entity_ZipCode,
                p_Sent_To_Entity_Email_Address,

                p_Recieved_Document_DateTime,
                p_Recieved_In_Country_Id, p_Recieved_In_State_Id,
                p_Recieved_In_City, p_Recieved_In_Address,
                p_Recieved_In_ZipCode, p_Recieved_In_Email_Address,

                p_User_Comments, p_Recieved_By_User_Id, p_Recieved_DateTime,
                p_Original_File_Name, p_Azure_Block_Blob_Reference,
                p_Is_Visible_To_Anonymous_Users, p_Is_Available_For_Download_For_Anonymous_Users,
                p_Is_Visible_To_Followers_Users, p_Is_Available_For_Download_For_Followers_Users,
                p_Record_Created_By_User_Id, p_Record_Creation_DateTime_UTC,
                p_Record_Last_Updated_By_User_Id, p_Record_Last_Updated_DateTime_UTC,
                p_Is_Active
            );
        }

        public bool GeneralDocuments_Update_Document_Details(
            int p_General_Document_Id, short p_General_Document_Type_Id, string p_Title,
            string p_Description, DateTime? p_Document_Creation_DateTime,
            string p_Sent_By_Entity_Name, short? p_Sent_By_Entity_Country_Id,
            short? p_Sent_By_Entity_State_Id, string p_Sent_By_Entity_City, string p_Sent_By_Entity_Address,
            string p_Sent_By_Entity_ZipCode, DateTime? p_Sent_By_Entity_DateTime,
            string p_Sent_By_Entity_Email_Address, string p_Sent_To_Entity_Name,
            short? p_Sent_To_Entity_Country_Id, short? p_Sent_To_Entity_State_Id, string p_Sent_To_Entity_City,
            string p_Sent_To_Entity_Address, string p_Sent_To_Entity_ZipCode, string p_Sent_To_Entity_Email_Address,
            DateTime? p_Recieved_Document_DateTime, short? p_Recieved_In_Country_Id, short? p_Recieved_In_State_Id,
            string p_Recieved_In_City, string p_Recieved_In_Address, string p_Recieved_In_ZipCode,
            string p_Recieved_In_Email_Address, string p_User_Comments, int? p_Recieved_By_User_Id, DateTime? p_Recieved_DateTime,
            bool p_Is_Visible_To_Anonymous_Users, bool p_Is_Available_For_Download_For_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users, bool p_Is_Available_For_Download_For_Followers_Users,
            bool p_Is_Active, int p_Updating_User_Id)
        {
            return General_Documents_Operations.Instance.Update_General_Document_Details(
                p_General_Document_Id, p_General_Document_Type_Id, p_Title,
                p_Description, p_Document_Creation_DateTime, p_Sent_By_Entity_Name, p_Sent_By_Entity_Country_Id,
                p_Sent_By_Entity_State_Id, p_Sent_By_Entity_City, p_Sent_By_Entity_Address,
                p_Sent_By_Entity_ZipCode, p_Sent_By_Entity_DateTime,
                p_Sent_By_Entity_Email_Address, p_Sent_To_Entity_Name,
                p_Sent_To_Entity_Country_Id, p_Sent_To_Entity_State_Id, p_Sent_To_Entity_City,
                p_Sent_To_Entity_Address, p_Sent_To_Entity_ZipCode, p_Sent_To_Entity_Email_Address,
                p_Recieved_Document_DateTime, p_Recieved_In_Country_Id, p_Recieved_In_State_Id,
                p_Recieved_In_City, p_Recieved_In_Address, p_Recieved_In_ZipCode,
                p_Recieved_In_Email_Address, p_User_Comments, p_Recieved_By_User_Id, p_Recieved_DateTime,
                p_Is_Visible_To_Anonymous_Users, p_Is_Available_For_Download_For_Anonymous_Users,
                p_Is_Visible_To_Followers_Users, p_Is_Available_For_Download_For_Followers_Users,
                p_Is_Active, p_Updating_User_Id);
        }

        public List<General_Documents> GeneralDocuments_Get_Search(
            int p_User_Id,
            short? p_Filter_By_Type,
            short? p_Filter_By_Country,
            short? p_Filter_By_State,
            string p_Filter_By_City_Or_Address_Or_ZipCode,
            string p_Filter_By_CompanyName_Or_Person_Fullname)
        {
            return General_Documents_Operations.Instance.Get_Search(
                p_User_Id,
                p_Filter_By_Type,
                p_Filter_By_Country,
                p_Filter_By_State,
                p_Filter_By_City_Or_Address_Or_ZipCode,
                p_Filter_By_CompanyName_Or_Person_Fullname);
        }


        public bool Expenses_Update_Expense_Details(
            int p_Expense_Record_Id, int p_Supplier_Id, DateTime? p_Expense_Invoice_DateTime,
            byte p_Currency_Id, decimal p_Total_Amount, decimal p_Vat_Percentage, decimal p_Total_Without_Vat,
            decimal p_Total_Vat, int? p_Invoiced_Client_On_User_Location_Id,
            string p_Invoiced_Client_To_CompanyName, string p_Invoiced_Client_To_Tax_Reference,
            string p_Invoiced_Client_To_PersonName, string p_Invoiced_Client_To_PhoneNumber,
            short? p_Invoiced_Client_To_Country_Id, short? p_Invoiced_Client_To_State_Id,
            string p_Invoiced_Client_To_City, string p_Invoiced_Client_To_Address,
            string p_Invoiced_Client_To_Zip, string p_Invoiced_Client_To_EmailAddress,
            byte p_Expense_Type_Id, string p_Invoice_Number, string p_Invoice_Reference_Number,
            string p_Invoice_Supplier_Company_Details, string p_Invoice_Supplier_Tax_Reference, short? p_Invoice_Supplier_Country_Id,
            short? p_Invoice_Supplier_State_Id, string p_Invoice_Supplier_City, string p_Invoice_Supplier_Address_Description,
            string p_Invoice_Supplier_ZipCode, string p_Invoice_Supplier_WebAddress,
            string p_Invoice_Supplier_Phone_Number, string p_Invoice_Supplier_Contact_FullName,
            string p_Invoice_Content_Long_Description, string p_User_Description, string p_User_Comments,
            string p_Original_File_Name, string p_Expense_Azure_Block_Blob_Reference, bool p_File_Uploaded,
            bool p_Is_Visible_To_Anonymous_Users, bool p_Is_Available_For_Download_For_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users, bool p_Is_Available_For_Download_For_Followers_Users,
            int p_Updating_User_Id, bool p_Is_Active)
        {
            return Expenses_Operations.Instance.Update_Expense_Details(
                p_Expense_Record_Id, p_Supplier_Id, p_Expense_Invoice_DateTime, p_Currency_Id, p_Total_Amount, p_Vat_Percentage,
                p_Total_Without_Vat, p_Total_Vat, p_Invoiced_Client_On_User_Location_Id, p_Invoiced_Client_To_CompanyName,
                p_Invoiced_Client_To_Tax_Reference, p_Invoiced_Client_To_PersonName, p_Invoiced_Client_To_PhoneNumber, p_Invoiced_Client_To_Country_Id,
                p_Invoiced_Client_To_State_Id, p_Invoiced_Client_To_City, p_Invoiced_Client_To_Address, p_Invoiced_Client_To_Zip,
                p_Invoiced_Client_To_EmailAddress, p_Expense_Type_Id, p_Invoice_Number, p_Invoice_Reference_Number,
                p_Invoice_Supplier_Company_Details, p_Invoice_Supplier_Tax_Reference, p_Invoice_Supplier_Country_Id,
                p_Invoice_Supplier_State_Id, p_Invoice_Supplier_City, p_Invoice_Supplier_Address_Description,
                p_Invoice_Supplier_ZipCode, p_Invoice_Supplier_WebAddress, p_Invoice_Supplier_Phone_Number,
                p_Invoice_Supplier_Contact_FullName, p_Invoice_Content_Long_Description, p_User_Description,
                p_User_Comments,
                p_Original_File_Name, p_Expense_Azure_Block_Blob_Reference, p_File_Uploaded,
                p_Is_Visible_To_Anonymous_Users, p_Is_Available_For_Download_For_Anonymous_Users,
                p_Is_Visible_To_Followers_Users, p_Is_Available_For_Download_For_Followers_Users,
                p_Updating_User_Id, p_Is_Active
            );
        }

        public bool Invoices_Update_Invoice_Details(
            int p_Invoice_Record_Id, int p_Client_Id, DateTime? p_Invoice_DateTime,
            byte p_Currency_Id, decimal p_Total_Amount, decimal p_Vat_Percentage,
            decimal p_Total_Without_Vat, decimal p_Total_Vat,
            DateTime? p_Creation_DateTime,
            int? p_Invoiced_Client_On_User_Location_Id,
            string p_Invoiced_Client_To_CompanyName, string p_Invoiced_Client_To_Tax_Reference,
            string p_Invoiced_Client_To_PersonName, string p_Invoiced_Client_To_PhoneNumber,
            short? p_Invoiced_Client_To_Country_Id, short? p_Invoiced_Client_To_State_Id, string p_Invoiced_Client_To_City,
            string p_Invoiced_Client_To_Address, string p_Invoiced_Client_To_Zip, string p_Invoiced_Client_To_EmailAddress,
            byte p_Invoice_Type_Id, string p_Invoice_Number, string p_Invoice_Reference_Number,
            string p_Invoice_Content_Long_Description,
            string p_User_Description,
            string p_User_Comments,
            bool p_Is_Visible_To_Anonymous_Users, bool p_Is_Available_For_Download_For_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users, bool p_Is_Available_For_Download_For_Followers_Users,
            bool p_Is_Active, int p_Updating_UserId)
        {
            return Invoices_Operations.Instance.Update_Invoice_Details(
                p_Invoice_Record_Id, p_Client_Id, p_Invoice_DateTime,
                p_Currency_Id, p_Total_Amount, p_Vat_Percentage,
                p_Total_Without_Vat, p_Total_Vat,
                p_Creation_DateTime, p_Invoiced_Client_On_User_Location_Id,
                p_Invoiced_Client_To_CompanyName, p_Invoiced_Client_To_Tax_Reference,
                p_Invoiced_Client_To_PersonName, p_Invoiced_Client_To_PhoneNumber,
                p_Invoiced_Client_To_Country_Id, p_Invoiced_Client_To_State_Id, p_Invoiced_Client_To_City,
                p_Invoiced_Client_To_Address, p_Invoiced_Client_To_Zip, p_Invoiced_Client_To_EmailAddress,
                p_Invoice_Type_Id, p_Invoice_Number, p_Invoice_Reference_Number,
                p_Invoice_Content_Long_Description, p_User_Description,
                p_User_Comments, p_Is_Visible_To_Anonymous_Users, p_Is_Available_For_Download_For_Anonymous_Users,
                p_Is_Visible_To_Followers_Users, p_Is_Available_For_Download_For_Followers_Users,
                p_Is_Active, p_Updating_UserId);
        }

        public Expenses Expenses_Get_By_Id(int p_Expense_Record_Id, int p_User_Id_Expense_Owner)
        {
            return Expenses_Operations.Instance.Get_Expense_Details_By_Expense_Id(
                p_Expense_Record_Id,
                p_User_Id_Expense_Owner,
                p_User_Id_Expense_Owner);
        }

        public Invoices Invoices_Get_Invoice_Latest_Entry_Based_On_Client_Id_Selection(int p_Client_Id, int p_User_Id_LoggedIn_Creating_Invoice)
        {
            return Invoices_Operations.Instance.Get_Latest_Invoice_By_Client_Id(p_Client_Id, p_User_Id_LoggedIn_Creating_Invoice);
        }

        public Invoices Invoices_Get_Invoice_Latest_Entry_Based_On_Client_Id_And_Invoice_DateTime_Selection(
            int p_Client_Id,
            DateTime p_Invoice_DateTime,
            int p_User_Id_LoggedIn_Creating_Invoice)
        {
            return Invoices_Operations.Instance.Invoices_Get_Invoice_Latest_Entry_Based_On_Client_Id_And_Invoice_DateTime_Selection(
                p_Client_Id,
                p_Invoice_DateTime,
                p_User_Id_LoggedIn_Creating_Invoice);
        }

        public Bank_Account_Transactions BankAccount_Transactions_Get_Transaction_Details_By_Transaction_Id(
                    long p_Bank_Account_Transaction_Id,
                    int p_User_Id_Bank_Account_Transaction_Owner,
                    int p_User_Id_Searching_For_Bank_Account_Transaction_Details)
        {
            return BankAccount_Transactions.Instance.Get_Bank_Account_Transaction_Details_By_Transaction_Id(
                p_Bank_Account_Transaction_Id,
                p_User_Id_Bank_Account_Transaction_Owner,
                p_User_Id_Searching_For_Bank_Account_Transaction_Details
                );
        }

        public Bank_Account_Transactions BankAccount_Transactions_Insert_New_Transaction_Details(
            int p_Bank_Account_Id,
            long? p_After_Transaction_Id,
            decimal p_Transaction_Account_Balance,
            DateTime p_Transaction_Actual_DateTime,
            decimal p_Positive_Amount_Entered,
            decimal p_Negative_Amount_Paid,
            DateTime? p_Transaction_Value_DateTime,
            string p_Reference_Number,
            string p_Transaction_Bank_Description,
            string p_Transaction_Bank_Inner_Reference_Code,
            bool p_Is_Visible_To_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users,
            int p_Creating_User_Id)
        {
            return BankAccount_Transactions.Instance.Insert_New_Bank_Account_Transaction_Details(
                p_Bank_Account_Id,
                p_After_Transaction_Id, 
                p_Transaction_Account_Balance,
                p_Transaction_Actual_DateTime,
                p_Positive_Amount_Entered,
                p_Negative_Amount_Paid,
                p_Transaction_Value_DateTime,
                p_Reference_Number,
                p_Transaction_Bank_Description,
                p_Transaction_Bank_Inner_Reference_Code,
                p_Is_Visible_To_Anonymous_Users,
                p_Is_Visible_To_Followers_Users,
                p_Creating_User_Id
                );
        }

        public bool BankAccount_Transactions_Update_Transaction_Details(
            long p_Bank_Account_Transaction_Id,
            decimal p_Transaction_Account_Balance,
            DateTime p_Transaction_Actual_DateTime,
            decimal p_Positive_Amount_Entered,
            decimal p_Negative_Amount_Paid,
            DateTime? p_Transaction_Value_DateTime,
            string p_Reference_Number,
            string p_Transaction_Bank_Description,
            string p_Transaction_Bank_Inner_Reference_Code,
            bool p_Is_Visible_To_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users,
            int p_Updating_User_Id)
        {
            return BankAccount_Transactions.Instance.Update_Bank_Account_Transaction_Details(
                    p_Bank_Account_Transaction_Id,
                    p_Transaction_Account_Balance,
                    p_Transaction_Actual_DateTime,
                    p_Positive_Amount_Entered,
                    p_Negative_Amount_Paid,
                    p_Transaction_Value_DateTime,
                    p_Reference_Number,
                    p_Transaction_Bank_Description,
                    p_Transaction_Bank_Inner_Reference_Code,
                    p_Is_Visible_To_Anonymous_Users,
                    p_Is_Visible_To_Followers_Users,
                    p_Updating_User_Id
                );
        }

        public bool BankAccount_Transactions_Update_Transaction_Details(
            long p_Bank_Account_Transaction_Id,
            decimal p_Transaction_Account_Balance,
            DateTime p_Transaction_Actual_DateTime,
            decimal p_Positive_Amount_Entered,
            decimal p_Negative_Amount_Paid,
            DateTime? p_Transaction_Value_DateTime,
            string p_Reference_Number,
            string p_Transaction_Bank_Description,
            string p_Transaction_Bank_Inner_Reference_Code,
            string p_User_Description,
            string p_User_Comments,
            bool p_Is_Visible_To_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users,
            int p_Updating_User_Id)
        {
            return BankAccount_Transactions.Instance.Update_Bank_Account_Transaction_Details(
                    p_Bank_Account_Transaction_Id,
                    p_Transaction_Account_Balance,
                    p_Transaction_Actual_DateTime,
                    p_Positive_Amount_Entered,
                    p_Negative_Amount_Paid,
                    p_Transaction_Value_DateTime,
                    p_Reference_Number,
                    p_Transaction_Bank_Description,
                    p_Transaction_Bank_Inner_Reference_Code,
                    p_User_Description,
                    p_User_Comments,
                    p_Is_Visible_To_Anonymous_Users,
                    p_Is_Visible_To_Followers_Users,
                    p_Updating_User_Id
                );
        }

        public Bank_Account_Transactions_Response_For_UI BankAccount_Transactions_Get_Transactions_By_Bank_Account_Id_And_User_Id(
            int p_Page_Number,
            int p_Rows_Per_Page,
            int p_Bank_Account_Id,
            int p_User_Id_Bank_Account_Owner,
            int p_User_Id_Searching_For_Bank_Account_Transactions)
        {
            return BankAccount_Transactions.Instance.Get_Bank_Account_Transactions_By_Bank_Account_Id_And_User_Id(
                    p_Page_Number,
                    p_Rows_Per_Page,
                    p_Bank_Account_Id,
                    p_User_Id_Bank_Account_Owner,
                    p_User_Id_Searching_For_Bank_Account_Transactions
                );
        }

        public bool BankAccount_Transactions_Delete_Transaction(
            int p_Bank_Account_Id,
            long p_Bank_Account_Transaction_Id,
            int p_Updating_User_Id
            )
        {
            return BankAccount_Transactions.Instance.Delete_Bank_Account_Transaction(
                    p_Bank_Account_Id,
                    p_Bank_Account_Transaction_Id,
                    p_Updating_User_Id
                );
        }

        public List<Bank_Accounts> BankAccounts_Get_Search(int p_User_Id)
        {
            return Bank_Accounts_Operations.Instance.Get_Search(p_User_Id);
        }

        public List<Bank_Accounts> BankAccounts_Get_All_By_User_Id(
            int p_User_Id_To_Return_Bank_Accounts, 
            int p_Authenticated_User_ID)
        {
            return this.BankAccounts_Get_Search(p_User_Id_To_Return_Bank_Accounts);
        }

        public Bank_Accounts BankAccounts_Get_Bank_Account_Details(int p_Bank_Account_Id, int p_User_Id_Bank_Account_Owner)
        {
            return Bank_Accounts_Operations.Instance.Get_Bank_Account_Details_By_Bank_Account_Id(p_Bank_Account_Id, p_User_Id_Bank_Account_Owner);
        }

        public Bank_Accounts BankAccounts_Insert_New_Bank_Account_Details(
            string p_Bank_Name, string p_Bank_Number,
            string p_Branch_Name, string p_Branch_Number,
            string p_Account_Number, string p_Account_Name,
            string p_IBAN, byte? p_Currency_Id,
            DateTime? p_Opened_Account_DateTime, short? p_Branch_Country_Id,
            short? p_Branch_State_Id, string p_Branch_City,
            string p_Branch_Address_Description, string p_Branch_ZipCode,
            string p_Branch_Phone, string p_Branch_Main_Email_Address,
            string p_Branch_Main_Contact, string p_Main_Contact_Phone_Number,
            DateTime? p_Account_Active_From_Date, DateTime? p_Account_Active_To_Date,
            bool p_Is_Visible_To_Anonymous_Users, bool p_Is_Available_For_Download_For_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users, bool p_Is_Available_For_Download_For_Followers_Users,
            bool p_Is_Active,
            int p_Creating_User_Id)
        {
            return Bank_Accounts_Operations.Instance.Insert_New_Bank_Account_Details(
                p_Bank_Name, p_Bank_Number,
                p_Branch_Name, p_Branch_Number,
                p_Account_Number, p_Account_Name,
                p_IBAN, p_Currency_Id,
                p_Opened_Account_DateTime, p_Branch_Country_Id,
                p_Branch_State_Id, p_Branch_City,
                p_Branch_Address_Description, p_Branch_ZipCode,
                p_Branch_Phone, p_Branch_Main_Email_Address,
                p_Branch_Main_Contact, p_Main_Contact_Phone_Number,
                p_Account_Active_From_Date, p_Account_Active_To_Date,
                p_Is_Visible_To_Anonymous_Users, p_Is_Available_For_Download_For_Anonymous_Users,
                p_Is_Visible_To_Followers_Users, p_Is_Available_For_Download_For_Followers_Users,
                p_Is_Active,
                p_Creating_User_Id);
        }

        public bool BankAccounts_Update_Bank_Account_Details(
            int p_Bank_Account_Id,
            string p_Bank_Name, string p_Bank_Number,
            string p_Branch_Name, string p_Branch_Number,
            string p_Account_Number, string p_Account_Name,
            string p_IBAN, byte? p_Currency_Id,
            DateTime? p_Opened_Account_DateTime, short? p_Branch_Country_Id,
            short? p_Branch_State_Id, string p_Branch_City,
            string p_Branch_Address_Description, string p_Branch_ZipCode,
            string p_Branch_Phone, string p_Branch_Main_Email_Address,
            string p_Branch_Main_Contact, string p_Main_Contact_Phone_Number,
            DateTime? p_Account_Active_From_Date, DateTime? p_Account_Active_To_Date,
            bool p_Is_Visible_To_Anonymous_Users, bool p_Is_Available_For_Download_For_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users, bool p_Is_Available_For_Download_For_Followers_Users,
            bool p_Is_Active, int p_Creating_User_Id)
        {
            return Bank_Accounts_Operations.Instance.Update_Bank_Account_Details(
                p_Bank_Account_Id, p_Bank_Name,
                p_Bank_Number, p_Branch_Name, p_Branch_Number,
                p_Account_Number, p_Account_Name,
                p_IBAN, p_Currency_Id,
                p_Opened_Account_DateTime, p_Branch_Country_Id,
                p_Branch_State_Id, p_Branch_City,
                p_Branch_Address_Description, p_Branch_ZipCode,
                p_Branch_Phone, p_Branch_Main_Email_Address,
                p_Branch_Main_Contact, p_Main_Contact_Phone_Number,
                p_Account_Active_From_Date, p_Account_Active_To_Date,
                p_Is_Visible_To_Anonymous_Users, p_Is_Available_For_Download_For_Anonymous_Users,
                p_Is_Visible_To_Followers_Users, p_Is_Available_For_Download_For_Followers_Users,
                p_Is_Active, p_Creating_User_Id);
        }

        public int? Invoices_Get_Next_Invoice_Number_Based_On_Invoice_Type(int p_User_ID, byte p_Invoice_Type)
        {
            return Invoices_Operations.Instance.Get_Next_Invoice_Number_Based_On_Invoice_Type(
                p_User_ID, p_Invoice_Type);
        }

        public List<Credit_Cards> CreditCards_Get_Search(
            int p_User_Id,
            int? p_Bank_Account_Id)
        {
            return Credit_Cards_Operations.Instance.Get_Search(
                p_User_Id,
                p_Bank_Account_Id);
        }

        public Credit_Cards CreditCards_Get_Credit_Card_Details_By_Credit_Card_Id(
            int p_Credit_Card_Id,
            int p_User_Id_Credit_Card_Owner,
            int p_User_Id_Searching_For_Credit_Card)
        {
            return Credit_Cards_Operations.Instance.Get_Credit_Card_Details_By_Credit_Card_Id(
                p_Credit_Card_Id,
                p_User_Id_Credit_Card_Owner,
                p_User_Id_Searching_For_Credit_Card);
        }

        public Credit_Cards CreditCards_Insert_New_Credit_Card_Details(
            int p_User_Id_Owner,
            int p_Bank_Account_Id,
            string p_Card_Name,
            string p_Four_Ending_Digits,
            DateTime? p_Expiration_Date,
            bool p_Is_Active,
            int p_Creating_User_Id)
        {
            return Credit_Cards_Operations.Instance.Insert_New_Credit_Card_Details(
                p_Bank_Account_Id,
                p_User_Id_Owner,
                p_Card_Name,
                p_Four_Ending_Digits,
                p_Expiration_Date,
                p_Is_Active,
                p_Creating_User_Id);
        }

        public bool CreditCards_Update_Credit_Card_Details(
            int p_Credit_Card_Id,
            int p_Bank_Account_Id,
            string p_Card_Name,
            string p_Four_Ending_Digits,
            DateTime? p_Expiration_Date,
            bool p_Is_Active,
            int p_Updating_User_Id)
        {
            return Credit_Cards_Operations.Instance.Update_Credit_Card_Details(
                p_Credit_Card_Id,
                p_Bank_Account_Id,
                p_Card_Name,
                p_Four_Ending_Digits,
                p_Expiration_Date,
                p_Is_Active,
                p_Updating_User_Id);
        }

        public List<Credit_Cards> CreditCards_Get_All_By_User_Id(
            int p_User_Id_To_Return_Credit_Cards,
            int p_Authenticated_User_ID)
        {
            return Credit_Cards_Operations.Instance.Get_All_By_User_Id(
                p_User_Id_To_Return_Credit_Cards,
                p_Authenticated_User_ID);
        }

        public List<Credit_Cards_Statement> CreditCardStatements_Get_Search(
            int p_User_ID_Bank_Owner,
            int? p_Bank_Account_Id,
            int p_User_ID_Searching)
        {
            return Credit_Cards_Statement_Operations.Instance.Get_Search(
                p_User_ID_Bank_Owner,
                p_Bank_Account_Id,
                p_User_ID_Searching);
        }

        public Credit_Cards_Statement CreditCardStatements_Get_Credit_Card_Statement_Details_By_Credit_Card_Statement_Id(
            int p_Credit_Card_Statement_Id,
            int p_User_ID_Bank_Owner,
            int p_User_ID_Searching)
        {
            return Credit_Cards_Statement_Operations.Instance.Get_Credit_Card_Statement_Details_By_Credit_Card_Statement_Id(
                p_Credit_Card_Statement_Id,
                p_User_ID_Bank_Owner,
                p_User_ID_Searching);
        }

        public Credit_Cards_Statement CreditCardStatements_Insert_New_Credit_Card_Statement_Details(
            int p_User_Id_Owner,
            int p_Bank_Account_Id,
            int p_Credit_Card_Id,
            DateTime? p_Statement_Date,
            decimal p_Total_Amount,
            byte p_Currency_Id,
            string p_Original_File_Name,
            string p_Azure_Block_Blob_Reference,
            long? p_Bank_Account_Transaction_Id_Connection,
            bool p_Is_Visible_To_Anonymous_Users,
            bool p_Is_Available_For_Download_For_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users,
            bool p_Is_Available_For_Download_For_Followers_Users,
            int p_Creating_User_Id)
        {
            return Credit_Cards_Statement_Operations.Instance.Insert_New_Credit_Card_Statement_Details(
                p_User_Id_Owner,
                p_Bank_Account_Id,
                p_Credit_Card_Id,
                p_Statement_Date,
                p_Total_Amount,
                p_Currency_Id,
                p_Original_File_Name,
                p_Azure_Block_Blob_Reference,
                p_Bank_Account_Transaction_Id_Connection,
                p_Is_Visible_To_Anonymous_Users,
                p_Is_Available_For_Download_For_Anonymous_Users,
                p_Is_Visible_To_Followers_Users,
                p_Is_Available_For_Download_For_Followers_Users,
                p_Creating_User_Id);
        }

        public bool CreditCardStatements_Update_Credit_Card_Statement_Details(
            int p_Credit_Card_Statement_Id,
            int p_Credit_Card_Id,
            DateTime? p_Statement_Date,
            decimal? p_Total_Amount,
            byte p_Currency_Id,
            string p_Original_File_Name,
            string p_Azure_Block_Blob_Reference,
            bool p_File_Uploaded,
            long? p_Bank_Account_Transaction_Id_Connection,
            bool p_Is_Visible_To_Anonymous_Users,
            bool p_Is_Available_For_Download_For_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users,
            bool p_Is_Available_For_Download_For_Followers_Users,
            int p_Updating_User_Id)
        {
            return Credit_Cards_Statement_Operations.Instance.Update_Credit_Card_Statement_Details(
                p_Credit_Card_Statement_Id,
                p_Credit_Card_Id,
                p_Statement_Date,
                p_Total_Amount,
                p_Currency_Id,
                p_Original_File_Name,
                p_Azure_Block_Blob_Reference,
                p_File_Uploaded,
                p_Bank_Account_Transaction_Id_Connection,
                p_Is_Visible_To_Anonymous_Users,
                p_Is_Available_For_Download_For_Anonymous_Users,
                p_Is_Visible_To_Followers_Users,
                p_Is_Available_For_Download_For_Followers_Users,
                p_Updating_User_Id);
        }

        public List<Credit_Cards_Statement> CreditCardStatements_Get_All_By_User_Id(
            int p_User_Id_To_Return_Credit_Cards_Statement,
            int p_Authenticated_User_ID)
        {
            return Credit_Cards_Statement_Operations.Instance.Get_All_By_User_Id(
                p_User_Id_To_Return_Credit_Cards_Statement,
                p_Authenticated_User_ID);
        }

        public List<Credit_Cards_Statement_Transaction> CreditCardStatementTransactions_Get_Credit_Card_Statement_Transactions_List(
            int? p_Bank_Account_Credit_Card_Statement_Id,
            int p_User_ID_Bank_Owner,
            int p_User_ID_Searching)
        {
            return Credit_Cards_Statement_Transaction_Operations.Instance.Get_Credit_Card_Statement_Transactions_List(
                p_Bank_Account_Credit_Card_Statement_Id,
                p_User_ID_Bank_Owner,
                p_User_ID_Searching);
        }

        public int CreditCardStatementTransactions_Insert_New_Credit_Card_Statement_Transaction_Details(
            int p_Bank_Account_Credit_Card_Statement_Id,
            DateTime? p_Transaction_Date,
            string p_Business_Name,
            decimal? p_Transaction_Amount,
            byte? p_Transaction_Amount_Currency_Id,
            decimal? p_Transaction_Actual_Payment_Amount,
            string p_Description,
            bool p_Has_Been_Actually_Charged_In_Statement,
            decimal? p_Total_Charged_In_Statement,
            string p_User_Description,
            string p_User_Comments,
            bool p_Is_Visible_To_Anonymous_Users,
            bool p_Is_Available_For_Download_For_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users,
            bool p_Is_Available_For_Download_For_Followers_Users,
            int? p_Creating_User_Id)
        {
            return Credit_Cards_Statement_Transaction_Operations.Instance.Insert_New_Credit_Card_Statement_Transaction_Details(
                p_Bank_Account_Credit_Card_Statement_Id,
                p_Transaction_Date,
                p_Business_Name,
                p_Transaction_Amount,
                p_Transaction_Amount_Currency_Id,
                p_Transaction_Actual_Payment_Amount,
                p_Description,
                p_Has_Been_Actually_Charged_In_Statement,
                p_Total_Charged_In_Statement,
                p_User_Description,
                p_User_Comments,
                p_Is_Visible_To_Anonymous_Users,
                p_Is_Available_For_Download_For_Anonymous_Users,
                p_Is_Visible_To_Followers_Users,
                p_Is_Available_For_Download_For_Followers_Users,
                p_Creating_User_Id);
        }

        public bool CreditCardStatementTransactions_Update_Credit_Card_Statement_Transaction(
            long p_Credit_Card_Statement_Transaction_Id,
            DateTime? p_Transaction_Date,
            string p_Business_Name,
            decimal? p_Transaction_Amount,
            byte? p_Transaction_Amount_Currency_Id,
            decimal? p_Transaction_Actual_Payment_Amount,
            string p_Description,
            bool p_Has_Been_Actually_Charged_In_Statement,
            decimal? p_Total_Charged_In_Statement,
            int p_Updating_User_Id)
        {
            return Credit_Cards_Statement_Transaction_Operations.Instance.Update_Credit_Card_Statement_Transaction(
                p_Credit_Card_Statement_Transaction_Id,
                p_Transaction_Date,
                p_Business_Name,
                p_Transaction_Amount,
                p_Transaction_Amount_Currency_Id,
                p_Transaction_Actual_Payment_Amount,
                p_Description,
                p_Has_Been_Actually_Charged_In_Statement,
                p_Total_Charged_In_Statement,
                p_Updating_User_Id);
        }

        public bool CreditCardStatementTransactions_Delete_Credit_Card_Statement_Transaction(
            long p_Credit_Card_Statement_Transaction_Id,
            int p_Deleting_User_Id)
        {
            return Credit_Cards_Statement_Transaction_Operations.Instance.Delete_Credit_Card_Statement_Transaction(
                p_Credit_Card_Statement_Transaction_Id,
                p_Deleting_User_Id);
        }

        public bool CreditCardStatementTransactions_Delete_Credit_Card_Statement_All_Transactions_By_Statement_Id(
            int p_Bank_Account_Credit_Card_Statement_Id,
            int p_Deleting_User_Id)
        {
            return Credit_Cards_Statement_Transaction_Operations.Instance.Delete_Credit_Card_Statement_All_Transactions_By_Statement_Id(
                p_Bank_Account_Credit_Card_Statement_Id,
                p_Deleting_User_Id);
        }

        public Credit_Cards_Statement_Transaction CreditCardStatementTransactions_Get_Credit_Card_Statement_Transaction_Details(
            int p_User_ID_Bank_Owner,
            long p_Credit_Card_Statement_Transaction_Id,
            int p_User_ID_Searching
            )
        {
            return Credit_Cards_Statement_Transaction_Operations.Instance.Get_Credit_Card_Statement_Transaction_Details(
                p_User_ID_Bank_Owner,
                p_Credit_Card_Statement_Transaction_Id,
                p_User_ID_Searching);
        }

        public bool CreditCardStatementTransactions_Update_Credit_Card_Statement_Transaction_FullDetails(
            long p_Credit_Card_Statement_Transaction_Id,
            DateTime? p_Transaction_Date,
            string p_Business_Name,
            decimal? p_Transaction_Amount,
            byte? p_Transaction_Amount_Currency_Id,
            decimal? p_Transaction_Actual_Payment_Amount,
            string p_Description,
            bool p_Has_Been_Actually_Charged_In_Statement,
            decimal? p_Total_Charged_In_Statement,
            string p_User_Description,
            string p_User_Comments,
            bool p_Is_Visible_To_Anonymous_Users,
            bool p_Is_Available_For_Download_For_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users,
            bool p_Is_Available_For_Download_For_Followers_Users,
            int p_Updating_User_Id)
        {
            return Credit_Cards_Statement_Transaction_Operations.Instance.Update_Credit_Card_Statement_Transaction_FullDetails(
                p_Credit_Card_Statement_Transaction_Id,
                p_Transaction_Date,
                p_Business_Name,
                p_Transaction_Amount,
                p_Transaction_Amount_Currency_Id,
                p_Transaction_Actual_Payment_Amount,
                p_Description,
                p_Has_Been_Actually_Charged_In_Statement,
                p_Total_Charged_In_Statement,
                p_User_Description,
                p_User_Comments,
                p_Is_Visible_To_Anonymous_Users,
                p_Is_Available_For_Download_For_Anonymous_Users,
                p_Is_Visible_To_Followers_Users,
                p_Is_Available_For_Download_For_Followers_Users,
                p_Updating_User_Id);
        }

        //public List<Credit_Card_Statement_Transaction_Document_Connection> CreditCardStatementTransactionDocumentConnection_Get_Document_Connections_By_CCStatement_Transaction_Id(
        //    int p_User_Id_Bank_Owner,
        //    long p_Credit_Card_Statement_Transaction_Id,
        //    int p_Searching_User_Id
        //    )
        //{
        //    return Credit_Card_Statement_Transaction_Document_Connection_Operations.Instance
        //        .Get_Document_Connections_By_CCStatement_Transaction_Id(
        //            p_User_Id_Bank_Owner,
        //            p_Credit_Card_Statement_Transaction_Id,
        //            p_Searching_User_Id
        //        );
        //}

        public long CreditCardStatementTransactionDocumentConnection_Insert_Credit_Card_Statement_Transaction_Document_Connection(
            int p_User_Id_Bank_Owner,
            long p_Credit_Card_Statement_Transaction_Id,
            byte p_Connection_Type,
            int p_Document_Record_Id,
            bool p_Is_Visible_To_Anonymous_Users,
            bool p_Is_Available_For_Download_For_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users,
            bool p_Is_Available_For_Download_For_Followers_Users,
            int p_Creating_User_Id)
        {
            return Credit_Card_Statement_Transaction_Document_Connection_Operations.Instance
                .Insert_Credit_Card_Statement_Transaction_Document_Connection(
                    p_User_Id_Bank_Owner,
                    p_Credit_Card_Statement_Transaction_Id,
                    p_Connection_Type,
                    p_Document_Record_Id,
                    p_Is_Visible_To_Anonymous_Users,
                    p_Is_Available_For_Download_For_Anonymous_Users,
                    p_Is_Visible_To_Followers_Users,
                    p_Is_Available_For_Download_For_Followers_Users,
                    p_Creating_User_Id
                );
        }

        public bool CreditCardStatementTransactionDocumentConnection_Delete_Credit_Card_Statement_Transaction_Document_Connection(
            int p_User_Id_Bank_Owner,
            long p_Document_Connection_Id,
            int p_Deleting_User_Id)
        {
            return Credit_Card_Statement_Transaction_Document_Connection_Operations.Instance
                .Delete_Credit_Card_Statement_Transaction_Document_Connection(
                    p_User_Id_Bank_Owner,
                    p_Document_Connection_Id,
                    p_Deleting_User_Id
                );
        }

        //public List<Documents_Suggestions_For_Credit_Card_Statement_Transaction> CreditCardStatementTransactionDocumentConnection_Get_Documents_Connections_Suggestions(
        //    int p_User_Id_Bank_Owner,
        //    long p_Credit_Card_Statement_Transaction_Id,
        //    int p_Searching_User_Id
        //    )
        //{
        //    return Credit_Card_Statement_Transaction_Document_Connection_Operations.Instance
        //        .Get_Documents_Connections_Suggestions(
        //            p_User_Id_Bank_Owner,
        //            p_Credit_Card_Statement_Transaction_Id,
        //            p_Searching_User_Id );
        //}

        public List<Bank_Account_Transaction_Document_Connection>
            BankAccountTransactionsDocumentConnections_Get_Documents_Connections(
            long p_Bank_Account_Transaction_Id,
            Transaction_Type p_Transaction_Type,
            int p_Searching_User_Id)
        {
            return BankAccount_Transactions_Document_Connections_Operations.Instance
                .Get_Documents_Connections(
                    p_Bank_Account_Transaction_Id,
                    p_Transaction_Type,
                    p_Searching_User_Id);
        }

        public List<Bank_Account_Transaction_Document_Connection_Suggestion> 
            BankAccountTransactionsDocumentConnections_Get_Document_Connection_Suggestions(
            long p_Transaction_Id,
            Transaction_Type p_Transaction_Type,
            int p_Searching_User_Id)
        {
            return BankAccount_Transactions_Document_Connections_Operations.Instance
                .Get_Document_Connection_Suggestions(
                    p_Transaction_Id,
                    p_Transaction_Type,
                    p_Searching_User_Id);
        }

        public List<Bank_Account_Transaction_Document_Connection_Suggestion> BankAccountTransactionsDocumentConnections_Search_For_Documents_To_Connect(
            long p_Transaction_Id,
            Transaction_Type p_Transaction_Type,
            DateTime? p_Filter_By_From_Date,
            DateTime? p_Filter_By_To_Date,
            byte? p_Filter_By_Type,
            short? p_Filter_By_Country_Id,
            string p_Filter_By_City_Or_Address_Or_Zipcode,
            string p_Filter_By_Company_Name_Or_People_Name,
            int p_Searching_User_Id)
        {
            return BankAccount_Transactions_Document_Connections_Operations.Instance
                .Search_For_Documents_To_Connect(
                    p_Transaction_Id,
                    p_Transaction_Type,
                    p_Filter_By_From_Date,
                    p_Filter_By_To_Date,
                    p_Filter_By_Type,
                    p_Filter_By_Country_Id,
                    p_Filter_By_City_Or_Address_Or_Zipcode,
                    p_Filter_By_Company_Name_Or_People_Name,
                    p_Searching_User_Id);
        }

        public long BankAccountTransactionsDocumentConnections_Insert_Document_Connection(
            long p_Bank_Account_Transaction_Id,
            byte p_Connection_Type,
            int  p_Document_Record_Id,
            bool p_Is_Visible_To_Anonymous_Users,
            bool p_Is_Available_For_Download_For_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users,
            bool p_Is_Available_For_Download_For_Followers_Users,
            int  p_Creating_User_Id)
        {
            return BankAccount_Transactions_Document_Connections_Operations.Instance
                .Insert_Document_Connection(
                    p_Bank_Account_Transaction_Id,
                    p_Connection_Type,
                    p_Document_Record_Id,
                    p_Is_Visible_To_Anonymous_Users,
                    p_Is_Available_For_Download_For_Anonymous_Users,
                    p_Is_Visible_To_Followers_Users,
                    p_Is_Available_For_Download_For_Followers_Users,
                    p_Creating_User_Id);
        }

        public bool BankAccountTransactionsDocumentConnections_Update_Document_Connection(
            long p_Document_Connection_Id,
            long p_Bank_Account_Transaction_Id,
            bool p_Is_Visible_To_Anonymous_Users,
            bool p_Is_Available_For_Download_For_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users,
            bool p_Is_Available_For_Download_For_Followers_Users,
            int p_Updating_User_Id )
        {
            return BankAccount_Transactions_Document_Connections_Operations.Instance
                .Update_Document_Connection(
                    p_Document_Connection_Id,
                    p_Bank_Account_Transaction_Id,
                    p_Is_Visible_To_Anonymous_Users,
                    p_Is_Available_For_Download_For_Anonymous_Users,
                    p_Is_Visible_To_Followers_Users,
                    p_Is_Available_For_Download_For_Followers_Users,
                    p_Updating_User_Id);
        }

        public bool BankAccountTransactionsDocumentConnections_Delete_Document_Connection(
            long p_Document_Connection_Id,
            long p_Bank_Account_Transaction_Id,
            int p_Deleting_User_Id )
        {
            return BankAccount_Transactions_Document_Connections_Operations.Instance
                .Delete_Document_Connection(
                    p_Document_Connection_Id,
                    p_Bank_Account_Transaction_Id,
                    p_Deleting_User_Id);
        }

        public List<Credit_Cards_Statement> CreditCardStatements_Get_By_Date_Unconnected_Statements(
            long p_Bank_Account_Transaction_Id,
            int p_User_ID_Searching)
        {
            return Credit_Cards_Statement_Operations.Instance.Get_By_Date_Unconnected_Statements(
                p_Bank_Account_Transaction_Id,
                p_User_ID_Searching);
        }

        public bool BankAccount_Transactions_Update_Connect_With_Statement(
            long p_Bank_Account_Transaction_Id,
            int p_Credit_Card_Statement_Id,
            int p_Updating_User_Id
            )
        {
            return BankAccount_Transactions.Instance.Update_Bank_Account_Transaction_Connect_With_Statement(
                    p_Bank_Account_Transaction_Id,
                    p_Credit_Card_Statement_Id,
                    p_Updating_User_Id
                );
        }

        public bool BankAccount_Transactions_Update_Disconnect_Statement(
            long p_Bank_Account_Transaction_Id,
            int p_Credit_Card_Statement_Id,
            int p_Updating_User_Id )
        {
            return BankAccount_Transactions.Instance.Update_Bank_Account_Transaction_Disconnect_Statement(
                    p_Bank_Account_Transaction_Id,
                    p_Credit_Card_Statement_Id,
                    p_Updating_User_Id
                );
        }

        public List<Bank_Account_Transactions> BankAccount_Transactions_Get_By_Date_Unconnected_Transactions_To_Credit_Card_Statements(
            int p_Credit_card_Statement_Id,
            int p_User_ID_Searching)
        {
            return BankAccount_Transactions.Instance
                .Get_By_Date_Unconnected_Transactions_To_Credit_Card_Statements(
                    p_Credit_card_Statement_Id,
                    p_User_ID_Searching);
        }
    }
}

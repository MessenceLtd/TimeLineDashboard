using System;
using System.Collections.Generic;
using TimeLineDashboard.DAL;
using TimeLineDashboard.Shared.Models;
using System.Text;
using TimeLineDashboard_BLL;
using System.Data;
using System.Linq;
using TimeLineDashboard.Shared.Responses;

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
            return Data_Access_Layer_Facade.Instance.Countries_GetAll();
        }

        public Countries Countries_Get_By_Country_Id(short p_Country_Id)
        {
            return Data_Access_Layer_Facade.Instance.Countries_Get_By_Country_Id(p_Country_Id);
        }

        public List<General_Documents> GeneralDocuments_Get_Search(
            int p_User_Id,
            short? p_Filter_By_Type,
            short? p_Filter_By_Country,
            short? p_Filter_By_State,
            string p_Filter_By_City_Or_Address_Or_ZipCode,
            string p_Filter_By_CompanyName_Or_Person_Fullname)
        {
            return Data_Access_Layer_Facade.Instance.GeneralDocuments_Get_Search(
                p_User_Id,
                p_Filter_By_Type,
                p_Filter_By_Country,
                p_Filter_By_State,
                p_Filter_By_City_Or_Address_Or_ZipCode,
                p_Filter_By_CompanyName_Or_Person_Fullname);
        }

        public List<Document_Types> DocumentTypes_Get_All()
        {
            return Data_Access_Layer_Facade.Instance.DocumentTypes_Get_All();
        }

        public List<Invoices> Invoices_Get_Search(
            int p_User_Id,
            short? p_Filter_By_Type,
            short? p_Filter_By_Country,
            short? p_Filter_By_State,
            string p_Filter_By_City_Or_Address_Or_ZipCode,
            string p_Filter_By_CompanyName_Or_Person_Fullname)
        {
            return Data_Access_Layer_Facade.Instance.Invoices_Get_Search(
                p_User_Id,
                p_Filter_By_Type,
                p_Filter_By_Country,
                p_Filter_By_State,
                p_Filter_By_City_Or_Address_Or_ZipCode,
                p_Filter_By_CompanyName_Or_Person_Fullname);
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

        public Users Users_Get_Details_By_User_Id(
            int p_User_Id,
            int p_Authenticated_User_Id,
            App_Permission_Type p_Authenticated_User_Permission_Type)
        {
            this.Validate_Operation_For_Authenticated_User(
                p_User_Id,
                p_Authenticated_User_Id,
                p_Authenticated_User_Permission_Type);

            return Data_Access_Layer_Facade.Instance.Users_Get_Details_By_User_Id(p_User_Id, p_Authenticated_User_Id);
        }

        private void Validate_Operation_For_Authenticated_User(
            int p_User_Id,
            int p_Authenticated_User_Id,
            App_Permission_Type p_Authenticated_User_Permission_Type)
        {
            if (p_User_Id != p_Authenticated_User_Id &&
                p_Authenticated_User_Permission_Type.App_Permission_Type_Id != App_Permission_Type.Permission_Type.Application_Administrator &&
                p_Authenticated_User_Permission_Type.App_Permission_Type_Id != App_Permission_Type.Permission_Type.DashboardTimeLine_Company_Employee)
            {
                throw new Exception("Permission Error! The authenticated user is not permitted to get the user details");
            }
        }

        public List<Clients> Clients_Get_All_By_User_Id(int p_Selected_User_Id_To_Return_Clients, int p_Authenticated_User_ID)
        {
            return Data_Access_Layer_Facade.Instance.Clients_Get_All_By_User_Id(p_Selected_User_Id_To_Return_Clients, p_Authenticated_User_ID);
        }

        public Users Users_Insert_New_User_Administrative_Registration_Process(
            string p_Username, string p_Password, byte p_App_Permission_Type_Id, string p_First_Name, string p_Middle_Name,
            string p_Last_Name, string p_Email, short p_Country_Id, short? p_State_Id,
            string p_City, string p_Address, string p_ZipCode, byte? p_Default_Currency_Id, string p_Mobile_Phone, string p_Additional_Phone_Number,
            DateTime p_BirthDate, byte p_Gender, string p_Heard_About_Application_From, string p_Our_Administrative_Side_Notes,
            int p_Logged_In_Administrative_User_Id)
        {
            Users new_Registered_User_To_Return = null;

            const byte k_Random_Salt_String_Length_For_Encryption_Process = 30;

            // ToDo: Validation of the parameters goes here (Length / Password strength / Required fields ect.. )
            string l_Encryption_Random_Salt = Cryptography_Processor.CreateSalt(k_Random_Salt_String_Length_For_Encryption_Process);
            string l_Encrypted_Password = Cryptography_Processor.GenerateHash(p_Password, l_Encryption_Random_Salt);

            new_Registered_User_To_Return = Data_Access_Layer_Facade.Instance.Users_Insert_New_User_Administrative_Registration_Process(
                p_Username, l_Encrypted_Password, l_Encryption_Random_Salt, p_App_Permission_Type_Id, p_First_Name, p_Middle_Name,
                p_Last_Name, p_Email, p_Country_Id, p_State_Id, p_City, p_Address, p_ZipCode, p_Default_Currency_Id, p_Mobile_Phone, p_Additional_Phone_Number,
                p_BirthDate, p_Gender, p_Heard_About_Application_From, p_Our_Administrative_Side_Notes,
                p_Logged_In_Administrative_User_Id);

            return new_Registered_User_To_Return;
        }

        public General_Documents GeneralDocuments_Get_By_Id(
            int p_General_Document_Record_Id,
            int p_User_Id_Document_Owner,
            int p_Authenticated_User_Id,
            App_Permission_Type p_Authenticated_User_Permission)
        {
            this.Validate_Operation_For_Authenticated_User(
                p_User_Id_Document_Owner,
                p_Authenticated_User_Id,
                p_Authenticated_User_Permission);

            return Data_Access_Layer_Facade.Instance.GeneralDocuments_Get_By_Id(p_General_Document_Record_Id, p_User_Id_Document_Owner);
        }

        public Invoices Invoices_Get_By_Id(
            int p_Invoice_Record_Id,
            int p_User_Id_Invoice_Owner,
            int p_Authenticated_User_Id,
            App_Permission_Type p_Authenticated_User_Permission)
        {
            this.Validate_Operation_For_Authenticated_User(
                p_User_Id_Invoice_Owner,
                p_Authenticated_User_Id,
                p_Authenticated_User_Permission);

            return Data_Access_Layer_Facade.Instance.Invoices_Get_By_Id(p_Invoice_Record_Id, p_User_Id_Invoice_Owner);
        }

        public Currencies Currencies_Get_By_Id(byte p_Currency_Id)
        {
            return Data_Access_Layer_Facade.Instance.Currencies_Get_By_Id(p_Currency_Id);
        }

        public Currencies Currencies_Get_By_Code(string p_Currency_Code)
        {
            return Data_Access_Layer_Facade.Instance.Currencies_Get_By_Code(p_Currency_Code);
        }

        public ClientType ClientTypes_Get_By_Id(short p_Client_Type_Id)
        {
            return Data_Access_Layer_Facade.Instance.ClientTypes_Get_By_Id(p_Client_Type_Id);
        }

        public States States_Get_By_State_Id(short p_State_Id)
        {
            return Data_Access_Layer_Facade.Instance.States_Get_By_State_Id(p_State_Id);
        }

        public SupplierType SupplierTypes_Get_By_Id(short p_Supplier_Type_Id)
        {
            return Data_Access_Layer_Facade.Instance.SupplierTypes_Get_By_Id(p_Supplier_Type_Id);
        }

        public List<Currencies> Currencies_Get_List()
        {
            return Data_Access_Layer_Facade.Instance.Currencies_Get_All();
        }

        public List<Users> Users_Get_Search(string p_Search_Criteria)
        {
            return Data_Access_Layer_Facade.Instance.Users_Get_Search(p_Search_Criteria);
        }

        public bool Users_Are_There_Any_Users_In_Database()
        {
            return Data_Access_Layer_Facade.Instance.Users_Are_There_Any_Users_In_Database();
        }

        public Users Users_Get_User_Details_By_Username_For_Authentication(string p_Username_For_Authentication)
        {
            try
            {
                var user_Details_By_Username_For_Authentication_To_Return = Data_Access_Layer_Facade.Instance.Users_Get_User_Details_By_Username_For_Authentication(p_Username_For_Authentication);

                if (user_Details_By_Username_For_Authentication_To_Return != null && user_Details_By_Username_For_Authentication_To_Return.User_Id > 0)
                    return user_Details_By_Username_For_Authentication_To_Return;
                else
                    return null;
            }
            catch (Exception exc)
            {
                return null;
            }
        }

        public bool Users_Is_Entered_Password_And_RandomSalt_Matches_DB_User_Details_Encrypted_Password(
            string p_Entered_Password_For_Authenticaton,
            string p_User_Details_Encrypted_Password,
            string p_User_Details_Encryption_Random_Salt)
        {
            return Cryptography_Processor.ArePasswordsEqual(
                p_Entered_Password_For_Authenticaton,
                p_User_Details_Encrypted_Password,
                p_User_Details_Encryption_Random_Salt);
        }

        public List<App_Permission_Type> App_Permission_Types_Get_All()
        {
            return Data_Access_Layer_Facade.Instance.App_Permission_Types_Get_All();
        }

        public App_Permission_Type App_Permission_Types_Get_By_Type_Id(byte p_Permission_Type_Id)
        {
            return Data_Access_Layer_Facade.Instance.App_Permission_Types_Get_By_Type_Id(p_Permission_Type_Id);
        }

        public App_Permission_Type App_Permission_Types_Get_By_Permission_Type_Code(string p_Permission_Type_Code)
        {
            return Data_Access_Layer_Facade.Instance.App_Permission_Types_Get_By_Permission_Type_Code(p_Permission_Type_Code);
        }

        public bool Clients_Update_Client_Details(
            int p_Client_Id, string p_Company_Name, string p_Website_URL, short p_Country_Id,
            short? p_State_Id, string p_City, string p_Address, string p_ZipCode,
            byte? p_Default_Currency , decimal? p_Default_Vat_Percentage, 
            string p_Telephone, string p_Mobile_Phone,
            short p_Client_Type_Id, string p_Client_Tax_Reference_Number, string p_Main_Contact_FullName,
            string p_Main_Contact_Email_Address, string p_Main_Contact_Phone_Number,
            DateTime? p_Client_From_Date, DateTime? p_Client_To_Date, DateTime? p_First_Contract_Date,
            string p_First_Contract_Signed_With_Contact_Full_Name, string p_First_Contract_Signed_In_Location_Description,
            bool p_Is_Active, int p_Authenticated_User_ID)
        {
            bool updated_Successfully = false;

            updated_Successfully = Data_Access_Layer_Facade.Instance.Clients_Update_Client_Details(
                p_Client_Id, p_Company_Name, p_Website_URL, p_Country_Id,
                p_State_Id, p_City, p_Address, p_ZipCode,
                p_Default_Currency , p_Default_Vat_Percentage, 
                p_Telephone, p_Mobile_Phone, p_Client_Type_Id,
                p_Client_Tax_Reference_Number, p_Main_Contact_FullName,
                p_Main_Contact_Email_Address, p_Main_Contact_Phone_Number,
                p_Client_From_Date, p_Client_To_Date, p_First_Contract_Date,
                p_First_Contract_Signed_With_Contact_Full_Name, p_First_Contract_Signed_In_Location_Description,
                p_Is_Active, p_Authenticated_User_ID
            );

            return updated_Successfully;
        }

        public bool Users_Update_User_Details(
            int p_User_Id, string p_Username, string p_First_Name, string p_Middle_Name,
            string p_Last_Name, string p_Email, short p_Country_Id, short? p_State_Id,
            string p_City, string p_Address, string p_ZipCode, byte? p_Default_Currency_Id, string p_Mobile_Phone,
            string p_Additional_Phone_Number, DateTime? p_Birth_Date, byte? p_Gender,
            DateTime? p_Registration_Date, string p_Azure_Container_Ref,
            string p_Heard_About_Application_From, string p_Our_Administrative_Side_Notes,
            bool p_Is_Active, int p_Authenticated_User_ID, App_Permission_Type authenticated_Permission_Type)
        {
            bool updated_Successfully = false;

            if (p_User_Id != p_Authenticated_User_ID &&
                authenticated_Permission_Type.App_Permission_Type_Id != App_Permission_Type.Permission_Type.DashboardTimeLine_Company_Employee &&
                authenticated_Permission_Type.App_Permission_Type_Id != App_Permission_Type.Permission_Type.Application_Administrator)
            {
                throw new Exception("Permission Error! The authenticated user is not permitted to get the user details");
            }

            updated_Successfully = Data_Access_Layer_Facade.Instance.Users_Update_User_Details(
                p_User_Id, p_Username, p_First_Name, p_Middle_Name,
                p_Last_Name, p_Email, p_Country_Id, p_State_Id,
                p_City, p_Address, p_ZipCode, p_Default_Currency_Id, p_Mobile_Phone,
                p_Additional_Phone_Number, p_Birth_Date, p_Gender,
                p_Registration_Date, p_Azure_Container_Ref,
                p_Heard_About_Application_From, p_Our_Administrative_Side_Notes,
                p_Is_Active, p_Authenticated_User_ID
            );

            return updated_Successfully;
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

        public List<Clients> Clients_Get_Search(
            int p_User_Id,
            short? p_Filter_By_Type,
            short? p_Filter_By_Country,
            short? p_Filter_By_State,
            string p_Filter_By_City_Or_Address_Or_ZipCode,
            string p_Filter_By_CompanyName_Or_Person_Fullname)
        {
            return Data_Access_Layer_Facade.Instance.Clients_Get_Search(
                p_User_Id,
                p_Filter_By_Type,
                p_Filter_By_Country,
                p_Filter_By_State,
                p_Filter_By_City_Or_Address_Or_ZipCode,
                p_Filter_By_CompanyName_Or_Person_Fullname);
        }

        public Clients Clients_Get_By_Id(int p_Client_Id, int p_User_Id_Client_Owner)
        {
            return Data_Access_Layer_Facade.Instance.Clients_Get_By_Id(p_Client_Id, p_User_Id_Client_Owner);
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
            return Data_Access_Layer_Facade.Instance.Clients_Insert_New_Client_Administrative_Registration_Process(
                p_User_Id, p_Company_Name, p_Website_URL, p_Country_Id,
                p_State_Id, p_City, p_Address, p_ZipCode,
                p_Default_Currency, p_Default_Vat_Percentage, 
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

        public InvoiceType InvoiceTypes_Get_By_Id(byte p_Invoice_Type_Id)
        {
            return Data_Access_Layer_Facade.Instance.InvoiceTypes_Get_By_Id(p_Invoice_Type_Id);
        }

        public InvoiceType InvoiceTypes_Get_By_Id(InvoiceType.Codes p_Invoice_Type_Id)
        {
            return Data_Access_Layer_Facade.Instance.InvoiceTypes_Get_By_Id((byte)p_Invoice_Type_Id);
        }

        public Suppliers Suppliers_Insert_New_Supplier_Administrative_Registration_Process(
            int p_User_Id, string p_Company_Name, string p_Website_URL, short p_Country_Id,
            short? p_State_Id, string p_City, string p_Address, string p_ZipCode, byte? p_Default_Currency, decimal? p_Default_Vat_Percentage,
            string p_Telephone, string p_Mobile_Phone, short p_Supplier_Type_Id,
            string p_Supplier_Tax_Reference_Number, string p_Main_Contact_FullName,
            string p_Main_Contact_Email_Address, string p_Main_Contact_Phone_Number,
            DateTime? p_Supplier_From_Date, DateTime? p_Supplier_To_Date, DateTime? p_First_Contract_Date,
            string p_First_Contract_Signed_With_Contact_Full_Name, string p_First_Contract_Signed_In_Location_Description,
            bool p_Is_Active, int p_Logged_In_Administrative_User_Id)
        {
            return Data_Access_Layer_Facade.Instance.Suppliers_Insert_New_Client_Administrative_Registration_Process(
                p_User_Id, p_Company_Name, p_Website_URL, p_Country_Id,
                p_State_Id, p_City, p_Address, p_ZipCode, p_Default_Currency, p_Default_Vat_Percentage,
                p_Telephone, p_Mobile_Phone, p_Supplier_Type_Id,
                p_Supplier_Tax_Reference_Number, p_Main_Contact_FullName,
                p_Main_Contact_Email_Address, p_Main_Contact_Phone_Number,
                p_Supplier_From_Date, p_Supplier_To_Date, p_First_Contract_Date,
                p_First_Contract_Signed_With_Contact_Full_Name, p_First_Contract_Signed_In_Location_Description,
                p_Is_Active, p_Logged_In_Administrative_User_Id);
        }

        public Suppliers Suppliers_Get_By_Supplier_Id(int p_Supplier_Id, int p_User_Id_Searching_For_Supplier_Details)
        {
            return Data_Access_Layer_Facade.Instance.Suppliers_Get_By_Supplier_Id(p_Supplier_Id, p_User_Id_Searching_For_Supplier_Details);
        }

        public List<Suppliers> Suppliers_Get_Search(
            int p_User_Id,
            short? p_Filter_By_Type,
            short? p_Filter_By_Country,
            short? p_Filter_By_State,
            string p_Filter_By_City_Or_Address_Or_ZipCode,
            string p_Filter_By_CompanyName_Or_Person_Fullname)
        {
            return Data_Access_Layer_Facade.Instance.Suppliers_Get_Search(
                p_User_Id,
                p_Filter_By_Type,
                p_Filter_By_Country,
                p_Filter_By_State,
                p_Filter_By_City_Or_Address_Or_ZipCode,
                p_Filter_By_CompanyName_Or_Person_Fullname);
        }

        public List<Suppliers> Suppliers_Get_All_By_User_Id(int p_User_Id, int p_Searching_User_Id)
        {
            return Data_Access_Layer_Facade.Instance.Suppliers_Get_All_By_User_Id(p_User_Id, p_Searching_User_Id);
        }

        public List<SupplierType> SupplierTypes_Get_All()
        {
            return Data_Access_Layer_Facade.Instance.SupplierTypes_Get_All();
        }

        public Invoices Invoices_Get_Auto_Complete_Invoice_Based_On_Client_And_DateTime_Selection(
            int p_Client_Id, DateTime p_Invoice_Invoice_DateTime, int p_User_Id_LoggedIn_Creating_Invoice)
        {
            Invoices Invoice_To_Return = new Invoices();

            if (p_Client_Id > 0 && p_User_Id_LoggedIn_Creating_Invoice > 0)
            {
                // try to get the latest Client's Invoice to auto fillup the relevant details of the page
                // ToDo -- Add data range search for possinle users who wants to slowly update/upload information and they should pick the datetime first
                var latest_Invoice = this.Invoices_Get_Invoice_Latest_Entry_Based_On_Client_Id_Selection(p_Client_Id, p_User_Id_LoggedIn_Creating_Invoice);
                if (latest_Invoice != null)
                {
                    // A latest Invoice was found for the current Client. Return the basic needed information from the latest Invoice
                    // If the Invoice has been created BEFORE the datetime the user has selected for the new Invoice then the last Invoice of the Client can be used for the autocomplete 
                    if (latest_Invoice.Invoice_DateTime < p_Invoice_Invoice_DateTime)
                    {
                        Invoice_To_Return = latest_Invoice;
                    }
                    else
                    {
                        // The Invoice the user is trying to create is older then the last Invoice for the current Client 
                        // Try to find any Invoice that can suit the auto complete accoring to the selected datetime of the user
                        var lastest_Invoice_By_DateTime = this.Invoices_Get_Invoice_Latest_Entry_Based_On_Client_Id_And_Invoice_DateTime_Selection(p_Client_Id, p_Invoice_Invoice_DateTime, p_User_Id_LoggedIn_Creating_Invoice);
                        if (lastest_Invoice_By_DateTime.Invoice_Record_Id > 0)
                        {
                            Invoice_To_Return = lastest_Invoice_By_DateTime;
                        }
                        else
                        {
                            Invoice_To_Return = latest_Invoice;
                        }
                    }
                }
                else
                {
                    // no latest Invoice was found in the database. Set the auto complete Invoice to basic Client's details
                    // Get the Client details from the database 
                    var Client_Details = this.Clients_Get_By_Id(p_Client_Id, p_User_Id_LoggedIn_Creating_Invoice);
                    if (Client_Details != null)
                    {
                        //Invoice_To_Return.
                        Invoice_To_Return.Invoiced_Client_To_CompanyName = Client_Details.Company_Name;
                        Invoice_To_Return.Invoiced_Client_To_Tax_Reference = Client_Details.Client_Tax_Reference_Number;
                        Invoice_To_Return.Invoiced_Client_To_Country_Id = Client_Details.Country_Id;
                        Invoice_To_Return.Invoiced_Client_To_State_Id = Client_Details.State_Id;
                        Invoice_To_Return.Invoiced_Client_To_City = Client_Details.City;
                        Invoice_To_Return.Invoiced_Client_To_Address = Client_Details.Address;
                        Invoice_To_Return.Invoiced_Client_To_Zip = Client_Details.ZipCode;
                        Invoice_To_Return.Invoiced_Client_To_PhoneNumber = Client_Details.Main_Contact_Phone_Number;
                        Invoice_To_Return.Invoiced_Client_To_PersonName = Client_Details.Main_Contact_FullName;

                        if (Client_Details.Default_Currency_Id.HasValue)
                        {
                            Invoice_To_Return.Currency_Id = Client_Details.Default_Currency_Id.Value;
                        }
                        else
                        {
                            // The Client has no default currency. Try to use the default currency of the Client country
                            if (Client_Details.Country_Id > 0)
                            {
                                var countryDetails = this.Countries_Get_By_Country_Id(Client_Details.Country_Id);
                                if (countryDetails.Primary_Currency_Id.HasValue)
                                {
                                    Invoice_To_Return.Currency_Id = countryDetails.Primary_Currency_Id.Value;
                                }
                                else
                                {
                                    // The country has no primary currency information. 
                                    // Resort to USD as default currency. 
                                    Invoice_To_Return.Currency_Id = 1;
                                }
                            }
                            else
                            {
                                // The Client has no country information. 
                                // Resort to USD as default currency. 
                                Invoice_To_Return.Currency_Id = 1;
                            }

                        }

                        if (Client_Details.Country_Id > 0)
                        {
                            //var latest_Vat_History_Of_Country = Data_Access_Layer_Facade.Countries_Vat_History_Get_By_Country
                            var latest_Vat_History_Of_Country = Data_Access_Layer_Facade.Instance.Countries_Vat_History_Get_By_Country_And_Date(Client_Details.Country_Id, p_Invoice_Invoice_DateTime);
                            Invoice_To_Return.Vat_Percentage = latest_Vat_History_Of_Country.Vat_Percentage;
                        }
                    }
                }
            }

            return Invoice_To_Return;
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
            return Data_Access_Layer_Facade.Instance.GeneralDocuments_Update_Document_Details(
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
            return Data_Access_Layer_Facade.Instance.Suppliers_Update_Supplier_Details(
                p_Supplier_Id, p_Company_Name, p_Website_URL, p_Country_Id,
                p_State_Id, p_City, p_Address, p_ZipCode, p_Default_Currency_Id, p_Default_Vat_Percentage,
                p_Telephone, p_Mobile_Phone, p_Supplier_Type_Id,
                p_Supplier_Tax_Reference_Number, p_Main_Contact_FullName,
                p_Main_Contact_Email_Address, p_Main_Contact_Phone_Number,
                p_Supplier_From_Date, p_Supplier_To_Date, p_First_Contract_Date,
                p_First_Contract_Signed_With_Contact_Full_Name, p_First_Contract_Signed_In_Location_Description,
                p_Is_Active, p_Updating_User_Id);
        }

        public List<Expenses> Expenses_Get_Search(
            int p_User_Id,
            short? p_Filter_By_Type,
            short? p_Filter_By_Country,
            short? p_Filter_By_State,
            string p_Filter_By_City_Or_Address_Or_ZipCode,
            string p_Filter_By_CompanyName_Or_Person_Fullname)
        {
            return Data_Access_Layer_Facade.Instance.Expenses_Get_Search(
                p_User_Id,
                p_Filter_By_Type,
                p_Filter_By_Country,
                p_Filter_By_State,
                p_Filter_By_City_Or_Address_Or_ZipCode,
                p_Filter_By_CompanyName_Or_Person_Fullname);
        }

        public Expenses Expenses_Get_Auto_Complete_Expense_Based_On_Supplier_And_DateTime_Selection(int p_Supplier_Id, DateTime p_Expense_Invoice_DateTime, int p_User_Id_LoggedIn_Creating_Expense)
        {
            Expenses expense_To_Return = new Expenses();

            if (p_Supplier_Id > 0 && p_User_Id_LoggedIn_Creating_Expense > 0)
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
                    if (supplier_Details != null)
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
                        else
                        {
                            // The supplier has no default currency. Try to use the default currency of the supplier country
                            if (supplier_Details.Country_Id > 0)
                            {
                                var countryDetails = this.Countries_Get_By_Country_Id(supplier_Details.Country_Id);
                                if (countryDetails.Primary_Currency_Id.HasValue)
                                {
                                    expense_To_Return.Currency_Id = countryDetails.Primary_Currency_Id.Value;
                                }
                                else
                                {
                                    // The country has no primary currency information. 
                                    // Resort to USD as default currency. 
                                    expense_To_Return.Currency_Id = 1;
                                }
                            }
                            else
                            {
                                // The supplier has no country information. 
                                // Resort to USD as default currency. 
                                expense_To_Return.Currency_Id = 1;
                            }

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
            int p_User_Id_Expense_Owner, string p_Original_File_Name, byte[] p_File_Content_To_Save_In_Azure,
            bool p_Is_Visible_To_Anonymous_Users, bool p_Is_Available_For_Download_For_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users, bool p_Is_Available_For_Download_For_Followers_Users,
            int p_Updating_User_Id, App_Permission_Type p_Authenticated_User_Permission_Type,  bool p_Is_Active)
        {
            this.Validate_Operation_For_Authenticated_User(
                p_User_Id_Expense_Owner,
                p_Updating_User_Id,
                p_Authenticated_User_Permission_Type );

            bool l_File_Uploaded = false;
            bool l_Error_Occured_During_Azure_Operations = false;
            string l_New_Azure_Block_Blob_Reference = string.Empty;

            if (!string.IsNullOrEmpty(p_Original_File_Name) && p_File_Content_To_Save_In_Azure.Length > 0)
            {
                // A new file has been uploaded for the expense. 
                // the previous file needs to be deleted from azure and the new one should be uploaded and connected with the update process
                Users user_Details = this.Users_Get_Details_By_User_Id(
                    p_User_Id_Expense_Owner,
                    p_Updating_User_Id,
                    p_Authenticated_User_Permission_Type);

                string l_Azure_Container_Reference = user_Details.Azure_Container_Ref;

                Expenses expense_Details = this.Expenses_Get_By_Id(
                    p_Expense_Record_Id,
                    p_User_Id_Expense_Owner,
                    p_Updating_User_Id,
                    p_Authenticated_User_Permission_Type);

                string l_Expense_Azure_Block_Blob_Reference = expense_Details.Azure_Block_Blob_Reference;
                if (!string.IsNullOrEmpty(l_Expense_Azure_Block_Blob_Reference))
                {
                    // Try to first upload the new expense file, If successfull then try to delete as well. 
                    l_New_Azure_Block_Blob_Reference =  Azure_Integration.Instance.Upload_File_To_Azure_Storage_Blob_Container(
                        p_File_Content_To_Save_In_Azure,
                        p_Original_File_Name,
                        l_Azure_Container_Reference);

                    if (!string.IsNullOrEmpty(l_New_Azure_Block_Blob_Reference))
                    {
                        l_File_Uploaded = true;

                        bool l_Deleted_Successfully = Azure_Integration.Instance.Delete_File_From_Azure_Storage_Blob_Container(
                        l_Expense_Azure_Block_Blob_Reference, l_Azure_Container_Reference);

                        if (!l_Deleted_Successfully )
                        {
                            // ToDo -- Log exception that a file was uploaded but the previous file was not deleted.. 
                        }
                    }
                }
                else
                {
                    // There is no azure block blob reference for the current expense, so there is nothing to delete.
                }
            }

            return Data_Access_Layer_Facade.Instance.Expenses_Update_Expense_Details(
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
                p_Original_File_Name, l_New_Azure_Block_Blob_Reference, l_File_Uploaded,
                p_Is_Visible_To_Anonymous_Users, p_Is_Available_For_Download_For_Anonymous_Users,
                p_Is_Visible_To_Followers_Users, p_Is_Available_For_Download_For_Followers_Users,
                p_Updating_User_Id, p_Is_Active);
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
            return Data_Access_Layer_Facade.Instance.Invoices_Update_Invoice_Details(
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
            string p_Original_File_Name, byte[] p_File_Content_To_Save_In_Azure,
            bool p_Is_Visible_To_Anonymous_Users, bool p_Is_Available_For_Download_For_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users, bool p_Is_Available_For_Download_For_Followers_Users,
            int p_Record_Created_By_User_Id,
            App_Permission_Type p_Creating_User_Permission,
            bool p_Is_Active
            )
        {
            Expenses new_Created_Expenses_To_Return = null;

            this.Validate_Operation_For_Authenticated_User(p_User_Id, p_Record_Created_By_User_Id, p_Creating_User_Permission);

            // Try to save in azure and if successfull, get the Azure_Block_Blob_Reference 
            string p_Azure_Block_Blob_Reference = string.Empty;
            bool l_Process_Tried_To_Upload_File_And_Failed = false;

            if (p_File_Content_To_Save_In_Azure != null && p_File_Content_To_Save_In_Azure.Length > 0)
            {
                string l_Azure_Block_Blob_Uploaded_Reference
                    = this.Upload_File_To_Azure(
                        p_File_Content_To_Save_In_Azure,
                        p_Original_File_Name,
                        p_User_Id,
                        p_Record_Created_By_User_Id,
                        p_Creating_User_Permission);

                if (!string.IsNullOrEmpty(l_Azure_Block_Blob_Uploaded_Reference))
                {
                    // File uploaded to azure successfully
                    p_Azure_Block_Blob_Reference = l_Azure_Block_Blob_Uploaded_Reference;
                }
                else
                {
                    // Azure upload process has failed. The user should get an alert and insert process should be stopped.
                    l_Process_Tried_To_Upload_File_And_Failed = true;
                }
            }

            if (l_Process_Tried_To_Upload_File_And_Failed)
            {
                throw new Exception("Failed to upload the file :( Please try again later or contact us!");
            }

            try
            {
                new_Created_Expenses_To_Return = Data_Access_Layer_Facade.Instance.Expenses_Insert_New_Expense(
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
                p_Record_Created_By_User_Id, p_Is_Active
                );
            }
            catch (Exception exc)
            {
                // Exception occured during database operation. 
                // If the document was stored in azure it needs to be deleted to avoid unreferenced files
                if (!l_Process_Tried_To_Upload_File_And_Failed &&
                    !string.IsNullOrEmpty(p_Azure_Block_Blob_Reference))
                {
                    this.Delete_Azure_Uploaded_File(
                        p_Azure_Block_Blob_Reference,
                        p_User_Id,
                        p_Record_Created_By_User_Id,
                        p_Creating_User_Permission);
                }
            }

            return new_Created_Expenses_To_Return;
        }

        private void Validate_Permissions_For_Authenticated_User_On_User(
            int p_On_User_Id,
            int p_Authenticated_User_Id,
            App_Permission_Type p_Authenticated_User_Permission
            )
        {
            if (p_On_User_Id != p_Authenticated_User_Id &&
                p_Authenticated_User_Permission.App_Permission_Type_Id != App_Permission_Type.Permission_Type.Application_Administrator &&
                p_Authenticated_User_Permission.App_Permission_Type_Id != App_Permission_Type.Permission_Type.DashboardTimeLine_Company_Employee)
            {
                throw new Exception("Permission Error! The authenticated user is not permitted to get the user details");
            }
        }

        public Expenses Expenses_Get_By_Id(
            int p_Expense_Record_Id,
            int p_User_Id_Expense_Owner,
            int p_Authenticated_User_Id,
            App_Permission_Type p_Authenticated_User_Permission)
        {
            this.Validate_Operation_For_Authenticated_User(
                p_User_Id_Expense_Owner,
                p_Authenticated_User_Id,
                p_Authenticated_User_Permission);

            return Data_Access_Layer_Facade.Instance.Expenses_Get_By_Id(p_Expense_Record_Id, p_User_Id_Expense_Owner);
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
            string p_User_Comments, 
            string p_Original_File_Name, byte[] p_File_Content_To_Save_In_Azure,
            bool p_Is_Visible_To_Anonymous_Users, bool p_Is_Available_For_Download_For_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users, bool p_Is_Available_For_Download_For_Followers_Users,
            int p_Record_Created_By_User_Id, App_Permission_Type p_Creating_User_Permission,
            bool p_Is_Active
            )
        {
            Invoices new_Created_Invoice_To_Return = null;

            this.Validate_Operation_For_Authenticated_User(p_User_Id, p_Record_Created_By_User_Id, p_Creating_User_Permission);

            // Try to save in azure and if successfull, get the Azure_Block_Blob_Reference 
            string p_Azure_Block_Blob_Reference = string.Empty;
            bool l_Process_Tried_To_Upload_File_And_Failed = false;

            if (p_File_Content_To_Save_In_Azure != null && p_File_Content_To_Save_In_Azure.Length > 0)
            {
                string l_Azure_Block_Blob_Uploaded_Reference
                    = this.Upload_File_To_Azure(
                        p_File_Content_To_Save_In_Azure,
                        p_Original_File_Name,
                        p_User_Id,
                        p_Record_Created_By_User_Id,
                        p_Creating_User_Permission);

                if (!string.IsNullOrEmpty(l_Azure_Block_Blob_Uploaded_Reference))
                {
                    // File uploaded to azure successfully
                    p_Azure_Block_Blob_Reference = l_Azure_Block_Blob_Uploaded_Reference;
                }
                else
                {
                    // Azure upload process has failed. The user should get an alert and insert process should be stopped.
                    l_Process_Tried_To_Upload_File_And_Failed = true;
                }
            }

            if (l_Process_Tried_To_Upload_File_And_Failed)
            {
                throw new Exception("Failed to upload the file :( Please try again later or contact us!");
            }

            try
            {
                new_Created_Invoice_To_Return = Data_Access_Layer_Facade.Instance.Invoices_Insert_New_Invoice_Details(
                p_User_Id, p_Client_Id, p_Invoice_DateTime, p_Currency_Id, p_Total_Amount, p_Vat_Percentage,
                p_Total_Without_Vat, p_Total_Vat, p_Creation_DateTime, p_Invoiced_Client_On_User_Location_Id, p_Invoiced_Client_To_CompanyName,
                p_Invoiced_Client_To_Tax_Reference, p_Invoiced_Client_To_PersonName,
                p_Invoiced_Client_To_PhoneNumber, p_Invoiced_Client_To_Country_Id,
                p_Invoiced_Client_To_State_Id, p_Invoiced_Client_To_City, p_Invoiced_Client_To_Address, p_Invoiced_Client_To_Zip,
                p_Invoiced_Client_To_EmailAddress, p_Invoice_Type_Id, p_Invoice_Number, p_Invoice_Reference_Number,
                p_Invoice_Content_Long_Description, p_User_Description,
                p_User_Comments, p_Original_File_Name, p_Azure_Block_Blob_Reference,
                p_Is_Visible_To_Anonymous_Users, p_Is_Available_For_Download_For_Anonymous_Users,
                p_Is_Visible_To_Followers_Users, p_Is_Available_For_Download_For_Followers_Users,
                p_Record_Created_By_User_Id, 
                p_Is_Active
                );
            }
            catch(Exception exc)
            {

            }

            return new_Created_Invoice_To_Return;
        }

        public Expenses Expenses_Get_Expense_Latest_Entry_Based_On_Supplier_Id_Selection(int p_Supplier_Id, int p_User_Id_LoggedIn_Creating_Expense)
        {
            return Data_Access_Layer_Facade.Instance.Expenses_Get_Expense_Latest_Entry_Based_On_Supplier_Id_Selection(p_Supplier_Id, p_User_Id_LoggedIn_Creating_Expense);
        }

        public Invoices Invoices_Get_Invoice_Latest_Entry_Based_On_Client_Id_Selection(int p_Client_Id, int p_User_Id_LoggedIn_Creating_Invoice)
        {
            return Data_Access_Layer_Facade.Instance.Invoices_Get_Invoice_Latest_Entry_Based_On_Client_Id_Selection(p_Client_Id, p_User_Id_LoggedIn_Creating_Invoice);
        }

        public Expenses Expenses_Get_Expense_Latest_Entry_Based_On_Supplier_Id_And_Expense_DateTime_Selection(int p_Supplier_Id, DateTime p_Expense_DateTime, int p_User_Id_LoggedIn_Creating_Expense)
        {
            return Data_Access_Layer_Facade.Instance.Expenses_Get_Expense_Latest_Entry_Based_On_Supplier_Id_And_Expense_DateTime_Selection(
                p_Supplier_Id,
                p_Expense_DateTime,
                p_User_Id_LoggedIn_Creating_Expense);
        }

        public Invoices Invoices_Get_Invoice_Latest_Entry_Based_On_Client_Id_And_Invoice_DateTime_Selection(int p_Client_Id, DateTime p_Invoice_DateTime, int p_User_Id_LoggedIn_Creating_Invoice)
        {
            return Data_Access_Layer_Facade.Instance.Invoices_Get_Invoice_Latest_Entry_Based_On_Client_Id_And_Invoice_DateTime_Selection(
                p_Client_Id,
                p_Invoice_DateTime,
                p_User_Id_LoggedIn_Creating_Invoice);
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
            return Data_Access_Layer_Facade.Instance.GeneralDocuments_Insert_New_General_Document_Details(
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

        public Bank_Account_Transactions BankAccount_Transactions_Get_Transaction_Details_By_Transaction_Id(
                    long p_Bank_Account_Transaction_Id,
                    int p_User_Id_Bank_Account_Transaction_Owner,
                    int p_User_Id_Searching_For_Bank_Account_Transaction_Details)
        {
            return Data_Access_Layer_Facade.Instance.BankAccount_Transactions_Get_Transaction_Details_By_Transaction_Id(
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
            return Data_Access_Layer_Facade.Instance.BankAccount_Transactions_Insert_New_Transaction_Details(
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
            return Data_Access_Layer_Facade.Instance.BankAccount_Transactions_Update_Transaction_Details(
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
            return Data_Access_Layer_Facade.Instance.BankAccount_Transactions_Update_Transaction_Details(
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

        public Bank_Account_Transactions_Response_For_UI BankAccount_Transactions_Get_Transactions_By_Bank_Account_Id_And_User_Id_As_DataTable(
            int p_Page_Number,
            int p_Rows_Per_Page,
            int p_Bank_Account_Id,
            int p_User_Id_Bank_Account_Owner,
            int p_User_Id_Searching_For_Bank_Account_Transactions)
        {
            DataTable transactions_Data_Table = this.Initialize_BankAccount_Transactions_DataTable();

            Bank_Account_Transactions_Response_For_UI response_From_DB = Data_Access_Layer_Facade.Instance.BankAccount_Transactions_Get_Transactions_By_Bank_Account_Id_And_User_Id(
                    p_Page_Number,
                    p_Rows_Per_Page,
                    p_Bank_Account_Id,
                    p_User_Id_Bank_Account_Owner,
                    p_User_Id_Searching_For_Bank_Account_Transactions
                );

            List<Bank_Account_Transactions> transactions = response_From_DB.Bank_Account_Transactions_From_DB;

            for (int i = 0; i < transactions.Count; i++)
            {
                this.BankAccount_Transactions_Insert_Transaction_To_DataTable(transactions_Data_Table, transactions[i]);
            }

            // Clear unnecessary memory allocation as UI will use DataTable (for now..)
            response_From_DB.Bank_Account_Transactions_From_DB = null;

            response_From_DB.Bank_Account_Transactions_DataTable = transactions_Data_Table;

            return response_From_DB;
        }

        private DataTable Initialize_BankAccount_Transactions_DataTable()
        {
            DataTable transaction_Data_Table = new DataTable();

            transaction_Data_Table.Columns.Add("Bank_Account_Transaction_Id", typeof(int));
            transaction_Data_Table.Columns.Add("Bank_Account_Id", typeof(int));
            transaction_Data_Table.Columns.Add("Transaction_Account_Balance", typeof(decimal));
            transaction_Data_Table.Columns.Add("Transaction_Actual_DateTime", typeof(DateTime));
            transaction_Data_Table.Columns.Add("Positive_Amount_Entered", typeof(decimal));
            transaction_Data_Table.Columns.Add("Negative_Amount_Paid", typeof(decimal));
            transaction_Data_Table.Columns.Add("Transaction_Value_DateTime", typeof(DateTime));
            transaction_Data_Table.Columns.Add("Reference_Number", typeof(string));
            transaction_Data_Table.Columns.Add("Transaction_Bank_Description", typeof(string));
            transaction_Data_Table.Columns.Add("Transaction_Bank_Inner_Reference_Code", typeof(string));
            transaction_Data_Table.Columns.Add("Is_Visible_To_Anonymous_Users", typeof(bool));
            transaction_Data_Table.Columns.Add("Is_Visible_To_Followers_Users", typeof(bool));
            transaction_Data_Table.Columns.Add("Pending_Changes", typeof(bool));
            transaction_Data_Table.Columns.Add("Is_New_Record", typeof(bool));
            transaction_Data_Table.Columns.Add("Is_Deleted", typeof(bool));
            transaction_Data_Table.Columns.Add("Has_Error", typeof(bool));

            return transaction_Data_Table;
        }

        private void BankAccount_Transactions_Insert_Transaction_To_DataTable(
            DataTable transactions_Table,
            Bank_Account_Transactions transaction_To_Insert)
        {
            DataRow new_Transaction_Row = transactions_Table.NewRow();

            new_Transaction_Row["Bank_Account_Transaction_Id"] = transaction_To_Insert.Bank_Account_Transaction_Id;
            new_Transaction_Row["Bank_Account_Id"] = transaction_To_Insert.Bank_Account_Id;
            new_Transaction_Row["Transaction_Account_Balance"] = transaction_To_Insert.Transaction_Account_Balance;
            new_Transaction_Row["Transaction_Actual_DateTime"] = transaction_To_Insert.Transaction_Actual_DateTime;
            new_Transaction_Row["Positive_Amount_Entered"] = transaction_To_Insert.Positive_Amount_Entered;
            new_Transaction_Row["Negative_Amount_Paid"] = transaction_To_Insert.Negative_Amount_Paid;

            if (transaction_To_Insert.Transaction_Value_DateTime.HasValue)
                new_Transaction_Row["Transaction_Value_DateTime"] = transaction_To_Insert.Transaction_Value_DateTime;
            else
                new_Transaction_Row["Transaction_Value_DateTime"] = DBNull.Value;

            new_Transaction_Row["Reference_Number"] = transaction_To_Insert.Reference_Number;
            new_Transaction_Row["Transaction_Bank_Description"] = transaction_To_Insert.Transaction_Bank_Description;
            new_Transaction_Row["Transaction_Bank_Inner_Reference_Code"] = transaction_To_Insert.Transaction_Bank_Inner_Reference_Code;

            new_Transaction_Row["Is_Visible_To_Anonymous_Users"] = transaction_To_Insert.Is_Visible_To_Anonymous_Users;
            new_Transaction_Row["Is_Visible_To_Followers_Users"] = transaction_To_Insert.Is_Visible_To_Followers_Users;

            new_Transaction_Row["Pending_Changes"] = false;
            new_Transaction_Row["Is_New_Record"] = false;
            new_Transaction_Row["Is_Deleted"] = false;
            new_Transaction_Row["Has_Error"] = false;

            transactions_Table.Rows.Add(new_Transaction_Row);
        }

        public bool BankAccount_Transactions_Delete_Transaction(
            int p_Bank_Account_Id,
            long p_Bank_Account_Transaction_Id,
            int p_Updating_User_Id)
        {
            return Data_Access_Layer_Facade.Instance.BankAccount_Transactions_Delete_Transaction(
                    p_Bank_Account_Id,
                    p_Bank_Account_Transaction_Id,
                    p_Updating_User_Id
                );
        }

        public List<Bank_Accounts> BankAccounts_Get_Search(int p_User_Id)
        {
            return Data_Access_Layer_Facade.Instance.BankAccounts_Get_Search(p_User_Id);
        }

        public List<Bank_Accounts> Get_All_By_User_Id(int p_User_Id_To_Return_Bank_Accounts, int p_Authenticated_User_ID)
        {
            return this.BankAccounts_Get_Search(p_User_Id_To_Return_Bank_Accounts);
        }

        public Bank_Accounts BankAccounts_Get_Bank_Account_Details(int p_Bank_Account_Id, int p_User_Id_Bank_Account_Owner)
        {
            return Data_Access_Layer_Facade.Instance.BankAccounts_Get_Bank_Account_Details(p_Bank_Account_Id, p_User_Id_Bank_Account_Owner);
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
            return Data_Access_Layer_Facade.Instance.BankAccounts_Insert_New_Bank_Account_Details(
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
            return Data_Access_Layer_Facade.Instance.BankAccounts_Update_Bank_Account_Details(
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

        public string Upload_File_To_Azure(
            byte[] p_File_Content,
            string p_File_Name,
            string p_Azure_Container_Name)
        {
            string new_Blob_Reference =
                Azure_Integration.Instance.Upload_File_To_Azure_Storage_Blob_Container(
                    p_File_Content,
                    p_File_Name,
                    p_Azure_Container_Name);

            return new_Blob_Reference;
        }

        public string Upload_File_To_Azure(
            byte[] p_File_Content,
            string p_File_Name,
            int p_Upload_For_User_Id,
            int p_Authenticated_User_Id,
            App_Permission_Type p_Authenticated_User_Permission
            )
        {
            string l_Uploaded_Azure_Block_Blob_Reference = string.Empty;

            var user_Details = this.Users_Get_Details_By_User_Id(p_Upload_For_User_Id, p_Authenticated_User_Id, p_Authenticated_User_Permission);

            if (user_Details != null)
            {
                string l_User_Azure_Container_Reference = user_Details.Azure_Container_Ref;

                l_Uploaded_Azure_Block_Blob_Reference = this.Upload_File_To_Azure(p_File_Content, p_File_Name, l_User_Azure_Container_Reference);
            }

            return l_Uploaded_Azure_Block_Blob_Reference;
        }

        public bool Delete_Azure_Uploaded_File(
            string p_Azure_Block_Blob_Reference,
            int p_Upload_For_User_Id,
            int p_Authenticated_User_Id,
            App_Permission_Type p_Authenticated_User_Permission
            )
        {
            bool l_Deleted_Successfully = false;

            var user_Details = this.Users_Get_Details_By_User_Id(p_Upload_For_User_Id, p_Authenticated_User_Id, p_Authenticated_User_Permission);

            if (user_Details != null)
            {
                string l_User_Azure_Container_Reference = user_Details.Azure_Container_Ref;

                l_Deleted_Successfully = Azure_Integration.Instance.Delete_File_From_Azure_Storage_Blob_Container(
                    p_Azure_Block_Blob_Reference,
                    l_User_Azure_Container_Reference);
            }

            return l_Deleted_Successfully;
        }

        public Expense_Auto_Complete_Suggestion_Based_On_Uploaded_File_Name_As_Response_For_UI
            Expenses_Get_AutoComplete_Suggestion_Based_On_Uploaded_FileName(
                string p_Uploaded_File_Name,
                int p_User_Id,
                int p_Authenticated_User_Id)
        {
            Expense_Auto_Complete_Suggestion_Based_On_Uploaded_File_Name_As_Response_For_UI suggestions_To_Return
                = new Expense_Auto_Complete_Suggestion_Based_On_Uploaded_File_Name_As_Response_For_UI();

            // The following formats are supported:
            /*
                14.04.2021 - Total 44.88 nis - pelephone - mobile services for 15.03.2021 - 14.04.2021.pdf
                18.02.2021 1825 - Total 273.91 nis - Mega Kimonaut Ltd - Groceries food and general items.pdf
            */

            // Algorithm description:
            /*
                1) Try to extract date from the first part
                2) If date extraction passed -- try to extract total value
                3) If total value extracted try to extract supplier reference (Search for a supplier based on the first words until 1 supplier is found)
                4) If there is more content after the found supplier - use it as decription response
                    If a supplier was not found, use the description - if there is any.
                
                For the vat value / total amounts -- If a date and a supplier was extracted, Use the supplier's country/state vat value. 
                If no supplier was found, Use the default vat value/totals from the user's country 
                If a currency code was found in step 2 of the total amount extraction -- use this currency. 
                If a currency was not detected, Use the default currency of the user
             */
            string step_Description_For_Exception_Logging = "Start";
            try
            {
                // 1) Try to extract date from the first part
                step_Description_For_Exception_Logging = "Date extraction";
                string date_String_Extracted =
                    p_Uploaded_File_Name.Substring(0, p_Uploaded_File_Name.IndexOf("-"));

                // Check if the date_String contains hours/minutes
                string hours_String_Extracted = "";
                string minutes_String_Extracted = "";
                if (date_String_Extracted.Length > 12)
                {
                    if (date_String_Extracted.IndexOf(" ") > -1)
                    {
                        hours_String_Extracted = date_String_Extracted.Substring(date_String_Extracted.IndexOf(" ") + 1, 2);
                        minutes_String_Extracted = date_String_Extracted.Substring(date_String_Extracted.IndexOf(" ") + 3, 2);

                        date_String_Extracted = date_String_Extracted.Substring(0, date_String_Extracted.IndexOf(" ") + 1).Trim();
                    }
                }

                if (string.IsNullOrEmpty(hours_String_Extracted) || string.IsNullOrEmpty(minutes_String_Extracted))
                {
                    hours_String_Extracted = "0";
                    minutes_String_Extracted = "0";
                }

                step_Description_For_Exception_Logging = "Date extraction - Parsing date as dd.MM.yyyy";
                DateTime parsedDate = DateTime.ParseExact(date_String_Extracted, "dd.MM.yyyy", null, System.Globalization.DateTimeStyles.None);

                parsedDate = parsedDate.AddHours(double.Parse(hours_String_Extracted));
                parsedDate = parsedDate.AddMinutes(double.Parse(minutes_String_Extracted));

                suggestions_To_Return.Expense_Invoice_DateTime = parsedDate;
            }
            catch (Exception exc)
            {

            }

            // 2) If date extraction passed -- try to extract total value
            if (suggestions_To_Return.Expense_Invoice_DateTime.HasValue)
            {
                try
                {
                    step_Description_For_Exception_Logging = "Extracting Total Value + currency";

                    int l_Total_Value_Expression_From_Index = p_Uploaded_File_Name.IndexOf("- ") + 2;
                    int l_Total_Value_Expression_To_Index = p_Uploaded_File_Name.IndexOf(" -", l_Total_Value_Expression_From_Index);

                    string total_Value_With_Currency_Expression_Extracted
                        = p_Uploaded_File_Name.Substring(l_Total_Value_Expression_From_Index, l_Total_Value_Expression_To_Index - l_Total_Value_Expression_From_Index);

                    total_Value_With_Currency_Expression_Extracted = total_Value_With_Currency_Expression_Extracted.ToLower();
                    if (total_Value_With_Currency_Expression_Extracted.IndexOf("total ") > -1)
                    {
                        total_Value_With_Currency_Expression_Extracted = total_Value_With_Currency_Expression_Extracted.Replace("total ", "");
                    }

                    if (total_Value_With_Currency_Expression_Extracted.IndexOf(" ") > -1)
                    {
                        total_Value_With_Currency_Expression_Extracted = total_Value_With_Currency_Expression_Extracted.TrimStart().TrimEnd();
                    }

                    step_Description_For_Exception_Logging = "Extracting Total Value + currency - part 2 parsing";
                    string total_Value_Only_From_Extracted_Expression = total_Value_With_Currency_Expression_Extracted.Split(' ')[0];

                    total_Value_Only_From_Extracted_Expression = total_Value_Only_From_Extracted_Expression.Trim();

                    decimal parsed_Extracted_Total_Value = decimal.Parse(total_Value_Only_From_Extracted_Expression);

                    Currencies parsed_Currency = null;

                    if (total_Value_With_Currency_Expression_Extracted.IndexOf(" ") > -1)
                    {
                        string currency_Code_From_Extracted_Expression = total_Value_With_Currency_Expression_Extracted.Split(' ')[1];
                        currency_Code_From_Extracted_Expression = currency_Code_From_Extracted_Expression.Trim();

                        parsed_Currency = this.Currencies_Get_By_Code(currency_Code_From_Extracted_Expression);
                    }

                    suggestions_To_Return.Total_Amount = parsed_Extracted_Total_Value;

                    if (parsed_Currency != null)
                    {
                        suggestions_To_Return.Currency_Id = parsed_Currency.Currency_Id;
                    }
                }
                catch (Exception exc)
                {

                }

                step_Description_For_Exception_Logging = "Extracting Supplier - start";

                try
                {
                    int starting_Index_Supplier_Details = p_Uploaded_File_Name.IndexOf('-', p_Uploaded_File_Name.IndexOf('-') + 1) + 1;
                    int length_Supplier_Name_Details_For_Extraction = p_Uploaded_File_Name.IndexOf('-', starting_Index_Supplier_Details) - starting_Index_Supplier_Details;
                    string supplier_Details_Extracted = p_Uploaded_File_Name.Substring(starting_Index_Supplier_Details, length_Supplier_Name_Details_For_Extraction);

                    supplier_Details_Extracted = supplier_Details_Extracted.Trim();

                    step_Description_For_Exception_Logging = "Extracting Supplier - by splitting white spaces vesus db suppliers list";

                    var supplier_Details_Entity = this.Try_To_Find_Supplier_Id_By_Supplier_Details_From_Filename(
                        supplier_Details_Extracted,
                        p_User_Id,
                        p_Authenticated_User_Id
                        );

                    if (supplier_Details_Entity != null)
                    {
                        suggestions_To_Return.Supplier_Id = supplier_Details_Entity.Supplier_Id;

                        // if the supplier has a default vat value then set it for suggestions and try to auto fill other total amount parts.
                        if (supplier_Details_Entity.Default_Vat_Percentage.HasValue &&
                            supplier_Details_Entity.Default_Vat_Percentage.Value > 0 &&
                            suggestions_To_Return.Total_Amount.HasValue &&
                            suggestions_To_Return.Total_Amount.Value > 0)
                        {
                            //suggestions_To_Return.Total_Vat  supplier_Details_Entity.Default_Vat_Percentage
                            suggestions_To_Return.Vat_Percentage = supplier_Details_Entity.Default_Vat_Percentage;
                        }
                        else
                        {
                            // The supplier might not have default vat value but this invoice might still be with vat value.. 
                            // Take the latest vat value of the current country and use it as the default vat percentage for calculation
                            decimal country_Vat_Value = this.Countries_Get_Latest_Vat_Value_By_Country_Id(supplier_Details_Entity.Country_Id);
                            suggestions_To_Return.Vat_Percentage = country_Vat_Value;
                        }

                        if (suggestions_To_Return.Vat_Percentage.HasValue &&
                            suggestions_To_Return.Vat_Percentage.Value > 0 &&
                            suggestions_To_Return.Total_Amount.HasValue &&
                            suggestions_To_Return.Total_Amount.Value > 0)
                        {
                            suggestions_To_Return.Total_Without_Vat =
                                suggestions_To_Return.Total_Amount / ((suggestions_To_Return.Vat_Percentage + 100) / 100);
                            suggestions_To_Return.Total_Vat = suggestions_To_Return.Total_Amount - suggestions_To_Return.Total_Without_Vat;
                        }
                    }
                }
                catch (Exception exc)
                {

                }
            }

            // Try to extract invoice description 
            step_Description_For_Exception_Logging = "Extracting invoice content description - start";
            try
            {
                string l_Invoice_Description = p_Uploaded_File_Name.Substring(p_Uploaded_File_Name.LastIndexOf("-") + 1, p_Uploaded_File_Name.LastIndexOf(".") - p_Uploaded_File_Name.LastIndexOf("-"));
                l_Invoice_Description = l_Invoice_Description.Trim();
                suggestions_To_Return.Invoice_Content_Long_Description = l_Invoice_Description;
            }
            catch (Exception exc)
            {

            }

            return suggestions_To_Return;
        }

        public Invoice_Auto_Complete_Suggestion_Based_On_Uploaded_File_Name_As_Response_For_UI
            Invoices_Get_AutoComplete_Suggestion_Based_On_Uploaded_FileName(
                string p_Uploaded_File_Name,
                int p_User_Id,
                int p_Authenticated_User_Id)
        {
            Invoice_Auto_Complete_Suggestion_Based_On_Uploaded_File_Name_As_Response_For_UI suggestions_To_Return
                = new Invoice_Auto_Complete_Suggestion_Based_On_Uploaded_File_Name_As_Response_For_UI();

            // The following formats are supported:
            /*
                21.07.2011 - Inv 153 - Total 13509 nis - TopUp Ltd - 108 dev hours on june 2011 + 2k nis eldan car credit offsets.pdf
                12.03.2012 - Tax Invoice 10040 - Total 47625 nis (12500 USD, NO VAT) - SellMyCastle.com.au - Final closing payment.pdf
            */

            // Algorithm description:
            /*
                1) Try to extract date from the first part
                2) If date extraction passed -- try to extract total value
                3) If total value extracted try to extract Client reference (Search for a Client based on the first words until 1 Client is found)
                4) If there is more content after the found Client - use it as decription response
                    If a Client was not found, use the description - if there is any.
                
                For the vat value / total amounts -- If a date and a Client was extracted, Use the Client's country/state vat value. 
                If no Client was found, Use the default vat value/totals from the user's country 
                If a currency code was found in step 2 of the total amount extraction -- use this currency. 
                If a currency was not detected, Use the default currency of the user
             */

            string step_Description_For_Exception_Logging = "Start";
            try
            {
                // 1) Try to extract date from the first part
                step_Description_For_Exception_Logging = "Date extraction";
                string date_String_Extracted =
                    p_Uploaded_File_Name.Substring(0, p_Uploaded_File_Name.IndexOf("-"));

                // Check if the date_String contains hours/minutes
                string hours_String_Extracted = "";
                string minutes_String_Extracted = "";
                if (date_String_Extracted.Length > 12)
                {
                    if (date_String_Extracted.IndexOf(" ") > -1)
                    {
                        hours_String_Extracted = date_String_Extracted.Substring(date_String_Extracted.IndexOf(" ") + 1, 2);
                        minutes_String_Extracted = date_String_Extracted.Substring(date_String_Extracted.IndexOf(" ") + 3, 2);

                        date_String_Extracted = date_String_Extracted.Substring(0, date_String_Extracted.IndexOf(" ") + 1).Trim();
                    }
                }

                if (string.IsNullOrEmpty(hours_String_Extracted) || string.IsNullOrEmpty(minutes_String_Extracted))
                {
                    hours_String_Extracted = "0";
                    minutes_String_Extracted = "0";
                }

                step_Description_For_Exception_Logging = "Date extraction - Parsing date as dd.MM.yyyy";
                date_String_Extracted = date_String_Extracted.Trim();

                DateTime parsedDate = DateTime.ParseExact(date_String_Extracted, "dd.MM.yyyy", null, System.Globalization.DateTimeStyles.None);

                parsedDate = parsedDate.AddHours(double.Parse(hours_String_Extracted));
                parsedDate = parsedDate.AddMinutes(double.Parse(minutes_String_Extracted));

                suggestions_To_Return.Invoice_DateTime = parsedDate;
            }
            catch (Exception exc)
            {

            }

            // 2) If date extraction passed -- try to extract invoice type and invoice reference number
            if (suggestions_To_Return.Invoice_DateTime.HasValue)
            {
                step_Description_For_Exception_Logging = "Extracting Invoice type + reference number";

                try
                {

                    int l_Invoice_Type_With_Reference_Expression_From_Index = p_Uploaded_File_Name.IndexOf("- ") + 2;
                    int l_Invoice_Type_With_Reference_Expression_To_Index = p_Uploaded_File_Name.IndexOf(" -", l_Invoice_Type_With_Reference_Expression_From_Index);

                    string l_Temp_Invoice_Type_With_Reference =
                        p_Uploaded_File_Name.Substring(
                            l_Invoice_Type_With_Reference_Expression_From_Index,
                            l_Invoice_Type_With_Reference_Expression_To_Index - l_Invoice_Type_With_Reference_Expression_From_Index);

                    l_Temp_Invoice_Type_With_Reference = l_Temp_Invoice_Type_With_Reference.Trim().ToLower();

                    byte? l_Invoice_Type = new byte?();

                    var invoice_Type = this.InvoiceTypes_Get_By_Name(l_Temp_Invoice_Type_With_Reference);

                    if (invoice_Type != null)
                    {
                        l_Invoice_Type = (byte)invoice_Type.Invoice_Type_Id;
                    }

                    if (l_Invoice_Type.HasValue)
                    {
                        suggestions_To_Return.Invoice_Type = l_Invoice_Type;

                        if (l_Temp_Invoice_Type_With_Reference.IndexOf(" ") > -1 )
                        {
                            string invoice_Reference_Number = 
                                l_Temp_Invoice_Type_With_Reference.Substring(l_Temp_Invoice_Type_With_Reference.LastIndexOf(" "));

                            invoice_Reference_Number = invoice_Reference_Number.Trim();

                            suggestions_To_Return.Invoice_Reference = invoice_Reference_Number;
                        }
                    }
                }
                catch (Exception exc )
                {

                }
            }

            // 3) If date extraction passed -- try to extract total value
            if (suggestions_To_Return.Invoice_DateTime.HasValue)
            {
                try
                {
                    step_Description_For_Exception_Logging = "Extracting Total Value + currency";

                    int l_Total_Value_Expression_From_Index = p_Uploaded_File_Name.IndexOf("- ", p_Uploaded_File_Name.IndexOf("- ") + 2) +2;
                    int l_Total_Value_Expression_To_Index = p_Uploaded_File_Name.IndexOf(" -", l_Total_Value_Expression_From_Index);

                    string total_Value_With_Currency_Expression_Extracted
                        = p_Uploaded_File_Name.Substring(l_Total_Value_Expression_From_Index, l_Total_Value_Expression_To_Index - l_Total_Value_Expression_From_Index);

                    total_Value_With_Currency_Expression_Extracted = total_Value_With_Currency_Expression_Extracted.ToLower();
                    if (total_Value_With_Currency_Expression_Extracted.IndexOf("total ") > -1)
                    {
                        total_Value_With_Currency_Expression_Extracted = total_Value_With_Currency_Expression_Extracted.Replace("total ", "");
                    }

                    if (total_Value_With_Currency_Expression_Extracted.IndexOf(" ") > -1)
                    {
                        total_Value_With_Currency_Expression_Extracted = total_Value_With_Currency_Expression_Extracted.TrimStart().TrimEnd();
                    }

                    step_Description_For_Exception_Logging = "Extracting Total Value + currency - part 2 parsing";
                    string total_Value_Only_From_Extracted_Expression = total_Value_With_Currency_Expression_Extracted.Split(' ')[0];

                    total_Value_Only_From_Extracted_Expression = total_Value_Only_From_Extracted_Expression.Trim();

                    decimal parsed_Extracted_Total_Value = decimal.Parse(total_Value_Only_From_Extracted_Expression);

                    Currencies parsed_Currency = null;

                    if (total_Value_With_Currency_Expression_Extracted.IndexOf(" ") > -1)
                    {
                        string currency_Code_From_Extracted_Expression = total_Value_With_Currency_Expression_Extracted.Split(' ')[1];
                        currency_Code_From_Extracted_Expression = currency_Code_From_Extracted_Expression.Trim();

                        parsed_Currency = this.Currencies_Get_By_Code(currency_Code_From_Extracted_Expression);
                    }

                    suggestions_To_Return.Total_Amount = parsed_Extracted_Total_Value;

                    if (parsed_Currency != null)
                    {
                        suggestions_To_Return.Currency_Id = parsed_Currency.Currency_Id;
                    }
                }
                catch (Exception exc)
                {

                }

                step_Description_For_Exception_Logging = "Extracting Client - start";

                try
                {
                    int starting_Index_Client_Details = p_Uploaded_File_Name.IndexOf('-', p_Uploaded_File_Name.IndexOf('-', p_Uploaded_File_Name.IndexOf('-') + 1) + 1) + 1;
                    int length_Client_Name_Details_For_Extraction = p_Uploaded_File_Name.IndexOf('-', starting_Index_Client_Details) - starting_Index_Client_Details;
                    string client_Details_Extracted = p_Uploaded_File_Name.Substring(starting_Index_Client_Details, length_Client_Name_Details_For_Extraction);

                    client_Details_Extracted = client_Details_Extracted.Trim();

                    step_Description_For_Exception_Logging = "Extracting Client - by splitting white spaces vesus db Clients list";

                    var client_Details_Entity = this.Try_To_Find_Client_Id_By_Client_Details_From_Filename(
                        client_Details_Extracted,
                        p_User_Id,
                        p_Authenticated_User_Id
                        );

                    if (client_Details_Entity != null)
                    {
                        suggestions_To_Return.Client_Id = client_Details_Entity.Client_Id;

                        // if the Client has a default vat value then set it for suggestions and try to auto fill other total amount parts.
                        if (client_Details_Entity.Default_Vat_Percentage.HasValue &&
                            client_Details_Entity.Default_Vat_Percentage.Value > 0 &&
                            suggestions_To_Return.Total_Amount.HasValue &&
                            suggestions_To_Return.Total_Amount.Value > 0)
                        {
                            //suggestions_To_Return.Total_Vat  Client_Details_Entity.Default_Vat_Percentage
                            suggestions_To_Return.Vat_Percentage = client_Details_Entity.Default_Vat_Percentage;
                        }
                        else
                        {
                            // The Client might not have default vat value but this invoice might still be with vat value.. 
                            // Take the latest vat value of the current country and use it as the default vat percentage for calculation
                            decimal country_Vat_Value = this.Countries_Get_Latest_Vat_Value_By_Country_Id(client_Details_Entity.Country_Id);
                            suggestions_To_Return.Vat_Percentage = country_Vat_Value;
                        }

                        if (suggestions_To_Return.Vat_Percentage.HasValue &&
                            suggestions_To_Return.Vat_Percentage.Value > 0 &&
                            suggestions_To_Return.Total_Amount.HasValue &&
                            suggestions_To_Return.Total_Amount.Value > 0)
                        {
                            suggestions_To_Return.Total_Without_Vat =
                                suggestions_To_Return.Total_Amount / ((suggestions_To_Return.Vat_Percentage + 100) / 100);
                            suggestions_To_Return.Total_Vat = suggestions_To_Return.Total_Amount - suggestions_To_Return.Total_Without_Vat;
                        }
                    }
                }
                catch (Exception exc)
                {

                }
            }

            // Try to extract invoice description 
            step_Description_For_Exception_Logging = "Extracting invoice content description - start";
            try
            {
                string l_Invoice_Description = p_Uploaded_File_Name.Substring(p_Uploaded_File_Name.LastIndexOf("-") + 1, p_Uploaded_File_Name.LastIndexOf(".") - p_Uploaded_File_Name.LastIndexOf("-"));
                l_Invoice_Description = l_Invoice_Description.Trim();
                suggestions_To_Return.Invoice_Content_Long_Description = l_Invoice_Description;
            }
            catch (Exception exc)
            {

            }

            return suggestions_To_Return;
        }

        private Suppliers Try_To_Find_Supplier_Id_By_Supplier_Details_From_Filename(
            string p_Supplier_Details_Extracted,
            int p_User_Id,
            int p_Authenticated_User_Id)
        {
            Suppliers supplier_Details_To_Return = null;
            int? supplier_Id_To_Return = new int?();

            var suppliers = this.Suppliers_Get_All_By_User_Id(p_User_Id, p_Authenticated_User_Id);
            for (int s = 0; s < suppliers.Count; s++)
            {
                suppliers[s].Company_Name = suppliers[s].Company_Name.ToLower();
            }

            // Split the supplier details extracted by white spaces and try to search the array of the suppliers for the first supplier that matches the details.
            string[] supplier_Details_Parts = p_Supplier_Details_Extracted.ToLower().Split(' ');

            Dictionary<int, short> supplier_Coordinates_Strength = new Dictionary<int, short>();

            for (int p = 0; p < supplier_Details_Parts.Length; p++)
            {
                for (int s = 0; s < suppliers.Count; s++)
                {
                    if (suppliers[s].Company_Name.IndexOf(supplier_Details_Parts[p], StringComparison.InvariantCultureIgnoreCase) > -1)
                    {
                        int supplier_Id = suppliers[s].Supplier_Id;
                        if (supplier_Coordinates_Strength.Keys.Any(x => x == supplier_Id))
                        {
                            supplier_Coordinates_Strength[supplier_Id]++;
                        }
                        else
                        {
                            supplier_Coordinates_Strength.Add(supplier_Id, 1);
                        }
                    }
                }
            }

            // get the maximum strength that should match the supplier_id to return
            short max_Strength_Helper_To_Return = 0;
            foreach (var pair in supplier_Coordinates_Strength)
            {
                if (pair.Value > max_Strength_Helper_To_Return)
                {
                    supplier_Id_To_Return = pair.Key;
                    max_Strength_Helper_To_Return = pair.Value;
                }
            }

            if (supplier_Id_To_Return.HasValue)
            {
                supplier_Details_To_Return = suppliers.SingleOrDefault(s => s.Supplier_Id == supplier_Id_To_Return.Value);
            }

            return supplier_Details_To_Return;
        }

        private Clients Try_To_Find_Client_Id_By_Client_Details_From_Filename(
            string p_Client_Details_Extracted,
            int p_User_Id,
            int p_Authenticated_User_Id)
        {
            Clients client_Details_To_Return = null;
            int? client_Id_To_Return = new int?();

            var clients = this.Clients_Get_All_By_User_Id(p_User_Id, p_Authenticated_User_Id);
            for (int s = 0; s < clients.Count; s++)
            {
                clients[s].Company_Name = clients[s].Company_Name.ToLower();
            }

            // Split the supplier details extracted by white spaces and try to search the array of the suppliers for the first supplier that matches the details.
            string[] client_Details_Parts = p_Client_Details_Extracted.ToLower().Split(' ');

            Dictionary<int, short> supplier_Coordinates_Strength = new Dictionary<int, short>();

            for (int p = 0; p < client_Details_Parts.Length; p++)
            {
                for (int s = 0; s < clients.Count; s++)
                {
                    if (clients[s].Company_Name.IndexOf(client_Details_Parts[p], StringComparison.InvariantCultureIgnoreCase) > -1)
                    {
                        int client_Id = clients[s].Client_Id;
                        if (supplier_Coordinates_Strength.Keys.Any(x => x == client_Id))
                        {
                            supplier_Coordinates_Strength[client_Id]++;
                        }
                        else
                        {
                            supplier_Coordinates_Strength.Add(client_Id, 1);
                        }
                    }
                }
            }

            // get the maximum strength that should match the supplier_id to return
            short max_Strength_Helper_To_Return = 0;
            foreach (var pair in supplier_Coordinates_Strength)
            {
                if (pair.Value > max_Strength_Helper_To_Return)
                {
                    client_Id_To_Return = pair.Key;
                    max_Strength_Helper_To_Return = pair.Value;
                }
            }

            if (client_Id_To_Return.HasValue)
            {
                client_Details_To_Return = clients.SingleOrDefault(s => s.Client_Id == client_Id_To_Return.Value);
            }

            return client_Details_To_Return;
        }

        public decimal Countries_Get_Latest_Vat_Value_By_Country_Id(short p_Country_Id)
        {
            decimal latest_Vat_Of_Country_To_Return = 0;

            var latest_Vat_History_Of_Country = Data_Access_Layer_Facade.Instance.Countries_Vat_History_Get_By_Country(p_Country_Id);

            if (latest_Vat_History_Of_Country != null && latest_Vat_History_Of_Country.Count > 0)
            {
                latest_Vat_Of_Country_To_Return = latest_Vat_History_Of_Country[0].Vat_Percentage;
            }

            return latest_Vat_Of_Country_To_Return;
        }

        public Azure_File_Download_For_UI Download_File_From_Azure(
            int p_File_Record_ID,
            string p_File_Type,
            int p_Download_For_User_Id,
            int p_Authenticated_User_Id,
            App_Permission_Type p_Authenticated_User_Permission
            )
        {
            Azure_File_Download_For_UI azure_Download_Result = new Azure_File_Download_For_UI();

            this.Validate_Permissions_For_Authenticated_User_On_User(
                p_Download_For_User_Id,
                p_Authenticated_User_Id,
                p_Authenticated_User_Permission);

            p_File_Type = p_File_Type.Trim().ToLower();

            if (p_File_Record_ID > 0)
            {
                // Get azure container reference from the user details: 
                Users user_Details = this.Users_Get_Details_By_User_Id(
                    p_Download_For_User_Id,
                    p_Authenticated_User_Id,
                    p_Authenticated_User_Permission
                    );

                string l_Azure_Container_Reference = user_Details.Azure_Container_Ref;
                string l_Original_File_Name = string.Empty;

                if (l_Azure_Container_Reference.Length > 0)
                {
                    string l_Azure_Block_Blob_Reference = "";

                    try
                    {
                        switch (p_File_Type)
                        {
                            case "expense":
                                Expenses expense_Details = this.Expenses_Get_By_Id(
                                    p_File_Record_ID,
                                    p_Download_For_User_Id,
                                    p_Authenticated_User_Id,
                                    p_Authenticated_User_Permission);

                                l_Azure_Block_Blob_Reference = expense_Details.Azure_Block_Blob_Reference;
                                l_Original_File_Name = expense_Details.Original_File_Name;
                                break;

                            case "invoice":
                                Invoices invoice_Details = this.Invoices_Get_By_Id(
                                    p_File_Record_ID,
                                    p_Download_For_User_Id,
                                    p_Authenticated_User_Id,
                                    p_Authenticated_User_Permission);

                                l_Azure_Block_Blob_Reference = invoice_Details.Azure_Block_Blob_Reference;
                                l_Original_File_Name = invoice_Details.Original_File_Name;
                                break;

                            case "general_document":
                                General_Documents general_Document_Details = this.GeneralDocuments_Get_By_Id(
                                    p_File_Record_ID,
                                    p_Download_For_User_Id,
                                    p_Authenticated_User_Id,
                                    p_Authenticated_User_Permission);

                                l_Azure_Block_Blob_Reference = general_Document_Details.Azure_Block_Blob_Reference;
                                l_Original_File_Name = general_Document_Details.Original_File_Name;
                                break;

                            case "ccstatement":
                                Credit_Cards_Statement ccStatement_Details = this.CreditCardStatements_Get_Credit_Card_Statement_Details_By_Credit_Card_Statement_Id(
                                    p_File_Record_ID,
                                    p_Download_For_User_Id,
                                    p_Authenticated_User_Id,
                                    p_Authenticated_User_Permission);

                                l_Azure_Block_Blob_Reference = ccStatement_Details.Azure_Block_Blob_Reference;
                                l_Original_File_Name = ccStatement_Details.Original_File_Name;
                                break;
                        }

                        if (!string.IsNullOrEmpty(l_Azure_Block_Blob_Reference) &&
                            !string.IsNullOrEmpty(l_Original_File_Name))
                        {
                            byte[] l_Azure_File_Content =
                                Azure_Integration.Instance.Download_File_From_Azure_Storage_Blob_Container(
                                    l_Azure_Block_Blob_Reference,
                                    l_Azure_Container_Reference);

                            if (l_Azure_File_Content != null && l_Azure_File_Content.Length > 0)
                            {
                                azure_Download_Result.Downloaded_Successfully = true;
                                azure_Download_Result.File_Original_Name = l_Original_File_Name;
                                azure_Download_Result.File_Content_Buffer = l_Azure_File_Content;
                            }
                        }
                    }
                    catch (Exception exc)
                    {
                        azure_Download_Result.Downloaded_Successfully = false;
                        azure_Download_Result.Exception_Details = exc;
                    }
                }
            }

            return azure_Download_Result;
        }

        public InvoiceType InvoiceTypes_Get_By_Name(string p_Invoice_Type_Name)
        {
            InvoiceType invoice_Type_To_Return = null;

            if (p_Invoice_Type_Name.StartsWith("inv "))
            {
                // 3 Receipt Tax Invoice
                invoice_Type_To_Return = this.InvoiceTypes_Get_By_Id(InvoiceType.Codes.Receipt_Tax_Invoice);
            }
            else if (p_Invoice_Type_Name.StartsWith("tax invoice "))
            {
                // 1 Tax Invoice
                invoice_Type_To_Return = this.InvoiceTypes_Get_By_Id(InvoiceType.Codes.Tax_Invoice);
            }
            else if (p_Invoice_Type_Name.StartsWith("receipt "))
            {
                // 5 Receipt 
                invoice_Type_To_Return = this.InvoiceTypes_Get_By_Id(InvoiceType.Codes.Receipt);
            }
            else if (p_Invoice_Type_Name.StartsWith("credit invoice "))
            {
                // 6 Credit Invoice
                invoice_Type_To_Return = this.InvoiceTypes_Get_By_Id(InvoiceType.Codes.Credit_Invoice);
            }

            return invoice_Type_To_Return;
        }

        public int? Invoices_Get_Next_Invoice_Number_Based_On_Invoice_Type(
            int p_User_ID,
            byte p_Invoice_Type,
            int p_Authenticated_User_Id,
            App_Permission_Type p_Authenticated_User_Permission )
        {
            int? next_Invoice_Number_To_Return = new int?();

            this.Validate_Operation_For_Authenticated_User(
                p_User_ID, p_Authenticated_User_Id, p_Authenticated_User_Permission);

            next_Invoice_Number_To_Return
                = Data_Access_Layer_Facade.Instance.Invoices_Get_Next_Invoice_Number_Based_On_Invoice_Type(
                    p_User_ID, p_Invoice_Type);

            return next_Invoice_Number_To_Return;
        }

        public List<Credit_Cards> CreditCards_Get_Credit_Cards_By_Bank_Account_Id(
            int p_User_ID,
            int p_Bank_Account_Id,
            int p_Searching_Authenticated_User_Id,
            App_Permission_Type p_Searching_Authenticated_User_Permission)
        {
            List<Credit_Cards> credit_Cards_To_Return = null;

            this.Validate_Operation_For_Authenticated_User(
                p_User_ID,
                p_Searching_Authenticated_User_Id,
                p_Searching_Authenticated_User_Permission);

            credit_Cards_To_Return = Data_Access_Layer_Facade.Instance.CreditCards_Get_Search(
                    p_User_ID, p_Bank_Account_Id);

            return credit_Cards_To_Return;
        }

        public Credit_Cards CreditCards_Get_Credit_Card_Details(
            int p_Credit_Card_Id,
            int p_User_Id_Owner,
            int p_Searching_Authenticated_User_Id,
            App_Permission_Type p_Searching_Authenticated_User_Permission)
        {
            Credit_Cards credit_Card_Details_To_Return = null;

            this.Validate_Operation_For_Authenticated_User(
                p_User_Id_Owner,
                p_Searching_Authenticated_User_Id,
                p_Searching_Authenticated_User_Permission);

            credit_Card_Details_To_Return = Data_Access_Layer_Facade.Instance.CreditCards_Get_Credit_Card_Details_By_Credit_Card_Id(
                    p_Credit_Card_Id, p_User_Id_Owner, p_Searching_Authenticated_User_Id);

            return credit_Card_Details_To_Return;
        }

        public Credit_Cards CreditCards_Add_New_Credit_Card(
            int p_User_ID,
            int p_Bank_Account_Id,
            string p_Card_Name,
            string p_Four_Ending_Digits,
            DateTime? p_Expiration_Date,
            bool p_Is_Active,
            int p_Creating_Authenticated_User_Id,
            App_Permission_Type p_Creating_Authenticated_User_Permission)
        {
            Credit_Cards new_Credit_Card_To_Return = null;

            this.Validate_Operation_For_Authenticated_User(
                p_User_ID,
                p_Creating_Authenticated_User_Id,
                p_Creating_Authenticated_User_Permission);

            new_Credit_Card_To_Return = Data_Access_Layer_Facade.Instance.CreditCards_Insert_New_Credit_Card_Details(
                    p_User_ID, 
                    p_Bank_Account_Id,
                    p_Card_Name,
                    p_Four_Ending_Digits,
                    p_Expiration_Date,
                    p_Is_Active,
                    p_Creating_Authenticated_User_Id);

            return new_Credit_Card_To_Return;
        }

        public List<Credit_Cards> CreditCards_Get_Credit_Cards(
            int p_User_ID,
            int p_Searching_Authenticated_User_Id,
            App_Permission_Type p_Searching_Authenticated_User_Permission)
        {
            List<Credit_Cards> credit_Cards_To_Return = null;

            this.Validate_Operation_For_Authenticated_User(
                p_User_ID,
                p_Searching_Authenticated_User_Id,
                p_Searching_Authenticated_User_Permission);

            credit_Cards_To_Return = Data_Access_Layer_Facade.Instance.CreditCards_Get_All_By_User_Id(
                p_User_ID, p_Searching_Authenticated_User_Id);

            return credit_Cards_To_Return;
        }

        public bool CreditCards_Update_Credit_Card_Details(
            int p_Credit_Card_Id,
            int p_Bank_Account_Id,
            string p_Card_Name,
            string p_Four_Ending_Digits,
            DateTime? p_Expiration_Date,
            bool p_Is_Active,
            int p_Updating_Authenticated_User_Id,
            App_Permission_Type p_Updating_Authenticated_User_Permission)
        {
            bool l_Updated_Successfully = false;

            l_Updated_Successfully = Data_Access_Layer_Facade.Instance.CreditCards_Update_Credit_Card_Details(
                p_Credit_Card_Id,
                p_Bank_Account_Id,
                p_Card_Name,
                p_Four_Ending_Digits,
                p_Expiration_Date,
                p_Is_Active,
                p_Updating_Authenticated_User_Id);

            return l_Updated_Successfully;
        }

        public List<Credit_Cards_Statement> CreditCardStatements_Get_Search(
            int p_User_ID_Bank_Owner,
            int? p_Bank_Account_Id,
            int p_User_ID_Searching,
            App_Permission_Type p_Authenticated_User_Permission)
        {
            this.Validate_Operation_For_Authenticated_User(
                p_User_ID_Bank_Owner,
                p_User_ID_Searching,
                p_Authenticated_User_Permission);

            return Data_Access_Layer_Facade.Instance.CreditCardStatements_Get_Search(
                p_User_ID_Bank_Owner,
                p_Bank_Account_Id,
                p_User_ID_Searching);
        }

        public Credit_Cards_Statement CreditCardStatements_Get_Credit_Card_Statement_Details_By_Credit_Card_Statement_Id(
            int p_Credit_Card_Statement_Id,
            int p_User_ID_Bank_Owner,
            int p_User_ID_Searching,
            App_Permission_Type p_Authenticated_User_Permission)
        {
            this.Validate_Operation_For_Authenticated_User(
                p_User_ID_Bank_Owner,
                p_User_ID_Searching,
                p_Authenticated_User_Permission);

            return Data_Access_Layer_Facade.Instance.CreditCardStatements_Get_Credit_Card_Statement_Details_By_Credit_Card_Statement_Id(
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
            byte[] p_File_Content_To_Save_In_Azure,
            long? p_Bank_Account_Transaction_Id_Connection,
            bool p_Is_Visible_To_Anonymous_Users,
            bool p_Is_Available_For_Download_For_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users,
            bool p_Is_Available_For_Download_For_Followers_Users,
            List<Credit_Card_Transactions_To_DB_Sync_From_UI> p_Statement_Transactions,
            int p_Creating_User_Id,
            App_Permission_Type p_Authenticated_User_Permission)
        {
            Credit_Cards_Statement statement_To_Return = null;

            this.Validate_Operation_For_Authenticated_User(
                p_User_Id_Owner,
                p_Creating_User_Id,
                p_Authenticated_User_Permission);

            // Try to save in azure and if successfull, get the Azure_Block_Blob_Reference 
            string p_Azure_Block_Blob_Reference = string.Empty;
            bool l_Process_Tried_To_Upload_File_And_Failed = false;

            if (p_File_Content_To_Save_In_Azure != null && p_File_Content_To_Save_In_Azure.Length > 0)
            {
                string l_Azure_Block_Blob_Uploaded_Reference
                    = this.Upload_File_To_Azure(
                        p_File_Content_To_Save_In_Azure,
                        p_Original_File_Name,
                        p_User_Id_Owner,
                        p_Creating_User_Id,
                        p_Authenticated_User_Permission);

                if (!string.IsNullOrEmpty(l_Azure_Block_Blob_Uploaded_Reference))
                {
                    // File uploaded to azure successfully
                    p_Azure_Block_Blob_Reference = l_Azure_Block_Blob_Uploaded_Reference;
                }
                else
                {
                    // Azure upload process has failed. The user should get an alert and insert process should be stopped.
                    l_Process_Tried_To_Upload_File_And_Failed = true;
                }
            }

            if (l_Process_Tried_To_Upload_File_And_Failed)
            {
                throw new Exception("Failed to upload the file :( Please try again later or contact us!");
            }

            statement_To_Return = Data_Access_Layer_Facade.Instance.CreditCardStatements_Insert_New_Credit_Card_Statement_Details(
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

            if (statement_To_Return != null && statement_To_Return.Credit_Card_Statement_Id > 0)
            {
                // Create the statement transactions for the new created transaction
                if (p_Statement_Transactions.Count > 0)
                {
                    for (int i = 0; i < p_Statement_Transactions.Count; i++)
                    {
                        if (!p_Statement_Transactions[i].Is_Deleted)
                        {
                            int new_Statement_Transaction_Id = this.CreditCardStatementTransactions_Insert_New_Credit_Card_Statement_Transaction_Details(
                                p_User_Id_Owner,
                                statement_To_Return.Credit_Card_Statement_Id,
                                p_Statement_Transactions[i].Transaction_Date,
                                p_Statement_Transactions[i].Business_Name,
                                p_Statement_Transactions[i].Transaction_Amount,
                                p_Statement_Transactions[i].Transaction_Amount_Currency_Id,
                                p_Statement_Transactions[i].Transaction_Actual_Payment_Amount,
                                p_Statement_Transactions[i].Description,
                                p_Statement_Transactions[i].Has_Been_Actually_Charged_In_Statement,
                                p_Statement_Transactions[i].Total_Charged_In_Statement,
                                string.Empty,
                                string.Empty,
                                p_Is_Visible_To_Anonymous_Users,
                                p_Is_Available_For_Download_For_Anonymous_Users,
                                p_Is_Visible_To_Followers_Users,
                                p_Is_Available_For_Download_For_Followers_Users,
                                p_Creating_User_Id,
                                p_Authenticated_User_Permission);
                        }
                    }
                }
            }
            else
            {
                // ToDo: The statement didnt got created in the DB, If azure file was uploaded it should be deleted here
            }

            return statement_To_Return;
        }

        public bool CreditCardStatements_Update_Credit_Card_Statement_Details(
            int p_User_Id_Owner,
            int p_Credit_Card_Statement_Id,
            int p_Credit_Card_Id,
            DateTime? p_Statement_Date,
            decimal? p_Total_Amount,
            byte p_Currency_Id,
            string p_Original_File_Name,
            byte[] p_File_Content_To_Save_In_Azure,
            long? p_Bank_Account_Transaction_Id_Connection,
            bool p_Is_Visible_To_Anonymous_Users,
            bool p_Is_Available_For_Download_For_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users,
            bool p_Is_Available_For_Download_For_Followers_Users,
            List<Credit_Card_Transactions_To_DB_Sync_From_UI> p_Statement_Transactions,
            int p_Updating_User_Id,
            App_Permission_Type p_Authenticated_User_Permission)
        {
            bool l_Updated_Success_Flag_To_Return = false;

            this.Validate_Operation_For_Authenticated_User(
                p_User_Id_Owner,
                p_Updating_User_Id,
                p_Authenticated_User_Permission);


            bool l_File_Uploaded = false;
            bool l_Error_Occured_During_Azure_Operations = false;
            string l_New_Azure_Block_Blob_Reference = string.Empty;

            if (!string.IsNullOrEmpty(p_Original_File_Name) && p_File_Content_To_Save_In_Azure.Length > 0)
            {
                // A new file has been uploaded for the expense. 
                // the previous file needs to be deleted from azure and the new one should be uploaded and connected with the update process
                Users user_Details = this.Users_Get_Details_By_User_Id(
                    p_User_Id_Owner,
                    p_Updating_User_Id,
                    p_Authenticated_User_Permission);

                string l_Azure_Container_Reference = user_Details.Azure_Container_Ref;

                Credit_Cards_Statement ccStatement_Details = this.CreditCardStatements_Get_Credit_Card_Statement_Details_By_Credit_Card_Statement_Id(
                    p_Credit_Card_Statement_Id,
                    p_User_Id_Owner,
                    p_Updating_User_Id,
                    p_Authenticated_User_Permission);

                string l_Expense_Azure_Block_Blob_Reference = ccStatement_Details.Azure_Block_Blob_Reference;
                if (!string.IsNullOrEmpty(l_Expense_Azure_Block_Blob_Reference))
                {
                    // Try to first upload the new expense file, If successfull then try to delete as well. 
                    l_New_Azure_Block_Blob_Reference = Azure_Integration.Instance.Upload_File_To_Azure_Storage_Blob_Container(
                        p_File_Content_To_Save_In_Azure,
                        p_Original_File_Name,
                        l_Azure_Container_Reference);

                    if (!string.IsNullOrEmpty(l_New_Azure_Block_Blob_Reference))
                    {
                        l_File_Uploaded = true;

                        bool l_Deleted_Successfully = Azure_Integration.Instance.Delete_File_From_Azure_Storage_Blob_Container(
                        l_Expense_Azure_Block_Blob_Reference, l_Azure_Container_Reference);

                        if (!l_Deleted_Successfully)
                        {
                            // ToDo -- Log exception that a file was uploaded but the previous file was not deleted.. 
                        }
                    }
                }
                else
                {
                    // There is no azure block blob reference for the current expense, so there is nothing to delete.
                }
            }

            l_Updated_Success_Flag_To_Return = Data_Access_Layer_Facade.Instance.CreditCardStatements_Update_Credit_Card_Statement_Details(
                p_Credit_Card_Statement_Id,
                p_Credit_Card_Id,
                p_Statement_Date,
                p_Total_Amount,
                p_Currency_Id,
                p_Original_File_Name,
                l_New_Azure_Block_Blob_Reference,
                l_File_Uploaded,
                p_Bank_Account_Transaction_Id_Connection,
                p_Is_Visible_To_Anonymous_Users,
                p_Is_Available_For_Download_For_Anonymous_Users,
                p_Is_Visible_To_Followers_Users,
                p_Is_Available_For_Download_For_Followers_Users,
                p_Updating_User_Id);


            if (l_Updated_Success_Flag_To_Return)
            {
                // Create the statement transactions for the new created transaction
                if (p_Statement_Transactions.Count > 0)
                {
                    for (int i = 0; i < p_Statement_Transactions.Count; i++)
                    {
                        if (!p_Statement_Transactions[i].Is_Deleted &&
                            p_Statement_Transactions[i].Is_New_Record &&
                            p_Statement_Transactions[i].Credit_Card_Statement_Transaction_Id <= 0 )
                        {
                            int new_Statement_Transaction_Id = this.CreditCardStatementTransactions_Insert_New_Credit_Card_Statement_Transaction_Details(
                                p_User_Id_Owner,
                                p_Credit_Card_Statement_Id,
                                p_Statement_Transactions[i].Transaction_Date,
                                p_Statement_Transactions[i].Business_Name,
                                p_Statement_Transactions[i].Transaction_Amount,
                                p_Statement_Transactions[i].Transaction_Amount_Currency_Id,
                                p_Statement_Transactions[i].Transaction_Actual_Payment_Amount,
                                p_Statement_Transactions[i].Description,
                                p_Statement_Transactions[i].Has_Been_Actually_Charged_In_Statement,
                                p_Statement_Transactions[i].Total_Charged_In_Statement,
                                string.Empty,
                                string.Empty,
                                p_Is_Visible_To_Anonymous_Users,
                                p_Is_Available_For_Download_For_Anonymous_Users,
                                p_Is_Visible_To_Followers_Users,
                                p_Is_Available_For_Download_For_Followers_Users,
                                p_Updating_User_Id,
                                p_Authenticated_User_Permission);
                        }
                        else
                        {
                            // The transaction might have been deleted or updated 
                            if (p_Statement_Transactions[i].Is_Deleted)
                            {
                                // If the transaction was deleted but it's transaction ID is less or equal to 0, It means it was a temporary delete that should not affect the database
                                if (p_Statement_Transactions[i].Credit_Card_Statement_Transaction_Id > 0 )
                                {
                                    this.CreditCardStatementTransactions_Delete_Credit_Card_Statement_Transaction(
                                        p_User_Id_Owner,
                                        p_Statement_Transactions[i].Credit_Card_Statement_Transaction_Id,
                                        p_Updating_User_Id,
                                        p_Authenticated_User_Permission);
                                }
                            }
                            else
                            {
                                // The transaction might have been updated. 
                                if (p_Statement_Transactions[i].Has_Pending_Changes)
                                {
                                    this.CreditCardStatementTransactions_Update_Credit_Card_Statement_Transaction(
                                        p_User_Id_Owner,
                                        p_Statement_Transactions[i].Credit_Card_Statement_Transaction_Id,
                                        p_Statement_Transactions[i].Transaction_Date,
                                        p_Statement_Transactions[i].Business_Name,
                                        p_Statement_Transactions[i].Transaction_Amount,
                                        p_Statement_Transactions[i].Transaction_Amount_Currency_Id,
                                        p_Statement_Transactions[i].Transaction_Actual_Payment_Amount,
                                        p_Statement_Transactions[i].Description,
                                        p_Statement_Transactions[i].Has_Been_Actually_Charged_In_Statement,
                                        p_Statement_Transactions[i].Total_Charged_In_Statement,
                                        p_Updating_User_Id,
                                        p_Authenticated_User_Permission);
                                }
                            }
                        }
                    }
                }
            }
            else
            {
                // ToDo: The statement didnt got created in the DB, If azure file was uploaded it should be deleted here
            }

            return l_Updated_Success_Flag_To_Return;
        }

        public List<Credit_Cards_Statement> CreditCardStatements_Get_All_By_User_Id(
            int p_User_Id_To_Return_Credit_Cards_Statement,
            int p_Authenticated_User_ID,
            App_Permission_Type p_Authenticated_User_Permission)
        {
            this.Validate_Operation_For_Authenticated_User(
                p_User_Id_To_Return_Credit_Cards_Statement,
                p_Authenticated_User_ID,
                p_Authenticated_User_Permission);

            return Data_Access_Layer_Facade.Instance.CreditCardStatements_Get_All_By_User_Id(
                p_User_Id_To_Return_Credit_Cards_Statement,
                p_Authenticated_User_ID);
        }

        private List<Credit_Cards_Statement_Transaction> CreditCardStatementTransactions_Get_Credit_Card_Statement_Transactions_List(
            int p_Bank_Account_Credit_Card_Statement_Id,
            int p_User_ID_Bank_Owner,
            int p_User_ID_Searching,
            App_Permission_Type p_Authenticated_User_Permission)
        {
            this.Validate_Operation_For_Authenticated_User(
                p_User_ID_Bank_Owner,
                p_User_ID_Searching,
                p_Authenticated_User_Permission);

            return Data_Access_Layer_Facade.Instance.CreditCardStatementTransactions_Get_Credit_Card_Statement_Transactions_List(
                p_Bank_Account_Credit_Card_Statement_Id,
                p_User_ID_Bank_Owner,
                p_User_ID_Searching);
        }

        public Credit_Card_Transactions_Response_For_UI CreditCardStatementTransactions_Get_Credit_Cards_Transactions_For_UI(
            int p_Bank_Account_Credit_Card_Statement_Id,
            int p_User_ID_Bank_Owner,
            int p_User_ID_Searching,
            App_Permission_Type p_Authenticated_User_Permission)
        {
            Credit_Card_Transactions_Response_For_UI response_To_Return = new Credit_Card_Transactions_Response_For_UI();

            response_To_Return.Credit_Card_Transactions_To_DB_Sync_From_Or_To_UI = new List<Credit_Card_Transactions_To_DB_Sync_From_UI>();

            var statement_Transactions = this.CreditCardStatementTransactions_Get_Credit_Card_Statement_Transactions_List(
                p_Bank_Account_Credit_Card_Statement_Id,
                p_User_ID_Bank_Owner,
                p_User_ID_Searching,
                p_Authenticated_User_Permission);

            for (int i = 0; i < statement_Transactions.Count; i++)
            {
                Credit_Card_Transactions_To_DB_Sync_From_UI transaction_To_Add = new Credit_Card_Transactions_To_DB_Sync_From_UI();

                transaction_To_Add.Credit_Card_Statement_Transaction_Id = statement_Transactions[i].Credit_Card_Statement_Transaction_Id;
                transaction_To_Add.Transaction_Date = statement_Transactions[i].Transaction_Date;
                transaction_To_Add.Business_Name = statement_Transactions[i].Business_Name;
                transaction_To_Add.Transaction_Amount = statement_Transactions[i].Transaction_Amount;
                transaction_To_Add.Transaction_Amount_Currency_Id = statement_Transactions[i].Transaction_Amount_Currency_Id;
                if (transaction_To_Add.Transaction_Amount_Currency_Id.HasValue)
                { 
                    transaction_To_Add.Transaction_Amount_Currency_Name = this.Currencies_Get_By_Id(transaction_To_Add.Transaction_Amount_Currency_Id.Value).Currency_Name;
                }
                
                transaction_To_Add.Transaction_Actual_Payment_Amount = statement_Transactions[i].Transaction_Actual_Payment_Amount;
                transaction_To_Add.Description = statement_Transactions[i].Description;
                transaction_To_Add.Has_Been_Actually_Charged_In_Statement = statement_Transactions[i].Has_Been_Actually_Charged_In_Statement;
                transaction_To_Add.Total_Charged_In_Statement = statement_Transactions[i].Total_Charged_In_Statement;

                response_To_Return.Credit_Card_Transactions_To_DB_Sync_From_Or_To_UI.Add(transaction_To_Add);
            }

            return response_To_Return;
        }

        public int CreditCardStatementTransactions_Insert_New_Credit_Card_Statement_Transaction_Details(
            int p_User_ID_Bank_Owner,
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
            int p_Creating_User_Id,
            App_Permission_Type p_Authenticated_User_Permission)
        {
            this.Validate_Operation_For_Authenticated_User(
                p_User_ID_Bank_Owner,
                p_Creating_User_Id,
                p_Authenticated_User_Permission);

            return Data_Access_Layer_Facade.Instance.CreditCardStatementTransactions_Insert_New_Credit_Card_Statement_Transaction_Details(
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
            int p_User_ID_Bank_Owner,
            long p_Credit_Card_Statement_Transaction_Id,
            DateTime? p_Transaction_Date,
            string p_Business_Name,
            decimal? p_Transaction_Amount,
            byte? p_Transaction_Amount_Currency_Id,
            decimal? p_Transaction_Actual_Payment_Amount,
            string p_Description,
            bool p_Has_Been_Actually_Charged_In_Statement,
            decimal? p_Total_Charged_In_Statement,
            int p_Updating_User_Id,
            App_Permission_Type p_Authenticated_User_Permission)
        {
            this.Validate_Operation_For_Authenticated_User(
                p_User_ID_Bank_Owner,
                p_Updating_User_Id,
                p_Authenticated_User_Permission);

            return Data_Access_Layer_Facade.Instance.CreditCardStatementTransactions_Update_Credit_Card_Statement_Transaction(
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
            int p_User_ID_Bank_Owner,
            long p_Credit_Card_Statement_Transaction_Id,
            int p_Deleting_User_Id,
            App_Permission_Type p_Authenticated_User_Permission)
        {
            this.Validate_Operation_For_Authenticated_User(
                p_User_ID_Bank_Owner,
                p_Deleting_User_Id,
                p_Authenticated_User_Permission);

            return Data_Access_Layer_Facade.Instance.CreditCardStatementTransactions_Delete_Credit_Card_Statement_Transaction(
                p_Credit_Card_Statement_Transaction_Id,
                p_Deleting_User_Id);
        }

        public bool CreditCardStatementTransactions_Delete_Credit_Card_Statement_All_Transactions_By_Statement_Id(
            int p_User_ID_Bank_Owner,
            int p_Bank_Account_Credit_Card_Statement_Id,
            int p_Deleting_User_Id,
            App_Permission_Type p_Authenticated_User_Permission)
        {
            this.Validate_Operation_For_Authenticated_User(
                p_User_ID_Bank_Owner,
                p_Deleting_User_Id,
                p_Authenticated_User_Permission);

            return Data_Access_Layer_Facade.Instance.CreditCardStatementTransactions_Delete_Credit_Card_Statement_All_Transactions_By_Statement_Id(
                p_Bank_Account_Credit_Card_Statement_Id,
                p_Deleting_User_Id);
        }

        public Credit_Cards_Statement_Transaction CreditCardStatementTransactions_Get_Credit_Card_Statement_Transaction_Details(
            int p_User_ID_Bank_Owner,
            long p_Credit_Card_Statement_Transaction_Id,
            int p_User_ID_Searching,
            App_Permission_Type p_Authenticated_User_Permission
            )
        {
            this.Validate_Operation_For_Authenticated_User(
                p_User_ID_Bank_Owner,
                p_User_ID_Searching,
                p_Authenticated_User_Permission);

            return Data_Access_Layer_Facade.Instance.CreditCardStatementTransactions_Get_Credit_Card_Statement_Transaction_Details(
                p_User_ID_Bank_Owner,
                p_Credit_Card_Statement_Transaction_Id,
                p_User_ID_Searching);
        }

        public bool CreditCardStatementTransactions_Update_Credit_Card_Statement_Transaction_FullDetails(
            int  p_User_ID_Bank_Owner,
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
            int p_Updating_User_Id,
            App_Permission_Type p_Authenticated_User_Permission)
        {
            this.Validate_Operation_For_Authenticated_User(
                p_User_ID_Bank_Owner,
                p_Updating_User_Id,
                p_Authenticated_User_Permission);

            return Data_Access_Layer_Facade.Instance.CreditCardStatementTransactions_Update_Credit_Card_Statement_Transaction_FullDetails(
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
        //    int p_Searching_User_Id,
        //    App_Permission_Type p_Authenticated_User_Permission)
        //{
        //    this.Validate_Operation_For_Authenticated_User(
        //        p_User_Id_Bank_Owner,
        //        p_Searching_User_Id,
        //        p_Authenticated_User_Permission);

        //    return Data_Access_Layer_Facade.Instance
        //        .CreditCardStatementTransactionDocumentConnection_Get_Document_Connections_By_CCStatement_Transaction_Id(
        //            p_User_Id_Bank_Owner,
        //            p_Credit_Card_Statement_Transaction_Id,
        //            p_Searching_User_Id
        //        );
        //}

        private long CreditCardStatementTransactionDocumentConnection_Insert_Credit_Card_Statement_Transaction_Document_Connection(
            int p_User_Id_Bank_Owner,
            long p_Credit_Card_Statement_Transaction_Id,
            byte p_Connection_Type,
            int p_Document_Record_Id,
            bool p_Is_Visible_To_Anonymous_Users,
            bool p_Is_Available_For_Download_For_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users,
            bool p_Is_Available_For_Download_For_Followers_Users,
            int p_Creating_User_Id,
            App_Permission_Type p_Authenticated_User_Permission)
        {
            this.Validate_Operation_For_Authenticated_User(
                p_User_Id_Bank_Owner,
                p_Creating_User_Id,
                p_Authenticated_User_Permission);

            return Data_Access_Layer_Facade.Instance
                .CreditCardStatementTransactionDocumentConnection_Insert_Credit_Card_Statement_Transaction_Document_Connection(
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

        public long CreditCardStatementTransactionDocumentConnection_Insert_Credit_Card_Statement_Transaction_Document_Connection(
            int p_User_Id_Bank_Owner,
            long p_Credit_Card_Statement_Transaction_Id,
            byte p_Connection_Type,
            int p_Document_Record_Id,
            int p_Creating_User_Id,
            App_Permission_Type p_Authenticated_User_Permission)
        {
            long l_New_Document_Connection_Id_To_Return = 0;

            this.Validate_Operation_For_Authenticated_User(
                p_User_Id_Bank_Owner,
                p_Creating_User_Id,
                p_Authenticated_User_Permission);

            bool? p_Is_Visible_To_Anonymous_Users = null;
            bool? p_Is_Available_For_Download_For_Anonymous_Users = null;
            bool? p_Is_Visible_To_Followers_Users = null;
            bool? p_Is_Available_For_Download_For_Followers_Users = null;

            switch (p_Connection_Type)
            {
                case 1:
                    // Expense
                    var expenseDetails = this.Expenses_Get_By_Id(
                            p_Document_Record_Id,
                            p_User_Id_Bank_Owner,
                            p_Creating_User_Id,
                            p_Authenticated_User_Permission);
                    if (expenseDetails!= null)
                    {
                        p_Is_Visible_To_Anonymous_Users = expenseDetails.Is_Visible_To_Anonymous_Users;
                        p_Is_Available_For_Download_For_Anonymous_Users = expenseDetails.Is_Available_For_Download_For_Anonymous_Users;
                        p_Is_Visible_To_Followers_Users = expenseDetails.Is_Visible_To_Anonymous_Users;
                        p_Is_Available_For_Download_For_Followers_Users = expenseDetails.Is_Available_For_Download_For_Followers_Users;
                    }

                    break;

                case 2:
                    // Invoice
                    var invoiceDetails = this.Invoices_Get_By_Id(
                            p_Document_Record_Id,
                            p_User_Id_Bank_Owner,
                            p_Creating_User_Id,
                            p_Authenticated_User_Permission);
                    if (invoiceDetails != null)
                    {
                        p_Is_Visible_To_Anonymous_Users = invoiceDetails.Is_Visible_To_Anonymous_Users;
                        p_Is_Available_For_Download_For_Anonymous_Users = invoiceDetails.Is_Available_For_Download_For_Anonymous_Users;
                        p_Is_Visible_To_Followers_Users = invoiceDetails.Is_Visible_To_Anonymous_Users;
                        p_Is_Available_For_Download_For_Followers_Users = invoiceDetails.Is_Available_For_Download_For_Followers_Users;
                    }
                    break;

                case 3:
                    // General document
                    var generalDocumentDetails = this.GeneralDocuments_Get_By_Id(
                            p_Document_Record_Id,
                            p_User_Id_Bank_Owner,
                            p_Creating_User_Id,
                            p_Authenticated_User_Permission);
                    if (generalDocumentDetails != null)
                    {
                        p_Is_Visible_To_Anonymous_Users = generalDocumentDetails.Is_Visible_To_Anonymous_Users;
                        p_Is_Available_For_Download_For_Anonymous_Users = generalDocumentDetails.Is_Available_For_Download_For_Anonymous_Users;
                        p_Is_Visible_To_Followers_Users = generalDocumentDetails.Is_Visible_To_Anonymous_Users;
                        p_Is_Available_For_Download_For_Followers_Users = generalDocumentDetails.Is_Available_For_Download_For_Followers_Users;
                    }
                    break;

            }

            if (    p_Is_Visible_To_Anonymous_Users.HasValue &&
                    p_Is_Available_For_Download_For_Anonymous_Users.HasValue &&
                    p_Is_Visible_To_Followers_Users.HasValue &&
                    p_Is_Available_For_Download_For_Followers_Users.HasValue    )
            {
                l_New_Document_Connection_Id_To_Return = Data_Access_Layer_Facade.Instance
                    .CreditCardStatementTransactionDocumentConnection_Insert_Credit_Card_Statement_Transaction_Document_Connection(
                        p_User_Id_Bank_Owner,
                        p_Credit_Card_Statement_Transaction_Id,
                        p_Connection_Type,
                        p_Document_Record_Id,
                        p_Is_Visible_To_Anonymous_Users.Value,
                        p_Is_Available_For_Download_For_Anonymous_Users.Value,
                        p_Is_Visible_To_Followers_Users.Value,
                        p_Is_Available_For_Download_For_Followers_Users.Value,
                        p_Creating_User_Id
                    );
            }

            return l_New_Document_Connection_Id_To_Return;
        }

        public bool CreditCardStatementTransactionDocumentConnection_Delete_Credit_Card_Statement_Transaction_Document_Connection(
            int p_User_Id_Bank_Owner,
            long p_Document_Connection_Id,
            int p_Deleting_User_Id,
            App_Permission_Type p_Authenticated_User_Permission)
        {
            this.Validate_Operation_For_Authenticated_User(
                p_User_Id_Bank_Owner,
                p_Deleting_User_Id,
                p_Authenticated_User_Permission);

            return Data_Access_Layer_Facade.Instance
                .CreditCardStatementTransactionDocumentConnection_Delete_Credit_Card_Statement_Transaction_Document_Connection(
                    p_User_Id_Bank_Owner,
                    p_Document_Connection_Id,
                    p_Deleting_User_Id
                );
        }

        public List<Bank_Account_Transaction_Document_Connection>
            BankAccountTransactionsDocumentConnections_Get_Documents_Connections(
            long p_Bank_Account_Transaction_Id,
            int p_Searching_User_Id
            )
        {
            return this.TransactionsDocumentConnections_Get_Documents_Connections(
                    p_Bank_Account_Transaction_Id,
                    Transaction_Type.Bank_Account_Transaction,
                    p_Searching_User_Id);
        }

        public List<Bank_Account_Transaction_Document_Connection>
            CreditCardStatementTransactionDocumentConnection_Get_Documents_Connections(
            long p_Credit_Card_Statement_Transaction_Id,
            int p_Searching_User_Id
            )
        {
            return this.TransactionsDocumentConnections_Get_Documents_Connections(
                    p_Credit_Card_Statement_Transaction_Id,
                    Transaction_Type.Credit_Card_Statement_Transaction,
                    p_Searching_User_Id);
        }

        private List<Bank_Account_Transaction_Document_Connection>
            TransactionsDocumentConnections_Get_Documents_Connections(
            long p_Transaction_Id,
            Transaction_Type p_Transaction_Type,
            int p_Searching_User_Id
            )
        {
            return Data_Access_Layer_Facade.Instance
                .BankAccountTransactionsDocumentConnections_Get_Documents_Connections(
                    p_Transaction_Id,
                    p_Transaction_Type,
                    p_Searching_User_Id);
        }

        public List<Bank_Account_Transaction_Document_Connection_Suggestion>
            BankAccountTransactionsDocumentConnections_Get_Document_Connection_Suggestions(
            long p_Bank_Account_Transaction_Id,
            int p_Searching_User_Id)
        {
            return this.TransactionsDocumentConnections_Get_Document_Connection_Suggestions(
                    p_Bank_Account_Transaction_Id,
                    Transaction_Type.Bank_Account_Transaction,
                    p_Searching_User_Id);
        }

        public List<Bank_Account_Transaction_Document_Connection_Suggestion>
            CreditCardStatementTransactionDocumentConnection_Get_Document_Connection_Suggestions(
            long p_Credit_Card_Statement_Transaction_Id,
            int p_Searching_User_Id)
        {
            return this.TransactionsDocumentConnections_Get_Document_Connection_Suggestions(
                    p_Credit_Card_Statement_Transaction_Id,
                    Transaction_Type.Credit_Card_Statement_Transaction,
                    p_Searching_User_Id);
        }

        private List<Bank_Account_Transaction_Document_Connection_Suggestion>
            TransactionsDocumentConnections_Get_Document_Connection_Suggestions(
            long p_Transaction_Id,
            Transaction_Type p_Transaction_Type,
            int p_Searching_User_Id)
        {
            return Data_Access_Layer_Facade.Instance
                .BankAccountTransactionsDocumentConnections_Get_Document_Connection_Suggestions(
                    p_Transaction_Id,
                    p_Transaction_Type,
                    p_Searching_User_Id);
        }

        public List<Bank_Account_Transaction_Document_Connection_Suggestion> 
            BankAccountTransactionsDocumentConnections_Search_For_Documents_To_Connect(
                long        p_Bank_Account_Transaction_Id               ,
                DateTime?   p_Filter_By_From_Date                       ,
                DateTime?   p_Filter_By_To_Date                         ,
                byte?       p_Filter_By_Type                            ,
                short?      p_Filter_By_Country_Id                      ,
                string      p_Filter_By_City_Or_Address_Or_Zipcode      ,
                string      p_Filter_By_Company_Name_Or_People_Name     ,
                int         p_Searching_User_Id                         )
        {
            // Validate for minimum search criteria 

            return this.TransactionsDocumentConnections_Search_For_Documents_To_Connect(
                    p_Bank_Account_Transaction_Id,
                    Transaction_Type.Bank_Account_Transaction,
                    p_Filter_By_From_Date,
                    p_Filter_By_To_Date,
                    p_Filter_By_Type,
                    p_Filter_By_Country_Id,
                    p_Filter_By_City_Or_Address_Or_Zipcode,
                    p_Filter_By_Company_Name_Or_People_Name,
                    p_Searching_User_Id);
        }

        public List<Bank_Account_Transaction_Document_Connection_Suggestion>
            CreditCardStatementTransactionDocumentConnection_Search_For_Documents_To_Connect(
                long p_Credit_Card_Statement_Transaction_Id,
                DateTime? p_Filter_By_From_Date,
                DateTime? p_Filter_By_To_Date,
                byte? p_Filter_By_Type,
                short? p_Filter_By_Country_Id,
                string p_Filter_By_City_Or_Address_Or_Zipcode,
                string p_Filter_By_Company_Name_Or_People_Name,
                int p_Searching_User_Id)
        {
            // Validate for minimum search criteria 

            return this.TransactionsDocumentConnections_Search_For_Documents_To_Connect(
                    p_Credit_Card_Statement_Transaction_Id,
                    Transaction_Type.Credit_Card_Statement_Transaction,
                    p_Filter_By_From_Date,
                    p_Filter_By_To_Date,
                    p_Filter_By_Type,
                    p_Filter_By_Country_Id,
                    p_Filter_By_City_Or_Address_Or_Zipcode,
                    p_Filter_By_Company_Name_Or_People_Name,
                    p_Searching_User_Id);
        }

        private List<Bank_Account_Transaction_Document_Connection_Suggestion>
            TransactionsDocumentConnections_Search_For_Documents_To_Connect(
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
            // Validate for minimum search criteria 

            return Data_Access_Layer_Facade.Instance
                .BankAccountTransactionsDocumentConnections_Search_For_Documents_To_Connect(
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
            int p_Document_Record_Id,
            bool p_Is_Visible_To_Anonymous_Users,
            bool p_Is_Available_For_Download_For_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users,
            bool p_Is_Available_For_Download_For_Followers_Users,
            int p_Creating_User_Id)
        {
            return Data_Access_Layer_Facade.Instance.BankAccountTransactionsDocumentConnections_Insert_Document_Connection(
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
            int p_Updating_User_Id)
        {
            return Data_Access_Layer_Facade.Instance.BankAccountTransactionsDocumentConnections_Update_Document_Connection(
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
            int p_Deleting_User_Id)
        {
            return Data_Access_Layer_Facade.Instance.BankAccountTransactionsDocumentConnections_Delete_Document_Connection(
                    p_Document_Connection_Id,
                    p_Bank_Account_Transaction_Id,
                    p_Deleting_User_Id);
        }

        public List<Credit_Cards_Statement> CreditCardStatements_Get_By_Date_Unconnected_Statements(
            long p_Bank_Account_Transaction_Id,
            int p_User_ID_Searching)
        {
            return Data_Access_Layer_Facade.Instance.CreditCardStatements_Get_By_Date_Unconnected_Statements(
                p_Bank_Account_Transaction_Id,
                p_User_ID_Searching);
        }

        public bool BankAccount_Transactions_Update_Connect_With_Statement(
            long p_Bank_Account_Transaction_Id,
            int p_Credit_Card_Statement_Id,
            int p_Updating_User_Id
            )
        {
            return Data_Access_Layer_Facade.Instance.BankAccount_Transactions_Update_Connect_With_Statement(
                    p_Bank_Account_Transaction_Id,
                    p_Credit_Card_Statement_Id,
                    p_Updating_User_Id
                );
        }

        public bool BankAccount_Transactions_Update_Disconnect_Statement(
            long p_Bank_Account_Transaction_Id,
            int p_Credit_Card_Statement_Id,
            int p_Updating_User_Id)
        {
            return Data_Access_Layer_Facade.Instance.BankAccount_Transactions_Update_Disconnect_Statement(
                    p_Bank_Account_Transaction_Id,
                    p_Credit_Card_Statement_Id,
                    p_Updating_User_Id
                );
        }

        public List<Bank_Account_Transactions> BankAccount_Transactions_Get_By_Date_Unconnected_Transactions_To_Credit_Card_Statements(
            int p_Credit_card_Statement_Id,
            int p_User_ID_Searching)
        {
            return Data_Access_Layer_Facade.Instance
                .BankAccount_Transactions_Get_By_Date_Unconnected_Transactions_To_Credit_Card_Statements(
                    p_Credit_card_Statement_Id,
                    p_User_ID_Searching);
        }
    }
}

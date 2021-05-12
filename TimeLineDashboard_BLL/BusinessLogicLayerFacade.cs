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
            if (p_User_Id != p_Authenticated_User_Id  &&
                p_Authenticated_User_Permission_Type.App_Permission_Type_Id != App_Permission_Type.Permission_Type.Application_Administrator &&
                p_Authenticated_User_Permission_Type.App_Permission_Type_Id != App_Permission_Type.Permission_Type.DashboardTimeLine_Company_Employee ) 
            {
                throw new Exception("Permission Error! The authenticated user is not permitted to get the user details");
            }

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

        public General_Documents GeneralDocuments_Get_By_Id(int p_General_Document_Record_Id, int p_User_Id_Document_Owner)
        {
            return Data_Access_Layer_Facade.Instance.GeneralDocuments_Get_By_Id(p_General_Document_Record_Id, p_User_Id_Document_Owner);
        }

        public Invoices Invoices_Get_By_Id(int invoice_Record_Id, int user_Id_Invoice_Owner)
        {
            return Data_Access_Layer_Facade.Instance.Invoices_Get_By_Id(invoice_Record_Id, user_Id_Invoice_Owner);
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
            int p_Client_Id, string p_Company_Name, string p_Website_URL, byte? p_Default_Currency, short p_Country_Id,
            short? p_State_Id, string p_City, string p_Address, string p_ZipCode, string p_Telephone, string p_Mobile_Phone,
            short p_Client_Type_Id, string p_Client_Tax_Reference_Number, string p_Main_Contact_FullName,
            string p_Main_Contact_Email_Address, string p_Main_Contact_Phone_Number,
            DateTime? p_Client_From_Date, DateTime? p_Client_To_Date, DateTime? p_First_Contract_Date,
            string p_First_Contract_Signed_With_Contact_Full_Name, string p_First_Contract_Signed_In_Location_Description,
            bool p_Is_Active, int p_Authenticated_User_ID)
        {
            bool updated_Successfully = false;

            updated_Successfully = Data_Access_Layer_Facade.Instance.Clients_Update_Client_Details(
                p_Client_Id, p_Company_Name, p_Website_URL, p_Default_Currency, p_Country_Id,
                p_State_Id, p_City, p_Address, p_ZipCode,
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
                authenticated_Permission_Type.App_Permission_Type_Id != App_Permission_Type.Permission_Type.Application_Administrator )
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
            int p_User_Id, string p_Company_Name, string p_Website_URL, byte? p_Default_Currency, short p_Country_Id,
            short? p_State_Id, string p_City, string p_Address, string p_ZipCode,
            string p_Telephone, string p_Mobile_Phone,
            short p_Client_Type_Id, string p_Client_Tax_Reference_Number, string p_Main_Contact_FullName,
            string p_Main_Contact_Email_Address, string p_Main_Contact_Phone_Number,
            DateTime? p_Client_From_Date, DateTime? p_Client_To_Date, DateTime? p_First_Contract_Date,
            string p_First_Contract_Signed_With_Contact_Full_Name, string p_First_Contract_Signed_In_Location_Description,
            bool p_Is_Active, int p_Logged_In_Administrative_User_Id)
        {
            return Data_Access_Layer_Facade.Instance.Clients_Insert_New_Client_Administrative_Registration_Process(
                p_User_Id, p_Company_Name, p_Website_URL, p_Default_Currency, p_Country_Id,
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
            short? p_State_Id, string p_City, string p_Address, string p_ZipCode, byte? p_Default_Currency,decimal? p_Default_Vat_Percentage,
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
            bool p_Is_Visible_To_Anonymous_Users, bool p_Is_Available_For_Download_For_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users, bool p_Is_Available_For_Download_For_Followers_Users,
            int p_Updating_User_Id, bool p_Is_Active)
        {
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

            if (p_File_Content_To_Save_In_Azure!= null && p_File_Content_To_Save_In_Azure.Length>0)
            {
                string l_Azure_Block_Blob_Uploaded_Reference
                    = this.Upload_File_To_Azure(
                        p_File_Content_To_Save_In_Azure, 
                        p_Original_File_Name,
                        p_User_Id,
                        p_Record_Created_By_User_Id, 
                        p_Creating_User_Permission );

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

            new_Created_Expenses_To_Return =  Data_Access_Layer_Facade.Instance.Expenses_Insert_New_Expense(
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

            return new_Created_Expenses_To_Return;
        }

        public Expenses Expenses_Get_By_Id(int p_Expense_Record_Id, int p_User_Id_Expense_Owner)
        {
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
            string p_User_Comments, string p_Original_File_Name, string p_Azure_Block_Blob_Reference,
            bool p_Is_Visible_To_Anonymous_Users, bool p_Is_Available_For_Download_For_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users, bool p_Is_Available_For_Download_For_Followers_Users,
            int p_Record_Created_By_User_Id, DateTime p_Record_Creation_DateTime_UTC,
            int p_Record_Last_Updated_By_User_Id, DateTime p_Record_Last_Updated_DateTime_UTC,
            bool p_Is_Active
            )
        {
            return Data_Access_Layer_Facade.Instance.Invoices_Insert_New_Invoice_Details(
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
                p_Record_Created_By_User_Id, p_Record_Creation_DateTime_UTC,
                p_Record_Last_Updated_By_User_Id, p_Record_Last_Updated_DateTime_UTC,
                p_Is_Active
                );
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
                    int p_Bank_Account_Transaction_Id,
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
            int p_Bank_Account_Transaction_Id,
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
            int p_Bank_Account_Transaction_Id,
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

        public Bank_Account_Transactions_Response_For_UI BankAccount_Transactions_Get_Transactions_By_Bank_Account_Id_And_User_Id(
            int p_Page_Number,
            int p_Rows_Per_Page,
            int p_Bank_Account_Id,
            int p_User_Id_Bank_Account_Owner,
            int p_User_Id_Searching_For_Bank_Account_Transactions)
        {
            return Data_Access_Layer_Facade.Instance.BankAccount_Transactions_Get_Transactions_By_Bank_Account_Id_And_User_Id(
                    p_Page_Number,
                    p_Rows_Per_Page,
                    p_Bank_Account_Id,
                    p_User_Id_Bank_Account_Owner,
                    p_User_Id_Searching_For_Bank_Account_Transactions
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

        public int BankAccount_Transactions_Save_Transactions_From_UI_To_Database(
            int p_Bank_Account_Id,
            Bank_Account_Transactions_To_DB_Sync_From_UI transactions_From_UI,
            int p_Saving_User_Id
            )
        {
            int successfully_Processed_Transactions = 0;

            int[] bankAccount_Transactions_Ids = new int[] { transactions_From_UI.Bank_Account_Transaction_Id };// transactions_From_UI.Where(t => t.Bank_Account_Transaction_Id > 0).Select(t => t.Bank_Account_Transaction_Id).ToArray();
            // Select the bankAccountsTransactions In the database to compare values to know if to actually update the records in the database.
            List<Bank_Account_Transactions> transactions_To_Check_If_Updated =
                this.BankAccounts_Transactions_Get_Transactions_By_Transactions_ArrayOfIds(p_Bank_Account_Id, bankAccount_Transactions_Ids, p_Saving_User_Id);

            Bank_Account_Transactions_To_DB_Sync_From_UI transaction_To_DB_Sync_From_UI = transactions_From_UI;

            if (transaction_To_DB_Sync_From_UI.Is_New_Record)
            {
                var newTransaction = this.BankAccount_Transactions_Insert_New_Transaction_Details(
                    p_Bank_Account_Id,
                    transaction_To_DB_Sync_From_UI.Transaction_Account_Balance,
                    transaction_To_DB_Sync_From_UI.Transaction_Actual_DateTime,
                    transaction_To_DB_Sync_From_UI.Positive_Amount_Entered,
                    transaction_To_DB_Sync_From_UI.Negative_Amount_Paid,
                    transaction_To_DB_Sync_From_UI.Transaction_Value_DateTime,
                    transaction_To_DB_Sync_From_UI.Reference_Number,
                    transaction_To_DB_Sync_From_UI.Transaction_Bank_Description,
                    transaction_To_DB_Sync_From_UI.Transaction_Bank_Inner_Reference_Code,
                    transaction_To_DB_Sync_From_UI.Is_Visible_To_Anonymous_Users,
                    transaction_To_DB_Sync_From_UI.Is_Visible_To_Followers_Users,
                    p_Saving_User_Id
                    );

                if (newTransaction.Bank_Account_Transaction_Id > 0)
                {
                    successfully_Processed_Transactions++;
                }
            }
            else
            {
                if (!transaction_To_DB_Sync_From_UI.Is_Deleted)
                {
                    var transaction_Details_In_Database = transactions_To_Check_If_Updated.Single(t => t.Bank_Account_Transaction_Id == transaction_To_DB_Sync_From_UI.Bank_Account_Transaction_Id);

                    bool transaction_Should_Be_Updated = false;

                    if (transaction_Details_In_Database.Transaction_Account_Balance != transaction_To_DB_Sync_From_UI.Transaction_Account_Balance
                         || transaction_Details_In_Database.Transaction_Actual_DateTime != transaction_To_DB_Sync_From_UI.Transaction_Actual_DateTime
                         || transaction_Details_In_Database.Positive_Amount_Entered != transaction_To_DB_Sync_From_UI.Positive_Amount_Entered
                         || transaction_Details_In_Database.Negative_Amount_Paid != transaction_To_DB_Sync_From_UI.Negative_Amount_Paid
                         || transaction_Details_In_Database.Transaction_Value_DateTime != transaction_To_DB_Sync_From_UI.Transaction_Value_DateTime
                         || transaction_Details_In_Database.Reference_Number != transaction_To_DB_Sync_From_UI.Reference_Number
                         || transaction_Details_In_Database.Transaction_Bank_Description != transaction_To_DB_Sync_From_UI.Transaction_Bank_Description
                         || transaction_Details_In_Database.Transaction_Bank_Inner_Reference_Code != transaction_To_DB_Sync_From_UI.Transaction_Bank_Inner_Reference_Code
                         || transaction_Details_In_Database.Is_Visible_To_Anonymous_Users != transaction_To_DB_Sync_From_UI.Is_Visible_To_Anonymous_Users
                         || transaction_Details_In_Database.Is_Visible_To_Followers_Users != transaction_To_DB_Sync_From_UI.Is_Visible_To_Followers_Users
                         )
                    {
                        transaction_Should_Be_Updated = true;
                    }

                    if (transaction_Should_Be_Updated)
                    {
                        bool updated_Successfully = this.BankAccount_Transactions_Update_Transaction_Details(
                            transaction_To_DB_Sync_From_UI.Bank_Account_Transaction_Id,
                            transaction_To_DB_Sync_From_UI.Transaction_Account_Balance,
                            transaction_To_DB_Sync_From_UI.Transaction_Actual_DateTime,
                            transaction_To_DB_Sync_From_UI.Positive_Amount_Entered,
                            transaction_To_DB_Sync_From_UI.Negative_Amount_Paid,
                            transaction_To_DB_Sync_From_UI.Transaction_Value_DateTime,
                            transaction_To_DB_Sync_From_UI.Reference_Number,
                            transaction_To_DB_Sync_From_UI.Transaction_Bank_Description,
                            transaction_To_DB_Sync_From_UI.Transaction_Bank_Inner_Reference_Code,
                            transaction_To_DB_Sync_From_UI.Is_Visible_To_Anonymous_Users,
                            transaction_To_DB_Sync_From_UI.Is_Visible_To_Followers_Users,
                            p_Saving_User_Id
                            );

                        if (updated_Successfully)
                        {
                            successfully_Processed_Transactions++;
                        }
                    }
                    else
                    {
                        // The transaction is the same as in the database so no need to update it. 
                        successfully_Processed_Transactions++;
                    }
                }
                else
                {
                    // The transaction got deleted. Mark it as deleted in the DB..
                    if (this.BankAccount_Transactions_Delete_Transaction(
                        p_Bank_Account_Id,
                        transaction_To_DB_Sync_From_UI.Bank_Account_Transaction_Id,
                        p_Saving_User_Id
                        ))
                    {
                        successfully_Processed_Transactions++;
                    }
                }

            }

            return successfully_Processed_Transactions;
        }


        internal List<Bank_Account_Transactions> BankAccounts_Transactions_Get_Transactions_By_Transactions_ArrayOfIds(
            int p_Bank_Account_Id,
            int[] transactions_IDs_Array, 
            int p_Searching_User_Id
            )
        {
            return Data_Access_Layer_Facade.Instance.BankAccount_Transactions_Get_Transactions_By_Bank_Account_Id_And_User_Id_And_TransactionsIDs_Array(
                    p_Bank_Account_Id,
                    transactions_IDs_Array,
                    p_Searching_User_Id
                );
        }

        public bool BankAccount_Transactions_Delete_Transaction(
            int p_Bank_Account_Id,
            int p_Bank_Account_Transaction_Id,
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
            int p_Upload_For_User_Id , 
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
                    if (date_String_Extracted.IndexOf(" ") > -1 )
                    { 
                        hours_String_Extracted = date_String_Extracted.Substring(date_String_Extracted.IndexOf(" ")+1, 2);
                        minutes_String_Extracted = date_String_Extracted.Substring(date_String_Extracted.IndexOf(" ")+3, 2);

                        date_String_Extracted = date_String_Extracted.Substring(0, date_String_Extracted.IndexOf(" ")+1).Trim();
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
                    int starting_Index_Supplier_Details = p_Uploaded_File_Name.IndexOf('-', p_Uploaded_File_Name.IndexOf('-') + 1 ) + 1 ;
                    int length_Supplier_Name_Details_For_Extraction = p_Uploaded_File_Name.IndexOf('-', starting_Index_Supplier_Details ) - starting_Index_Supplier_Details;
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
                            suggestions_To_Return.Total_Without_Vat =
                                suggestions_To_Return.Total_Amount / ((suggestions_To_Return.Vat_Percentage + 100) / 100);
                            suggestions_To_Return.Total_Vat = suggestions_To_Return.Total_Amount - suggestions_To_Return.Total_Without_Vat;
                        }
                    }
                }
                catch(Exception exc)
                {

                }
            }

            return suggestions_To_Return;
        }

        private Suppliers Try_To_Find_Supplier_Id_By_Supplier_Details_From_Filename(
            string p_Supplier_Details_Extracted,
            int p_User_Id,
            int p_Authenticated_User_Id )
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
            foreach ( var pair in supplier_Coordinates_Strength)
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
    } 
}

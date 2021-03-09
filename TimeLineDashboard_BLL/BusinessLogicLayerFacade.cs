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
            string p_Filter_By_CompanyName_Or_Person_Fullname )
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
                p_Filter_By_CompanyName_Or_Person_Fullname );
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

        public List<Clients> Clients_Get_All_By_User_Id(int p_Selected_User_Id_To_Return_Clients, int p_Authenticated_User_ID)
        {
            return Data_Access_Layer_Facade.Instance.Clients_Get_All_By_User_Id(p_Selected_User_Id_To_Return_Clients, p_Authenticated_User_ID);
        }

        public Users Users_Insert_New_User_Administrative_Registration_Process(
            string p_Username, string p_Password, byte p_App_Permission_Type_Id, string p_First_Name, string p_Middle_Name,
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
                p_Username, l_Encrypted_Password, l_Encryption_Random_Salt, p_App_Permission_Type_Id, p_First_Name, p_Middle_Name,
                p_Last_Name, p_Email, p_Country_Id, p_State_Id, p_City, p_Address, p_ZipCode, p_Mobile_Phone, p_Additional_Phone_Number,
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

            updated_Successfully =  Data_Access_Layer_Facade.Instance.Clients_Update_Client_Details(
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

        public List<Clients> Clients_Get_Search(
            int p_User_Id,
            short? p_Filter_By_Type,
            short? p_Filter_By_Country,
            short? p_Filter_By_State,
            string p_Filter_By_City_Or_Address_Or_ZipCode,
            string p_Filter_By_CompanyName_Or_Person_Fullname )
        {
            return Data_Access_Layer_Facade.Instance.Clients_Get_Search(
                p_User_Id,
                p_Filter_By_Type,
                p_Filter_By_Country,
                p_Filter_By_State,
                p_Filter_By_City_Or_Address_Or_ZipCode,
                p_Filter_By_CompanyName_Or_Person_Fullname );
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
            DateTime? p_Client_From_Date, DateTime? p_Client_To_Date , DateTime? p_First_Contract_Date ,
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
                p_Filter_By_CompanyName_Or_Person_Fullname );
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
            byte? p_Default_Currency_Id, string p_Telephone, string p_Mobile_Phone,
            short p_Supplier_Type_Id, string p_Supplier_Tax_Reference_Number, string p_Main_Contact_FullName,
            string p_Main_Contact_Email_Address, string p_Main_Contact_Phone_Number,
            DateTime? p_Supplier_From_Date, DateTime? p_Supplier_To_Date, DateTime? p_First_Contract_Date,
            string p_First_Contract_Signed_With_Contact_Full_Name, string p_First_Contract_Signed_In_Location_Description,
            bool p_Is_Active, int p_Updating_User_Id )
        {
            return Data_Access_Layer_Facade.Instance.Suppliers_Update_Supplier_Details(
                p_Supplier_Id, p_Company_Name, p_Website_URL, p_Country_Id,
                p_State_Id, p_City, p_Address, p_ZipCode, p_Default_Currency_Id,
                p_Telephone, p_Mobile_Phone, p_Supplier_Type_Id,
                p_Supplier_Tax_Reference_Number, p_Main_Contact_FullName,
                p_Main_Contact_Email_Address, p_Main_Contact_Phone_Number,
                p_Supplier_From_Date, p_Supplier_To_Date, p_First_Contract_Date,
                p_First_Contract_Signed_With_Contact_Full_Name, p_First_Contract_Signed_In_Location_Description,
                p_Is_Active, p_Updating_User_Id );
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
            string p_Invoiced_Client_To_CompanyName,string p_Invoiced_Client_To_Tax_Reference, 
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
            int p_Record_Created_By_User_Id, DateTime p_Record_Creation_DateTime_UTC,
            int p_Record_Last_Updated_By_User_Id, DateTime p_Record_Last_Updated_DateTime_UTC,
            bool p_Is_Active
            )
        {
            return Data_Access_Layer_Facade.Instance.Expenses_Insert_New_Expense(
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
                p_Record_Created_By_User_Id, p_Record_Creation_DateTime_UTC,
                p_Record_Last_Updated_By_User_Id, p_Record_Last_Updated_DateTime_UTC,
                p_Is_Active
                );
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

        public Expenses Expenses_Get_Expense_Latest_Entry_Based_On_Supplier_Id_And_Expense_DateTime_Selection(int p_Supplier_Id , DateTime p_Expense_DateTime, int p_User_Id_LoggedIn_Creating_Expense)
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
    }
}

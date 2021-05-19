using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TimeLineDashboard.Shared.Models;

namespace TimeLineDashboard.DAL.Operations
{
    internal class Expenses_Operations
    {
        #region Singleton
        private static readonly Expenses_Operations instance = new Expenses_Operations();
        // Explicit static constructor to tell C# compiler  
        // not to mark type as beforefieldinit  
        static Expenses_Operations()
        {
        }
        private Expenses_Operations()
        {
        }
        public static Expenses_Operations Instance
        {
            get
            {
                return instance;
            }
        }
        #endregion

        internal List<Expenses> Get_Search(
            int p_User_Id,
            short? p_Filter_By_Type,
            short? p_Filter_By_Country,
            short? p_Filter_By_State,
            string p_Filter_By_City_Or_Address_Or_ZipCode,
            string p_Filter_By_CompanyName_Or_Person_Fullname)
        {
            List<Expenses> Expenses_To_Return = new List<Expenses>();

            SqlParameter spUser_Id = new SqlParameter("@User_Id", SqlDbType.Int);
            SqlParameter spFilter_By_Type = new SqlParameter("@Filter_By_Type", SqlDbType.SmallInt);
            SqlParameter spFilter_By_Country = new SqlParameter("@Filter_By_Country", SqlDbType.SmallInt);
            SqlParameter spFilter_By_State = new SqlParameter("@Filter_By_State", SqlDbType.SmallInt);
            SqlParameter spFilter_By_City_Or_Address_Or_ZipCode = new SqlParameter("@Filter_By_City_Or_Address_Or_ZipCode", SqlDbType.NVarChar, 50);
            SqlParameter spFilter_By_CompanyName_Or_Person_Fullname = new SqlParameter("@Filter_By_CompanyName_Or_Person_Fullname", SqlDbType.NVarChar, 50);

            spUser_Id.Value = p_User_Id;
            if (p_Filter_By_Type.HasValue)
                spFilter_By_Type.Value = p_Filter_By_Type.Value;
            else
                spFilter_By_Type.Value = DBNull.Value;

            if (p_Filter_By_Country.HasValue)
                spFilter_By_Country.Value = p_Filter_By_Country.Value;
            else
                spFilter_By_Country.Value = DBNull.Value;

            if (p_Filter_By_State.HasValue)
                spFilter_By_State.Value = p_Filter_By_State.Value;
            else
                spFilter_By_State.Value = DBNull.Value;

            spFilter_By_City_Or_Address_Or_ZipCode.Value = p_Filter_By_City_Or_Address_Or_ZipCode;
            spFilter_By_CompanyName_Or_Person_Fullname.Value = p_Filter_By_CompanyName_Or_Person_Fullname;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Expenses_Search", 
                new List<SqlParameter>() { 
                    spUser_Id,
                    spFilter_By_Type,
                    spFilter_By_Country,
                    spFilter_By_State,
                    spFilter_By_City_Or_Address_Or_ZipCode,
                    spFilter_By_CompanyName_Or_Person_Fullname });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                Expenses_To_Return = new List<Expenses>(dataSet.Tables[0].Rows.Count);

                for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                {
                    Expenses_To_Return.Add(Create_Expense_Details_From_Data_Row(dataSet.Tables[0].Rows[i]));
                }
            }

            return Expenses_To_Return;
        }

        internal Expenses Get_Expense_Details_By_Expense_Id(
            int p_Expense_Id, 
            int p_User_Id_Expense_Owner, 
            int p_User_Id_Searching_For_Expense_Details )
        {
            Expenses Expense_To_Return = new Expenses();

            SqlParameter spExpense_Record_Id = new SqlParameter("@Expense_Record_Id", SqlDbType.Int);
            SqlParameter spUser_Id_Expense_Owner = new SqlParameter("@User_Id_Expense_Owner", SqlDbType.Int);
            SqlParameter spUser_Id_Searching_For_Expense_Details = new SqlParameter("@User_Id_Searching_For_Expense_Details", SqlDbType.Int);

            spExpense_Record_Id.Value = p_Expense_Id;
            spUser_Id_Expense_Owner.Value = p_User_Id_Expense_Owner;
            spUser_Id_Searching_For_Expense_Details.Value = p_User_Id_Searching_For_Expense_Details;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Expense_Details",
                new List<SqlParameter>() { spExpense_Record_Id, spUser_Id_Expense_Owner, spUser_Id_Searching_For_Expense_Details });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                Expense_To_Return = Create_Expense_Details_From_Data_Row(dataSet.Tables[0].Rows[0]); 
            }

            return Expense_To_Return;
        }

        internal Expenses Insert_New_Expense_Administrative_Registration_Process(
            int p_User_Id, int p_Supplier_Id, DateTime? p_Expense_Invoice_DateTime, 
            byte p_Currency_Id, decimal p_Total_Amount , decimal p_Vat_Percentage,
            decimal p_Total_Without_Vat, decimal p_Total_Vat, 
            int? p_Invoiced_Client_On_User_Location_Id,
            string p_Invoiced_Client_To_CompanyName, string p_Invoiced_Client_To_Tax_Reference, 
            string p_Invoiced_Client_To_PersonName, string p_Invoiced_Client_To_PhoneNumber,
            short? p_Invoiced_Client_To_Country_Id, short? p_Invoiced_Client_To_State_Id, string p_Invoiced_Client_To_City, 
            string p_Invoiced_Client_To_Address, string p_Invoiced_Client_To_Zip, string p_Invoiced_Client_To_EmailAddress, 
            byte p_Expense_Type_Id, 
            string p_Invoice_Number, string p_Invoice_Reference_Number, 
            string p_Invoice_Supplier_Company_Details, string p_Invoice_Supplier_Tax_Reference, short? p_Invoice_Supplier_Country_Id, 
            short? p_Invoice_Supplier_State_Id , string p_Invoice_Supplier_City, string p_Invoice_Supplier_Address_Description,
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
            Expenses new_Registered_Expense_To_Return = null;

            SqlParameter spUser_Id = new SqlParameter("@User_Id", SqlDbType.Int);
            SqlParameter spSupplier_Id = new SqlParameter("@Supplier_Id", SqlDbType.Int);
            SqlParameter spExpense_Invoice_DateTime = new SqlParameter("@Expense_Invoice_DateTime", SqlDbType.DateTime);
            SqlParameter spCurrency_Id = new SqlParameter("@Currency_Id", SqlDbType.TinyInt);
            
            SqlParameter spTotal_Amount = new SqlParameter("@Total_Amount", SqlDbType.Decimal);
            SqlParameter spVat_Percentage = new SqlParameter("@Vat_Percentage", SqlDbType.Decimal);
            SqlParameter spTotal_Without_Vat = new SqlParameter("@Total_Without_Vat", SqlDbType.Decimal);
            SqlParameter spTotal_Vat = new SqlParameter("@Total_Vat", SqlDbType.Decimal);

            SqlParameter spInvoiced_Client_On_User_Location_Id = new SqlParameter("@Invoiced_Client_On_User_Location_Id", SqlDbType.Int);
            SqlParameter spInvoiced_Client_To_CompanyName = new SqlParameter("@Invoiced_Client_To_CompanyName", SqlDbType.NVarChar , 150);
            SqlParameter spInvoiced_Client_To_Tax_Reference = new SqlParameter("@Invoiced_Client_To_Tax_Reference", SqlDbType.NVarChar, 50);
            SqlParameter spInvoiced_Client_To_PersonName = new SqlParameter("@Invoiced_Client_To_PersonName", SqlDbType.NVarChar, 100);
            SqlParameter spInvoiced_Client_To_PhoneNumber = new SqlParameter("@Invoiced_Client_To_PhoneNumber", SqlDbType.NVarChar, 50);
            SqlParameter spInvoiced_Client_To_Country_Id = new SqlParameter("@Invoiced_Client_To_Country_Id", SqlDbType.SmallInt);
            SqlParameter spInvoiced_Client_To_State_Id = new SqlParameter("@Invoiced_Client_To_State_Id", SqlDbType.SmallInt);
            SqlParameter spInvoiced_Client_To_City = new SqlParameter("@Invoiced_Client_To_City", SqlDbType.NVarChar , 100);
            SqlParameter spInvoiced_Client_To_Address = new SqlParameter("@Invoiced_Client_To_Address", SqlDbType.NVarChar, 120);
            SqlParameter spInvoiced_Client_To_Zip = new SqlParameter("@Invoiced_Client_To_Zip", SqlDbType.NVarChar, 10);
            SqlParameter spInvoiced_Client_To_EmailAddress = new SqlParameter("@Invoiced_Client_To_EmailAddress", SqlDbType.NVarChar, 120);

            SqlParameter spExpense_Type_Id = new SqlParameter("@Expense_Type_Id", SqlDbType.TinyInt);
            SqlParameter spInvoice_Number = new SqlParameter("@Invoice_Number", SqlDbType.NVarChar, 30 );
            SqlParameter spInvoice_Reference_Number = new SqlParameter("@Invoice_Reference_Number", SqlDbType.NVarChar, 50);
            
            SqlParameter spInvoice_Supplier_Company_Details = new SqlParameter("@Invoice_Supplier_Company_Details", SqlDbType.NVarChar, 120);
            SqlParameter spInvoice_Supplier_Tax_Reference = new SqlParameter("@Invoice_Supplier_Tax_Reference", SqlDbType.NVarChar, 50);
            SqlParameter spInvoice_Supplier_Country_Id = new SqlParameter("@Invoice_Supplier_Country_Id", SqlDbType.SmallInt );
            SqlParameter spInvoice_Supplier_State_Id = new SqlParameter("@Invoice_Supplier_State_Id", SqlDbType.SmallInt);
            SqlParameter spInvoice_Supplier_City = new SqlParameter("@Invoice_Supplier_City", SqlDbType.NVarChar, 100);
            SqlParameter spInvoice_Supplier_Address_Description = new SqlParameter("@Invoice_Supplier_Address_Description", SqlDbType.NVarChar, 255);
            SqlParameter spInvoice_Supplier_ZipCode = new SqlParameter("@Invoice_Supplier_ZipCode", SqlDbType.NVarChar, 10);
            SqlParameter spInvoice_Supplier_WebAddress = new SqlParameter("@Invoice_Supplier_WebAddress", SqlDbType.NVarChar, 120);
            SqlParameter spInvoice_Supplier_Phone_Number = new SqlParameter("@Invoice_Supplier_Phone_Number", SqlDbType.NVarChar, 50);

            SqlParameter spInvoice_Supplier_Contact_FullName = new SqlParameter("@Invoice_Supplier_Contact_FullName", SqlDbType.NVarChar, 80);
            SqlParameter spInvoice_Content_Long_Description = new SqlParameter("@Invoice_Content_Long_Description", SqlDbType.NVarChar, 2000);
            SqlParameter spUser_Description = new SqlParameter("@User_Description", SqlDbType.NVarChar, 1000);
            SqlParameter spUser_Comments = new SqlParameter("@User_Comments", SqlDbType.NVarChar, 1000);
            SqlParameter spOriginal_File_Name = new SqlParameter("@Original_File_Name", SqlDbType.NVarChar, 255);
            SqlParameter spAzure_Block_Blob_Reference = new SqlParameter("@Azure_Block_Blob_Reference", SqlDbType.NVarChar, 255);

            SqlParameter spIs_Visible_To_Anonymous_Users = new SqlParameter("@Is_Visible_To_Anonymous_Users", SqlDbType.Bit);
            SqlParameter spIs_Available_For_Download_For_Anonymous_Users = new SqlParameter("@Is_Available_For_Download_For_Anonymous_Users", SqlDbType.Bit );
            SqlParameter spIs_Visible_To_Followers_Users = new SqlParameter("@Is_Visible_To_Followers_Users", SqlDbType.Bit);
            SqlParameter spIs_Available_For_Download_For_Followers_Users = new SqlParameter("@Is_Available_For_Download_For_Followers_Users", SqlDbType.Bit);

            SqlParameter spRecord_Created_By_User_Id = new SqlParameter("@Record_Created_By_User_Id", SqlDbType.Int);
            SqlParameter spIs_Active = new SqlParameter("@Is_Active", SqlDbType.Bit);

            spUser_Id.Value = p_User_Id;
            spSupplier_Id.Value = p_Supplier_Id;
            
            if (p_Expense_Invoice_DateTime.HasValue)
                spExpense_Invoice_DateTime.Value = p_Expense_Invoice_DateTime.Value;
            else
                spExpense_Invoice_DateTime.Value = DBNull.Value;

            spCurrency_Id.Value = p_Currency_Id;
            spTotal_Amount.Value = p_Total_Amount;
            spVat_Percentage.Value = p_Vat_Percentage;
            spTotal_Without_Vat.Value = p_Total_Without_Vat;
            spTotal_Vat.Value = p_Total_Vat;

            if (p_Invoiced_Client_On_User_Location_Id.HasValue)
                spInvoiced_Client_On_User_Location_Id.Value = p_Invoiced_Client_On_User_Location_Id;
            else
                spInvoiced_Client_On_User_Location_Id.Value = DBNull.Value;

            spInvoiced_Client_To_CompanyName.Value = p_Invoiced_Client_To_CompanyName;
            spInvoiced_Client_To_Tax_Reference.Value = p_Invoiced_Client_To_Tax_Reference;

            spInvoiced_Client_To_PersonName.Value = p_Invoiced_Client_To_PersonName;
            spInvoiced_Client_To_PhoneNumber.Value = p_Invoiced_Client_To_PhoneNumber;
            if (p_Invoiced_Client_To_Country_Id.HasValue)
                spInvoiced_Client_To_Country_Id.Value = p_Invoiced_Client_To_Country_Id;
            else
                spInvoiced_Client_To_Country_Id.Value = DBNull.Value;
            if (p_Invoiced_Client_To_State_Id.HasValue)
                spInvoiced_Client_To_State_Id.Value = p_Invoiced_Client_To_State_Id;
            else
                spInvoiced_Client_To_State_Id.Value = DBNull.Value;
            spInvoiced_Client_To_City.Value = p_Invoiced_Client_To_City;
            spInvoiced_Client_To_Address.Value = p_Invoiced_Client_To_Address;
            spInvoiced_Client_To_Zip.Value = p_Invoiced_Client_To_Zip;
            spInvoiced_Client_To_EmailAddress.Value = p_Invoiced_Client_To_EmailAddress;

            spExpense_Type_Id.Value = p_Expense_Type_Id;
            spInvoice_Number.Value = p_Invoice_Number;
            spInvoice_Reference_Number.Value = p_Invoice_Reference_Number;
            spInvoice_Supplier_Company_Details.Value = p_Invoice_Supplier_Company_Details;
            spInvoice_Supplier_Tax_Reference.Value = p_Invoice_Supplier_Tax_Reference;
            if (p_Invoice_Supplier_Country_Id.HasValue)
                spInvoice_Supplier_Country_Id.Value = p_Invoice_Supplier_Country_Id;
            else
                spInvoice_Supplier_Country_Id.Value = DBNull.Value;
            if (p_Invoice_Supplier_State_Id.HasValue)
                spInvoice_Supplier_State_Id.Value = p_Invoice_Supplier_State_Id;
            else
                spInvoice_Supplier_State_Id.Value = DBNull.Value;
            spInvoice_Supplier_City.Value = p_Invoice_Supplier_City;
            spInvoice_Supplier_Address_Description.Value = p_Invoice_Supplier_Address_Description;
            spInvoice_Supplier_ZipCode.Value = p_Invoice_Supplier_ZipCode;
            spInvoice_Supplier_WebAddress.Value = p_Invoice_Supplier_WebAddress;
            spInvoice_Supplier_Phone_Number.Value = p_Invoice_Supplier_Phone_Number;

            spInvoice_Supplier_Contact_FullName.Value = p_Invoice_Supplier_Contact_FullName;
            spInvoice_Content_Long_Description.Value = p_Invoice_Content_Long_Description;
            spUser_Description.Value = p_User_Description;
            spUser_Comments.Value = p_User_Comments;
            spOriginal_File_Name.Value = p_Original_File_Name;
            spAzure_Block_Blob_Reference.Value = p_Azure_Block_Blob_Reference;

            spIs_Visible_To_Anonymous_Users.Value = p_Is_Visible_To_Anonymous_Users;
            spIs_Available_For_Download_For_Anonymous_Users.Value = p_Is_Available_For_Download_For_Anonymous_Users;
            spIs_Visible_To_Followers_Users.Value = p_Is_Visible_To_Followers_Users;
            spIs_Available_For_Download_For_Followers_Users.Value = p_Is_Available_For_Download_For_Followers_Users;

            spRecord_Created_By_User_Id.Value = p_Record_Created_By_User_Id;
            spIs_Active.Value = p_Is_Active;

            object new_Expense_Id = SQLHelper.ExecuteStoredProcedure_ReturnDataObjectResult("p_TLBoard_Insert_Expense_Details",
                new List<SqlParameter>() {
                    spUser_Id,  spSupplier_Id, spExpense_Invoice_DateTime,
                    spCurrency_Id, spTotal_Amount, spVat_Percentage, 
                    spTotal_Without_Vat, spTotal_Vat, 
                    spInvoiced_Client_On_User_Location_Id,
                    spInvoiced_Client_To_CompanyName, spInvoiced_Client_To_Tax_Reference, 
                    spInvoiced_Client_To_PersonName, spInvoiced_Client_To_PhoneNumber, 
                    spInvoiced_Client_To_Country_Id, spInvoiced_Client_To_State_Id, spInvoiced_Client_To_City,
                    spInvoiced_Client_To_Address, spInvoiced_Client_To_Zip, spInvoiced_Client_To_EmailAddress,
                    spExpense_Type_Id, spInvoice_Number, spInvoice_Reference_Number,
                    spInvoice_Supplier_Company_Details, spInvoice_Supplier_Tax_Reference,
                    spInvoice_Supplier_Country_Id, spInvoice_Supplier_State_Id, spInvoice_Supplier_City,
                    spInvoice_Supplier_Address_Description, spInvoice_Supplier_ZipCode, spInvoice_Supplier_WebAddress,
                    spInvoice_Supplier_Phone_Number, spInvoice_Supplier_Contact_FullName,
                    spInvoice_Content_Long_Description, spUser_Description, spUser_Comments, 
                    spOriginal_File_Name, spAzure_Block_Blob_Reference,
                    spIs_Visible_To_Anonymous_Users, spIs_Available_For_Download_For_Anonymous_Users,
                    spIs_Visible_To_Followers_Users, spIs_Available_For_Download_For_Followers_Users,
                    spRecord_Created_By_User_Id, 
                    spIs_Active
                });

            if (new_Expense_Id != null)
            {
                int Expense_Id_Registered = Convert.ToInt32(new_Expense_Id);
                if (Expense_Id_Registered > 0)
                {
                    new_Registered_Expense_To_Return = Get_Expense_Details_By_Expense_Id(Expense_Id_Registered, p_User_Id, p_Record_Created_By_User_Id);
                }
            }

            return new_Registered_Expense_To_Return;
        }

        internal bool Update_Expense_Details(
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
            int p_Updating_User_Id , bool p_Is_Active )
        {
            bool updated_Successfully = false;

            SqlParameter spExpense_Record_Id = new SqlParameter("@Expense_Record_Id", SqlDbType.Int);
            SqlParameter spSupplier_Id = new SqlParameter("@Supplier_Id", SqlDbType.Int);
            SqlParameter spExpense_Invoice_DateTime = new SqlParameter("@Expense_Invoice_DateTime", SqlDbType.DateTime);
            SqlParameter spCurrency_Id = new SqlParameter("@Currency_Id", SqlDbType.TinyInt);

            SqlParameter spTotal_Amount = new SqlParameter("@Total_Amount", SqlDbType.Decimal);
            SqlParameter spVat_Percentage = new SqlParameter("@Vat_Percentage", SqlDbType.Decimal);
            SqlParameter spTotal_Without_Vat = new SqlParameter("@Total_Without_Vat", SqlDbType.Decimal);
            SqlParameter spTotal_Vat = new SqlParameter("@Total_Vat", SqlDbType.Decimal);

            SqlParameter spInvoiced_Client_On_User_Location_Id = new SqlParameter("@Invoiced_Client_On_User_Location_Id", SqlDbType.Int);
            SqlParameter spInvoiced_Client_To_CompanyName = new SqlParameter("@Invoiced_Client_To_CompanyName", SqlDbType.NVarChar, 150);
            SqlParameter spInvoiced_Client_To_Tax_Reference = new SqlParameter("@Invoiced_Client_To_Tax_Reference", SqlDbType.NVarChar, 50);
            SqlParameter spInvoiced_Client_To_PersonName = new SqlParameter("@Invoiced_Client_To_PersonName", SqlDbType.NVarChar, 100);
            SqlParameter spInvoiced_Client_To_PhoneNumber = new SqlParameter("@Invoiced_Client_To_PhoneNumber", SqlDbType.NVarChar, 50);
            SqlParameter spInvoiced_Client_To_Country_Id = new SqlParameter("@Invoiced_Client_To_Country_Id", SqlDbType.SmallInt);
            SqlParameter spInvoiced_Client_To_State_Id = new SqlParameter("@Invoiced_Client_To_State_Id", SqlDbType.SmallInt);
            SqlParameter spInvoiced_Client_To_City = new SqlParameter("@Invoiced_Client_To_City", SqlDbType.NVarChar, 100);
            SqlParameter spInvoiced_Client_To_Address = new SqlParameter("@Invoiced_Client_To_Address", SqlDbType.NVarChar, 120);
            SqlParameter spInvoiced_Client_To_Zip = new SqlParameter("@Invoiced_Client_To_Zip", SqlDbType.NVarChar, 10);
            SqlParameter spInvoiced_Client_To_EmailAddress = new SqlParameter("@Invoiced_Client_To_EmailAddress", SqlDbType.NVarChar, 120);

            SqlParameter spExpense_Type_Id = new SqlParameter("@Expense_Type_Id", SqlDbType.TinyInt);
            SqlParameter spInvoice_Number = new SqlParameter("@Invoice_Number", SqlDbType.NVarChar, 30);
            SqlParameter spInvoice_Reference_Number = new SqlParameter("@Invoice_Reference_Number", SqlDbType.NVarChar, 50);

            SqlParameter spInvoice_Supplier_Company_Details = new SqlParameter("@Invoice_Supplier_Company_Details", SqlDbType.NVarChar, 120);
            SqlParameter spInvoice_Supplier_Tax_Reference = new SqlParameter("@Invoice_Supplier_Tax_Reference", SqlDbType.NVarChar, 50);
            SqlParameter spInvoice_Supplier_Country_Id = new SqlParameter("@Invoice_Supplier_Country_Id", SqlDbType.SmallInt);
            SqlParameter spInvoice_Supplier_State_Id = new SqlParameter("@Invoice_Supplier_State_Id", SqlDbType.SmallInt);
            SqlParameter spInvoice_Supplier_City = new SqlParameter("@Invoice_Supplier_City", SqlDbType.NVarChar, 100);
            SqlParameter spInvoice_Supplier_Address_Description = new SqlParameter("@Invoice_Supplier_Address_Description", SqlDbType.NVarChar, 255);
            SqlParameter spInvoice_Supplier_ZipCode = new SqlParameter("@Invoice_Supplier_ZipCode", SqlDbType.NVarChar, 10);
            SqlParameter spInvoice_Supplier_WebAddress = new SqlParameter("@Invoice_Supplier_WebAddress", SqlDbType.NVarChar, 120);
            SqlParameter spInvoice_Supplier_Phone_Number = new SqlParameter("@Invoice_Supplier_Phone_Number", SqlDbType.NVarChar, 50);

            SqlParameter spInvoice_Supplier_Contact_FullName = new SqlParameter("@Invoice_Supplier_Contact_FullName", SqlDbType.NVarChar, 80);
            SqlParameter spInvoice_Content_Long_Description = new SqlParameter("@Invoice_Content_Long_Description", SqlDbType.NVarChar, 2000);
            SqlParameter spUser_Description = new SqlParameter("@User_Description", SqlDbType.NVarChar, 1000);
            SqlParameter spUser_Comments = new SqlParameter("@User_Comments", SqlDbType.NVarChar, 1000);

            SqlParameter spOriginal_File_Name = new SqlParameter("@Original_File_Name", SqlDbType.NVarChar, 255);
            SqlParameter spAzure_Block_Blob_Reference = new SqlParameter("@Azure_Block_Blob_Reference", SqlDbType.NVarChar, 256);
            SqlParameter spFile_Uploaded = new SqlParameter("@File_Uploaded", SqlDbType.Bit);

            SqlParameter spIs_Visible_To_Anonymous_Users = new SqlParameter("@Is_Visible_To_Anonymous_Users", SqlDbType.Bit);
            SqlParameter spIs_Available_For_Download_For_Anonymous_Users = new SqlParameter("@Is_Available_For_Download_For_Anonymous_Users", SqlDbType.Bit);
            SqlParameter spIs_Visible_To_Followers_Users = new SqlParameter("@Is_Visible_To_Followers_Users", SqlDbType.Bit);
            SqlParameter spIs_Available_For_Download_For_Followers_Users = new SqlParameter("@Is_Available_For_Download_For_Followers_Users", SqlDbType.Bit);

            SqlParameter spUpdating_User_Id = new SqlParameter("@Updating_User_Id", SqlDbType.Int);
            SqlParameter spIs_Active = new SqlParameter("@Is_Active", SqlDbType.Bit);

            spExpense_Record_Id.Value = p_Expense_Record_Id;
            spSupplier_Id.Value = p_Supplier_Id;

            if (p_Expense_Invoice_DateTime.HasValue)
                spExpense_Invoice_DateTime.Value = p_Expense_Invoice_DateTime.Value;
            else
                spExpense_Invoice_DateTime.Value = DBNull.Value;

            spCurrency_Id.Value = p_Currency_Id;
            spTotal_Amount.Value = p_Total_Amount;
            spVat_Percentage.Value = p_Vat_Percentage;
            spTotal_Without_Vat.Value = p_Total_Without_Vat;
            spTotal_Vat.Value = p_Total_Vat;

            if (p_Invoiced_Client_On_User_Location_Id.HasValue)
                spInvoiced_Client_On_User_Location_Id.Value = p_Invoiced_Client_On_User_Location_Id;
            else
                spInvoiced_Client_On_User_Location_Id.Value = DBNull.Value;

            spInvoiced_Client_To_CompanyName.Value = p_Invoiced_Client_To_CompanyName;
            spInvoiced_Client_To_Tax_Reference.Value = p_Invoiced_Client_To_Tax_Reference;

            spInvoiced_Client_To_PersonName.Value = p_Invoiced_Client_To_PersonName;
            spInvoiced_Client_To_PhoneNumber.Value = p_Invoiced_Client_To_PhoneNumber;
            if (p_Invoiced_Client_To_Country_Id.HasValue)
                spInvoiced_Client_To_Country_Id.Value = p_Invoiced_Client_To_Country_Id;
            else
                spInvoiced_Client_To_Country_Id.Value = DBNull.Value;
            if (p_Invoiced_Client_To_State_Id.HasValue)
                spInvoiced_Client_To_State_Id.Value = p_Invoiced_Client_To_State_Id;
            else
                spInvoiced_Client_To_State_Id.Value = DBNull.Value;
            spInvoiced_Client_To_City.Value = p_Invoiced_Client_To_City;
            spInvoiced_Client_To_Address.Value = p_Invoiced_Client_To_Address;
            spInvoiced_Client_To_Zip.Value = p_Invoiced_Client_To_Zip;
            spInvoiced_Client_To_EmailAddress.Value = p_Invoiced_Client_To_EmailAddress;

            spExpense_Type_Id.Value = p_Expense_Type_Id;
            spInvoice_Number.Value = p_Invoice_Number;
            spInvoice_Reference_Number.Value = p_Invoice_Reference_Number;
            spInvoice_Supplier_Company_Details.Value = p_Invoice_Supplier_Company_Details;
            spInvoice_Supplier_Tax_Reference.Value = p_Invoice_Supplier_Tax_Reference;
            if (p_Invoice_Supplier_Country_Id.HasValue)
                spInvoice_Supplier_Country_Id.Value = p_Invoice_Supplier_Country_Id;
            else
                spInvoice_Supplier_Country_Id.Value = DBNull.Value;
            if (p_Invoice_Supplier_State_Id.HasValue)
                spInvoice_Supplier_State_Id.Value = p_Invoice_Supplier_State_Id;
            else
                spInvoice_Supplier_State_Id.Value = DBNull.Value;
            spInvoice_Supplier_City.Value = p_Invoice_Supplier_City;
            spInvoice_Supplier_Address_Description.Value = p_Invoice_Supplier_Address_Description;
            spInvoice_Supplier_ZipCode.Value = p_Invoice_Supplier_ZipCode;
            spInvoice_Supplier_WebAddress.Value = p_Invoice_Supplier_WebAddress;
            spInvoice_Supplier_Phone_Number.Value = p_Invoice_Supplier_Phone_Number;

            spInvoice_Supplier_Contact_FullName.Value = p_Invoice_Supplier_Contact_FullName;
            spInvoice_Content_Long_Description.Value = p_Invoice_Content_Long_Description;
            spUser_Description.Value = p_User_Description;
            spUser_Comments.Value = p_User_Comments;

            if (p_File_Uploaded)
            {
                spOriginal_File_Name.Value = p_Original_File_Name;
                spAzure_Block_Blob_Reference.Value = p_Expense_Azure_Block_Blob_Reference;
                spFile_Uploaded.Value = p_File_Uploaded;
            }
            else
            {
                spOriginal_File_Name.Value = DBNull.Value;
                spAzure_Block_Blob_Reference.Value = DBNull.Value;
                spFile_Uploaded.Value = DBNull.Value;
            }

            spIs_Visible_To_Anonymous_Users.Value = p_Is_Visible_To_Anonymous_Users;
            spIs_Available_For_Download_For_Anonymous_Users.Value = p_Is_Available_For_Download_For_Anonymous_Users;
            spIs_Visible_To_Followers_Users.Value = p_Is_Visible_To_Followers_Users;
            spIs_Available_For_Download_For_Followers_Users.Value = p_Is_Available_For_Download_For_Followers_Users;

            spUpdating_User_Id.Value = p_Updating_User_Id;
            spIs_Active.Value = p_Is_Active;

            int affected_Rows = SQLHelper.ExecuteStoredProcedure_ReturnAffectedRowsNumber_WithDefaultAppConfigConnectionString("p_TLBoard_Update_Expense_Details",
                new List<SqlParameter>() {
                    spExpense_Record_Id,  
                    spSupplier_Id, 
                    spExpense_Invoice_DateTime,
                    spCurrency_Id, 
                    spTotal_Amount, 
                    spVat_Percentage,
                    spTotal_Without_Vat, 
                    spTotal_Vat,
                    spInvoiced_Client_On_User_Location_Id,
                    spInvoiced_Client_To_CompanyName, 
                    spInvoiced_Client_To_Tax_Reference,
                    spInvoiced_Client_To_PersonName, 
                    spInvoiced_Client_To_PhoneNumber,
                    spInvoiced_Client_To_Country_Id, 
                    spInvoiced_Client_To_State_Id, 
                    spInvoiced_Client_To_City,
                    spInvoiced_Client_To_Address, 
                    spInvoiced_Client_To_Zip, 
                    spInvoiced_Client_To_EmailAddress,
                    spExpense_Type_Id, 
                    spInvoice_Number, 
                    spInvoice_Reference_Number,
                    spInvoice_Supplier_Company_Details, 
                    spInvoice_Supplier_Tax_Reference,
                    spInvoice_Supplier_Country_Id, 
                    spInvoice_Supplier_State_Id, 
                    spInvoice_Supplier_City,
                    spInvoice_Supplier_Address_Description, 
                    spInvoice_Supplier_ZipCode, 
                    spInvoice_Supplier_WebAddress,
                    spInvoice_Supplier_Phone_Number, 
                    spInvoice_Supplier_Contact_FullName,
                    spInvoice_Content_Long_Description, 
                    spUser_Description, 
                    spUser_Comments,
                    spOriginal_File_Name,
                    spAzure_Block_Blob_Reference,
                    spFile_Uploaded,
                    spIs_Visible_To_Anonymous_Users, 
                    spIs_Available_For_Download_For_Anonymous_Users,
                    spIs_Visible_To_Followers_Users, 
                    spIs_Available_For_Download_For_Followers_Users,
                    spUpdating_User_Id,
                    spIs_Active
                });

            if (affected_Rows > 0)
            {
                updated_Successfully = true;
            }

            return updated_Successfully;
        }

        internal Expenses Expenses_Get_Expense_Latest_Entry_Based_On_Supplier_Id_And_Expense_DateTime_Selection(
            int p_Supplier_Id, 
            DateTime p_Expense_DateTime, 
            int p_User_Id_LoggedIn_Creating_Expense)
        {
            Expenses Expense_To_Return = new Expenses();

            SqlParameter spSupplier_Id = new SqlParameter("@Supplier_Id", SqlDbType.Int);
            SqlParameter spExpense_DateTime = new SqlParameter("@Expense_DateTime", SqlDbType.DateTime);
            SqlParameter spSearching_User_Id = new SqlParameter("@Searching_User_Id", SqlDbType.Int);
            
            spSupplier_Id.Value = p_Supplier_Id;
            spExpense_DateTime.Value = p_Expense_DateTime;
            spSearching_User_Id.Value = p_User_Id_LoggedIn_Creating_Expense;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Expense_Latest_Expense_By_Supplier_Id_And_Expense_DateTime",
                new List<SqlParameter>() { spSupplier_Id, spExpense_DateTime, spSearching_User_Id });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                Expense_To_Return = Create_Expense_Details_From_Data_Row(dataSet.Tables[0].Rows[0]);
            }

            return Expense_To_Return;
        }

        internal Expenses Get_Latest_Expense_By_Supplier_Id(int p_Supplier_Id, int p_User_Id_LoggedIn_Creating_Expense)
        {
            Expenses Expense_To_Return = null;

            SqlParameter spSupplier_Id = new SqlParameter("@Supplier_Id", SqlDbType.Int);
            SqlParameter spSearching_User_Id = new SqlParameter("@Searching_User_Id", SqlDbType.Int);

            spSupplier_Id.Value = p_Supplier_Id;
            spSearching_User_Id.Value = p_User_Id_LoggedIn_Creating_Expense;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Expense_Latest_Expense_By_Supplier_Id",
                new List<SqlParameter>() { spSupplier_Id, spSearching_User_Id });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                Expense_To_Return = Create_Expense_Details_From_Data_Row(dataSet.Tables[0].Rows[0]);
            }

            return Expense_To_Return;
        }

        internal List<Expenses> Get_All_By_User_Id(int p_User_Id, int p_Searching_User_Id)
        {
            List<Expenses> Expenses_To_Return = new List<Expenses>();

            SqlParameter spUser_Id = new SqlParameter("@User_Id", SqlDbType.Int);
            SqlParameter spSearching_User_Id = new SqlParameter("@Searching_User_Id", SqlDbType.Int);

            spUser_Id.Value = p_User_Id;
            spSearching_User_Id.Value = p_Searching_User_Id;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Expenses_List_By_User_Id",
                new List<SqlParameter>() { spUser_Id, spSearching_User_Id });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                Expenses_To_Return = new List<Expenses>(dataSet.Tables[0].Rows.Count);

                for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                {
                    Expenses_To_Return.Add(Create_Expense_Short_Details_From_Data_Row(dataSet.Tables[0].Rows[i]));
                }
            }

            return Expenses_To_Return;
        }

        private Expenses Create_Expense_Details_From_Data_Row(DataRow dbRow)
        {
            Expenses Expense_To_Return = new Expenses();

            Expense_To_Return.Expense_Record_Id = Convert.ToInt32(dbRow["Expense_Record_Id"]);
            Expense_To_Return.User_Id = Convert.ToInt32(dbRow["User_Id"]);
            Expense_To_Return.Supplier_Id = Convert.ToInt32(dbRow["Supplier_Id"]);
            
            Expense_To_Return.Expense_Invoice_DateTime = (DateTime)dbRow["Expense_Invoice_DateTime"];

            Expense_To_Return.Currency_Id = (byte)dbRow["Currency_Id"];

            if (dbRow.Table.Columns.IndexOf("Currency_Symbol") > -1)
            {
                Expense_To_Return.Currency_Symbol = dbRow["Currency_Symbol"].ToString();
            }

            Expense_To_Return.Total_Amount = (decimal)dbRow["Total_Amount"];
            Expense_To_Return.Total_Without_Vat = (decimal)dbRow["Total_Without_Vat"];
            Expense_To_Return.Total_Vat = (decimal)dbRow["Total_Vat"];
            Expense_To_Return.Vat_Percentage = (decimal)dbRow["Vat_Percentage"];

            if (dbRow.Table.Columns.IndexOf("Invoiced_Client_On_User_Location_Id") > -1 && dbRow["Invoiced_Client_On_User_Location_Id"] != DBNull.Value)
            {
                Expense_To_Return.Invoiced_Client_On_User_Location_Id = (int)dbRow["Invoiced_Client_On_User_Location_Id"];
            }

            if (dbRow.Table.Columns.IndexOf("Invoiced_Client_To_CompanyName") > -1)
            {
                Expense_To_Return.Invoiced_Client_To_CompanyName = dbRow["Invoiced_Client_To_CompanyName"].ToString();
                Expense_To_Return.Invoiced_Client_To_Tax_Reference = dbRow["Invoiced_Client_To_Tax_Reference"].ToString();
                Expense_To_Return.Invoiced_Client_To_PersonName = dbRow["Invoiced_Client_To_PersonName"].ToString();
                Expense_To_Return.Invoiced_Client_To_PhoneNumber = dbRow["Invoiced_Client_To_PhoneNumber"].ToString();
                if (dbRow["Invoiced_Client_To_Country_Id"] != DBNull.Value)
                {
                    Expense_To_Return.Invoiced_Client_To_Country_Id = (short)dbRow["Invoiced_Client_To_Country_Id"];
                    if (dbRow["Invoiced_Client_To_State_Id"] != DBNull.Value)
                    {
                        Expense_To_Return.Invoiced_Client_To_State_Id = (short)dbRow["Invoiced_Client_To_State_Id"];
                    }
                }
                Expense_To_Return.Invoiced_Client_To_City = dbRow["Invoiced_Client_To_City"].ToString();
                Expense_To_Return.Invoiced_Client_To_Address = dbRow["Invoiced_Client_To_Address"].ToString();
                Expense_To_Return.Invoiced_Client_To_Zip = dbRow["Invoiced_Client_To_Zip"].ToString();
                Expense_To_Return.Invoiced_Client_To_EmailAddress = dbRow["Invoiced_Client_To_EmailAddress"].ToString();
            }

            Expense_To_Return.Invoice_Number = dbRow["Invoice_Number"].ToString();
            Expense_To_Return.Invoice_Reference_Number = dbRow["Invoice_Reference_Number"].ToString();
            Expense_To_Return.Expense_Type_Id = (byte)dbRow["Expense_Type_Id"];

            Expense_To_Return.Invoice_Supplier_Company_Details = dbRow["Invoice_Supplier_Company_Details"].ToString();
            Expense_To_Return.Invoice_Supplier_Tax_Reference = dbRow["Invoice_Supplier_Tax_Reference"].ToString();
            if (dbRow["Invoice_Supplier_Country_Id"] != DBNull.Value )
            {
                Expense_To_Return.Invoice_Supplier_Country_Id = (short)dbRow["Invoice_Supplier_Country_Id"];
                if (dbRow.Table.Columns.IndexOf("Invoice_Supplier_Country_Name") > -1)
                { 
                    Expense_To_Return.Invoice_Supplier_Country_Name = dbRow["Invoice_Supplier_Country_Name"].ToString();
                }

                if (dbRow["Invoice_Supplier_State_Id"] != DBNull.Value )
                {
                    Expense_To_Return.Invoice_Supplier_State_Id = (short)dbRow["Invoice_Supplier_State_Id"];
                }
            }

            Expense_To_Return.Invoice_Supplier_City = dbRow["Invoice_Supplier_City"].ToString();
            if (dbRow.Table.Columns.IndexOf("Invoice_Supplier_Address_Description") > -1)
            {
                Expense_To_Return.Invoice_Supplier_Address_Description = dbRow["Invoice_Supplier_Address_Description"].ToString();
                Expense_To_Return.Invoice_Supplier_ZipCode = dbRow["Invoice_Supplier_ZipCode"].ToString();
                Expense_To_Return.Invoice_Supplier_Phone_Number = dbRow["Invoice_Supplier_Phone_Number"].ToString();
                Expense_To_Return.Invoice_Supplier_WebAddress = dbRow["Invoice_Supplier_WebAddress"].ToString();
            }
            
            Expense_To_Return.Invoice_Supplier_Contact_FullName = dbRow["Invoice_Supplier_Contact_FullName"].ToString();

            if (dbRow.Table.Columns.IndexOf("Invoice_Content_Long_Description") > -1)
            {
                Expense_To_Return.Invoice_Content_Long_Description = dbRow["Invoice_Content_Long_Description"].ToString();
                Expense_To_Return.User_Description = dbRow["User_Description"].ToString();
                Expense_To_Return.User_Comments = dbRow["User_Comments"].ToString();
            }

            if (dbRow.Table.Columns.IndexOf("Original_File_Name") > -1)
            {
                Expense_To_Return.Original_File_Name = dbRow["Original_File_Name"].ToString();
                Expense_To_Return.Azure_Block_Blob_Reference = dbRow["Azure_Block_Blob_Reference"].ToString();
            }

            if (dbRow.Table.Columns.IndexOf("Record_Created_By_User_Id") > -1)
            {
                Expense_To_Return.Record_Created_By_User_Id = (int)dbRow["Record_Created_By_User_Id"];
                if (dbRow.Table.Columns.IndexOf("Created_By_First_Name") > -1)
                {
                    Expense_To_Return.Record_Created_By_User_Details = new Users();
                    Expense_To_Return.Record_Created_By_User_Details.First_Name = dbRow["Created_By_First_Name"].ToString();
                    Expense_To_Return.Record_Created_By_User_Details.Last_Name = dbRow["Created_By_Last_Name"].ToString();
                }
                Expense_To_Return.Record_Creation_DateTime_UTC = (DateTime)dbRow["Record_Creation_DateTime_UTC"];
                Expense_To_Return.Record_Last_Updated_By_User_Id = (int)dbRow["Record_Last_Updated_By_User_Id"];
                if (dbRow.Table.Columns.IndexOf("Last_Updated_By_First_Name") > -1)
                {
                    Expense_To_Return.Record_Last_Updated_By_User_Details = new Users();
                    Expense_To_Return.Record_Last_Updated_By_User_Details.First_Name = dbRow["Last_Updated_By_First_Name"].ToString();
                    Expense_To_Return.Record_Last_Updated_By_User_Details.Last_Name = dbRow["Last_Updated_By_Last_Name"].ToString();
                }
                Expense_To_Return.Record_Last_Updated_DateTime_UTC = (DateTime)dbRow["Record_Last_Updated_DateTime_UTC"];
            }

            Expense_To_Return.Is_Visible_To_Anonymous_Users = (bool)dbRow["Is_Visible_To_Anonymous_Users"];
            Expense_To_Return.Is_Available_For_Download_For_Anonymous_Users = (bool)dbRow["Is_Available_For_Download_For_Anonymous_Users"];
            Expense_To_Return.Is_Visible_To_Followers_Users = (bool)dbRow["Is_Visible_To_Followers_Users"];
            Expense_To_Return.Is_Available_For_Download_For_Followers_Users = (bool)dbRow["Is_Available_For_Download_For_Followers_Users"];
            Expense_To_Return.Is_Active = (bool)dbRow["Is_Active"];

            return Expense_To_Return;
        }

        private Expenses Create_Expense_Short_Details_From_Data_Row(DataRow dataRow)
        {
            Expenses Expense_To_Return = new Expenses();

            Expense_To_Return.Expense_Record_Id = Convert.ToInt32(dataRow["Expense_Record_Id"]);
            Expense_To_Return.User_Id = Convert.ToInt32(dataRow["User_Id"]);
            Expense_To_Return.Supplier_Id = Convert.ToInt32(dataRow["Supplier_Id"]);

            return Expense_To_Return;
        }

        
    }
}

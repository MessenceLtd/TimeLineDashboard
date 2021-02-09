﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TimeLineDashboard.Shared.Models;

namespace TimeLineDashboard.DAL.Operations
{
    internal class Invoices_Operations
    {
        #region Singleton
        private static readonly Invoices_Operations instance = new Invoices_Operations();
        // Explicit static constructor to tell C# compiler  
        // not to mark type as beforefieldinit  
        static Invoices_Operations()
        {
        }
        private Invoices_Operations()
        {
        }
        public static Invoices_Operations Instance
        {
            get
            {
                return instance;
            }
        }
        #endregion

        internal List<Invoices> Get_Search( string p_Search_Criteria , int p_User_Id )
        {
            List<Invoices> Invoices_To_Return = new List<Invoices>();

            SqlParameter spSearch_Criteria = new SqlParameter("@Search_Criteria", SqlDbType.NVarChar, 50);
            SqlParameter spUser_Id = new SqlParameter("@User_Id", SqlDbType.Int );

            spSearch_Criteria.Value = p_Search_Criteria;
            spUser_Id.Value = p_User_Id;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Invoices_Search", 
                new List<SqlParameter>() { spSearch_Criteria , spUser_Id });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                Invoices_To_Return = new List<Invoices>(dataSet.Tables[0].Rows.Count);

                for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                {
                    Invoices_To_Return.Add(Create_Invoice_Details_From_Data_Row(dataSet.Tables[0].Rows[i]));
                }
            }

            return Invoices_To_Return;
        }

        internal Invoices Get_Invoice_Details_By_Invoice_Id(
            int p_Invoice_Id, 
            int p_User_Id_Invoice_Owner, 
            int p_User_Id_Searching_For_Invoice_Details )
        {
            Invoices Invoice_To_Return = new Invoices();

            SqlParameter spInvoice_Record_Id = new SqlParameter("@Invoice_Record_Id", SqlDbType.Int);
            SqlParameter spUser_Id_Invoice_Owner = new SqlParameter("@User_Id_Invoice_Owner", SqlDbType.Int);
            SqlParameter spUser_Id_Searching_For_Invoice_Details = new SqlParameter("@User_Id_Searching_For_Invoice_Details", SqlDbType.Int);

            spInvoice_Record_Id.Value = p_Invoice_Id;
            spUser_Id_Invoice_Owner.Value = p_User_Id_Invoice_Owner;
            spUser_Id_Searching_For_Invoice_Details.Value = p_User_Id_Searching_For_Invoice_Details;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Invoice_Details",
                new List<SqlParameter>() { spInvoice_Record_Id, spUser_Id_Invoice_Owner, spUser_Id_Searching_For_Invoice_Details });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                Invoice_To_Return = Create_Invoice_Details_From_Data_Row(dataSet.Tables[0].Rows[0]); 
            }

            return Invoice_To_Return;
        }

        internal Invoices Insert_New_Invoice_Details(
            int p_User_Id, int p_Client_Id, DateTime p_Invoice_DateTime, 
            byte p_Currency_Id, decimal p_Total_Amount , decimal p_Vat_Percentage,
            decimal p_Total_Without_Vat, decimal p_Total_Vat,
            DateTime? p_Creation_DateTime, 
            int? p_Invoiced_Client_On_User_Location_Id,
            string p_Invoiced_Client_To_CompanyName, string p_Invoiced_Client_To_Tax_Reference, 
            string p_Invoiced_Client_To_PersonName, string p_Invoiced_Client_To_PhoneNumber,
            short? p_Invoiced_Client_To_Country_Id , short? p_Invoiced_Client_To_State_Id, string p_Invoiced_Client_To_City, 
            string p_Invoiced_Client_To_Address, string p_Invoiced_Client_To_Zip, string p_Invoiced_Client_To_EmailAddress, 
            byte p_Invoice_Type_Id, string p_Invoice_Number, string p_Invoice_Reference_Number, 
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
            Invoices new_Registered_Invoice_To_Return = null;

            SqlParameter spUser_Id = new SqlParameter("@User_Id", SqlDbType.Int);
            SqlParameter spSupplier_Id = new SqlParameter("@Supplier_Id", SqlDbType.Int);
            SqlParameter spInvoice_Invoice_DateTime = new SqlParameter("@Invoice_Invoice_DateTime", SqlDbType.DateTime);
            SqlParameter spCurrency_Id = new SqlParameter("@Currency_Id", SqlDbType.TinyInt);
            
            SqlParameter spTotal_Amount = new SqlParameter("@Total_Amount", SqlDbType.Decimal);
            SqlParameter spVat_Percentage = new SqlParameter("@Vat_Percentage", SqlDbType.Decimal);
            SqlParameter spTotal_Without_Vat = new SqlParameter("@Total_Without_Vat", SqlDbType.Decimal);
            SqlParameter spTotal_Vat = new SqlParameter("@Total_Vat", SqlDbType.Decimal);
            SqlParameter spCreation_DateTime = new SqlParameter("@Creation_DateTime", SqlDbType.DateTime);

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

            SqlParameter spInvoice_Type_Id = new SqlParameter("@Invoice_Type_Id", SqlDbType.TinyInt);
            SqlParameter spInvoice_Number = new SqlParameter("@Invoice_Number", SqlDbType.NVarChar, 30 );
            SqlParameter spInvoice_Reference_Number = new SqlParameter("@Invoice_Reference_Number", SqlDbType.NVarChar, 50);

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
            SqlParameter spRecord_Creation_DateTime_UTC = new SqlParameter("@Record_Creation_DateTime_UTC", SqlDbType.DateTime);
            SqlParameter spRecord_Last_Updated_By_User_Id = new SqlParameter("@Record_Last_Updated_By_User_Id", SqlDbType.Int);
            SqlParameter spRecord_Last_Updated_DateTime_UTC = new SqlParameter("@Record_Last_Updated_DateTime_UTC", SqlDbType.DateTime);
            
            SqlParameter spIs_Active = new SqlParameter("@Is_Active", SqlDbType.Bit);


            spUser_Id.Value = p_User_Id;
            spSupplier_Id.Value = p_Client_Id;
            spInvoice_Invoice_DateTime.Value = p_Invoice_DateTime;
            spCurrency_Id.Value = p_Currency_Id;
            spTotal_Amount.Value = p_Total_Amount;
            spVat_Percentage.Value = p_Vat_Percentage;
            spTotal_Without_Vat.Value = p_Total_Without_Vat;
            spTotal_Vat.Value = p_Total_Vat;
            if (p_Creation_DateTime.HasValue)
                spCreation_DateTime.Value = p_Creation_DateTime;
            else
                spCreation_DateTime.Value = DBNull.Value;

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

            spInvoice_Type_Id.Value = p_Invoice_Type_Id;
            spInvoice_Number.Value = p_Invoice_Number;
            spInvoice_Reference_Number.Value = p_Invoice_Reference_Number;
            
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
            spRecord_Creation_DateTime_UTC.Value = p_Record_Creation_DateTime_UTC;
            spRecord_Last_Updated_By_User_Id.Value = p_Record_Last_Updated_By_User_Id;
            spRecord_Last_Updated_DateTime_UTC.Value = p_Record_Last_Updated_DateTime_UTC;
            spIs_Active.Value = p_Is_Active;

            object new_Invoice_Id = SQLHelper.ExecuteStoredProcedure_ReturnDataObjectResult("p_TLBoard_Insert_Invoice_Details",
                new List<SqlParameter>() {
                    spUser_Id,  spSupplier_Id, spInvoice_Invoice_DateTime,
                    spCurrency_Id, spTotal_Amount, spVat_Percentage, 
                    spTotal_Without_Vat, spTotal_Vat, spCreation_DateTime,
                    spInvoiced_Client_On_User_Location_Id,
                    spInvoiced_Client_To_CompanyName, spInvoiced_Client_To_Tax_Reference, 
                    spInvoiced_Client_To_PersonName, spInvoiced_Client_To_PhoneNumber, 
                    spInvoiced_Client_To_Country_Id, spInvoiced_Client_To_State_Id, spInvoiced_Client_To_City,
                    spInvoiced_Client_To_Address, spInvoiced_Client_To_Zip, spInvoiced_Client_To_EmailAddress,
                    spInvoice_Type_Id, spInvoice_Number, spInvoice_Reference_Number,
                    spInvoice_Content_Long_Description, spUser_Description, spUser_Comments, 
                    spOriginal_File_Name, spAzure_Block_Blob_Reference,
                    spIs_Visible_To_Anonymous_Users, spIs_Available_For_Download_For_Anonymous_Users,
                    spIs_Visible_To_Followers_Users, spIs_Available_For_Download_For_Followers_Users,
                    spRecord_Created_By_User_Id, spRecord_Creation_DateTime_UTC, 
                    spRecord_Last_Updated_By_User_Id, spRecord_Last_Updated_DateTime_UTC,
                    spIs_Active
                });

            if (new_Invoice_Id != null)
            {
                int Invoice_Id_Registered = Convert.ToInt32(new_Invoice_Id);
                if (Invoice_Id_Registered > 0)
                {
                    new_Registered_Invoice_To_Return = Get_Invoice_Details_By_Invoice_Id(Invoice_Id_Registered, p_User_Id, p_Record_Created_By_User_Id);
                }
            }

            return new_Registered_Invoice_To_Return;
        }

        internal Invoices Invoices_Get_Invoice_Latest_Entry_Based_On_Supplier_Id_And_Invoice_DateTime_Selection(
            int p_Supplier_Id, 
            DateTime p_Invoice_DateTime, 
            int p_User_Id_LoggedIn_Creating_Invoice)
        {
            Invoices Invoice_To_Return = new Invoices();

            SqlParameter spSupplier_Id = new SqlParameter("@Supplier_Id", SqlDbType.Int);
            SqlParameter spInvoice_DateTime = new SqlParameter("@Invoice_DateTime", SqlDbType.DateTime);
            SqlParameter spSearching_User_Id = new SqlParameter("@Searching_User_Id", SqlDbType.Int);
            
            spSupplier_Id.Value = p_Supplier_Id;
            spInvoice_DateTime.Value = p_Invoice_DateTime;
            spSearching_User_Id.Value = p_User_Id_LoggedIn_Creating_Invoice;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Invoice_Latest_Invoice_By_Supplier_Id_Invoice_DateTime",
                new List<SqlParameter>() { spSupplier_Id, spInvoice_DateTime, spSearching_User_Id });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                Invoice_To_Return = Create_Invoice_Details_From_Data_Row(dataSet.Tables[0].Rows[0]);
            }

            return Invoice_To_Return;
        }

        internal Invoices Get_Latest_Invoice_By_Supplier_Id(int p_Supplier_Id, int p_User_Id_LoggedIn_Creating_Invoice)
        {
            Invoices Invoice_To_Return = null;

            SqlParameter spSupplier_Id = new SqlParameter("@Supplier_Id", SqlDbType.Int);
            SqlParameter spSearching_User_Id = new SqlParameter("@Searching_User_Id", SqlDbType.Int);

            spSupplier_Id.Value = p_Supplier_Id;
            spSearching_User_Id.Value = p_User_Id_LoggedIn_Creating_Invoice;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Invoice_Latest_Invoice_By_Supplier_Id",
                new List<SqlParameter>() { spSupplier_Id, spSearching_User_Id });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                Invoice_To_Return = Create_Invoice_Details_From_Data_Row(dataSet.Tables[0].Rows[0]);
            }

            return Invoice_To_Return;
        }

        internal List<Invoices> Get_All_By_User_Id(int p_User_Id, int p_Searching_User_Id)
        {
            List<Invoices> Invoices_To_Return = new List<Invoices>();

            SqlParameter spUser_Id = new SqlParameter("@User_Id", SqlDbType.Int);
            SqlParameter spSearching_User_Id = new SqlParameter("@Searching_User_Id", SqlDbType.Int);

            spUser_Id.Value = p_User_Id;
            spSearching_User_Id.Value = p_Searching_User_Id;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Invoices_List_By_User_Id",
                new List<SqlParameter>() { spUser_Id, spSearching_User_Id });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                Invoices_To_Return = new List<Invoices>(dataSet.Tables[0].Rows.Count);

                for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                {
                    Invoices_To_Return.Add(Create_Invoice_Short_Details_From_Data_Row(dataSet.Tables[0].Rows[i]));
                }
            }

            return Invoices_To_Return;
        }

        private Invoices Create_Invoice_Details_From_Data_Row(DataRow dbRow)
        {
            Invoices Invoice_To_Return = new Invoices();

            Invoice_To_Return.Invoice_Record_Id = Convert.ToInt32(dbRow["Invoice_Record_Id"]);
            Invoice_To_Return.User_Id = Convert.ToInt32(dbRow["User_Id"]);
            Invoice_To_Return.Client_Id = Convert.ToInt32(dbRow["Client_Id"]);
            Invoice_To_Return.Invoice_DateTime = (DateTime)dbRow["Invoice_DateTime"];

            Invoice_To_Return.Currency_Id = (byte)dbRow["Currency_Id"];
            Invoice_To_Return.Total_Without_Vat = (decimal)dbRow["Total_Without_Vat"];
            Invoice_To_Return.Total_Vat = (decimal)dbRow["Total_Vat"];
            Invoice_To_Return.Vat_Percentage = (decimal)dbRow["Vat_Percentage"];
            Invoice_To_Return.Total_Amount = (decimal)dbRow["Total_Amount"];
            if (dbRow["Creation_DateTime"] != DBNull.Value)
            { 
                Invoice_To_Return.Creation_DateTime = (DateTime)dbRow["Creation_DateTime"];
            }

            if (dbRow["Invoiced_Client_On_User_Location_Id"] != DBNull.Value)
            {
                Invoice_To_Return.Invoiced_Client_On_User_Location_Id = (int)dbRow["Invoiced_Client_On_User_Location_Id"];
            }
            
            Invoice_To_Return.Invoiced_Client_To_CompanyName = dbRow["Invoiced_Client_To_CompanyName"].ToString();
            Invoice_To_Return.Invoiced_Client_To_Tax_Reference = dbRow["Invoiced_Client_To_Tax_Reference"].ToString();
            Invoice_To_Return.Invoiced_Client_To_PersonName = dbRow["Invoiced_Client_To_PersonName"].ToString();
            Invoice_To_Return.Invoiced_Client_To_PhoneNumber = dbRow["Invoiced_Client_To_PhoneNumber"].ToString();
            if (dbRow["Invoiced_Client_To_Country_Id"] != DBNull.Value)
            {
                Invoice_To_Return.Invoiced_Client_To_Country_Id = (short)dbRow["Invoiced_Client_To_Country_Id"];
                if (dbRow["Invoiced_Client_To_State_Id"] != DBNull.Value)
                {
                    Invoice_To_Return.Invoiced_Client_To_State_Id = (short)dbRow["Invoiced_Client_To_State_Id"];
                }
            }
            Invoice_To_Return.Invoiced_Client_To_City = dbRow["Invoiced_Client_To_City"].ToString();
            Invoice_To_Return.Invoiced_Client_To_Address = dbRow["Invoiced_Client_To_Address"].ToString();
            Invoice_To_Return.Invoiced_Client_To_Zip = dbRow["Invoiced_Client_To_Zip"].ToString();
            Invoice_To_Return.Invoiced_Client_To_EmailAddress = dbRow["Invoiced_Client_To_EmailAddress"].ToString();

            Invoice_To_Return.Invoice_Type_Id = (byte)dbRow["Invoice_Type_Id"];
            Invoice_To_Return.Invoice_Number = dbRow["Invoice_Number"].ToString();
            Invoice_To_Return.Invoice_Reference_Number = dbRow["Invoice_Reference_Number"].ToString();

            Invoice_To_Return.Invoice_Content_Long_Description = dbRow["Invoice_Content_Long_Description"].ToString();
            Invoice_To_Return.User_Description = dbRow["User_Description"].ToString();
            Invoice_To_Return.User_Comments = dbRow["User_Comments"].ToString();
            Invoice_To_Return.Original_File_Name = dbRow["Original_File_Name"].ToString();
            Invoice_To_Return.Azure_Block_Blob_Reference = dbRow["Azure_Block_Blob_Reference"].ToString();

            Invoice_To_Return.Record_Created_By_User_Id = (int)dbRow["Record_Created_By_User_Id"];
            Invoice_To_Return.Record_Creation_DateTime_UTC = (DateTime)dbRow["Record_Creation_DateTime_UTC"];
            Invoice_To_Return.Record_Last_Updated_By_User_Id = (int)dbRow["Record_Last_Updated_By_User_Id"];
            Invoice_To_Return.Record_Last_Updated_DateTime_UTC = (DateTime)dbRow["Record_Last_Updated_DateTime_UTC"];

            Invoice_To_Return.Is_Visible_To_Anonymous_Users = (bool)dbRow["Is_Visible_To_Anonymous_Users"];
            Invoice_To_Return.Is_Available_For_Download_For_Anonymous_Users = (bool)dbRow["Is_Available_For_Download_For_Anonymous_Users"];
            Invoice_To_Return.Is_Visible_To_Followers_Users = (bool)dbRow["Is_Visible_To_Followers_Users"];
            Invoice_To_Return.Is_Available_For_Download_For_Followers_Users = (bool)dbRow["Is_Available_For_Download_For_Followers_Users"];
            Invoice_To_Return.Is_Active = (bool)dbRow["Is_Active"];

            return Invoice_To_Return;
        }

        private Invoices Create_Invoice_Short_Details_From_Data_Row(DataRow dataRow)
        {
            Invoices Invoice_To_Return = new Invoices();

            Invoice_To_Return.Invoice_Record_Id = Convert.ToInt32(dataRow["Invoice_Record_Id"]);
            Invoice_To_Return.User_Id = Convert.ToInt32(dataRow["User_Id"]);
            Invoice_To_Return.Client_Id = Convert.ToInt32(dataRow["Supplier_Id"]);

            return Invoice_To_Return;
        }

    }
}

using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TimeLineDashboard.Shared.Models;

namespace TimeLineDashboard.DAL.Operations
{
    internal class Clients_Operations
    {
        #region Singleton
        private static readonly Clients_Operations instance = new Clients_Operations();
        // Explicit static constructor to tell C# compiler  
        // not to mark type as beforefieldinit  
        static Clients_Operations()
        {
        }
        private Clients_Operations()
        {
        }
        public static Clients_Operations Instance
        {
            get
            {
                return instance;
            }
        }
        #endregion


        internal List<Clients> Get_Search( string p_Search_Criteria , int p_User_Id )
        {
            List<Clients> clients_To_Return = new List<Clients>();

            SqlParameter spSearch_Criteria = new SqlParameter("@Search_Criteria", SqlDbType.NVarChar, 50);
            SqlParameter spUser_Id = new SqlParameter("@User_Id", SqlDbType.Int );

            spSearch_Criteria.Value = p_Search_Criteria;
            spUser_Id.Value = p_User_Id;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Clients_Search", 
                new List<SqlParameter>() { spSearch_Criteria , spUser_Id });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                clients_To_Return = new List<Clients>(dataSet.Tables[0].Rows.Count);

                for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                {
                    clients_To_Return.Add(Create_Client_Details_From_Data_Row(dataSet.Tables[0].Rows[i]));
                }
            }

            return clients_To_Return;
        }


        internal Clients Get_Client_Details_By_Client_Id(int p_Client_Id, int p_User_Id_Client_Owner )
        {
            Clients client_To_Return = new Clients();

            SqlParameter spClient_Id = new SqlParameter("@Client_Id", SqlDbType.Int);
            SqlParameter spUser_Id = new SqlParameter("@User_Id", SqlDbType.Int);
            
            spClient_Id.Value = p_Client_Id;
            spUser_Id.Value = p_User_Id_Client_Owner;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Client_Details",
                new List<SqlParameter>() { spClient_Id, spUser_Id });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                client_To_Return = Create_Client_Details_From_Data_Row(dataSet.Tables[0].Rows[0]); 
            }

            return client_To_Return;
        }

        internal Clients Insert_New_Client_Administrative_Registration_Process(
            int p_User_Id, string p_Company_Name, string p_Website_URL, short p_Country_Id,
            short? p_State_Id, string p_City, string p_Address, string p_ZipCode,
            string p_Telephone, string p_Mobile_Phone,
            short p_Client_Type_Id, string p_Client_Tax_Reference_Number, string p_Main_Contact_FullName,
            string p_Main_Contact_Email_Address, string p_Main_Contact_Phone_Number,
            DateTime? p_Client_From_Date, DateTime? p_Client_To_Date, DateTime? p_First_Contract_Date,
            string p_First_Contract_Signed_With_Contact_Full_Name, string p_First_Contract_Signed_In_Location_Description,
            bool p_Is_Active, int p_Logged_In_Administrative_User_Id)
        {
            Clients new_Registered_Client_To_Return = null;

            SqlParameter spUser_Id = new SqlParameter("@User_Id", SqlDbType.Int);
            SqlParameter spCompany_Name = new SqlParameter("@Company_Name", SqlDbType.NVarChar , 150);
            SqlParameter spWebsite_URL = new SqlParameter("@Website_URL", SqlDbType.NVarChar, 150);
            SqlParameter spCountry_Id = new SqlParameter("@Country_Id", SqlDbType.SmallInt );
            SqlParameter spState_Id = new SqlParameter("@State_Id", SqlDbType.SmallInt);
            SqlParameter spCity = new SqlParameter("@City", SqlDbType.NVarChar, 100);
            SqlParameter spAddress = new SqlParameter("@Address", SqlDbType.NVarChar, 150);
            SqlParameter spZipCode = new SqlParameter("@ZipCode", SqlDbType.VarChar, 10);
            SqlParameter spTelephone = new SqlParameter("@Telephone", SqlDbType.VarChar, 40);
            SqlParameter spMobile_Phone = new SqlParameter("@Mobile_Phone", SqlDbType.VarChar, 40);
            SqlParameter spClient_Type_Id = new SqlParameter("@Client_Type_Id", SqlDbType.SmallInt);
            SqlParameter spClient_Tax_Reference_Number = new SqlParameter("@Client_Tax_Reference_Number", SqlDbType.NVarChar, 50);
            SqlParameter spMain_Contact_FullName = new SqlParameter("@Main_Contact_FullName", SqlDbType.NVarChar, 100);
            SqlParameter spMain_Contact_Email_Address = new SqlParameter("@Main_Contact_Email_Address", SqlDbType.NVarChar, 100);
            SqlParameter spMain_Contact_Phone_Number = new SqlParameter("@Main_Contact_Phone_Number", SqlDbType.NVarChar, 100);
            SqlParameter spClient_From_Date = new SqlParameter("@Client_From_Date", SqlDbType.DateTime);
            SqlParameter spClient_To_Date = new SqlParameter("@Client_To_Date", SqlDbType.DateTime);
            SqlParameter spFirst_Contract_Date = new SqlParameter("@First_Contract_Date", SqlDbType.DateTime);
            SqlParameter spFirst_Contract_Signed_With_Contact_Full_Name = new SqlParameter("@First_Contract_Signed_With_Contact_Full_Name", SqlDbType.NVarChar, 200);
            SqlParameter spFirst_Contract_Signed_In_Location_Description = new SqlParameter("@First_Contract_Signed_In_Location_Description", SqlDbType.NVarChar, 400);
            SqlParameter spIs_Active = new SqlParameter("@Is_Active", SqlDbType.Bit);
            SqlParameter spCreating_User_Id = new SqlParameter("@Creating_User_Id", SqlDbType.Int);

            spUser_Id.Value = p_User_Id;
            spCompany_Name.Value = p_Company_Name;
            spWebsite_URL.Value = p_Website_URL;
            spCountry_Id.Value = p_Country_Id;
            
            if (p_State_Id.HasValue)
                spState_Id.Value = p_State_Id;
            else
                spState_Id.Value = DBNull.Value;

            spCity.Value = p_City;
            spAddress.Value = p_Address;
            spZipCode.Value = p_ZipCode;
            spTelephone.Value = p_Telephone;
            spMobile_Phone.Value = p_Mobile_Phone;
            spClient_Type_Id.Value = p_Client_Type_Id;
            spClient_Tax_Reference_Number.Value = p_Client_Tax_Reference_Number;
            spMain_Contact_FullName.Value = p_Main_Contact_FullName;
            spMain_Contact_Email_Address.Value = p_Main_Contact_Email_Address;
            spMain_Contact_Phone_Number.Value = p_Main_Contact_Phone_Number;
            
            if (p_Client_From_Date.HasValue)
                spClient_From_Date.Value = p_Client_From_Date.Value;
            else
                spClient_From_Date.Value = DBNull.Value;

            if (p_Client_To_Date.HasValue)
                spClient_To_Date.Value = p_Client_To_Date.Value;
            else
                spClient_To_Date.Value = DBNull.Value;

            if (p_First_Contract_Date.HasValue)
                spFirst_Contract_Date.Value = p_First_Contract_Date.Value;
            else
                spFirst_Contract_Date.Value = DBNull.Value;

            spFirst_Contract_Signed_With_Contact_Full_Name.Value = p_First_Contract_Signed_With_Contact_Full_Name;
            spFirst_Contract_Signed_In_Location_Description.Value = p_First_Contract_Signed_In_Location_Description;
            spIs_Active.Value = p_Is_Active;
            spCreating_User_Id.Value = p_Logged_In_Administrative_User_Id;

            object new_Client_Id = SQLHelper.ExecuteStoredProcedure_ReturnDataObjectResult("p_TLBoard_Insert_Client_Details",
                new List<SqlParameter>() {
                    spUser_Id , spCompany_Name, spWebsite_URL , spCountry_Id , 
                    spState_Id , spCity , spAddress , spZipCode , 
                    spTelephone , spMobile_Phone , spClient_Type_Id , 
                    spClient_Tax_Reference_Number , spMain_Contact_FullName ,
                    spMain_Contact_Email_Address , spMain_Contact_Phone_Number ,
                    spClient_From_Date , spClient_To_Date , spFirst_Contract_Date ,
                    spFirst_Contract_Signed_With_Contact_Full_Name , spFirst_Contract_Signed_In_Location_Description ,
                    spIs_Active , spCreating_User_Id 
                });

            if (new_Client_Id != null)
            {
                int client_Id_Registered = Convert.ToInt32(new_Client_Id);
                if (client_Id_Registered > 0)
                {
                    new_Registered_Client_To_Return = Get_Client_Details_By_Client_Id(client_Id_Registered, p_User_Id);
                }
            }

            return new_Registered_Client_To_Return;
        }

        internal bool Update_Client_Details(
            int p_Client_Id, string p_Company_Name, string p_Website_URL, short p_Country_Id,
            short? p_State_Id, string p_City, string p_Address, string p_ZipCode,
            string p_Telephone, string p_Mobile_Phone,
            short p_Client_Type_Id, string p_Client_Tax_Reference_Number, string p_Main_Contact_FullName,
            string p_Main_Contact_Email_Address, string p_Main_Contact_Phone_Number,
            DateTime? p_Client_From_Date, DateTime? p_Client_To_Date, DateTime? p_First_Contract_Date,
            string p_First_Contract_Signed_With_Contact_Full_Name, string p_First_Contract_Signed_In_Location_Description,
            bool p_Is_Active, int p_Authenticated_User_Id)
        {
            bool updated_Successfully = false;

            SqlParameter spClient_Id = new SqlParameter("@Client_Id", SqlDbType.Int);
            SqlParameter spCompany_Name = new SqlParameter("@Company_Name", SqlDbType.NVarChar, 150);
            SqlParameter spWebsite_URL = new SqlParameter("@Website_URL", SqlDbType.NVarChar, 150);
            SqlParameter spCountry_Id = new SqlParameter("@Country_Id", SqlDbType.SmallInt);
            SqlParameter spState_Id = new SqlParameter("@State_Id", SqlDbType.SmallInt);
            SqlParameter spCity = new SqlParameter("@City", SqlDbType.NVarChar, 100);
            SqlParameter spAddress = new SqlParameter("@Address", SqlDbType.NVarChar, 150);
            SqlParameter spZipCode = new SqlParameter("@ZipCode", SqlDbType.VarChar, 10);
            SqlParameter spTelephone = new SqlParameter("@Telephone", SqlDbType.VarChar, 40);
            SqlParameter spMobile_Phone = new SqlParameter("@Mobile_Phone", SqlDbType.VarChar, 40);
            SqlParameter spClient_Type_Id = new SqlParameter("@Client_Type_Id", SqlDbType.SmallInt);
            SqlParameter spClient_Tax_Reference_Number = new SqlParameter("@Client_Tax_Reference_Number", SqlDbType.NVarChar, 50);
            SqlParameter spMain_Contact_FullName = new SqlParameter("@Main_Contact_FullName", SqlDbType.NVarChar, 100);
            SqlParameter spMain_Contact_Email_Address = new SqlParameter("@Main_Contact_Email_Address", SqlDbType.NVarChar, 100);
            SqlParameter spMain_Contact_Phone_Number = new SqlParameter("@Main_Contact_Phone_Number", SqlDbType.NVarChar, 100);
            SqlParameter spClient_From_Date = new SqlParameter("@Client_From_Date", SqlDbType.DateTime);
            SqlParameter spClient_To_Date = new SqlParameter("@Client_To_Date", SqlDbType.DateTime);
            SqlParameter spFirst_Contract_Date = new SqlParameter("@First_Contract_Date", SqlDbType.DateTime);
            SqlParameter spFirst_Contract_Signed_With_Contact_Full_Name = new SqlParameter("@First_Contract_Signed_With_Contact_Full_Name", SqlDbType.NVarChar, 200);
            SqlParameter spFirst_Contract_Signed_In_Location_Description = new SqlParameter("@First_Contract_Signed_In_Location_Description", SqlDbType.NVarChar, 400);
            SqlParameter spIs_Active = new SqlParameter("@Is_Active", SqlDbType.Bit);
            SqlParameter spUpdating_User_Id = new SqlParameter("@Updating_User_Id", SqlDbType.Int);

            spClient_Id.Value = p_Client_Id;
            spCompany_Name.Value = p_Company_Name;
            spWebsite_URL.Value = p_Website_URL;
            spCountry_Id.Value = p_Country_Id;

            if (p_State_Id.HasValue)
                spState_Id.Value = p_State_Id;
            else
                spState_Id.Value = DBNull.Value;

            spCity.Value = p_City;
            spAddress.Value = p_Address;
            spZipCode.Value = p_ZipCode;
            spTelephone.Value = p_Telephone;
            spMobile_Phone.Value = p_Mobile_Phone;
            spClient_Type_Id.Value = p_Client_Type_Id;
            spClient_Tax_Reference_Number.Value = p_Client_Tax_Reference_Number;
            spMain_Contact_FullName.Value = p_Main_Contact_FullName;
            spMain_Contact_Email_Address.Value = p_Main_Contact_Email_Address;
            spMain_Contact_Phone_Number.Value = p_Main_Contact_Phone_Number;

            if (p_Client_From_Date.HasValue)
                spClient_From_Date.Value = p_Client_From_Date.Value;
            else
                spClient_From_Date.Value = DBNull.Value;

            if (p_Client_To_Date.HasValue)
                spClient_To_Date.Value = p_Client_To_Date.Value;
            else
                spClient_To_Date.Value = DBNull.Value;

            if (p_First_Contract_Date.HasValue)
                spFirst_Contract_Date.Value = p_First_Contract_Date.Value;
            else
                spFirst_Contract_Date.Value = DBNull.Value;

            spFirst_Contract_Signed_With_Contact_Full_Name.Value = p_First_Contract_Signed_With_Contact_Full_Name;
            spFirst_Contract_Signed_In_Location_Description.Value = p_First_Contract_Signed_In_Location_Description;
            spIs_Active.Value = p_Is_Active;
            spUpdating_User_Id.Value = p_Authenticated_User_Id;

            int affected_Rows = SQLHelper.ExecuteStoredProcedure_ReturnAffectedRowsNumber_WithDefaultAppConfigConnectionString("p_TLBoard_Update_Client_Details",
                new List<SqlParameter>() {
                    spClient_Id , spCompany_Name, spWebsite_URL , spCountry_Id ,
                    spState_Id , spCity , spAddress , spZipCode ,
                    spTelephone , spMobile_Phone , spClient_Type_Id ,
                    spClient_Tax_Reference_Number , spMain_Contact_FullName ,
                    spMain_Contact_Email_Address , spMain_Contact_Phone_Number ,
                    spClient_From_Date , spClient_To_Date , spFirst_Contract_Date ,
                    spFirst_Contract_Signed_With_Contact_Full_Name , spFirst_Contract_Signed_In_Location_Description ,
                    spIs_Active , spUpdating_User_Id
                });

            if (affected_Rows > 0)
            {
                updated_Successfully = true;
            }

            return updated_Successfully;
        }

        internal List<Clients> Get_All_By_User_Id(int p_User_Id_To_Return_Clients, int p_Authenticated_User_ID)
        {
            List<Clients> clients_To_Return = new List<Clients>();

            SqlParameter spUser_Id_To_Return_Clients = new SqlParameter("@User_Id_To_Return_Clients", SqlDbType.NVarChar, 50);
            SqlParameter spAuthenticated_User_ID = new SqlParameter("@Authenticated_User_ID", SqlDbType.Int);

            spUser_Id_To_Return_Clients.Value = p_User_Id_To_Return_Clients;
            spAuthenticated_User_ID.Value = p_Authenticated_User_ID;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Clients_All_By_User_Id",
                new List<SqlParameter>() { spUser_Id_To_Return_Clients, spAuthenticated_User_ID });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                clients_To_Return = new List<Clients>(dataSet.Tables[0].Rows.Count);

                for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                {
                    clients_To_Return.Add(Create_Client_Details_From_Data_Row(dataSet.Tables[0].Rows[i]));
                }
            }

            return clients_To_Return;
        }

        private Clients Create_Client_Details_From_Data_Row(DataRow dbRow)
        {
            Clients client_To_Return = new Clients();

            client_To_Return.Client_Id = Convert.ToInt32(dbRow["Client_Id"]);
            client_To_Return.User_Id = Convert.ToInt32(dbRow["User_Id"]);
            client_To_Return.Company_Name = dbRow["Company_Name"].ToString();
            client_To_Return.Website_URL = dbRow["Website_URL"].ToString();
            client_To_Return.Country_Id = (short)dbRow["Country_Id"];

            if (dbRow["State_Id"] != DBNull.Value)
            {
                client_To_Return.State_Id = (short)dbRow["State_Id"];
            }

            client_To_Return.City = dbRow["City"].ToString();
            if (dbRow.Table.Columns.IndexOf("Address") > -1)
            {
                client_To_Return.Address = dbRow["Address"].ToString();
                client_To_Return.ZipCode = dbRow["ZipCode"].ToString();
            }

            if (dbRow.Table.Columns.IndexOf("Telephone") > -1) 
            { 
                client_To_Return.Telephone = dbRow["Telephone"].ToString();
            }

            if (dbRow.Table.Columns.IndexOf("Mobile_Phone") > -1)
            {
                client_To_Return.Mobile_Phone = dbRow["Mobile_Phone"].ToString();
            }
 
            client_To_Return.Client_Type_Id = (short)dbRow["Client_Type_Id"];

            if (dbRow.Table.Columns.IndexOf("Client_Tax_Reference_Number") > -1)
            { 
                client_To_Return.Client_Tax_Reference_Number = dbRow["Client_Tax_Reference_Number"].ToString();
            }

            if (dbRow.Table.Columns.IndexOf("Main_Contact_FullName") > -1 )
            { 
                client_To_Return.Main_Contact_FullName = dbRow["Main_Contact_FullName"].ToString();
                client_To_Return.Main_Contact_Email_Address = dbRow["Main_Contact_Email_Address"].ToString();
                client_To_Return.Main_Contact_Phone_Number = dbRow["Main_Contact_Phone_Number"].ToString();
            }

            if (dbRow.Table.Columns.IndexOf("Client_From_Date") > -1)
            {
                if (dbRow["Client_From_Date"]!= DBNull.Value)
                {
                    client_To_Return.Client_From_Date = (DateTime)dbRow["Client_From_Date"];
                }

                if (dbRow["Client_To_Date"] != DBNull.Value)
                {
                    client_To_Return.Client_To_Date = (DateTime)dbRow["Client_To_Date"];
                }

                if (dbRow["First_Contract_Date"] != DBNull.Value)
                {
                    client_To_Return.First_Contract_Date = (DateTime)dbRow["First_Contract_Date"];
                }

                client_To_Return.First_Contract_Signed_With_Contact_Full_Name = dbRow["First_Contract_Signed_With_Contact_Full_Name"].ToString();
                client_To_Return.First_Contract_Signed_In_Location_Description = dbRow["First_Contract_Signed_In_Location_Description"].ToString();
            }

            if (dbRow.Table.Columns.IndexOf("Record_Creation_DateTime_UTC") >-1)
            { 
                client_To_Return.Record_Created_By_User_Id = Convert.ToInt32(dbRow["Record_Created_By_User_Id"]);
                client_To_Return.Record_Created_By_User_Details = new Users();
                client_To_Return.Record_Created_By_User_Details.User_Id = client_To_Return.Record_Created_By_User_Id;
                if (dbRow.Table.Columns.IndexOf("Created_By_First_Name") > -1)
                {
                    client_To_Return.Record_Created_By_User_Details.First_Name = dbRow["Created_By_First_Name"].ToString();
                    client_To_Return.Record_Created_By_User_Details.Last_Name = dbRow["Created_By_Last_Name"].ToString();
                }
                client_To_Return.Record_Creation_DateTime_UTC = (DateTime)dbRow["Record_Creation_DateTime_UTC"];

                client_To_Return.Record_Last_Updated_By_User_Id = Convert.ToInt32(dbRow["Record_Last_Updated_By_User_Id"]);
                client_To_Return.Record_Last_Updated_By_User_Details = new Users();
                client_To_Return.Record_Last_Updated_By_User_Details.User_Id = client_To_Return.Record_Last_Updated_By_User_Id;
                if (dbRow.Table.Columns.IndexOf("Last_Updated_By_First_Name") > -1)
                {
                    client_To_Return.Record_Last_Updated_By_User_Details.First_Name = dbRow["Last_Updated_By_First_Name"].ToString();
                    client_To_Return.Record_Last_Updated_By_User_Details.Last_Name = dbRow["Last_Updated_By_Last_Name"].ToString();
                }
                client_To_Return.Record_Last_Updated_DateTime_UTC = (DateTime)dbRow["Record_Last_Updated_DateTime_UTC"];
            }

            client_To_Return.Is_Active = (bool)dbRow["Is_Active"];
            if (!client_To_Return.Is_Active)
            {
                if (dbRow.Table.Columns.IndexOf("Active_Last_Updated_dateTime_UTC") > -1)
                {
                    client_To_Return.Active_Last_Updated_dateTime_UTC = (DateTime)dbRow["Active_Last_Updated_dateTime_UTC"];
                    client_To_Return.Active_Last_Updated_By_User_Id = Convert.ToInt32(dbRow["Active_Last_Updated_By_User_Id"]);
                    client_To_Return.Active_Last_Updated_Comments = dbRow["Active_Last_Updated_Comments"].ToString();
                }
            }

            client_To_Return.Is_Deleted = (bool)dbRow["Is_Deleted"];
            if (client_To_Return.Is_Deleted)
            {
                if (dbRow.Table.Columns.IndexOf("Record_Deleted_By_User_Id") > -1)
                {
                    client_To_Return.Record_Deleted_By_User_Id = Convert.ToInt32(dbRow["Record_Deleted_By_User_Id"]);
                    client_To_Return.Record_Deleted_DateTime_UTC = (DateTime)dbRow["Record_Deleted_DateTime_UTC"];
                }
            }

            return client_To_Return;
        }

    }
}

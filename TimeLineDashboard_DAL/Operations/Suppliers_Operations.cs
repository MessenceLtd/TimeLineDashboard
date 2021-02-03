using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TimeLineDashboard.Shared.Models;

namespace TimeLineDashboard.DAL.Operations
{
    internal class Suppliers_Operations
    {
        #region Singleton
        private static readonly Suppliers_Operations instance = new Suppliers_Operations();
        // Explicit static constructor to tell C# compiler  
        // not to mark type as beforefieldinit  
        static Suppliers_Operations()
        {
        }
        private Suppliers_Operations()
        {
        }
        public static Suppliers_Operations Instance
        {
            get
            {
                return instance;
            }
        }
        #endregion

        internal List<Suppliers> Get_Search( string p_Search_Criteria , int p_User_Id )
        {
            List<Suppliers> Suppliers_To_Return = new List<Suppliers>();

            SqlParameter spSearch_Criteria = new SqlParameter("@Search_Criteria", SqlDbType.NVarChar, 50);
            SqlParameter spUser_Id = new SqlParameter("@User_Id", SqlDbType.Int );

            spSearch_Criteria.Value = p_Search_Criteria;
            spUser_Id.Value = p_User_Id;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Suppliers_Search", 
                new List<SqlParameter>() { spSearch_Criteria , spUser_Id });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                Suppliers_To_Return = new List<Suppliers>(dataSet.Tables[0].Rows.Count);

                for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                {
                    Suppliers_To_Return.Add(Create_Supplier_Details_From_Data_Row(dataSet.Tables[0].Rows[i]));
                }
            }

            return Suppliers_To_Return;
        }


        internal Suppliers Get_Supplier_Details_By_Supplier_Id(int p_Supplier_Id, int p_User_Id_Searching_For_Supplier_Details)
        {
            Suppliers Supplier_To_Return = new Suppliers();

            SqlParameter spSupplier_Id = new SqlParameter("@Supplier_Id", SqlDbType.Int);
            SqlParameter spUser_Id_Searching_For_Supplier_Details = new SqlParameter("@User_Id_Searching_For_Supplier_Details", SqlDbType.Int);

            spSupplier_Id.Value = p_Supplier_Id;
            spUser_Id_Searching_For_Supplier_Details.Value = p_User_Id_Searching_For_Supplier_Details;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Supplier_Details",
                new List<SqlParameter>() { spSupplier_Id, spUser_Id_Searching_For_Supplier_Details });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                Supplier_To_Return = Create_Supplier_Details_From_Data_Row(dataSet.Tables[0].Rows[0]); 
            }

            return Supplier_To_Return;
        }

        internal Suppliers Insert_New_Supplier_Administrative_Registration_Process(
            int p_User_Id, string p_Company_Name, string p_Website_URL, 
            short p_Country_Id, short? p_State_Id, string p_City, string p_Address, string p_ZipCode,
            byte? p_Default_Currency_Id, string p_Telephone, string p_Mobile_Phone,
            short p_Supplier_Type_Id, string p_Supplier_Tax_Reference_Number, string p_Main_Contact_FullName,
            string p_Main_Contact_Email_Address, string p_Main_Contact_Phone_Number,
            DateTime? p_Supplier_From_Date, DateTime? p_Supplier_To_Date, DateTime? p_First_Contract_Date,
            string p_First_Contract_Signed_With_Contact_Full_Name, string p_First_Contract_Signed_In_Location_Description,
            bool p_Is_Active, int p_Logged_In_Administrative_User_Id)
        {
            Suppliers new_Registered_Supplier_To_Return = null;

            SqlParameter spUser_Id = new SqlParameter("@User_Id", SqlDbType.Int);
            SqlParameter spCompany_Name = new SqlParameter("@Company_Name", SqlDbType.NVarChar , 150);
            SqlParameter spWebsite_URL = new SqlParameter("@Website_URL", SqlDbType.NVarChar, 150);
            SqlParameter spCountry_Id = new SqlParameter("@Country_Id", SqlDbType.SmallInt );
            SqlParameter spState_Id = new SqlParameter("@State_Id", SqlDbType.SmallInt);
            SqlParameter spCity = new SqlParameter("@City", SqlDbType.NVarChar, 100);
            SqlParameter spAddress = new SqlParameter("@Address", SqlDbType.NVarChar, 150);
            SqlParameter spZipCode = new SqlParameter("@ZipCode", SqlDbType.VarChar, 10);
            SqlParameter spDefault_Currency_Id = new SqlParameter("@Default_Currency_Id", SqlDbType.TinyInt);
            SqlParameter spTelephone = new SqlParameter("@Telephone", SqlDbType.VarChar, 40);
            SqlParameter spMobile_Phone = new SqlParameter("@Mobile_Phone", SqlDbType.VarChar, 40);
            SqlParameter spSupplier_Type_Id = new SqlParameter("@Supplier_Type_Id", SqlDbType.SmallInt);
            SqlParameter spSupplier_Tax_Reference_Number = new SqlParameter("@Supplier_Tax_Reference_Number", SqlDbType.NVarChar, 50);
            SqlParameter spMain_Contact_FullName = new SqlParameter("@Main_Contact_FullName", SqlDbType.NVarChar, 100);
            SqlParameter spMain_Contact_Email_Address = new SqlParameter("@Main_Contact_Email_Address", SqlDbType.NVarChar, 100);
            SqlParameter spMain_Contact_Phone_Number = new SqlParameter("@Main_Contact_Phone_Number", SqlDbType.NVarChar, 100);
            SqlParameter spSupplier_From_Date = new SqlParameter("@Supplier_From_Date", SqlDbType.DateTime);
            SqlParameter spSupplier_To_Date = new SqlParameter("@Supplier_To_Date", SqlDbType.DateTime);
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

            if (p_Default_Currency_Id.HasValue)
                spDefault_Currency_Id.Value = p_Default_Currency_Id.Value;
            else
                spDefault_Currency_Id.Value = DBNull.Value;

            spTelephone.Value = p_Telephone;
            spMobile_Phone.Value = p_Mobile_Phone;
            spSupplier_Type_Id.Value = p_Supplier_Type_Id;
            spSupplier_Tax_Reference_Number.Value = p_Supplier_Tax_Reference_Number;
            spMain_Contact_FullName.Value = p_Main_Contact_FullName;
            spMain_Contact_Email_Address.Value = p_Main_Contact_Email_Address;
            spMain_Contact_Phone_Number.Value = p_Main_Contact_Phone_Number;
            
            if (p_Supplier_From_Date.HasValue)
                spSupplier_From_Date.Value = p_Supplier_From_Date.Value;
            else
                spSupplier_From_Date.Value = DBNull.Value;

            if (p_Supplier_To_Date.HasValue)
                spSupplier_To_Date.Value = p_Supplier_To_Date.Value;
            else
                spSupplier_To_Date.Value = DBNull.Value;

            if (p_First_Contract_Date.HasValue)
                spFirst_Contract_Date.Value = p_First_Contract_Date.Value;
            else
                spFirst_Contract_Date.Value = DBNull.Value;

            spFirst_Contract_Signed_With_Contact_Full_Name.Value = p_First_Contract_Signed_With_Contact_Full_Name;
            spFirst_Contract_Signed_In_Location_Description.Value = p_First_Contract_Signed_In_Location_Description;
            spIs_Active.Value = p_Is_Active;
            spCreating_User_Id.Value = p_Logged_In_Administrative_User_Id;

            object new_Supplier_Id = SQLHelper.ExecuteStoredProcedure_ReturnDataObjectResult("p_TLBoard_Insert_Supplier_Details",
                new List<SqlParameter>() {
                    spUser_Id , spCompany_Name, spWebsite_URL , 
                    spCountry_Id , spState_Id , spCity , spAddress , spZipCode ,
                    spDefault_Currency_Id, spTelephone , spMobile_Phone , spSupplier_Type_Id , 
                    spSupplier_Tax_Reference_Number , spMain_Contact_FullName ,
                    spMain_Contact_Email_Address , spMain_Contact_Phone_Number ,
                    spSupplier_From_Date , spSupplier_To_Date , spFirst_Contract_Date ,
                    spFirst_Contract_Signed_With_Contact_Full_Name , spFirst_Contract_Signed_In_Location_Description ,
                    spIs_Active , spCreating_User_Id 
                });

            if (new_Supplier_Id != null)
            {
                int Supplier_Id_Registered = Convert.ToInt32(new_Supplier_Id);
                if (Supplier_Id_Registered > 0)
                {
                    new_Registered_Supplier_To_Return = Get_Supplier_Details_By_Supplier_Id(Supplier_Id_Registered, p_Logged_In_Administrative_User_Id);
                }
            }

            return new_Registered_Supplier_To_Return;
        }

        internal List<Suppliers> Get_All_By_User_Id(int p_User_Id, int p_Searching_User_Id)
        {
            List<Suppliers> Suppliers_To_Return = new List<Suppliers>();

            SqlParameter spUser_Id = new SqlParameter("@User_Id", SqlDbType.Int);
            SqlParameter spSearching_User_Id = new SqlParameter("@Searching_User_Id", SqlDbType.Int);

            spUser_Id.Value = p_User_Id;
            spSearching_User_Id.Value = p_Searching_User_Id;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Suppliers_List_By_User_Id",
                new List<SqlParameter>() { spUser_Id, spSearching_User_Id });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                Suppliers_To_Return = new List<Suppliers>(dataSet.Tables[0].Rows.Count);

                for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                {
                    Suppliers_To_Return.Add(Create_Supplier_Short_Details_From_Data_Row(dataSet.Tables[0].Rows[i]));
                }
            }

            return Suppliers_To_Return;
        }

        private Suppliers Create_Supplier_Details_From_Data_Row(DataRow dbRowDetailsForUserInitialization)
        {
            Suppliers Supplier_To_Return = new Suppliers();

            Supplier_To_Return.Supplier_Id = Convert.ToInt32(dbRowDetailsForUserInitialization["Supplier_Id"]);
            Supplier_To_Return.User_Id = Convert.ToInt32(dbRowDetailsForUserInitialization["User_Id"]);
            Supplier_To_Return.Company_Name = dbRowDetailsForUserInitialization["Company_Name"].ToString();
            Supplier_To_Return.Website_URL = dbRowDetailsForUserInitialization["Website_URL"].ToString();
            Supplier_To_Return.Country_Id = (short)dbRowDetailsForUserInitialization["Country_Id"];

            if (dbRowDetailsForUserInitialization["State_Id"] != DBNull.Value)
            {
                Supplier_To_Return.State_Id = (short)dbRowDetailsForUserInitialization["State_Id"];
            }

            Supplier_To_Return.City = dbRowDetailsForUserInitialization["City"].ToString();
            if (dbRowDetailsForUserInitialization.Table.Columns.IndexOf("Address") > -1)
            {
                Supplier_To_Return.Address = dbRowDetailsForUserInitialization["Address"].ToString();
                Supplier_To_Return.ZipCode = dbRowDetailsForUserInitialization["ZipCode"].ToString();
            }

            if (dbRowDetailsForUserInitialization.Table.Columns.IndexOf("Default_Currency_Id") > -1 
                && dbRowDetailsForUserInitialization["Default_Currency_Id"] != DBNull.Value)
            {
                Supplier_To_Return.Default_Currency_Id = (byte)dbRowDetailsForUserInitialization["Default_Currency_Id"];
            }

            if (dbRowDetailsForUserInitialization.Table.Columns.IndexOf("Telephone") > -1) 
            { 
                Supplier_To_Return.Telephone = dbRowDetailsForUserInitialization["Telephone"].ToString();
            }

            if (dbRowDetailsForUserInitialization.Table.Columns.IndexOf("Mobile_Phone") > -1)
            {
                Supplier_To_Return.Mobile_Phone = dbRowDetailsForUserInitialization["Mobile_Phone"].ToString();
            }
 
            Supplier_To_Return.Supplier_Type_Id = (short)dbRowDetailsForUserInitialization["Supplier_Type_Id"];

            if (dbRowDetailsForUserInitialization.Table.Columns.IndexOf("Supplier_Tax_Reference_Number") > -1)
            { 
                Supplier_To_Return.Supplier_Tax_Reference_Number = dbRowDetailsForUserInitialization["Supplier_Tax_Reference_Number"].ToString();
            }

            if (dbRowDetailsForUserInitialization.Table.Columns.IndexOf("Main_Contact_FullName") > -1 )
            { 
                Supplier_To_Return.Main_Contact_FullName = dbRowDetailsForUserInitialization["Main_Contact_FullName"].ToString();
                Supplier_To_Return.Main_Contact_Email_Address = dbRowDetailsForUserInitialization["Main_Contact_Email_Address"].ToString();
                Supplier_To_Return.Main_Contact_Phone_Number = dbRowDetailsForUserInitialization["Main_Contact_Phone_Number"].ToString();
            }

            if (dbRowDetailsForUserInitialization.Table.Columns.IndexOf("Record_Creation_DateTime_UTC") >-1)
            { 
                Supplier_To_Return.Record_Created_By_User_Id = Convert.ToInt32(dbRowDetailsForUserInitialization["Record_Created_By_User_Id"]);
                Supplier_To_Return.Record_Creation_DateTime_UTC = (DateTime)dbRowDetailsForUserInitialization["Record_Creation_DateTime_UTC"];
                Supplier_To_Return.Record_Last_Updated_By_User_Id = Convert.ToInt32(dbRowDetailsForUserInitialization["Record_Last_Updated_By_User_Id"]);
                Supplier_To_Return.Record_Last_Updated_DateTime_UTC = (DateTime)dbRowDetailsForUserInitialization["Record_Last_Updated_DateTime_UTC"];
            }

            Supplier_To_Return.Is_Active = (bool)dbRowDetailsForUserInitialization["Is_Active"];
            if (!Supplier_To_Return.Is_Active)
            {
                if (dbRowDetailsForUserInitialization.Table.Columns.IndexOf("Active_Last_Updated_dateTime_UTC") > -1 &&
                    dbRowDetailsForUserInitialization["Active_Last_Updated_dateTime_UTC"] != DBNull.Value)
                {
                    Supplier_To_Return.Active_Last_Updated_dateTime_UTC = (DateTime)dbRowDetailsForUserInitialization["Active_Last_Updated_dateTime_UTC"];
                    Supplier_To_Return.Active_Last_Updated_By_User_Id = Convert.ToInt32(dbRowDetailsForUserInitialization["Active_Last_Updated_By_User_Id"]);
                    Supplier_To_Return.Active_Last_Updated_Comments = dbRowDetailsForUserInitialization["Active_Last_Updated_Comments"].ToString();
                }
            }

            Supplier_To_Return.Is_Deleted = (bool)dbRowDetailsForUserInitialization["Is_Deleted"];
            if (Supplier_To_Return.Is_Deleted)
            {
                if (dbRowDetailsForUserInitialization.Table.Columns.IndexOf("Record_Deleted_By_User_Id") > -1 &&
                    dbRowDetailsForUserInitialization["Record_Deleted_By_User_Id"] != DBNull.Value)
                {
                    Supplier_To_Return.Record_Deleted_By_User_Id = Convert.ToInt32(dbRowDetailsForUserInitialization["Record_Deleted_By_User_Id"]);
                    Supplier_To_Return.Record_Deleted_DateTime_UTC = (DateTime)dbRowDetailsForUserInitialization["Record_Deleted_DateTime_UTC"];
                }
            }

            return Supplier_To_Return;
        }

        private Suppliers Create_Supplier_Short_Details_From_Data_Row(DataRow dataRow)
        {
            Suppliers Supplier_To_Return = new Suppliers();

            Supplier_To_Return.Supplier_Id = Convert.ToInt32(dataRow["Supplier_Id"]);
            Supplier_To_Return.User_Id = Convert.ToInt32(dataRow["User_Id"]);
            Supplier_To_Return.Company_Name = dataRow["Company_Name"].ToString();

            return Supplier_To_Return;
        }

    }
}

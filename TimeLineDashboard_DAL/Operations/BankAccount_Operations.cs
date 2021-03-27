using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TimeLineDashboard.Shared.Models;

namespace TimeLineDashboard.DAL.Operations
{
    internal class Bank_Accounts_Operations
    {
        #region Singleton
        private static readonly Bank_Accounts_Operations instance = new Bank_Accounts_Operations();
        // Explicit static constructor to tell C# compiler  
        // not to mark type as beforefieldinit  
        static Bank_Accounts_Operations()
        {
        }
        private Bank_Accounts_Operations()
        {
        }
        public static Bank_Accounts_Operations Instance
        {
            get
            {
                return instance;
            }
        }
        #endregion

        internal List<Bank_Accounts> Get_Search(
            int p_User_Id )
        {
            List<Bank_Accounts> Bank_Accounts_To_Return = new List<Bank_Accounts>();

            SqlParameter spUser_Id = new SqlParameter("@User_Id", SqlDbType.Int );

            spUser_Id.Value = p_User_Id;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Bank_Accounts_Search", 
                new List<SqlParameter>() { 
                    spUser_Id });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                Bank_Accounts_To_Return = new List<Bank_Accounts>(dataSet.Tables[0].Rows.Count);

                for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                {
                    Bank_Accounts_To_Return.Add(Create_Bank_Account_Details_From_Data_Row(dataSet.Tables[0].Rows[i]));
                }
            }

            return Bank_Accounts_To_Return;
        }

        internal Bank_Accounts Get_Bank_Account_Details_By_Bank_Account_Id(int p_Bank_Account_Id, int p_User_Id_Bank_Account_Owner )
        {
            Bank_Accounts Bank_Account_To_Return = new Bank_Accounts();

            SqlParameter spBank_Account_Id = new SqlParameter("@Bank_Account_Id", SqlDbType.Int);
            SqlParameter spUser_Id = new SqlParameter("@User_Id", SqlDbType.Int);
            
            spBank_Account_Id.Value = p_Bank_Account_Id;
            spUser_Id.Value = p_User_Id_Bank_Account_Owner;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Bank_Account_Details",
                new List<SqlParameter>() { spBank_Account_Id, spUser_Id });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                Bank_Account_To_Return = Create_Bank_Account_Details_From_Data_Row(dataSet.Tables[0].Rows[0]); 
            }

            return Bank_Account_To_Return;
        }

        internal Bank_Accounts Insert_New_Bank_Account_Details(
            string p_Bank_Name, string p_Bank_Number,
            string p_Branch_Name, string p_Branch_Number,
            string p_Account_Number, string p_Account_Name,
            string p_IBAN, byte? p_Currency_Id,
            DateTime? p_Opened_Account_DateTime, short? p_Branch_Country_Id,
            short? p_Branch_State_Id, string p_Branch_City,
            string p_Branch_Address_Description , string p_Branch_ZipCode ,
            string p_Branch_Phone , string p_Branch_Main_Email_Address ,
            string p_Branch_Main_Contact , string p_Main_Contact_Phone_Number ,
            DateTime? p_Account_Active_From_Date , DateTime? p_Account_Active_To_Date,
            bool p_Is_Visible_To_Anonymous_Users , bool p_Is_Available_For_Download_For_Anonymous_Users, 
            bool p_Is_Visible_To_Followers_Users , bool p_Is_Available_For_Download_For_Followers_Users,
            bool p_Is_Active,
            int p_Creating_User_Id )
        {
            Bank_Accounts new_Registered_Bank_Account_To_Return = null;

            SqlParameter spBank_Name = new SqlParameter("@Bank_Name", SqlDbType.NVarChar , 40);
            SqlParameter spBank_Number = new SqlParameter("@Bank_Number", SqlDbType.NVarChar, 10);
            SqlParameter spBranch_Name = new SqlParameter("@Branch_Name", SqlDbType.NVarChar, 40);
            SqlParameter spBranch_Number = new SqlParameter("@Branch_Number", SqlDbType.NVarChar, 50);
            SqlParameter spAccount_Number = new SqlParameter("@Account_Number", SqlDbType.NVarChar, 50);
            SqlParameter spAccount_Name = new SqlParameter("@Account_Name", SqlDbType.NVarChar, 50);
            SqlParameter spIBAN = new SqlParameter("@IBAN", SqlDbType.NVarChar, 50);
            SqlParameter spCurrency_Id = new SqlParameter("@Currency_Id", SqlDbType.TinyInt);
            SqlParameter spOpened_Account_DateTime = new SqlParameter("@Opened_Account_DateTime", SqlDbType.DateTime);
            SqlParameter spBranch_Country_Id = new SqlParameter("@Branch_Country_Id", SqlDbType.SmallInt);
            SqlParameter spBranch_State_Id = new SqlParameter("@Branch_State_Id", SqlDbType.SmallInt);
            SqlParameter spBranch_City = new SqlParameter("@Branch_City", SqlDbType.NVarChar, 100);
            SqlParameter spBranch_Address_Description = new SqlParameter("@Branch_Address_Description", SqlDbType.NVarChar, 255);
            SqlParameter spBranch_ZipCode = new SqlParameter("@Branch_ZipCode", SqlDbType.NVarChar, 20);
            SqlParameter spBranch_Phone = new SqlParameter("@Branch_Phone", SqlDbType.NVarChar, 50);
            SqlParameter spBranch_Main_Email_Address = new SqlParameter("@Branch_Main_Email_Address", SqlDbType.NVarChar, 100);
            SqlParameter spBranch_Main_Contact = new SqlParameter("@Branch_Main_Contact", SqlDbType.NVarChar, 100);
            SqlParameter spMain_Contact_Phone_Number = new SqlParameter("@Main_Contact_Phone_Number", SqlDbType.NVarChar, 50);
            SqlParameter spAccount_Active_From_Date = new SqlParameter("@Account_Active_From_Date", SqlDbType.DateTime);
            SqlParameter spAccount_Active_To_Date = new SqlParameter("@Account_Active_To_Date", SqlDbType.DateTime);
            SqlParameter spIs_Visible_To_Anonymous_Users = new SqlParameter("@Is_Visible_To_Anonymous_Users", SqlDbType.Bit);
            SqlParameter spIs_Available_For_Download_For_Anonymous_Users = new SqlParameter("@Is_Available_For_Download_For_Anonymous_Users", SqlDbType.Bit);
            SqlParameter spIs_Visible_To_Followers_Users = new SqlParameter("@Is_Visible_To_Followers_Users", SqlDbType.Bit);
            SqlParameter spIs_Available_For_Download_For_Followers_Users = new SqlParameter("@Is_Available_For_Download_For_Followers_Users", SqlDbType.Bit);
            SqlParameter spIs_Active = new SqlParameter("@Is_Active", SqlDbType.Bit);
            SqlParameter spCreating_User_Id = new SqlParameter("@Creating_User_Id", SqlDbType.Int);

            spBank_Name.Value = p_Bank_Name;
            spBank_Number.Value = p_Bank_Number;
            spBranch_Name.Value = p_Branch_Name;
            spBranch_Number.Value = p_Branch_Number;
            spAccount_Number.Value = p_Account_Number;
            spAccount_Name.Value = p_Account_Name;
            spIBAN.Value = p_IBAN;
            
            if (p_Currency_Id.HasValue)
                spCurrency_Id.Value = p_Currency_Id;
            else
                spCurrency_Id.Value = DBNull.Value;

            if (p_Opened_Account_DateTime.HasValue)
                spOpened_Account_DateTime.Value = p_Opened_Account_DateTime.Value;
            else
                spOpened_Account_DateTime.Value = DBNull.Value;

            if (p_Branch_Country_Id.HasValue)
                spBranch_Country_Id.Value = p_Branch_Country_Id;
            else
                spBranch_Country_Id.Value = DBNull.Value;

            if (p_Branch_State_Id.HasValue)
                spBranch_State_Id.Value = p_Branch_State_Id.Value;
            else
                spBranch_State_Id.Value = DBNull.Value;

            spBranch_City.Value = p_Branch_City;
            spBranch_Address_Description.Value = p_Branch_Address_Description;
            spBranch_ZipCode.Value = p_Branch_ZipCode;
            spBranch_Phone.Value = p_Branch_Phone;
            spBranch_Main_Email_Address.Value = p_Branch_Main_Email_Address;
            spBranch_Main_Contact.Value = p_Branch_Main_Contact;
            spMain_Contact_Phone_Number.Value = p_Main_Contact_Phone_Number;
            
            if (p_Account_Active_From_Date.HasValue)
                spAccount_Active_From_Date.Value = p_Account_Active_From_Date;
            else
                spAccount_Active_From_Date.Value = DBNull.Value;

            if (p_Account_Active_To_Date.HasValue)
                spAccount_Active_To_Date.Value = p_Account_Active_To_Date;
            else
                spAccount_Active_To_Date.Value = DBNull.Value;

            spIs_Visible_To_Anonymous_Users.Value = p_Is_Visible_To_Anonymous_Users;
            spIs_Available_For_Download_For_Anonymous_Users.Value = p_Is_Available_For_Download_For_Anonymous_Users;
            spIs_Visible_To_Followers_Users.Value = p_Is_Visible_To_Followers_Users;
            spIs_Available_For_Download_For_Followers_Users.Value = p_Is_Available_For_Download_For_Followers_Users;

            spIs_Active.Value = p_Is_Active;
            spCreating_User_Id.Value = p_Creating_User_Id;

            object new_Bank_Account_Id = SQLHelper.ExecuteStoredProcedure_ReturnDataObjectResult("p_TLBoard_Insert_Bank_Account_Details",
                new List<SqlParameter>() {
                    spBank_Name,
                    spBank_Number,
                    spBranch_Name,
                    spBranch_Number,
                    spAccount_Number,
                    spAccount_Name,
                    spIBAN,
                    spCurrency_Id,
                    spOpened_Account_DateTime, 
                    spBranch_Country_Id, 
                    spBranch_State_Id,
                    spBranch_City, 
                    spBranch_Address_Description,
                    spBranch_ZipCode,
                    spBranch_Phone,
                    spBranch_Main_Email_Address,
                    spBranch_Main_Contact,
                    spMain_Contact_Phone_Number,
                    spAccount_Active_From_Date,
                    spAccount_Active_To_Date,
                    spIs_Visible_To_Anonymous_Users, 
                    spIs_Available_For_Download_For_Anonymous_Users,
                    spIs_Visible_To_Followers_Users, 
                    spIs_Available_For_Download_For_Followers_Users,
                    spIs_Active,
                    spCreating_User_Id
            });

            if (new_Bank_Account_Id != null)
            {
                int Bank_Account_Id_Registered = Convert.ToInt32(new_Bank_Account_Id);
                if (Bank_Account_Id_Registered > 0)
                {
                    new_Registered_Bank_Account_To_Return = Get_Bank_Account_Details_By_Bank_Account_Id(Bank_Account_Id_Registered, p_Creating_User_Id);
                }
            }

            return new_Registered_Bank_Account_To_Return;
        }

        internal bool Update_Bank_Account_Details(
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
            bool p_Is_Active,
            int p_Creating_User_Id )
        {
            bool updated_Successfully = false;

            SqlParameter spBank_Account_Id = new SqlParameter("@Bank_Account_Id", SqlDbType.Int);
            SqlParameter spBank_Name = new SqlParameter("@Bank_Name", SqlDbType.NVarChar, 40);
            SqlParameter spBank_Number = new SqlParameter("@Bank_Number", SqlDbType.NVarChar, 10);
            SqlParameter spBranch_Name = new SqlParameter("@Branch_Name", SqlDbType.NVarChar, 40);
            SqlParameter spBranch_Number = new SqlParameter("@Branch_Number", SqlDbType.NVarChar, 50);
            SqlParameter spAccount_Number = new SqlParameter("@Account_Number", SqlDbType.NVarChar, 50);
            SqlParameter spAccount_Name = new SqlParameter("@Account_Name", SqlDbType.NVarChar, 50);
            SqlParameter spIBAN = new SqlParameter("@IBAN", SqlDbType.NVarChar, 50);
            SqlParameter spCurrency_Id = new SqlParameter("@Currency_Id", SqlDbType.TinyInt);
            SqlParameter spOpened_Account_DateTime = new SqlParameter("@Opened_Account_DateTime", SqlDbType.DateTime);
            SqlParameter spBranch_Country_Id = new SqlParameter("@Branch_Country_Id", SqlDbType.SmallInt);
            SqlParameter spBranch_State_Id = new SqlParameter("@Branch_State_Id", SqlDbType.SmallInt);
            SqlParameter spBranch_City = new SqlParameter("@Branch_City", SqlDbType.NVarChar, 100);
            SqlParameter spBranch_Address_Description = new SqlParameter("@Branch_Address_Description", SqlDbType.NVarChar, 255);
            SqlParameter spBranch_ZipCode = new SqlParameter("@Branch_ZipCode", SqlDbType.NVarChar, 20);
            SqlParameter spBranch_Phone = new SqlParameter("@Branch_Phone", SqlDbType.NVarChar, 50);
            SqlParameter spBranch_Main_Email_Address = new SqlParameter("@Branch_Main_Email_Address", SqlDbType.NVarChar, 100);
            SqlParameter spBranch_Main_Contact = new SqlParameter("@Branch_Main_Contact", SqlDbType.NVarChar, 100);
            SqlParameter spMain_Contact_Phone_Number = new SqlParameter("@Main_Contact_Phone_Number", SqlDbType.NVarChar, 50);
            SqlParameter spAccount_Active_From_Date = new SqlParameter("@Account_Active_From_Date", SqlDbType.DateTime);
            SqlParameter spAccount_Active_To_Date = new SqlParameter("@Account_Active_To_Date", SqlDbType.DateTime);
            SqlParameter spIs_Visible_To_Anonymous_Users = new SqlParameter("@Is_Visible_To_Anonymous_Users", SqlDbType.Bit);
            SqlParameter spIs_Available_For_Download_For_Anonymous_Users = new SqlParameter("@Is_Available_For_Download_For_Anonymous_Users", SqlDbType.Bit);
            SqlParameter spIs_Visible_To_Followers_Users = new SqlParameter("@Is_Visible_To_Followers_Users", SqlDbType.Bit);
            SqlParameter spIs_Available_For_Download_For_Followers_Users = new SqlParameter("@Is_Available_For_Download_For_Followers_Users", SqlDbType.Bit);
            SqlParameter spIs_Active = new SqlParameter("@Is_Active", SqlDbType.Bit);
            SqlParameter spUpdating_User_Id = new SqlParameter("@Updating_User_Id", SqlDbType.Int);

            spBank_Account_Id.Value = p_Bank_Account_Id;
            spBank_Name.Value = p_Bank_Name;
            spBank_Number.Value = p_Bank_Number;
            spBranch_Name.Value = p_Branch_Name;
            spBranch_Number.Value = p_Branch_Number;
            spAccount_Number.Value = p_Account_Number;
            spAccount_Name.Value = p_Account_Name;
            spIBAN.Value = p_IBAN;

            if (p_Currency_Id.HasValue)
                spCurrency_Id.Value = p_Currency_Id;
            else
                spCurrency_Id.Value = DBNull.Value;

            if (p_Opened_Account_DateTime.HasValue)
                spOpened_Account_DateTime.Value = p_Opened_Account_DateTime.Value;
            else
                spOpened_Account_DateTime.Value = DBNull.Value;

            if (p_Branch_Country_Id.HasValue)
                spBranch_Country_Id.Value = p_Branch_Country_Id;
            else
                spBranch_Country_Id.Value = DBNull.Value;

            if (p_Branch_State_Id.HasValue)
                spBranch_State_Id.Value = p_Branch_State_Id.Value;
            else
                spBranch_State_Id.Value = DBNull.Value;

            spBranch_City.Value = p_Branch_City;
            spBranch_Address_Description.Value = p_Branch_Address_Description;
            spBranch_ZipCode.Value = p_Branch_ZipCode;
            spBranch_Phone.Value = p_Branch_Phone;
            spBranch_Main_Email_Address.Value = p_Branch_Main_Email_Address;
            spBranch_Main_Contact.Value = p_Branch_Main_Contact;
            spMain_Contact_Phone_Number.Value = p_Main_Contact_Phone_Number;

            if (p_Account_Active_From_Date.HasValue)
                spAccount_Active_From_Date.Value = p_Account_Active_From_Date;
            else
                spAccount_Active_From_Date.Value = DBNull.Value;

            if (p_Account_Active_To_Date.HasValue)
                spAccount_Active_To_Date.Value = p_Account_Active_To_Date;
            else
                spAccount_Active_To_Date.Value = DBNull.Value;

            spIs_Visible_To_Anonymous_Users.Value = p_Is_Visible_To_Anonymous_Users;
            spIs_Available_For_Download_For_Anonymous_Users.Value = p_Is_Available_For_Download_For_Anonymous_Users;
            spIs_Visible_To_Followers_Users.Value = p_Is_Visible_To_Followers_Users;
            spIs_Available_For_Download_For_Followers_Users.Value = p_Is_Available_For_Download_For_Followers_Users;

            spIs_Active.Value = p_Is_Active;
            spUpdating_User_Id.Value = p_Creating_User_Id;

            int affected_Rows = SQLHelper.ExecuteStoredProcedure_ReturnAffectedRowsNumber_WithDefaultAppConfigConnectionString("p_TLBoard_Update_Bank_Account_Details",
                new List<SqlParameter>() {
                    spBank_Account_Id,
                    spBank_Name,
                    spBank_Number,
                    spBranch_Name,
                    spBranch_Number,
                    spAccount_Number,
                    spAccount_Name,
                    spIBAN,
                    spCurrency_Id,
                    spOpened_Account_DateTime,
                    spBranch_Country_Id,
                    spBranch_State_Id,
                    spBranch_City,
                    spBranch_Address_Description,
                    spBranch_ZipCode,
                    spBranch_Phone,
                    spBranch_Main_Email_Address,
                    spBranch_Main_Contact,
                    spMain_Contact_Phone_Number,
                    spAccount_Active_From_Date,
                    spAccount_Active_To_Date,
                    spIs_Visible_To_Anonymous_Users,
                    spIs_Available_For_Download_For_Anonymous_Users,
                    spIs_Visible_To_Followers_Users,
                    spIs_Available_For_Download_For_Followers_Users,
                    spIs_Active,
                    spUpdating_User_Id
                });

            if (affected_Rows > 0)
            {
                updated_Successfully = true;
            }

            return updated_Successfully;
        }

        internal List<Bank_Accounts> Get_All_By_User_Id(int p_User_Id_To_Return_Bank_Accounts, int p_Authenticated_User_ID)
        {
            return this.Get_Search(p_User_Id_To_Return_Bank_Accounts);
        }

        private Bank_Accounts Create_Bank_Account_Details_From_Data_Row(DataRow dbRow)
        {
            Bank_Accounts Bank_Account_To_Return = new Bank_Accounts();

            Bank_Account_To_Return.Bank_Account_Id = Convert.ToInt32(dbRow["Bank_Account_Id"]);
            Bank_Account_To_Return.User_Id = Convert.ToInt32(dbRow["User_Id"]);
            Bank_Account_To_Return.Bank_Name = dbRow["Bank_Name"].ToString();
            Bank_Account_To_Return.Bank_Number = dbRow["Bank_Number"].ToString();

            Bank_Account_To_Return.Branch_Name = dbRow["Branch_Name"].ToString();
            Bank_Account_To_Return.Branch_Number = dbRow["Branch_Number"].ToString();

            Bank_Account_To_Return.Account_Number = dbRow["Account_Number"].ToString();
            Bank_Account_To_Return.Account_Name = dbRow["Account_Name"].ToString();

            Bank_Account_To_Return.IBAN = dbRow["IBAN"].ToString();

            if (dbRow["Currency_Id"] != DBNull.Value)
            {
                Bank_Account_To_Return.Currency_Id = (byte)dbRow["Currency_Id"];

                if (dbRow.Table.Columns.IndexOf("Currency_Symbol") > -1)
                {
                    Bank_Account_To_Return.Currency_Symbol = dbRow["Currency_Symbol"].ToString();
                }
            }

            if (dbRow.Table.Columns.IndexOf("Latest_Transaction_Actual_DateTime") > -1 && 
                dbRow["Latest_Transaction_Actual_DateTime"] != DBNull.Value )
            {
                Bank_Account_To_Return.Latest_Transaction_Actual_DateTime = (DateTime)dbRow["Latest_Transaction_Actual_DateTime"];
                if (dbRow["Latest_Transaction_Account_Balance"] != DBNull.Value)
                {
                    Bank_Account_To_Return.Latest_Transaction_Account_Balance = (decimal)dbRow["Latest_Transaction_Account_Balance"];
                }
            }

            if (dbRow["Opened_Account_DateTime"] != DBNull.Value)
            {
                Bank_Account_To_Return.Opened_Account_DateTime = (DateTime)dbRow["Opened_Account_DateTime"];
            }

            if (dbRow["Branch_Country_Id"] != DBNull.Value)
            {
                Bank_Account_To_Return.Branch_Country_Id = (short)dbRow["Branch_Country_Id"];
                if (dbRow.Table.Columns.IndexOf("Branch_Country_Name") > -1)
                {
                    Bank_Account_To_Return.Branch_Country_Name = dbRow["Branch_Country_Name"].ToString();
                }

                if (dbRow["Branch_State_Id"] != DBNull.Value)
                {
                    Bank_Account_To_Return.Branch_State_Id = (short)dbRow["Branch_State_Id"];
                }
            }

            Bank_Account_To_Return.Branch_City = dbRow["Branch_City"].ToString();
            if (dbRow.Table.Columns.IndexOf("Branch_Address_Description") > -1)
            {
                Bank_Account_To_Return.Branch_Address = dbRow["Branch_Address_Description"].ToString();
                Bank_Account_To_Return.Branch_Zipcode = dbRow["Branch_ZipCode"].ToString();
            }

            if (dbRow.Table.Columns.IndexOf("Branch_Phone") > -1) 
            {
                Bank_Account_To_Return.Branch_Phone = dbRow["Branch_Phone"].ToString();
            }

            if (dbRow.Table.Columns.IndexOf("Branch_Main_Email_Address") > -1)
            {
                Bank_Account_To_Return.Branch_Main_Email_Address = dbRow["Branch_Main_Email_Address"].ToString();
            }

            if (dbRow.Table.Columns.IndexOf("Branch_Main_Contact") > -1)
            {
                Bank_Account_To_Return.Branch_Main_Contact = dbRow["Branch_Main_Contact"].ToString();
            }

            if (dbRow.Table.Columns.IndexOf("Main_Contact_Phone_Number") > -1)
            {
                Bank_Account_To_Return.Main_Contact_Phone_Number = dbRow["Main_Contact_Phone_Number"].ToString();
            }

            if (dbRow.Table.Columns.IndexOf("Account_Active_From_Date") > -1 )
            {
                if (dbRow["Account_Active_From_Date"] != DBNull.Value)
                {
                    Bank_Account_To_Return.Account_Active_From_Date = (DateTime)dbRow["Account_Active_From_Date"];
                }

                if (dbRow["Account_Active_To_Date"] != DBNull.Value)
                {
                    Bank_Account_To_Return.Account_Active_To_Date = (DateTime)dbRow["Account_Active_To_Date"];
                }
            }

            Bank_Account_To_Return.Is_Visible_To_Anonymous_Users = (bool)dbRow["Is_Visible_To_Anonymous_Users"];
            Bank_Account_To_Return.Is_Available_For_Download_For_Anonymous_Users = (bool)dbRow["Is_Available_For_Download_For_Anonymous_Users"];
            Bank_Account_To_Return.Is_Visible_To_Followers_Users = (bool)dbRow["Is_Visible_To_Followers_Users"];
            Bank_Account_To_Return.Is_Available_For_Download_For_Followers_Users = (bool)dbRow["Is_Available_For_Download_For_Followers_Users"];

            if (dbRow.Table.Columns.IndexOf("Record_Creation_DateTime_UTC") >-1)
            { 
                Bank_Account_To_Return.Record_Created_By_User_Id = Convert.ToInt32(dbRow["Record_Created_By_User_Id"]);
                Bank_Account_To_Return.Record_Created_By_User_Details = new Users();
                Bank_Account_To_Return.Record_Created_By_User_Details.User_Id = Bank_Account_To_Return.Record_Created_By_User_Id;
                if (dbRow.Table.Columns.IndexOf("Created_By_First_Name") > -1)
                {
                    Bank_Account_To_Return.Record_Created_By_User_Details.First_Name = dbRow["Created_By_First_Name"].ToString();
                    Bank_Account_To_Return.Record_Created_By_User_Details.Last_Name = dbRow["Created_By_Last_Name"].ToString();
                }
                Bank_Account_To_Return.Record_Creation_DateTime_UTC = (DateTime)dbRow["Record_Creation_DateTime_UTC"];

                Bank_Account_To_Return.Record_Last_Updated_By_User_Id = Convert.ToInt32(dbRow["Record_Last_Updated_By_User_Id"]);
                Bank_Account_To_Return.Record_Last_Updated_By_User_Details = new Users();
                Bank_Account_To_Return.Record_Last_Updated_By_User_Details.User_Id = Bank_Account_To_Return.Record_Last_Updated_By_User_Id;
                if (dbRow.Table.Columns.IndexOf("Last_Updated_By_First_Name") > -1)
                {
                    Bank_Account_To_Return.Record_Last_Updated_By_User_Details.First_Name = dbRow["Last_Updated_By_First_Name"].ToString();
                    Bank_Account_To_Return.Record_Last_Updated_By_User_Details.Last_Name = dbRow["Last_Updated_By_Last_Name"].ToString();
                }
                Bank_Account_To_Return.Record_Last_Updated_DateTime_UTC = (DateTime)dbRow["Record_Last_Updated_DateTime_UTC"];
            }

            Bank_Account_To_Return.Is_Active = (bool)dbRow["Is_Active"];
            Bank_Account_To_Return.Is_Deleted = (bool)dbRow["Is_Deleted"];

            return Bank_Account_To_Return;
        }
    }
}

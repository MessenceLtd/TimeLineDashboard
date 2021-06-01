using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TimeLineDashboard.Shared.Models;

namespace TimeLineDashboard.DAL.Operations
{
    internal class Credit_Cards_Statement_Operations
    {
        #region Singleton
        private static readonly Credit_Cards_Statement_Operations instance = new Credit_Cards_Statement_Operations();
        // Explicit static constructor to tell C# compiler  
        // not to mark type as beforefieldinit  
        static Credit_Cards_Statement_Operations()
        {
        }
        private Credit_Cards_Statement_Operations()
        {
        }
        public static Credit_Cards_Statement_Operations Instance
        {
            get
            {
                return instance;
            }
        }
        #endregion

        internal List<Credit_Cards_Statement> Get_Search(
            int p_User_ID_Bank_Owner    , 
            int? p_Bank_Account_Id      , 
            int p_User_ID_Searching     )
        {
            List<Credit_Cards_Statement> Credit_Cards_Statement_To_Return = new List<Credit_Cards_Statement>();

            SqlParameter spUser_Id_Bank_Owner = new SqlParameter("@User_Id_Bank_Owner", SqlDbType.Int );
            SqlParameter spBank_Account_Id = new SqlParameter("@Bank_Account_Id", SqlDbType.Int);
            SqlParameter spUser_ID_Searching = new SqlParameter("@User_ID_Searching", SqlDbType.Int);

            spUser_Id_Bank_Owner.Value = p_User_ID_Bank_Owner;
            if (p_Bank_Account_Id.HasValue)
                spBank_Account_Id.Value = p_Bank_Account_Id;
            else
                spBank_Account_Id.Value = DBNull.Value;

            spUser_ID_Searching.Value = p_User_ID_Searching;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Credit_Card_Statements_List", 
                new List<SqlParameter>() {
                    spUser_Id_Bank_Owner    ,
                    spBank_Account_Id       ,
                    spUser_ID_Searching
                });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                Credit_Cards_Statement_To_Return = new List<Credit_Cards_Statement>(dataSet.Tables[0].Rows.Count);

                for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                {
                    Credit_Cards_Statement_To_Return.Add(Create_Credit_Card_Statement_Details_From_Data_Row(dataSet.Tables[0].Rows[i]));
                }
            }

            return Credit_Cards_Statement_To_Return;
        }

        internal Credit_Cards_Statement Get_Credit_Card_Statement_Details_By_Credit_Card_Statement_Id(
            int p_Credit_Card_Statement_Id                      , 
            int p_User_ID_Bank_Owner                            ,
            int p_User_ID_Searching)
        {
            Credit_Cards_Statement Credit_Card_Statement_To_Return = new Credit_Cards_Statement();

            SqlParameter spCredit_Card_Statement_Id = new SqlParameter("@Bank_Account_Credit_Card_Statement_Id", SqlDbType.Int);
            SqlParameter spUser_ID_Bank_Owner = new SqlParameter("@User_ID_Bank_Owner", SqlDbType.Int);
            SqlParameter spUser_ID_Searching = new SqlParameter("@User_ID_Searching", SqlDbType.Int);
            
            spCredit_Card_Statement_Id.Value = p_Credit_Card_Statement_Id;
            spUser_ID_Bank_Owner.Value = p_User_ID_Bank_Owner;
            spUser_ID_Searching.Value = p_User_ID_Searching;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Credit_Card_Statement_Details",
                new List<SqlParameter>() {
                    spCredit_Card_Statement_Id,
                    spUser_ID_Bank_Owner ,
                    spUser_ID_Searching });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                Credit_Card_Statement_To_Return = Create_Credit_Card_Statement_Details_From_Data_Row(dataSet.Tables[0].Rows[0]); 
            }

            return Credit_Card_Statement_To_Return;
        }

        internal Credit_Cards_Statement Insert_New_Credit_Card_Statement_Details(
            int p_User_Id_Owner, 
            int p_Bank_Account_Id ,
            int p_Credit_Card_Id,
            DateTime? p_Statement_Date ,
            decimal p_Total_Amount,
            byte p_Currency_Id,
            string p_Original_File_Name,
            string p_Azure_Block_Blob_Reference,
            long? p_Bank_Account_Transaction_Id_Connection,
            bool p_Is_Visible_To_Anonymous_Users,
            bool p_Is_Available_For_Download_For_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users,
            bool p_Is_Available_For_Download_For_Followers_Users,
            int p_Creating_User_Id )
        {
            Credit_Cards_Statement new_Registered_Credit_Card_Statement_To_Return = null;

            SqlParameter spUser_Id_Owner = new SqlParameter("@User_Id_Owner", SqlDbType.Int);
            SqlParameter spBank_Account_Id = new SqlParameter("@Bank_Account_Id", SqlDbType.Int);
            SqlParameter spCredit_Card_Id = new SqlParameter("@Credit_Card_Id", SqlDbType.Int);
            SqlParameter spStatement_Date = new SqlParameter("@Statement_Date", SqlDbType.DateTime);
            SqlParameter spTotal_Amount = new SqlParameter("@Total_Amount", SqlDbType.Decimal);
            SqlParameter spCurrency_Id = new SqlParameter("@Currency_Id", SqlDbType.TinyInt);
            SqlParameter spOriginal_File_Name = new SqlParameter("@Original_File_Name", SqlDbType.NVarChar, 255);
            SqlParameter spAzure_Block_Blob_Reference = new SqlParameter("@Azure_Block_Blob_Reference", SqlDbType.NVarChar, 255);
            SqlParameter spBank_Account_Transaction_Id_Connection = new SqlParameter("@Bank_Account_Transaction_Id_Connection", SqlDbType.BigInt);
            SqlParameter spIs_Visible_To_Anonymous_Users = new SqlParameter("@Is_Visible_To_Anonymous_Users", SqlDbType.Bit);
            SqlParameter spIs_Available_For_Download_For_Anonymous_Users = new SqlParameter("@Is_Available_For_Download_For_Anonymous_Users", SqlDbType.Bit);
            SqlParameter spIs_Visible_To_Followers_Users = new SqlParameter("@Is_Visible_To_Followers_Users", SqlDbType.Bit);
            SqlParameter spIs_Available_For_Download_For_Followers_Users = new SqlParameter("@Is_Available_For_Download_For_Followers_Users", SqlDbType.Bit);
            SqlParameter spCreating_User_Id = new SqlParameter("@Creating_User_Id", SqlDbType.Int);

            spUser_Id_Owner.Value = p_User_Id_Owner;
            spBank_Account_Id.Value = p_Bank_Account_Id;
            spCredit_Card_Id.Value = p_Credit_Card_Id;
            if (p_Statement_Date.HasValue)
                spStatement_Date.Value = p_Statement_Date;
            else
                spStatement_Date.Value = DBNull.Value;

            spTotal_Amount.Value = p_Total_Amount;
            spCurrency_Id.Value = p_Currency_Id;
            
            spOriginal_File_Name.Value = p_Original_File_Name;
            spAzure_Block_Blob_Reference.Value = p_Azure_Block_Blob_Reference;
            
            if (p_Bank_Account_Transaction_Id_Connection.HasValue)
                spBank_Account_Transaction_Id_Connection.Value = p_Bank_Account_Transaction_Id_Connection;
            else
                spBank_Account_Transaction_Id_Connection.Value = DBNull.Value;

            spIs_Visible_To_Anonymous_Users.Value = p_Is_Visible_To_Anonymous_Users;
            spIs_Available_For_Download_For_Anonymous_Users.Value = p_Is_Available_For_Download_For_Anonymous_Users;
            spIs_Visible_To_Followers_Users.Value = p_Is_Visible_To_Followers_Users;
            spIs_Available_For_Download_For_Followers_Users.Value = p_Is_Available_For_Download_For_Followers_Users;

            spCreating_User_Id.Value = p_Creating_User_Id;

            object new_Credit_Card_Statement_Id = SQLHelper.ExecuteStoredProcedure_ReturnDataObjectResult("p_TLBoard_Insert_Credit_Card_Statement",
                new List<SqlParameter>() {
                    spUser_Id_Owner     ,
                    spBank_Account_Id   ,
                    spCredit_Card_Id    ,
                    spStatement_Date    ,
                    spTotal_Amount      ,
                    spCurrency_Id       ,
                    spOriginal_File_Name , 
                    spAzure_Block_Blob_Reference ,
                    spBank_Account_Transaction_Id_Connection ,
                    spIs_Visible_To_Anonymous_Users ,
                    spIs_Available_For_Download_For_Anonymous_Users ,
                    spIs_Visible_To_Followers_Users ,
                    spIs_Available_For_Download_For_Followers_Users ,
                    spCreating_User_Id 
            });

            if (new_Credit_Card_Statement_Id != null)
            {
                int Credit_Card_Statement_Id_Registered = Convert.ToInt32(new_Credit_Card_Statement_Id);
                if (Credit_Card_Statement_Id_Registered > 0)
                {
                    new_Registered_Credit_Card_Statement_To_Return = Get_Credit_Card_Statement_Details_By_Credit_Card_Statement_Id(
                        Credit_Card_Statement_Id_Registered, p_User_Id_Owner, p_Creating_User_Id);
                }
            }

            return new_Registered_Credit_Card_Statement_To_Return;
        }

        internal bool Update_Credit_Card_Statement_Details(
            int p_Credit_Card_Statement_Id,
            int p_Credit_Card_Id,
            DateTime p_Statement_Date,
            decimal p_Total_Amount,
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
            bool updated_Successfully = false;

            SqlParameter spCredit_Card_Statement_Id = new SqlParameter("@Bank_Account_Credit_Card_Statement_Id", SqlDbType.Int);
            SqlParameter spCredit_Card_Id = new SqlParameter("@Credit_Card_Id", SqlDbType.Int);
            SqlParameter spStatement_Date = new SqlParameter("@Statement_Date", SqlDbType.DateTime);
            SqlParameter spTotal_Amount = new SqlParameter("@Total_Amount", SqlDbType.Decimal);
            SqlParameter spCurrency_Id = new SqlParameter("@Currency_Id", SqlDbType.TinyInt);
            SqlParameter spOriginal_File_Name = new SqlParameter("@Original_File_Name", SqlDbType.NVarChar, 255);
            SqlParameter spAzure_Block_Blob_Reference = new SqlParameter("@Azure_Block_Blob_Reference", SqlDbType.NVarChar, 255);
            SqlParameter spFile_Uploaded = new SqlParameter("@File_Uploaded", SqlDbType.Bit);
            SqlParameter spBank_Account_Transaction_Id_Connection = new SqlParameter("@Bank_Account_Transaction_Id_Connection", SqlDbType.BigInt);
            SqlParameter spIs_Visible_To_Anonymous_Users = new SqlParameter("@Is_Visible_To_Anonymous_Users", SqlDbType.Bit);
            SqlParameter spIs_Available_For_Download_For_Anonymous_Users = new SqlParameter("@Is_Available_For_Download_For_Anonymous_Users", SqlDbType.Bit);
            SqlParameter spIs_Visible_To_Followers_Users = new SqlParameter("@Is_Visible_To_Followers_Users", SqlDbType.Bit);
            SqlParameter spIs_Available_For_Download_For_Followers_Users = new SqlParameter("@Is_Available_For_Download_For_Followers_Users", SqlDbType.Bit);
            SqlParameter spUpdating_User_Id = new SqlParameter("@Updating_User_Id", SqlDbType.Int);

            spCredit_Card_Statement_Id.Value = p_Credit_Card_Statement_Id;
            spCredit_Card_Id.Value = p_Credit_Card_Id;
            spStatement_Date.Value = p_Statement_Date;
            spTotal_Amount.Value = p_Total_Amount;
            spCurrency_Id.Value = p_Currency_Id;

            spOriginal_File_Name.Value = p_Original_File_Name;
            spAzure_Block_Blob_Reference.Value = p_Azure_Block_Blob_Reference;
            spFile_Uploaded.Value = p_File_Uploaded;

            if (p_Bank_Account_Transaction_Id_Connection.HasValue)
                spBank_Account_Transaction_Id_Connection.Value = p_Bank_Account_Transaction_Id_Connection;
            else
                spBank_Account_Transaction_Id_Connection.Value = DBNull.Value;

            spIs_Visible_To_Anonymous_Users.Value = p_Is_Visible_To_Anonymous_Users;
            spIs_Available_For_Download_For_Anonymous_Users.Value = p_Is_Available_For_Download_For_Anonymous_Users;
            spIs_Visible_To_Followers_Users.Value = p_Is_Visible_To_Followers_Users;
            spIs_Available_For_Download_For_Followers_Users.Value = p_Is_Available_For_Download_For_Followers_Users;

            spUpdating_User_Id.Value = p_Updating_User_Id;

            int affected_Rows = SQLHelper.ExecuteStoredProcedure_ReturnAffectedRowsNumber_WithDefaultAppConfigConnectionString("p_TLBoard_Update_Credit_Card_Statement",
                new List<SqlParameter>() {
                    spCredit_Card_Statement_Id ,
                    spCredit_Card_Id , 
                    spStatement_Date ,
                    spTotal_Amount ,
                    spCurrency_Id ,
                    spOriginal_File_Name ,
                    spAzure_Block_Blob_Reference ,
                    spFile_Uploaded ,
                    spBank_Account_Transaction_Id_Connection ,
                    spIs_Visible_To_Anonymous_Users ,
                    spIs_Available_For_Download_For_Anonymous_Users ,
                    spIs_Visible_To_Followers_Users ,
                    spIs_Available_For_Download_For_Followers_Users ,
                    spUpdating_User_Id 
            });

            if (affected_Rows > 0)
            {
                updated_Successfully = true;
            }

            return updated_Successfully;
        }

        internal List<Credit_Cards_Statement> Get_All_By_User_Id(
            int p_User_Id_To_Return_Credit_Cards_Statement, 
            int p_Authenticated_User_ID)
        {
            return this.Get_Search(p_User_Id_To_Return_Credit_Cards_Statement, null, p_Authenticated_User_ID);
        }

        private Credit_Cards_Statement Create_Credit_Card_Statement_Details_From_Data_Row(DataRow dbRow)
        {
            Credit_Cards_Statement Credit_Card_Statement_To_Return = new Credit_Cards_Statement();

            Credit_Card_Statement_To_Return.Credit_Card_Statement_Id = Convert.ToInt32(dbRow["Bank_Account_Credit_Card_Statement_Id"]);
            Credit_Card_Statement_To_Return.Bank_Account_Id = Convert.ToInt32(dbRow["Bank_Account_Id"]);

            if (dbRow.Table.Columns.IndexOf("Back_Account_Owner_User_Id") > -1)
            {
                Credit_Card_Statement_To_Return.Bank_Account_Owner_User_Id = Convert.ToInt32(dbRow["Bank_Account_Owner_User_Id"]);
            }

            if (dbRow.Table.Columns.IndexOf("Bank_Account_Name") > -1)
            {
                Credit_Card_Statement_To_Return.Bank_Account_Name = dbRow["Bank_Account_Name"].ToString();
            }

            Credit_Card_Statement_To_Return.Credit_Card_Id = Convert.ToInt32(dbRow["Credit_Card_Id"]);

            Credit_Card_Statement_To_Return.Statement_Date = Convert.ToDateTime(dbRow["Statement_Date"]);
            Credit_Card_Statement_To_Return.Total_Amount = Convert.ToDecimal(dbRow["Total_Amount"]);
            Credit_Card_Statement_To_Return.Currency_Id = Convert.ToByte(dbRow["Currency_Id"]);

            Credit_Card_Statement_To_Return.Original_File_Name = dbRow["Original_File_Name"].ToString();
            Credit_Card_Statement_To_Return.Azure_Block_Blob_Reference = dbRow["Azure_Block_Blob_Reference"].ToString();

            if (dbRow["Bank_Account_Transaction_Id_Connection"] != DBNull.Value)
            {
                Credit_Card_Statement_To_Return.Bank_Account_Transaction_Id_Connection
                    = Convert.ToInt64(dbRow["Bank_Account_Transaction_Id_Connection"]);
            }

            if (dbRow.Table.Columns.IndexOf("Record_Creation_DateTime_UTC") >-1)
            { 
                Credit_Card_Statement_To_Return.Record_Created_By_User_Id = Convert.ToInt32(dbRow["Record_Created_By_User_Id"]);
                Credit_Card_Statement_To_Return.Record_Created_By_User_Details = new Users();
                Credit_Card_Statement_To_Return.Record_Created_By_User_Details.User_Id = Credit_Card_Statement_To_Return.Record_Created_By_User_Id;
                if (dbRow.Table.Columns.IndexOf("Created_By_First_Name") > -1)
                {
                    Credit_Card_Statement_To_Return.Record_Created_By_User_Details.First_Name = dbRow["Created_By_First_Name"].ToString();
                    Credit_Card_Statement_To_Return.Record_Created_By_User_Details.Last_Name = dbRow["Created_By_Last_Name"].ToString();
                }
                Credit_Card_Statement_To_Return.Record_Creation_DateTime_UTC = (DateTime)dbRow["Record_Creation_DateTime_UTC"];

                Credit_Card_Statement_To_Return.Record_Last_Updated_By_User_Id = Convert.ToInt32(dbRow["Record_Last_Updated_By_User_Id"]);
                Credit_Card_Statement_To_Return.Record_Last_Updated_By_User_Details = new Users();
                Credit_Card_Statement_To_Return.Record_Last_Updated_By_User_Details.User_Id = Credit_Card_Statement_To_Return.Record_Last_Updated_By_User_Id;
                if (dbRow.Table.Columns.IndexOf("Last_Updated_By_First_Name") > -1)
                {
                    Credit_Card_Statement_To_Return.Record_Last_Updated_By_User_Details.First_Name = dbRow["Last_Updated_By_First_Name"].ToString();
                    Credit_Card_Statement_To_Return.Record_Last_Updated_By_User_Details.Last_Name = dbRow["Last_Updated_By_Last_Name"].ToString();
                }
                Credit_Card_Statement_To_Return.Record_Last_Updated_DateTime_UTC = (DateTime)dbRow["Record_Last_Updated_DateTime_UTC"];
            }

            Credit_Card_Statement_To_Return.Is_Visible_To_Anonymous_Users = (bool)dbRow["Is_Visible_To_Anonymous_Users"];
            Credit_Card_Statement_To_Return.Is_Available_For_Download_For_Anonymous_Users = (bool)dbRow["Is_Available_For_Download_For_Anonymous_Users"];
            Credit_Card_Statement_To_Return.Is_Visible_To_Followers_Users = (bool)dbRow["Is_Visible_To_Followers_Users"];
            Credit_Card_Statement_To_Return.Is_Available_For_Download_For_Followers_Users = (bool)dbRow["Is_Available_For_Download_For_Followers_Users"];

            Credit_Card_Statement_To_Return.Is_Deleted = (bool)dbRow["Is_Deleted"];

            return Credit_Card_Statement_To_Return;
        }
    }
}

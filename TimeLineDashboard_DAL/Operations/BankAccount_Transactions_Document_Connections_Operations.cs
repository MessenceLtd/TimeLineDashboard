using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TimeLineDashboard.Shared.Models;
using TimeLineDashboard.Shared.Responses;

namespace TimeLineDashboard.DAL.Operations
{
    internal class BankAccount_Transactions_Document_Connections_Operations
    {
        #region Singleton
        private static readonly BankAccount_Transactions_Document_Connections_Operations instance = new BankAccount_Transactions_Document_Connections_Operations();
        // Explicit static constructor to tell C# compiler  
        // not to mark type as beforefieldinit  
        static BankAccount_Transactions_Document_Connections_Operations()
        {
        }
        private BankAccount_Transactions_Document_Connections_Operations()
        {
        }
        public static BankAccount_Transactions_Document_Connections_Operations Instance
        {
            get
            {
                return instance;
            }
        }
        #endregion

        internal List<Bank_Account_Transaction_Document_Connection> Get_Documents_Connections(
            long p_Bank_Account_Transaction_Id,
            Transaction_Type p_Transaction_Type,
            int p_Searching_User_Id )
        {
            List<Bank_Account_Transaction_Document_Connection> transaction_Documents_Connections_To_Return = new List<Bank_Account_Transaction_Document_Connection>();

            SqlParameter spBank_Account_Transaction_Id = new SqlParameter("@p_Bank_Account_Transaction_Id", SqlDbType.BigInt);
            SqlParameter spTransaction_Type = new SqlParameter("@p_Transaction_Type", SqlDbType.TinyInt);
            SqlParameter spSearching_User_Id = new SqlParameter("@p_Searching_User_Id", SqlDbType.Int);

            spBank_Account_Transaction_Id.Value = p_Bank_Account_Transaction_Id;
            spTransaction_Type.Value = p_Transaction_Type;
            spSearching_User_Id.Value = p_Searching_User_Id;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Bank_Accounts_Transactions_Document_Connections",
                new List<SqlParameter>() { 
                    spBank_Account_Transaction_Id,
                    spTransaction_Type,
                    spSearching_User_Id });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                transaction_Documents_Connections_To_Return = new List<Bank_Account_Transaction_Document_Connection>(dataSet.Tables[0].Rows.Count);

                for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                {
                    transaction_Documents_Connections_To_Return.Add(Create_Transaction_Document_Connection_Details_From_Data_Row(dataSet.Tables[0].Rows[i]));
                }
            }

            return transaction_Documents_Connections_To_Return;
        }

        internal List<Bank_Account_Transaction_Document_Connection_Suggestion> Get_Document_Connection_Suggestions(
            long p_Bank_Account_Transaction_Id,
            Transaction_Type p_Transaction_Type,
            int p_Searching_User_Id)
        {
            List<Bank_Account_Transaction_Document_Connection_Suggestion> transaction_Documents_Suggestions_To_Return 
                = new List<Bank_Account_Transaction_Document_Connection_Suggestion>();

            SqlParameter spBank_Account_Transaction_Id = new SqlParameter("@p_Bank_Account_Transaction_Id", SqlDbType.BigInt);
            SqlParameter spTransaction_Type = new SqlParameter("@p_Transaction_Type", SqlDbType.TinyInt);
            SqlParameter spSearching_User_Id = new SqlParameter("@p_Searching_User_Id", SqlDbType.Int);

            spBank_Account_Transaction_Id.Value = p_Bank_Account_Transaction_Id;
            spTransaction_Type.Value = p_Transaction_Type;
            spSearching_User_Id.Value = p_Searching_User_Id;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString(
                "p_TLBoard_Get_Bank_Accounts_Transactions_Document_Connection_Suggestions",
                    new List<SqlParameter>() { 
                        spBank_Account_Transaction_Id,
                        spTransaction_Type,
                        spSearching_User_Id });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                transaction_Documents_Suggestions_To_Return = new List<Bank_Account_Transaction_Document_Connection_Suggestion>(dataSet.Tables[0].Rows.Count);

                for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                {
                    transaction_Documents_Suggestions_To_Return.Add(Create_Transaction_Document_Suggestion_Details_From_Data_Row(dataSet.Tables[0].Rows[i]));
                }
            }

            return transaction_Documents_Suggestions_To_Return;
        }

        internal List<Bank_Account_Transaction_Document_Connection_Suggestion> Search_For_Documents_To_Connect(
            long        p_Bank_Account_Transaction_Id               , 
            Transaction_Type p_Transaction_Type                     ,
            DateTime?   p_Filter_By_From_Date                       ,
            DateTime?   p_Filter_By_To_Date                         , 
            byte?       p_Filter_By_Type                            ,
            short?      p_Filter_By_Country_Id                      ,
            string      p_Filter_By_City_Or_Address_Or_Zipcode      ,
            string      p_Filter_By_Company_Name_Or_People_Name     ,
            int         p_Searching_User_Id                         )
        {
            List<Bank_Account_Transaction_Document_Connection_Suggestion> transaction_Documents_Suggestions_To_Return
                = new List<Bank_Account_Transaction_Document_Connection_Suggestion>();

            SqlParameter spBank_Account_Transaction_Id = new SqlParameter("@p_Bank_Account_Transaction_Id", SqlDbType.BigInt);
            SqlParameter spTransaction_Type = new SqlParameter("@p_Transaction_Type", SqlDbType.TinyInt);
            SqlParameter spFilter_By_From_Date = new SqlParameter("@p_Filter_By_From_Date", SqlDbType.SmallDateTime);
            SqlParameter spFilter_By_To_Date = new SqlParameter("@p_Filter_By_To_Date", SqlDbType.SmallDateTime);
            SqlParameter spFilter_By_Type = new SqlParameter("@p_Filter_By_Type", SqlDbType.TinyInt);
            SqlParameter spFilter_By_Country_Id = new SqlParameter("@p_Filter_By_Country_Id", SqlDbType.SmallInt);
            SqlParameter spFilter_By_City_Or_Address_Or_Zipcode = new SqlParameter("@p_Filter_By_City_Or_Address_Or_Zipcode", SqlDbType.NVarChar, 100);
            SqlParameter spFilter_By_Company_Name_Or_People_Name = new SqlParameter("@p_Filter_By_Company_Name_Or_People_Name", SqlDbType.NVarChar, 100);
            SqlParameter spSearching_User_Id = new SqlParameter("@p_Searching_User_Id", SqlDbType.Int);

            spBank_Account_Transaction_Id.Value = p_Bank_Account_Transaction_Id;
            spTransaction_Type.Value = p_Transaction_Type;

            if (p_Filter_By_From_Date.HasValue)
                spFilter_By_From_Date.Value = p_Filter_By_From_Date.Value;
            else
                spFilter_By_From_Date.Value = DBNull.Value;

            if (p_Filter_By_To_Date.HasValue)
                spFilter_By_To_Date.Value = p_Filter_By_To_Date.Value;
            else
                spFilter_By_To_Date.Value = DBNull.Value;

            if (p_Filter_By_Type.HasValue)
                spFilter_By_Type.Value = p_Filter_By_Type.Value;
            else
                spFilter_By_Type.Value = DBNull.Value;

            if (p_Filter_By_Country_Id.HasValue)
                spFilter_By_Country_Id.Value = p_Filter_By_Country_Id.Value;
            else
                spFilter_By_Country_Id.Value = DBNull.Value;

            if ( !string.IsNullOrEmpty(p_Filter_By_City_Or_Address_Or_Zipcode))
                spFilter_By_City_Or_Address_Or_Zipcode.Value = p_Filter_By_City_Or_Address_Or_Zipcode;
            else
                spFilter_By_City_Or_Address_Or_Zipcode.Value = DBNull.Value;

            if (!string.IsNullOrEmpty(p_Filter_By_Company_Name_Or_People_Name))
                spFilter_By_Company_Name_Or_People_Name.Value = p_Filter_By_Company_Name_Or_People_Name;
            else
                spFilter_By_Company_Name_Or_People_Name.Value = DBNull.Value;

            spSearching_User_Id.Value = p_Searching_User_Id;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Bank_Accounts_Transactions_Document_Connections_Search_Results",
                new List<SqlParameter>() {
                   spBank_Account_Transaction_Id                ,
                   spTransaction_Type                           ,
                   spFilter_By_From_Date                        , 
                   spFilter_By_To_Date                          , 
                   spFilter_By_Type                             ,
                   spFilter_By_Country_Id                       ,
                   spFilter_By_City_Or_Address_Or_Zipcode       , 
                   spFilter_By_Company_Name_Or_People_Name      ,  
                   spSearching_User_Id
                });

            if (dataSet != null && dataSet.Tables.Count > 0 && dataSet.Tables[0].Rows.Count > 0)
            {
                transaction_Documents_Suggestions_To_Return = new List<Bank_Account_Transaction_Document_Connection_Suggestion>(dataSet.Tables[0].Rows.Count);

                for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                {
                    transaction_Documents_Suggestions_To_Return.Add(Create_Transaction_Document_Suggestion_Details_From_Data_Row(dataSet.Tables[0].Rows[i]));
                }
            }

            return transaction_Documents_Suggestions_To_Return;
        }

        internal long Insert_Document_Connection(
            long p_Bank_Account_Transaction_Id      ,
            byte p_Connection_Type                  ,
            int  p_Document_Record_Id               ,
            bool p_Is_Visible_To_Anonymous_Users    ,
            bool p_Is_Available_For_Download_For_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users    ,
            bool p_Is_Available_For_Download_For_Followers_Users,
            int  p_Creating_User_Id                  )
        {
            long new_Registered_Document_Connection_ID_To_Return = 0;

            SqlParameter spBank_Account_Transaction_Id      = new SqlParameter("@p_Bank_Account_Transaction_Id", SqlDbType.BigInt);
            SqlParameter spConnection_Type                  = new SqlParameter("@p_Connection_Type", SqlDbType.TinyInt);
            SqlParameter spDocument_Record_Id               = new SqlParameter("@p_Document_Record_Id", SqlDbType.Int);
            SqlParameter spIs_Visible_To_Anonymous_Users    = new SqlParameter("@p_Is_Visible_To_Anonymous_Users", SqlDbType.Bit);
            SqlParameter spIs_Available_For_Download_For_Anonymous_Users = new SqlParameter("@p_Is_Available_For_Download_For_Anonymous_Users", SqlDbType.Bit);
            SqlParameter spIs_Visible_To_Followers_Users    = new SqlParameter("@p_Is_Visible_To_Followers_Users", SqlDbType.Bit);
            SqlParameter spIs_Available_For_Download_For_Followers_Users = new SqlParameter("@p_Is_Available_For_Download_For_Followers_Users", SqlDbType.Bit);
            SqlParameter spCreating_User_Id                 = new SqlParameter("@p_Creating_User_Id", SqlDbType.Int);

            spBank_Account_Transaction_Id.Value     = p_Bank_Account_Transaction_Id;
            spConnection_Type.Value                 = p_Connection_Type;
            spDocument_Record_Id.Value              = p_Document_Record_Id;
            spIs_Visible_To_Anonymous_Users.Value   = p_Is_Visible_To_Anonymous_Users;
            spIs_Available_For_Download_For_Anonymous_Users.Value = p_Is_Available_For_Download_For_Anonymous_Users;
            spIs_Visible_To_Followers_Users.Value   = p_Is_Visible_To_Followers_Users;
            spIs_Available_For_Download_For_Followers_Users.Value = p_Is_Available_For_Download_For_Followers_Users;
            spCreating_User_Id.Value                = p_Creating_User_Id;

            object new_Document_Connection_ID = SQLHelper.ExecuteStoredProcedure_ReturnDataObjectResult(
                "p_TLBoard_Insert_Bank_Accounts_Transactions_Document_Connection",
                new List<SqlParameter>() {
                    spBank_Account_Transaction_Id,
                    spConnection_Type,
                    spDocument_Record_Id,
                    spIs_Visible_To_Anonymous_Users,
                    spIs_Available_For_Download_For_Anonymous_Users,
                    spIs_Visible_To_Followers_Users,
                    spIs_Available_For_Download_For_Followers_Users,
                    spCreating_User_Id
                });

            if (new_Document_Connection_ID != null)
            {
                new_Registered_Document_Connection_ID_To_Return = Convert.ToInt64(new_Document_Connection_ID);
            }

            return new_Registered_Document_Connection_ID_To_Return;
        }

        internal bool Update_Document_Connection(
            long p_Document_Connection_Id,
            long p_Bank_Account_Transaction_Id,
            bool p_Is_Visible_To_Anonymous_Users,
            bool p_Is_Available_For_Download_For_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users,
            bool p_Is_Available_For_Download_For_Followers_Users,
            int p_Updating_User_Id
            )
        {
            bool updated_Successfully = false;

            SqlParameter spDocument_Connection_Id           = new SqlParameter("@p_Document_Connection_Id", SqlDbType.BigInt);
            SqlParameter spBank_Account_Transaction_Id      = new SqlParameter("@p_Bank_Account_Transaction_Id", SqlDbType.BigInt);
            SqlParameter spIs_Visible_To_Anonymous_Users    = new SqlParameter("@p_Is_Visible_To_Anonymous_Users", SqlDbType.Bit);
            SqlParameter spIs_Available_For_Download_For_Anonymous_Users = new SqlParameter("@p_Is_Available_For_Download_For_Anonymous_Users", SqlDbType.Bit);
            SqlParameter spIs_Visible_To_Followers_Users    = new SqlParameter("@p_Is_Visible_To_Followers_Users", SqlDbType.Bit);
            SqlParameter spIs_Available_For_Download_For_Followers_Users = new SqlParameter("@p_Is_Available_For_Download_For_Followers_Users", SqlDbType.Bit);
            SqlParameter spUpdating_User_Id                 = new SqlParameter("@p_Updating_User_Id", SqlDbType.Int);

            spDocument_Connection_Id.Value          = p_Document_Connection_Id;
            spBank_Account_Transaction_Id.Value     = p_Bank_Account_Transaction_Id;
            spIs_Visible_To_Anonymous_Users.Value   = p_Is_Visible_To_Anonymous_Users;
            spIs_Available_For_Download_For_Anonymous_Users.Value = p_Is_Available_For_Download_For_Anonymous_Users;
            spIs_Visible_To_Followers_Users.Value   = p_Is_Visible_To_Followers_Users;
            spIs_Available_For_Download_For_Followers_Users.Value = p_Is_Available_For_Download_For_Followers_Users;
            spUpdating_User_Id.Value                = p_Updating_User_Id;

            int affected_Rows = SQLHelper.ExecuteStoredProcedure_ReturnAffectedRowsNumber_WithDefaultAppConfigConnectionString(
                "p_TLBoard_Update_Bank_Accounts_Transactions_Document_Connection",
                    new List<SqlParameter>() {
                        spDocument_Connection_Id            ,
                        spBank_Account_Transaction_Id       ,
                        spIs_Visible_To_Anonymous_Users     ,
                        spIs_Available_For_Download_For_Anonymous_Users,
                        spIs_Visible_To_Followers_Users     ,
                        spIs_Available_For_Download_For_Followers_Users,
                        spUpdating_User_Id
                    });

            if (affected_Rows > 0)
            {
                updated_Successfully = true;
            }

            return updated_Successfully;
        }

        internal bool Delete_Document_Connection(
            long p_Document_Connection_Id,
            long p_Bank_Account_Transaction_Id,
            int p_Deleting_User_Id
            )
        {
            bool updated_Successfully = false;

            SqlParameter spDocument_Connection_Id = new SqlParameter("@p_Document_Connection_Id", SqlDbType.BigInt);
            SqlParameter spBank_Account_Transaction_Id = new SqlParameter("@p_Bank_Account_Transaction_Id", SqlDbType.BigInt);
            SqlParameter spDeleting_User_Id = new SqlParameter("@p_Deleting_User_Id", SqlDbType.Int);

            spDocument_Connection_Id.Value = p_Document_Connection_Id;
            spBank_Account_Transaction_Id.Value = p_Bank_Account_Transaction_Id;
            spDeleting_User_Id.Value = p_Deleting_User_Id;

            int affected_Rows = SQLHelper.ExecuteStoredProcedure_ReturnAffectedRowsNumber_WithDefaultAppConfigConnectionString(
                "p_TLBoard_Delete_Bank_Accounts_Transactions_Document_Connection",
                    new List<SqlParameter>() {
                        spDocument_Connection_Id,
                        spBank_Account_Transaction_Id,
                        spDeleting_User_Id
                    });

            if (affected_Rows > 0)
            {
                updated_Successfully = true;
            }

            return updated_Successfully;
        }

        private Bank_Account_Transaction_Document_Connection Create_Transaction_Document_Connection_Details_From_Data_Row(DataRow dbRow)
        {
            Bank_Account_Transaction_Document_Connection transaction_Document_Connection_To_Return = new Bank_Account_Transaction_Document_Connection();
            var suggestion_Connection = Create_Transaction_Document_Suggestion_Details_From_Data_Row(dbRow);

            if (dbRow.Table.Columns.IndexOf("Document_Connection_Id") > -1)
            {
                transaction_Document_Connection_To_Return.Document_Connection_Id = Convert.ToInt64(dbRow["Document_Connection_Id"]);
            }

            transaction_Document_Connection_To_Return.Connection_Type = suggestion_Connection.Connection_Type;
            transaction_Document_Connection_To_Return.Document_Record_Id = suggestion_Connection.Document_Record_Id;
            transaction_Document_Connection_To_Return.Title = suggestion_Connection.Title;
            transaction_Document_Connection_To_Return.Document_Date = suggestion_Connection.Document_Date;
            transaction_Document_Connection_To_Return.Description = suggestion_Connection.Description;
            transaction_Document_Connection_To_Return.Country_Name = suggestion_Connection.Country_Name;
            transaction_Document_Connection_To_Return.City = suggestion_Connection.City;
            transaction_Document_Connection_To_Return.Email_Address = suggestion_Connection.Email_Address;
            transaction_Document_Connection_To_Return.Creation_DateTime = suggestion_Connection.Creation_DateTime;

            transaction_Document_Connection_To_Return.Is_Visible_To_Anonymous_Users = suggestion_Connection.Is_Visible_To_Anonymous_Users;
            transaction_Document_Connection_To_Return.Is_Available_For_Download_For_Anonymous_Users = suggestion_Connection.Is_Available_For_Download_For_Anonymous_Users;
            transaction_Document_Connection_To_Return.Is_Visible_To_Followers_Users = suggestion_Connection.Is_Visible_To_Followers_Users;
            transaction_Document_Connection_To_Return.Is_Available_For_Download_For_Followers_Users = suggestion_Connection.Is_Available_For_Download_For_Followers_Users;
            
            transaction_Document_Connection_To_Return.Record_Created_By_User_Id = suggestion_Connection.Record_Created_By_User_Id;
            transaction_Document_Connection_To_Return.Record_Creation_DateTime_UTC = suggestion_Connection.Record_Creation_DateTime_UTC;
            transaction_Document_Connection_To_Return.Record_Creation_By_User_Fullname = suggestion_Connection.Record_Creation_By_User_Fullname;
            transaction_Document_Connection_To_Return.Record_Last_Updated_By_User_Id = suggestion_Connection.Record_Last_Updated_By_User_Id;
            transaction_Document_Connection_To_Return.Record_Last_Updated_DateTime_UTC = suggestion_Connection.Record_Last_Updated_DateTime_UTC;
            transaction_Document_Connection_To_Return.Record_Last_Updated_By_User_Fullname = suggestion_Connection.Record_Last_Updated_By_User_Fullname;

            return transaction_Document_Connection_To_Return;
        }

        private Bank_Account_Transaction_Document_Connection_Suggestion Create_Transaction_Document_Suggestion_Details_From_Data_Row(DataRow dbRow)
        {
            var document_suggestion_To_Return = new Bank_Account_Transaction_Document_Connection_Suggestion();

            document_suggestion_To_Return.Connection_Type = Convert.ToByte(dbRow["Connection_Type"]);
            document_suggestion_To_Return.Document_Record_Id = Convert.ToInt32(dbRow["Document_Record_Id"]);
            document_suggestion_To_Return.Title = dbRow["Title"].ToString();
            document_suggestion_To_Return.Document_Date = (DateTime)dbRow["Document_Date"];
            document_suggestion_To_Return.Description = dbRow["Description"].ToString();
            document_suggestion_To_Return.Country_Name = dbRow["Country_Name"].ToString();
            document_suggestion_To_Return.City = dbRow["City"].ToString();
            document_suggestion_To_Return.Email_Address = dbRow["Email_Address"].ToString();
            document_suggestion_To_Return.Creation_DateTime = (DateTime)dbRow["Creation_DateTime"];

            document_suggestion_To_Return.Is_Visible_To_Anonymous_Users = (bool)dbRow["Is_Visible_To_Anonymous_Users"];
            document_suggestion_To_Return.Is_Available_For_Download_For_Anonymous_Users = (bool)dbRow["Is_Available_For_Download_For_Anonymous_Users"];
            document_suggestion_To_Return.Is_Visible_To_Followers_Users = (bool)dbRow["Is_Visible_To_Followers_Users"];
            document_suggestion_To_Return.Is_Available_For_Download_For_Followers_Users = (bool)dbRow["Is_Available_For_Download_For_Followers_Users"];

            document_suggestion_To_Return.Record_Created_By_User_Id = Convert.ToInt32(dbRow["Record_Created_By_User_Id"]);
            document_suggestion_To_Return.Record_Creation_DateTime_UTC = (DateTime)dbRow["Record_Creation_DateTime_UTC"];
            document_suggestion_To_Return.Record_Creation_By_User_Fullname = dbRow["Record_Creation_By_User_Fullname"].ToString();
            document_suggestion_To_Return.Record_Last_Updated_By_User_Id = Convert.ToInt32(dbRow["Record_Last_Updated_By_User_Id"]);
            document_suggestion_To_Return.Record_Last_Updated_DateTime_UTC = (DateTime)dbRow["Record_Last_Updated_DateTime_UTC"];
            document_suggestion_To_Return.Record_Last_Updated_By_User_Fullname = dbRow["Record_Last_Updated_By_User_Fullname"].ToString();

            if (dbRow.Table.Columns.IndexOf("Is_Deleted") > -1)
            {
                document_suggestion_To_Return.Is_Deleted = (bool)dbRow["Is_Deleted"];

                document_suggestion_To_Return.Record_Deleted_By_User_Id = Convert.ToInt32(dbRow["Record_Deleted_By_User_Id"]);
                document_suggestion_To_Return.Record_Deleted_DateTime_UTC = (DateTime)dbRow["Record_Deleted_DateTime_UTC"];
            }

            return document_suggestion_To_Return;
        }
    }
}
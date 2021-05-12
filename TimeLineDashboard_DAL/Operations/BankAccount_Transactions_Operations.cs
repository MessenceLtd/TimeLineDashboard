using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TimeLineDashboard.Shared.Models;
using TimeLineDashboard.Shared.Responses;

namespace TimeLineDashboard.DAL.Operations
{
    internal class BankAccount_Transactions
    {
        #region Singleton
        private static readonly BankAccount_Transactions instance = new BankAccount_Transactions();
        // Explicit static constructor to tell C# compiler  
        // not to mark type as beforefieldinit  
        static BankAccount_Transactions()
        {
        }
        private BankAccount_Transactions()
        {
        }
        public static BankAccount_Transactions Instance
        {
            get
            {
                return instance;
            }
        }
        #endregion

        internal Bank_Account_Transactions Get_Bank_Account_Transaction_Details_By_Transaction_Id (
            int p_Bank_Account_Transaction_Id, 
            int p_User_Id_Bank_Account_Transaction_Owner, 
            int p_User_Id_Searching_For_Bank_Account_Transaction_Details )
        {
            Bank_Account_Transactions Bank_Account_Transaction_To_Return = new Bank_Account_Transactions();

            SqlParameter spBank_Account_Transaction_Record_Id = new SqlParameter("@Bank_Account_Transaction_Record_Id", SqlDbType.Int);
            SqlParameter spUser_Id_Bank_Account_Transaction_Owner = new SqlParameter("@User_Id_Bank_Account_Transaction_Owner", SqlDbType.Int);
            SqlParameter spUser_Id_Searching_For_Bank_Account_Transaction_Details = new SqlParameter("@User_Id_Searching_For_Bank_Account_Transaction_Details", SqlDbType.Int);

            spBank_Account_Transaction_Record_Id.Value = p_Bank_Account_Transaction_Id;
            spUser_Id_Bank_Account_Transaction_Owner.Value = p_User_Id_Bank_Account_Transaction_Owner;
            spUser_Id_Searching_For_Bank_Account_Transaction_Details.Value = p_User_Id_Searching_For_Bank_Account_Transaction_Details;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Bank_Account_Transaction_Details",
                new List<SqlParameter>() { spBank_Account_Transaction_Record_Id, spUser_Id_Bank_Account_Transaction_Owner, spUser_Id_Searching_For_Bank_Account_Transaction_Details });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                Bank_Account_Transaction_To_Return = Create_Bank_Account_Transaction_Details_From_Data_Row(dataSet.Tables[0].Rows[0]); 
            }

            return Bank_Account_Transaction_To_Return;
        }

        internal Bank_Account_Transactions Insert_New_Bank_Account_Transaction_Details(
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
            int p_Creating_User_Id
            )
        {
            Bank_Account_Transactions new_Registered_Bank_Account_Transaction_To_Return = null;

            SqlParameter spBank_Account_Id = new SqlParameter("@Bank_Account_Id", SqlDbType.Int);
            SqlParameter spTransaction_Account_Balance = new SqlParameter("@Transaction_Account_Balance", SqlDbType.Decimal);
            SqlParameter spTransaction_Actual_DateTime = new SqlParameter("@Transaction_Actual_DateTime", SqlDbType.DateTime);
            SqlParameter spPositive_Amount_Entered = new SqlParameter("@Positive_Amount_Entered", SqlDbType.Decimal);
            SqlParameter spNegative_Amount_Paid = new SqlParameter("@Negative_Amount_Paid", SqlDbType.Decimal);
            SqlParameter spTransaction_Value_DateTime = new SqlParameter("@Transaction_Value_DateTime", SqlDbType.DateTime);
            SqlParameter spReference_Number = new SqlParameter("@Reference_Number", SqlDbType.NVarChar , 40);
            SqlParameter spTransaction_Bank_Description = new SqlParameter("@Transaction_Bank_Description", SqlDbType.NVarChar, 40);
            SqlParameter spTransaction_Bank_Inner_Reference_Code = new SqlParameter("@Transaction_Bank_Inner_Reference_Code", SqlDbType.NVarChar, 15);
            SqlParameter spIs_Visible_To_Anonymous_Users = new SqlParameter("@Is_Visible_To_Anonymous_Users", SqlDbType.Bit);
            SqlParameter spIs_Visible_To_Followers_Users = new SqlParameter("@Is_Visible_To_Followers_Users", SqlDbType.Bit);
            SqlParameter spCreating_User_Id = new SqlParameter("@Creating_User_Id", SqlDbType.Int);

            spBank_Account_Id.Value = p_Bank_Account_Id;
            spTransaction_Account_Balance.Value = p_Transaction_Account_Balance;
            spTransaction_Actual_DateTime.Value = p_Transaction_Actual_DateTime;
            spPositive_Amount_Entered.Value = p_Positive_Amount_Entered;
            spNegative_Amount_Paid.Value = p_Negative_Amount_Paid;
            if (p_Transaction_Value_DateTime.HasValue)
                spTransaction_Value_DateTime.Value = p_Transaction_Value_DateTime.Value;
            else
                spTransaction_Value_DateTime.Value = DBNull.Value;

            spReference_Number.Value = p_Reference_Number;
            spTransaction_Bank_Description.Value = p_Transaction_Bank_Description;
            spTransaction_Bank_Inner_Reference_Code.Value = p_Transaction_Bank_Inner_Reference_Code;
            spIs_Visible_To_Anonymous_Users.Value = p_Is_Visible_To_Anonymous_Users;
            spIs_Visible_To_Followers_Users.Value = p_Is_Visible_To_Followers_Users;
            spCreating_User_Id.Value = p_Creating_User_Id;
            
            object new_Bank_Account_Transaction_Id = SQLHelper.ExecuteStoredProcedure_ReturnDataObjectResult(
                "p_TLBoard_Insert_Bank_Account_Transaction_Details",
                new List<SqlParameter>() {
                    spBank_Account_Id, 
                    spTransaction_Account_Balance,
                    spTransaction_Actual_DateTime, 
                    spPositive_Amount_Entered,
                    spNegative_Amount_Paid,
                    spTransaction_Value_DateTime,
                    spReference_Number,
                    spTransaction_Bank_Description,
                    spTransaction_Bank_Inner_Reference_Code,
                    spIs_Visible_To_Anonymous_Users, 
                    spIs_Visible_To_Followers_Users,
                    spCreating_User_Id
                });

            if (new_Bank_Account_Transaction_Id != null)
            {
                int Bank_Account_Transaction_Id_Registered = Convert.ToInt32(new_Bank_Account_Transaction_Id);
                if (Bank_Account_Transaction_Id_Registered > 0)
                {
                    new_Registered_Bank_Account_Transaction_To_Return = Get_Bank_Account_Transaction_Details_By_Transaction_Id(
                        Bank_Account_Transaction_Id_Registered, 
                        p_Creating_User_Id,
                        p_Creating_User_Id);
                }
            }

            return new_Registered_Bank_Account_Transaction_To_Return;
        }

        internal bool Update_Bank_Account_Transaction_Details(
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
            int p_Updating_User_Id
            )
        {
            bool updated_Successfully = false;

            SqlParameter spBank_Account_Transaction_Id = new SqlParameter("@Bank_Account_Transaction_Id", SqlDbType.Int);
            SqlParameter spTransaction_Account_Balance = new SqlParameter("@Transaction_Account_Balance", SqlDbType.Decimal);
            SqlParameter spTransaction_Actual_DateTime = new SqlParameter("@Transaction_Actual_DateTime", SqlDbType.DateTime);
            SqlParameter spPositive_Amount_Entered = new SqlParameter("@Positive_Amount_Entered", SqlDbType.Decimal);
            SqlParameter spNegative_Amount_Paid = new SqlParameter("@Negative_Amount_Paid", SqlDbType.Decimal);
            SqlParameter spTransaction_Value_DateTime = new SqlParameter("@Transaction_Value_DateTime", SqlDbType.DateTime);
            SqlParameter spReference_Number = new SqlParameter("@Reference_Number", SqlDbType.NVarChar, 40);
            SqlParameter spTransaction_Bank_Description = new SqlParameter("@Transaction_Bank_Description", SqlDbType.NVarChar, 40);
            SqlParameter spTransaction_Bank_Inner_Reference_Code = new SqlParameter("@Transaction_Bank_Inner_Reference_Code", SqlDbType.NVarChar, 15);
            SqlParameter spIs_Visible_To_Anonymous_Users = new SqlParameter("@Is_Visible_To_Anonymous_Users", SqlDbType.Bit);
            SqlParameter spIs_Visible_To_Followers_Users = new SqlParameter("@Is_Visible_To_Followers_Users", SqlDbType.Bit);
            SqlParameter spUpdating_User_Id = new SqlParameter("@Updating_User_Id", SqlDbType.Int);

            spBank_Account_Transaction_Id.Value = p_Bank_Account_Transaction_Id;
            spTransaction_Account_Balance.Value = p_Transaction_Account_Balance;
            spTransaction_Actual_DateTime.Value = p_Transaction_Actual_DateTime;
            spPositive_Amount_Entered.Value = p_Positive_Amount_Entered;
            spNegative_Amount_Paid.Value = p_Negative_Amount_Paid;
            if (p_Transaction_Value_DateTime.HasValue)
                spTransaction_Value_DateTime.Value = p_Transaction_Value_DateTime.Value;
            else
                spTransaction_Value_DateTime.Value = DBNull.Value;

            spReference_Number.Value = p_Reference_Number;
            spTransaction_Bank_Description.Value = p_Transaction_Bank_Description;
            spTransaction_Bank_Inner_Reference_Code.Value = p_Transaction_Bank_Inner_Reference_Code;
            spIs_Visible_To_Anonymous_Users.Value = p_Is_Visible_To_Anonymous_Users;
            spIs_Visible_To_Followers_Users.Value = p_Is_Visible_To_Followers_Users;
            spUpdating_User_Id.Value = p_Updating_User_Id;

            int affected_Rows = SQLHelper.ExecuteStoredProcedure_ReturnAffectedRowsNumber_WithDefaultAppConfigConnectionString("p_TLBoard_Update_Bank_Account_Transaction_Details",
                new List<SqlParameter>() {
                    spBank_Account_Transaction_Id,
                    spTransaction_Account_Balance,
                    spTransaction_Actual_DateTime,
                    spPositive_Amount_Entered,
                    spNegative_Amount_Paid, 
                    spTransaction_Value_DateTime,
                    spReference_Number,
                    spTransaction_Bank_Description,
                    spTransaction_Bank_Inner_Reference_Code,
                    spIs_Visible_To_Anonymous_Users,
                    spIs_Visible_To_Followers_Users,
                    spUpdating_User_Id
                });

            if (affected_Rows > 0)
            {
                updated_Successfully = true;
            }

            return updated_Successfully;
        }

        internal bool Update_Bank_Account_Transaction_Details(
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
            int p_Updating_User_Id
            )
        {
            bool updated_Successfully = false;

            SqlParameter spBank_Account_Transaction_Id = new SqlParameter("@Bank_Account_Transaction_Id", SqlDbType.Int);
            SqlParameter spTransaction_Account_Balance = new SqlParameter("@Transaction_Account_Balance", SqlDbType.Decimal);
            SqlParameter spTransaction_Actual_DateTime = new SqlParameter("@Transaction_Actual_DateTime", SqlDbType.DateTime);
            SqlParameter spPositive_Amount_Entered = new SqlParameter("@Positive_Amount_Entered", SqlDbType.Decimal);
            SqlParameter spNegative_Amount_Paid = new SqlParameter("@Negative_Amount_Paid", SqlDbType.Decimal);
            SqlParameter spTransaction_Value_DateTime = new SqlParameter("@Transaction_Value_DateTime", SqlDbType.DateTime);
            SqlParameter spReference_Number = new SqlParameter("@Reference_Number", SqlDbType.NVarChar, 40);
            SqlParameter spTransaction_Bank_Description = new SqlParameter("@Transaction_Bank_Description", SqlDbType.NVarChar, 40);
            SqlParameter spTransaction_Bank_Inner_Reference_Code = new SqlParameter("@Transaction_Bank_Inner_Reference_Code", SqlDbType.NVarChar, 15);

            SqlParameter spUser_Description = new SqlParameter("@User_Description", SqlDbType.NVarChar, 200);
            SqlParameter spUser_Comments = new SqlParameter("@User_Comments", SqlDbType.NVarChar, 200);

            SqlParameter spIs_Visible_To_Anonymous_Users = new SqlParameter("@Is_Visible_To_Anonymous_Users", SqlDbType.Bit);
            SqlParameter spIs_Visible_To_Followers_Users = new SqlParameter("@Is_Visible_To_Followers_Users", SqlDbType.Bit);
            SqlParameter spUpdating_User_Id = new SqlParameter("@Updating_User_Id", SqlDbType.Int);

            spBank_Account_Transaction_Id.Value = p_Bank_Account_Transaction_Id;
            spTransaction_Account_Balance.Value = p_Transaction_Account_Balance;
            spTransaction_Actual_DateTime.Value = p_Transaction_Actual_DateTime;
            spPositive_Amount_Entered.Value = p_Positive_Amount_Entered;
            spNegative_Amount_Paid.Value = p_Negative_Amount_Paid;
            if (p_Transaction_Value_DateTime.HasValue)
                spTransaction_Value_DateTime.Value = p_Transaction_Value_DateTime.Value;
            else
                spTransaction_Value_DateTime.Value = DBNull.Value;

            spReference_Number.Value = p_Reference_Number;
            spTransaction_Bank_Description.Value = p_Transaction_Bank_Description;
            spTransaction_Bank_Inner_Reference_Code.Value = p_Transaction_Bank_Inner_Reference_Code;

            spUser_Description.Value = p_User_Description;
            spUser_Comments.Value = p_User_Comments;

            spIs_Visible_To_Anonymous_Users.Value = p_Is_Visible_To_Anonymous_Users;
            spIs_Visible_To_Followers_Users.Value = p_Is_Visible_To_Followers_Users;
            spUpdating_User_Id.Value = p_Updating_User_Id;

            int affected_Rows = SQLHelper.ExecuteStoredProcedure_ReturnAffectedRowsNumber_WithDefaultAppConfigConnectionString("p_TLBoard_Update_Bank_Account_Transaction_Full_Details",
                new List<SqlParameter>() {
                    spBank_Account_Transaction_Id,
                    spTransaction_Account_Balance,
                    spTransaction_Actual_DateTime,
                    spPositive_Amount_Entered,
                    spNegative_Amount_Paid,
                    spTransaction_Value_DateTime,
                    spReference_Number,
                    spTransaction_Bank_Description,
                    spTransaction_Bank_Inner_Reference_Code,
                    spUser_Description, 
                    spUser_Comments,
                    spIs_Visible_To_Anonymous_Users,
                    spIs_Visible_To_Followers_Users,
                    spUpdating_User_Id
                });

            if (affected_Rows > 0)
            {
                updated_Successfully = true;
            }

            return updated_Successfully;
        }

        internal bool Delete_Bank_Account_Transaction(
            int p_Bank_Account_Id,
            int p_Bank_Account_Transaction_Id,
            int p_Updating_User_Id
            )
        {
            bool updated_Successfully = false;

            SqlParameter spBank_Account_Id = new SqlParameter("@Bank_Account_Id", SqlDbType.Int);
            SqlParameter spBank_Account_Transaction_Id = new SqlParameter("@Bank_Account_Transaction_Id", SqlDbType.Int);
            SqlParameter spUpdating_User_Id = new SqlParameter("@Updating_User_Id", SqlDbType.Int);

            spBank_Account_Id.Value = p_Bank_Account_Id;
            spBank_Account_Transaction_Id.Value = p_Bank_Account_Transaction_Id;
            spUpdating_User_Id.Value = p_Updating_User_Id;

            int affected_Rows = SQLHelper.ExecuteStoredProcedure_ReturnAffectedRowsNumber_WithDefaultAppConfigConnectionString("p_TLBoard_Delete_Bank_Account_Transactions_By_Bank_Account_Id_And_User_Id_And_Transaction_ID",
                new List<SqlParameter>() {
                    spBank_Account_Id, 
                    spBank_Account_Transaction_Id,
                    spUpdating_User_Id
                });

            if (affected_Rows > 0)
            {
                updated_Successfully = true;
            }

            return updated_Successfully;
        }

        internal Bank_Account_Transactions_Response_For_UI Get_Bank_Account_Transactions_By_Bank_Account_Id_And_User_Id(
            int p_Page_Number,
            int p_Rows_Per_Page,
            int p_Bank_Account_Id, 
            int p_User_Id_Bank_Account_Owner,
            int p_User_Id_Searching_For_Bank_Account_Transactions )
        {
            Bank_Account_Transactions_Response_For_UI bank_Account_Transactions_Response = new Bank_Account_Transactions_Response_For_UI();

            List<Bank_Account_Transactions> transactions_To_Return = new List<Bank_Account_Transactions>();

            SqlParameter spPage_Number = new SqlParameter("@Page_Number", SqlDbType.Int);
            SqlParameter spRows_Per_Page = new SqlParameter("@Rows_Per_Page", SqlDbType.Int);
            SqlParameter spBank_Account_Id = new SqlParameter("@Bank_Account_Id", SqlDbType.Int);
            SqlParameter spUser_Id_Bank_Account_Owner = new SqlParameter("@User_Id_Bank_Account_Owner", SqlDbType.Int);
            SqlParameter spUser_Id_Searching_For_Bank_Account_Transactions = new SqlParameter("@User_Id_Searching_For_Bank_Account_Transactions", SqlDbType.Int);
            SqlParameter spTotal_Records = new SqlParameter("@Total_Records", SqlDbType.Int);
            spTotal_Records.Direction = ParameterDirection.Output;

            spPage_Number.Value = p_Page_Number;
            spRows_Per_Page.Value = p_Rows_Per_Page;
            spBank_Account_Id.Value = p_Bank_Account_Id;
            spUser_Id_Bank_Account_Owner.Value = p_User_Id_Bank_Account_Owner;
            spUser_Id_Searching_For_Bank_Account_Transactions.Value = p_User_Id_Searching_For_Bank_Account_Transactions;
            spTotal_Records.Value = 0;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString(
                "p_TLBoard_Get_Bank_Account_Transactions_By_Bank_Account_Id_And_User_Id",
                new List<SqlParameter>() {
                    spPage_Number,
                    spRows_Per_Page, 
                    spBank_Account_Id, 
                    spUser_Id_Bank_Account_Owner, 
                    spUser_Id_Searching_For_Bank_Account_Transactions,
                    spTotal_Records });
            
            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                transactions_To_Return = new List<Bank_Account_Transactions>(dataSet.Tables[0].Rows.Count);

                for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                {
                    transactions_To_Return.Add(Create_Bank_Account_Transaction_Details_From_Data_Row(dataSet.Tables[0].Rows[i]));
                }
            }

            bank_Account_Transactions_Response.Bank_Account_Transactions_From_DB = transactions_To_Return;
            bank_Account_Transactions_Response.Number_Of_Records = transactions_To_Return.Count;
            bank_Account_Transactions_Response.Total_Number_Of_Records = Convert.ToInt32(spTotal_Records.Value);

            return bank_Account_Transactions_Response;
        }

        internal List<Bank_Account_Transactions> Get_Transactions_By_Bank_Account_Id_And_User_Id_And_TransactionsIDs_Array(
            int p_Bank_Account_Id,
            int[] p_Transcations_IDs_Array,
            int p_User_Id_Searching_For_Bank_Account_Transactions)
        {
            List<Bank_Account_Transactions> transactions_To_Return = new List<Bank_Account_Transactions>();

            SqlParameter spBank_Account_Id = new SqlParameter("@Bank_Account_Id", SqlDbType.Int);
            SqlParameter spTranscations_IDs_Array = new SqlParameter("@Transcations_IDs_Array", SqlDbType.VarChar, 1000);
            SqlParameter spUser_Id_Searching_For_Bank_Account_Transactions = new SqlParameter("@User_Id_Searching_For_Bank_Account_Transactions", SqlDbType.Int);

            spBank_Account_Id.Value = p_Bank_Account_Id;
            string p_Transactions_IDs_Seperated_Array = string.Empty;
            for (int i = 0; i < p_Transcations_IDs_Array.Length; i++)
            {
                p_Transactions_IDs_Seperated_Array += p_Transcations_IDs_Array[i] ;
                if ( i <  p_Transcations_IDs_Array.Length -1    )
                {
                    p_Transactions_IDs_Seperated_Array += ",";
                }
            }

            spTranscations_IDs_Array.Value = p_Transactions_IDs_Seperated_Array;
            spUser_Id_Searching_For_Bank_Account_Transactions.Value = p_User_Id_Searching_For_Bank_Account_Transactions;
            
            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString(
                "p_TLBoard_Get_Bank_Account_Transactions_By_Bank_Account_Id_And_User_Id_And_Transactions_IDs",
                new List<SqlParameter>() {
                    spBank_Account_Id,
                    spTranscations_IDs_Array,
                    spUser_Id_Searching_For_Bank_Account_Transactions });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                transactions_To_Return = new List<Bank_Account_Transactions>(dataSet.Tables[0].Rows.Count);

                for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                {
                    transactions_To_Return.Add(Create_Bank_Account_Transaction_Details_From_Data_Row(dataSet.Tables[0].Rows[i]));
                }
            }

            return transactions_To_Return;
        }

        private Bank_Account_Transactions Create_Bank_Account_Transaction_Details_From_Data_Row(DataRow dbRow)
        {
            Bank_Account_Transactions Bank_Account_Transaction_To_Return = new Bank_Account_Transactions();

            Bank_Account_Transaction_To_Return.Bank_Account_Transaction_Id = Convert.ToInt32(dbRow["Bank_Account_Transaction_Id"]);
            Bank_Account_Transaction_To_Return.Bank_Account_Id = Convert.ToInt32(dbRow["Bank_Account_Id"]);
            if (dbRow["Transaction_Account_Balance"] != DBNull.Value)
                Bank_Account_Transaction_To_Return.Transaction_Account_Balance = (decimal)dbRow["Transaction_Account_Balance"];
            else
                Bank_Account_Transaction_To_Return.Transaction_Account_Balance = 0;

            Bank_Account_Transaction_To_Return.Transaction_Actual_DateTime = (DateTime)dbRow["Transaction_Actual_DateTime"];

            if (dbRow["Positive_Amount_Entered"] != DBNull.Value) 
                Bank_Account_Transaction_To_Return.Positive_Amount_Entered = (decimal)dbRow["Positive_Amount_Entered"];

            if (dbRow["Negative_Amount_Paid"] != DBNull.Value)
                Bank_Account_Transaction_To_Return.Negative_Amount_Paid = (decimal)dbRow["Negative_Amount_Paid"];

            if (dbRow["Transaction_Value_DateTime"] != DBNull.Value)
                Bank_Account_Transaction_To_Return.Transaction_Value_DateTime = (DateTime)dbRow["Transaction_Value_DateTime"];

            Bank_Account_Transaction_To_Return.Reference_Number = dbRow["Reference_Number"].ToString();
            Bank_Account_Transaction_To_Return.Transaction_Bank_Description = dbRow["Transaction_Bank_Description"].ToString();
            Bank_Account_Transaction_To_Return.Transaction_Bank_Inner_Reference_Code = dbRow["Transaction_Bank_Inner_Reference_Code"].ToString();

            if (dbRow.Table.Columns.IndexOf("Transaction_User_Description") > -1)
            {
                Bank_Account_Transaction_To_Return.Transaction_User_Description = dbRow["Transaction_User_Description"].ToString();
            }

            if (dbRow.Table.Columns.IndexOf("Transaction_User_Comments") > -1)
            {
                Bank_Account_Transaction_To_Return.Transaction_User_Comments = dbRow["Transaction_User_Comments"].ToString();
            }

            if (dbRow.Table.Columns.IndexOf("Record_Created_By_User_Id") > -1 )
            {
                Bank_Account_Transaction_To_Return.Record_Created_By_User_Id = (int)dbRow["Record_Created_By_User_Id"];
                if (dbRow.Table.Columns.IndexOf("Created_By_First_Name") > -1)
                {
                    Bank_Account_Transaction_To_Return.Record_Created_By_User_Details = new Users();
                    Bank_Account_Transaction_To_Return.Record_Created_By_User_Details.First_Name = dbRow["Created_By_First_Name"].ToString();
                    Bank_Account_Transaction_To_Return.Record_Created_By_User_Details.Last_Name = dbRow["Created_By_Last_Name"].ToString();
                }
                Bank_Account_Transaction_To_Return.Record_Creation_DateTime_UTC = (DateTime)dbRow["Record_Creation_DateTime_UTC"];
                Bank_Account_Transaction_To_Return.Record_Last_Updated_By_User_Id = (int)dbRow["Record_Last_Updated_By_User_Id"];
                if (dbRow.Table.Columns.IndexOf("Last_Updated_By_First_Name") > -1)
                {
                    Bank_Account_Transaction_To_Return.Record_Last_Updated_By_User_Details = new Users();
                    Bank_Account_Transaction_To_Return.Record_Last_Updated_By_User_Details.First_Name = dbRow["Last_Updated_By_First_Name"].ToString();
                    Bank_Account_Transaction_To_Return.Record_Last_Updated_By_User_Details.Last_Name = dbRow["Last_Updated_By_Last_Name"].ToString();
                }
                Bank_Account_Transaction_To_Return.Record_Last_Updated_DateTime_UTC = (DateTime)dbRow["Record_Last_Updated_DateTime_UTC"];
            }

            Bank_Account_Transaction_To_Return.Is_Visible_To_Anonymous_Users = (bool)dbRow["Is_Visible_To_Anonymous_Users"];
            Bank_Account_Transaction_To_Return.Is_Visible_To_Followers_Users = (bool)dbRow["Is_Visible_To_Followers_Users"];

            return Bank_Account_Transaction_To_Return;
        }
    }
}

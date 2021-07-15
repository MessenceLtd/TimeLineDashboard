using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TimeLineDashboard.Shared.Models;

namespace TimeLineDashboard.DAL.Operations
{
    internal class Credit_Cards_Statement_Transaction_Operations
    {
        #region Singleton
        private static readonly Credit_Cards_Statement_Transaction_Operations instance = new Credit_Cards_Statement_Transaction_Operations();
        // Explicit static constructor to tell C# compiler  
        // not to mark type as beforefieldinit  
        static Credit_Cards_Statement_Transaction_Operations()
        {
        }
        private Credit_Cards_Statement_Transaction_Operations()
        {
        }
        public static Credit_Cards_Statement_Transaction_Operations Instance
        {
            get
            {
                return instance;
            }
        }
        #endregion

        internal List<Credit_Cards_Statement_Transaction> Get_Credit_Card_Statement_Transactions_List(
            int? p_Bank_Account_Credit_Card_Statement_Id, 
            int p_User_ID_Bank_Owner, 
            int p_User_ID_Searching)
        {
            List<Credit_Cards_Statement_Transaction> Credit_Cards_Statement_Transactions_To_Return
                = new List<Credit_Cards_Statement_Transaction>();

            SqlParameter spBank_Account_Credit_Card_Statement_Id = new SqlParameter("@Bank_Account_Credit_Card_Statement_Id", SqlDbType.Int );
            SqlParameter spUser_ID_Bank_Owner = new SqlParameter("@User_ID_Bank_Owner", SqlDbType.Int);
            SqlParameter spUser_ID_Searching = new SqlParameter("@User_ID_Searching", SqlDbType.Int);

            spBank_Account_Credit_Card_Statement_Id.Value = p_Bank_Account_Credit_Card_Statement_Id;
            spUser_ID_Bank_Owner.Value = p_User_ID_Bank_Owner;
            spUser_ID_Searching.Value = p_User_ID_Searching;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Credit_Card_Statement_Transactions_List", 
                new List<SqlParameter>() {
                    spBank_Account_Credit_Card_Statement_Id    ,
                    spUser_ID_Bank_Owner       ,
                    spUser_ID_Searching
                });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                Credit_Cards_Statement_Transactions_To_Return = new List<Credit_Cards_Statement_Transaction>(dataSet.Tables[0].Rows.Count);

                for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                {
                    Credit_Cards_Statement_Transactions_To_Return.Add(Create_Credit_Card_Statement_Details_From_Data_Row(dataSet.Tables[0].Rows[i]));
                }
            }

            return Credit_Cards_Statement_Transactions_To_Return;
        }

        
        internal int Insert_New_Credit_Card_Statement_Transaction_Details(
            int p_Bank_Account_Credit_Card_Statement_Id ,
            DateTime? p_Transaction_Date,
            string p_Business_Name, 
            decimal? p_Transaction_Amount, 
            byte? p_Transaction_Amount_Currency_Id,
            decimal? p_Transaction_Actual_Payment_Amount, 
            string p_Description, 
            bool p_Has_Been_Actually_Charged_In_Statement,
            decimal? p_Total_Charged_In_Statement, 
            string p_User_Description,
            string p_User_Comments,
            bool p_Is_Visible_To_Anonymous_Users,
            bool p_Is_Available_For_Download_For_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users,
            bool p_Is_Available_For_Download_For_Followers_Users,
            int? p_Creating_User_Id )
        {
            int l_New_Transaction_Id_To_Return = 0;

            SqlParameter spBank_Account_Credit_Card_Statement_Id = new SqlParameter("@Bank_Account_Credit_Card_Statement_Id", SqlDbType.Int);
            SqlParameter spTransaction_Date = new SqlParameter("@Transaction_Date", SqlDbType.DateTime);
            SqlParameter spBusiness_Name = new SqlParameter("@Business_Name", SqlDbType.NVarChar, 50);
            SqlParameter spTransaction_Amount = new SqlParameter("@Transaction_Amount", SqlDbType.Decimal);
            SqlParameter spTransaction_Amount_Currency_Id = new SqlParameter("@Transaction_Amount_Currency_Id", SqlDbType.Decimal);
            SqlParameter spTransaction_Actual_Payment_Amount = new SqlParameter("@Transaction_Actual_Payment_Amount", SqlDbType.Decimal);
            SqlParameter spDescription = new SqlParameter("@Description", SqlDbType.NVarChar, 80);
            SqlParameter spHas_Been_Actually_Charged_In_Statement = new SqlParameter("@Has_Been_Actually_Charged_In_Statement", SqlDbType.Bit);
            SqlParameter spTotal_Charged_In_Statement = new SqlParameter("@Total_Charged_In_Statement", SqlDbType.Decimal);
            SqlParameter spUser_Description = new SqlParameter("@User_Description", SqlDbType.NVarChar, 300);
            SqlParameter spUser_Comments = new SqlParameter("@User_Comments", SqlDbType.NVarChar, 300);
            SqlParameter spIs_Visible_To_Anonymous_Users = new SqlParameter("@Is_Visible_To_Anonymous_Users", SqlDbType.Bit);
            SqlParameter spIs_Available_For_Download_For_Anonymous_Users = new SqlParameter("@Is_Available_For_Download_For_Anonymous_Users", SqlDbType.Bit);
            SqlParameter spIs_Visible_To_Followers_Users = new SqlParameter("@Is_Visible_To_Followers_Users", SqlDbType.Bit);
            SqlParameter spIs_Available_For_Download_For_Followers_Users = new SqlParameter("@Is_Available_For_Download_For_Followers_Users", SqlDbType.Bit);

            SqlParameter spCreating_User_Id = new SqlParameter("@Creating_User_Id", SqlDbType.Int);

            spBank_Account_Credit_Card_Statement_Id.Value = p_Bank_Account_Credit_Card_Statement_Id;

            if (p_Transaction_Date.HasValue)
                spTransaction_Date.Value = p_Transaction_Date.Value;
            else
                spTransaction_Date.Value = DBNull.Value;

            spBusiness_Name.Value = p_Business_Name;
            if (p_Transaction_Amount.HasValue)
                spTransaction_Amount.Value = p_Transaction_Amount;
            else
                spTransaction_Amount.Value = DBNull.Value;

            if (p_Transaction_Amount_Currency_Id.HasValue)
                spTransaction_Amount_Currency_Id.Value = p_Transaction_Amount_Currency_Id.Value;
            else
                spTransaction_Amount_Currency_Id.Value = DBNull.Value;

            if (p_Transaction_Actual_Payment_Amount.HasValue)
                spTransaction_Actual_Payment_Amount.Value = p_Transaction_Actual_Payment_Amount.Value;
            else
                spTransaction_Actual_Payment_Amount.Value = DBNull.Value;

            spDescription.Value = p_Description;
            spHas_Been_Actually_Charged_In_Statement.Value = p_Has_Been_Actually_Charged_In_Statement;

            if (p_Total_Charged_In_Statement.HasValue)
                spTotal_Charged_In_Statement.Value = p_Total_Charged_In_Statement.Value;
            else
                spTotal_Charged_In_Statement.Value = DBNull.Value;

            spUser_Description.Value = p_User_Description;
            spUser_Comments.Value = p_User_Comments;

            spIs_Visible_To_Anonymous_Users.Value = p_Is_Visible_To_Anonymous_Users;
            spIs_Available_For_Download_For_Anonymous_Users.Value = p_Is_Available_For_Download_For_Anonymous_Users;
            spIs_Visible_To_Followers_Users.Value = p_Is_Visible_To_Followers_Users;
            spIs_Available_For_Download_For_Followers_Users.Value = p_Is_Available_For_Download_For_Followers_Users;

            spCreating_User_Id.Value = p_Creating_User_Id.Value;

            object new_Credit_Card_Statement_Transaction_Id = SQLHelper.ExecuteStoredProcedure_ReturnDataObjectResult(
                "p_TLBoard_Insert_Credit_Card_Statement_Transaction",
                    new List<SqlParameter>() {
                        spBank_Account_Credit_Card_Statement_Id,
                        spTransaction_Date,
                        spBusiness_Name,
                        spTransaction_Amount,
                        spTransaction_Amount_Currency_Id,
                        spTransaction_Actual_Payment_Amount,
                        spDescription,
                        spHas_Been_Actually_Charged_In_Statement,
                        spTotal_Charged_In_Statement,
                        spUser_Description,
                        spUser_Comments,
                        spIs_Visible_To_Anonymous_Users, 
                        spIs_Available_For_Download_For_Anonymous_Users,
                        spIs_Visible_To_Followers_Users, 
                        spIs_Available_For_Download_For_Followers_Users,
                        spCreating_User_Id
            });

            if (new_Credit_Card_Statement_Transaction_Id != null)
            {
                l_New_Transaction_Id_To_Return = Convert.ToInt32(new_Credit_Card_Statement_Transaction_Id);
            }

            return l_New_Transaction_Id_To_Return;
        }

        internal bool Update_Credit_Card_Statement_Transaction(
            long p_Credit_Card_Statement_Transaction_Id,
            DateTime? p_Transaction_Date,
            string p_Business_Name,
            decimal? p_Transaction_Amount,
            byte? p_Transaction_Amount_Currency_Id,
            decimal? p_Transaction_Actual_Payment_Amount,
            string p_Description,
            bool p_Has_Been_Actually_Charged_In_Statement,
            decimal? p_Total_Charged_In_Statement,
            int p_Updating_User_Id)
        {
            bool updated_Successfully = false;

            SqlParameter spCredit_Card_Statement_Transaction_Id = new SqlParameter("@Credit_Card_Statement_Transaction_Id", SqlDbType.BigInt);
            SqlParameter spTransaction_Date = new SqlParameter("@Transaction_Date", SqlDbType.DateTime);
            SqlParameter spBusiness_Name = new SqlParameter("@Business_Name", SqlDbType.NVarChar, 50);
            SqlParameter spTransaction_Amount = new SqlParameter("@Transaction_Amount", SqlDbType.Decimal);
            SqlParameter spTransaction_Amount_Currency_Id = new SqlParameter("@Transaction_Amount_Currency_Id", SqlDbType.Decimal);
            SqlParameter spTransaction_Actual_Payment_Amount = new SqlParameter("@Transaction_Actual_Payment_Amount", SqlDbType.Decimal);
            SqlParameter spDescription = new SqlParameter("@Description", SqlDbType.NVarChar, 80);
            SqlParameter spHas_Been_Actually_Charged_In_Statement = new SqlParameter("@Has_Been_Actually_Charged_In_Statement", SqlDbType.Bit);
            SqlParameter spTotal_Charged_In_Statement = new SqlParameter("@Total_Charged_In_Statement", SqlDbType.Decimal);
            SqlParameter spUpdating_User_Id = new SqlParameter("@Updating_User_Id", SqlDbType.Int);

            spCredit_Card_Statement_Transaction_Id.Value = p_Credit_Card_Statement_Transaction_Id;

            if (p_Transaction_Date.HasValue)
                spTransaction_Date.Value = p_Transaction_Date.Value;
            else
                spTransaction_Date.Value = DBNull.Value;

            spBusiness_Name.Value = p_Business_Name;
            if (p_Transaction_Amount.HasValue)
                spTransaction_Amount.Value = p_Transaction_Amount;
            else
                spTransaction_Amount.Value = DBNull.Value;

            if (p_Transaction_Amount_Currency_Id.HasValue)
                spTransaction_Amount_Currency_Id.Value = p_Transaction_Amount_Currency_Id.Value;
            else
                spTransaction_Amount_Currency_Id.Value = DBNull.Value;

            if (p_Transaction_Actual_Payment_Amount.HasValue)
                spTransaction_Actual_Payment_Amount.Value = p_Transaction_Actual_Payment_Amount.Value;
            else
                spTransaction_Actual_Payment_Amount.Value = DBNull.Value;

            spDescription.Value = p_Description;

            spHas_Been_Actually_Charged_In_Statement.Value = p_Has_Been_Actually_Charged_In_Statement;

            if (p_Total_Charged_In_Statement.HasValue)
                spTotal_Charged_In_Statement.Value = p_Total_Charged_In_Statement.Value;
            else
                spTotal_Charged_In_Statement.Value = DBNull.Value;

            spUpdating_User_Id.Value = p_Updating_User_Id;

            int affected_Rows = SQLHelper.ExecuteStoredProcedure_ReturnAffectedRowsNumber_WithDefaultAppConfigConnectionString(
                "p_TLBoard_Update_Credit_Card_Statement_Transaction",
                    new List<SqlParameter>() {
                        spCredit_Card_Statement_Transaction_Id,
                        spTransaction_Date,
                        spBusiness_Name,
                        spTransaction_Amount,
                        spTransaction_Amount_Currency_Id,
                        spTransaction_Actual_Payment_Amount,
                        spDescription,
                        spHas_Been_Actually_Charged_In_Statement,
                        spTotal_Charged_In_Statement,
                        spUpdating_User_Id
                    });

            if (affected_Rows > 0)
            {
                updated_Successfully = true;
            }

            return updated_Successfully;
        }

        internal bool Update_Credit_Card_Statement_Transaction_FullDetails(
            long p_Credit_Card_Statement_Transaction_Id,
            DateTime? p_Transaction_Date,
            string p_Business_Name,
            decimal? p_Transaction_Amount,
            byte? p_Transaction_Amount_Currency_Id,
            decimal? p_Transaction_Actual_Payment_Amount,
            string p_Description,
            bool p_Has_Been_Actually_Charged_In_Statement,
            decimal? p_Total_Charged_In_Statement,
            string p_User_Description,
            string p_User_Comments,
            bool p_Is_Visible_To_Anonymous_Users,
            bool p_Is_Available_For_Download_For_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users,
            bool p_Is_Available_For_Download_For_Followers_Users,
            int p_Updating_User_Id)
        {
            bool updated_Successfully = false;

            SqlParameter spCredit_Card_Statement_Transaction_Id = new SqlParameter("@Credit_Card_Statement_Transaction_Id", SqlDbType.BigInt);
            SqlParameter spTransaction_Date = new SqlParameter("@Transaction_Date", SqlDbType.DateTime);
            SqlParameter spBusiness_Name = new SqlParameter("@Business_Name", SqlDbType.NVarChar, 50);
            SqlParameter spTransaction_Amount = new SqlParameter("@Transaction_Amount", SqlDbType.Decimal);
            SqlParameter spTransaction_Amount_Currency_Id = new SqlParameter("@Transaction_Amount_Currency_Id", SqlDbType.Decimal);
            SqlParameter spTransaction_Actual_Payment_Amount = new SqlParameter("@Transaction_Actual_Payment_Amount", SqlDbType.Decimal);
            SqlParameter spDescription = new SqlParameter("@Description", SqlDbType.NVarChar, 80);
            SqlParameter spHas_Been_Actually_Charged_In_Statement = new SqlParameter("@Has_Been_Actually_Charged_In_Statement", SqlDbType.Bit);
            SqlParameter spTotal_Charged_In_Statement = new SqlParameter("@Total_Charged_In_Statement", SqlDbType.Decimal);
            SqlParameter spUser_Description = new SqlParameter("@User_Description", SqlDbType.NVarChar, 300);
            SqlParameter spUser_Comments = new SqlParameter("@User_Comments", SqlDbType.NVarChar, 300);
            SqlParameter spIs_Visible_To_Anonymous_Users = new SqlParameter("@Is_Visible_To_Anonymous_Users", SqlDbType.Bit);
            SqlParameter spIs_Available_For_Download_For_Anonymous_Users = new SqlParameter("@Is_Available_For_Download_For_Anonymous_Users", SqlDbType.Bit);
            SqlParameter spIs_Visible_To_Followers_Users = new SqlParameter("@Is_Visible_To_Followers_Users", SqlDbType.Bit);
            SqlParameter spIs_Available_For_Download_For_Followers_Users = new SqlParameter("@Is_Available_For_Download_For_Followers_Users", SqlDbType.Bit);
            SqlParameter spUpdating_User_Id = new SqlParameter("@Updating_User_Id", SqlDbType.Int);

            spCredit_Card_Statement_Transaction_Id.Value = p_Credit_Card_Statement_Transaction_Id;

            if (p_Transaction_Date.HasValue)
                spTransaction_Date.Value = p_Transaction_Date.Value;
            else
                spTransaction_Date.Value = DBNull.Value;

            spBusiness_Name.Value = p_Business_Name;
            if (p_Transaction_Amount.HasValue)
                spTransaction_Amount.Value = p_Transaction_Amount;
            else
                spTransaction_Amount.Value = DBNull.Value;

            if (p_Transaction_Amount_Currency_Id.HasValue)
                spTransaction_Amount_Currency_Id.Value = p_Transaction_Amount_Currency_Id.Value;
            else
                spTransaction_Amount_Currency_Id.Value = DBNull.Value;

            if (p_Transaction_Actual_Payment_Amount.HasValue)
                spTransaction_Actual_Payment_Amount.Value = p_Transaction_Actual_Payment_Amount.Value;
            else
                spTransaction_Actual_Payment_Amount.Value = DBNull.Value;

            spDescription.Value = p_Description;

            spHas_Been_Actually_Charged_In_Statement.Value = p_Has_Been_Actually_Charged_In_Statement;

            if (p_Total_Charged_In_Statement.HasValue)
                spTotal_Charged_In_Statement.Value = p_Total_Charged_In_Statement.Value;
            else
                spTotal_Charged_In_Statement.Value = DBNull.Value;

            spUser_Description.Value = p_User_Description;
            spUser_Comments.Value = p_User_Comments;

            spIs_Visible_To_Anonymous_Users.Value = p_Is_Visible_To_Anonymous_Users;
            spIs_Available_For_Download_For_Anonymous_Users.Value = p_Is_Available_For_Download_For_Anonymous_Users;
            spIs_Visible_To_Followers_Users.Value = p_Is_Visible_To_Followers_Users;
            spIs_Available_For_Download_For_Followers_Users.Value = p_Is_Available_For_Download_For_Followers_Users;

            spUpdating_User_Id.Value = p_Updating_User_Id;

            int affected_Rows = SQLHelper.ExecuteStoredProcedure_ReturnAffectedRowsNumber_WithDefaultAppConfigConnectionString(
                "p_TLBoard_Update_Credit_Card_Statement_Transaction_FullDetails",
                    new List<SqlParameter>() {
                        spCredit_Card_Statement_Transaction_Id,
                        spTransaction_Date,
                        spBusiness_Name,
                        spTransaction_Amount,
                        spTransaction_Amount_Currency_Id,
                        spTransaction_Actual_Payment_Amount,
                        spDescription,
                        spHas_Been_Actually_Charged_In_Statement,
                        spTotal_Charged_In_Statement,
                        spUser_Description,
                        spUser_Comments,
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

        internal bool Delete_Credit_Card_Statement_Transaction(
            long p_Credit_Card_Statement_Transaction_Id,
            int p_Deleting_User_Id)
        {
            bool updated_Successfully = false;

            SqlParameter spCredit_Card_Statement_Transaction_Id = new SqlParameter("@Credit_Card_Statement_Transaction_Id", SqlDbType.BigInt);
            SqlParameter spDeleting_User_Id = new SqlParameter("@Deleting_User_Id", SqlDbType.Int);

            spCredit_Card_Statement_Transaction_Id.Value = p_Credit_Card_Statement_Transaction_Id;
            spDeleting_User_Id.Value = p_Deleting_User_Id;

            int affected_Rows = SQLHelper.ExecuteStoredProcedure_ReturnAffectedRowsNumber_WithDefaultAppConfigConnectionString(
                "p_TLBoard_Delete_Credit_Card_Statement_Transaction",
                    new List<SqlParameter>() {
                        spCredit_Card_Statement_Transaction_Id,
                        spDeleting_User_Id
                    });

            if (affected_Rows > 0)
            {
                updated_Successfully = true;
            }

            return updated_Successfully;
        }

        internal bool Delete_Credit_Card_Statement_All_Transactions_By_Statement_Id(
            int p_Bank_Account_Credit_Card_Statement_Id,
            int p_Deleting_User_Id)
        {
            bool updated_Successfully = false;

            SqlParameter spBank_Account_Credit_Card_Statement_Id = new SqlParameter("@Bank_Account_Credit_Card_Statement_Id", SqlDbType.BigInt);
            SqlParameter spDeleting_User_Id = new SqlParameter("@Deleting_User_Id", SqlDbType.Int);

            spBank_Account_Credit_Card_Statement_Id.Value = p_Bank_Account_Credit_Card_Statement_Id;
            spDeleting_User_Id.Value = p_Deleting_User_Id;

            int affected_Rows = SQLHelper.ExecuteStoredProcedure_ReturnAffectedRowsNumber_WithDefaultAppConfigConnectionString(
                "p_TLBoard_Delete_Credit_Card_Statement_All_Transactions_By_Statement_Id",
                    new List<SqlParameter>() {
                        spBank_Account_Credit_Card_Statement_Id,
                        spDeleting_User_Id
                    });

            if (affected_Rows > 0)
            {
                updated_Successfully = true;
            }

            return updated_Successfully;
        }

        internal Credit_Cards_Statement_Transaction Get_Credit_Card_Statement_Transaction_Details(
            int p_User_ID_Bank_Owner,
            long p_Credit_Card_Statement_Transaction_Id,
            int p_User_ID_Searching)
        {
            Credit_Cards_Statement_Transaction ccStatement_Transactions_To_Return = null;

            SqlParameter spUser_Id_Bank_Owner = new SqlParameter("@User_Id_Bank_Owner", SqlDbType.Int);
            SqlParameter spCredit_Card_Statement_Transaction_Id = new SqlParameter("@Credit_Card_Statement_Transaction_Id", SqlDbType.BigInt);
            SqlParameter spSearching_User_Idarching = new SqlParameter("@User_ID_Searching", SqlDbType.Int);

            spUser_Id_Bank_Owner.Value = p_User_ID_Bank_Owner;
            spCredit_Card_Statement_Transaction_Id.Value = p_Credit_Card_Statement_Transaction_Id;
            spSearching_User_Idarching.Value = p_User_ID_Searching;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString(
                "p_TLBoard_Get_Credit_Card_Statement_Transaction_Details",
                    new List<SqlParameter>() {
                        spUser_Id_Bank_Owner                        ,
                        spCredit_Card_Statement_Transaction_Id      ,
                        spSearching_User_Idarching
                    });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                ccStatement_Transactions_To_Return = Create_Credit_Card_Statement_Details_From_Data_Row(dataSet.Tables[0].Rows[0]);
            }

            return ccStatement_Transactions_To_Return;
        }

        private Credit_Cards_Statement_Transaction Create_Credit_Card_Statement_Details_From_Data_Row(DataRow dbRow)
        {
            Credit_Cards_Statement_Transaction Credit_Card_Statement_To_Return = new Credit_Cards_Statement_Transaction();

            Credit_Card_Statement_To_Return.Credit_Card_Statement_Transaction_Id = Convert.ToInt32(dbRow["Credit_Card_Statement_Transaction_Id"]);
            Credit_Card_Statement_To_Return.Bank_Account_Credit_Card_Statement_Id = Convert.ToInt32(dbRow["Bank_Account_Credit_Card_Statement_Id"]);

            if (dbRow.Table.Columns.IndexOf("Bank_Account_Owner_User_Id") > -1)
            {
                Credit_Card_Statement_To_Return.Bank_Account_Owner_User_Id = Convert.ToInt32(dbRow["Bank_Account_Owner_User_Id"]);
            }

            if (dbRow["Transaction_Date"] != DBNull.Value)
                Credit_Card_Statement_To_Return.Transaction_Date = (DateTime)dbRow["Transaction_Date"];
            else
                Credit_Card_Statement_To_Return.Transaction_Date = null;

            Credit_Card_Statement_To_Return.Business_Name = dbRow["Business_Name"].ToString();

            if (dbRow["Transaction_Amount"] != DBNull.Value)
                Credit_Card_Statement_To_Return.Transaction_Amount = Convert.ToDecimal(dbRow["Transaction_Amount"]);
            else
                Credit_Card_Statement_To_Return.Transaction_Amount = null;

            if (dbRow["Transaction_Amount_Currency_Id"] != DBNull.Value)
                Credit_Card_Statement_To_Return.Transaction_Amount_Currency_Id = Convert.ToByte(dbRow["Transaction_Amount_Currency_Id"]);
            else
                Credit_Card_Statement_To_Return.Transaction_Amount_Currency_Id = null;

            if (dbRow["Transaction_Actual_Payment_Amount"] != DBNull.Value)
                Credit_Card_Statement_To_Return.Transaction_Actual_Payment_Amount = Convert.ToDecimal(dbRow["Transaction_Actual_Payment_Amount"]);
            else
                Credit_Card_Statement_To_Return.Transaction_Actual_Payment_Amount = null;

            Credit_Card_Statement_To_Return.Description = dbRow["Description"].ToString();
            
            if (dbRow["Has_Been_Actually_Charged_In_Statement"] != DBNull.Value)
                Credit_Card_Statement_To_Return.Has_Been_Actually_Charged_In_Statement = (bool)dbRow["Has_Been_Actually_Charged_In_Statement"];
            else
                Credit_Card_Statement_To_Return.Has_Been_Actually_Charged_In_Statement = false;

            if (dbRow["Total_Charged_In_Statement"] != DBNull.Value)
                Credit_Card_Statement_To_Return.Total_Charged_In_Statement = Convert.ToDecimal(dbRow["Total_Charged_In_Statement"]);
            else
                Credit_Card_Statement_To_Return.Total_Charged_In_Statement = null;

            Credit_Card_Statement_To_Return.User_Description = dbRow["User_Description"].ToString();
            Credit_Card_Statement_To_Return.User_Comments = dbRow["User_Comments"].ToString();

            Credit_Card_Statement_To_Return.Is_Visible_To_Anonymous_Users = (bool)dbRow["Is_Visible_To_Anonymous_Users"];
            Credit_Card_Statement_To_Return.Is_Available_For_Download_For_Anonymous_Users = (bool)dbRow["Is_Available_For_Download_For_Anonymous_Users"];
            Credit_Card_Statement_To_Return.Is_Visible_To_Followers_Users = (bool)dbRow["Is_Visible_To_Followers_Users"];
            Credit_Card_Statement_To_Return.Is_Available_For_Download_For_Followers_Users = (bool)dbRow["Is_Available_For_Download_For_Followers_Users"];

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

            Credit_Card_Statement_To_Return.Is_Deleted = (bool)dbRow["Is_Deleted"];

            return Credit_Card_Statement_To_Return;
        }
    }
}

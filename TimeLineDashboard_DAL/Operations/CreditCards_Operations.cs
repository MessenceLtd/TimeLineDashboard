using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TimeLineDashboard.Shared.Models;

namespace TimeLineDashboard.DAL.Operations
{
    internal class Credit_Cards_Operations
    {
        #region Singleton
        private static readonly Credit_Cards_Operations instance = new Credit_Cards_Operations();
        // Explicit static constructor to tell C# compiler  
        // not to mark type as beforefieldinit  
        static Credit_Cards_Operations()
        {
        }
        private Credit_Cards_Operations()
        {
        }
        public static Credit_Cards_Operations Instance
        {
            get
            {
                return instance;
            }
        }
        #endregion

        internal List<Credit_Cards> Get_Search(
            int p_User_Id, 
            int? p_Bank_Account_Id)
        {
            List<Credit_Cards> Credit_Cards_To_Return = new List<Credit_Cards>();

            SqlParameter spUser_Id = new SqlParameter("@User_Id", SqlDbType.Int );
            SqlParameter spBank_Account_Id = new SqlParameter("@Bank_Account_Id", SqlDbType.Int);

            spUser_Id.Value = p_User_Id;
            if (p_Bank_Account_Id.HasValue)
                spBank_Account_Id.Value = p_Bank_Account_Id;
            else
                spBank_Account_Id.Value = DBNull.Value;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Credit_Cards_Search", 
                new List<SqlParameter>() { 
                    spUser_Id,
                    spBank_Account_Id
                });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                Credit_Cards_To_Return = new List<Credit_Cards>(dataSet.Tables[0].Rows.Count);

                for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                {
                    Credit_Cards_To_Return.Add(Create_Credit_Card_Details_From_Data_Row(dataSet.Tables[0].Rows[i]));
                }
            }

            return Credit_Cards_To_Return;
        }

        internal Credit_Cards Get_Credit_Card_Details_By_Credit_Card_Id(
            int p_Credit_Card_Id, 
            int p_User_Id_Credit_Card_Owner,
            int p_User_Id_Searching_For_Credit_Card
            )
        {
            Credit_Cards Credit_Card_To_Return = new Credit_Cards();

            SqlParameter spCredit_Card_Id = new SqlParameter("@Credit_Card_Id", SqlDbType.Int);
            SqlParameter spUser_Id = new SqlParameter("@User_Id", SqlDbType.Int);
            SqlParameter spUser_Id_Searching_For_Credit_Card = new SqlParameter("@User_Id_Searching_For_Credit_Card", SqlDbType.Int);
            
            spCredit_Card_Id.Value = p_Credit_Card_Id;
            spUser_Id.Value = p_User_Id_Credit_Card_Owner;
            spUser_Id_Searching_For_Credit_Card.Value = p_User_Id_Searching_For_Credit_Card;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Credit_Card_Details",
                new List<SqlParameter>() { spCredit_Card_Id, spUser_Id , spUser_Id_Searching_For_Credit_Card });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                Credit_Card_To_Return = Create_Credit_Card_Details_From_Data_Row(dataSet.Tables[0].Rows[0]); 
            }

            return Credit_Card_To_Return;
        }

        internal Credit_Cards Insert_New_Credit_Card_Details(
            int p_User_Id_Owner,
            int p_Bank_Account_Id,
            string p_Card_Name,
            string p_Four_Ending_Digits,
            DateTime? p_Expiration_Date,
            bool p_Is_Active,
            int p_Creating_User_Id)
        {
            Credit_Cards new_Registered_Credit_Card_To_Return = null;

            SqlParameter spBank_Account_Id = new SqlParameter("@Bank_Account_Id", SqlDbType.Int);
            SqlParameter spUser_Id_Owner = new SqlParameter("@User_Id_Owner", SqlDbType.Int);
            SqlParameter spCard_Name = new SqlParameter("@Card_Name", SqlDbType.NVarChar, 40);
            SqlParameter spFour_Ending_Digits = new SqlParameter("@Four_Ending_Digits", SqlDbType.NVarChar, 4);
            SqlParameter spExpiration_Date = new SqlParameter("@Expiration_Date", SqlDbType.SmallDateTime);
            SqlParameter spIs_Active = new SqlParameter("@Is_Active", SqlDbType.Bit);
            SqlParameter spCreating_User_Id = new SqlParameter("@Creating_User_Id", SqlDbType.Int);

            spBank_Account_Id.Value = p_Bank_Account_Id;
            spUser_Id_Owner.Value = p_User_Id_Owner;
            spCard_Name.Value = p_Card_Name;
            spFour_Ending_Digits.Value = p_Four_Ending_Digits;

            if (p_Expiration_Date.HasValue)
                spExpiration_Date.Value = p_Expiration_Date;
            else
                spExpiration_Date.Value = DBNull.Value;

            spIs_Active.Value = p_Is_Active;
            spCreating_User_Id.Value = p_Creating_User_Id;

            object new_Credit_Card_Id = SQLHelper.ExecuteStoredProcedure_ReturnDataObjectResult("p_TLBoard_Insert_Credit_Card_Details",
                new List<SqlParameter>() {
                    spBank_Account_Id,
                    spUser_Id_Owner,
                    spCard_Name,
                    spFour_Ending_Digits,
                    spExpiration_Date,
                    spIs_Active,
                    spCreating_User_Id
            });

            if (new_Credit_Card_Id != null)
            {
                int Credit_Card_Id_Registered = Convert.ToInt32(new_Credit_Card_Id);
                if (Credit_Card_Id_Registered > 0)
                {
                    new_Registered_Credit_Card_To_Return = Get_Credit_Card_Details_By_Credit_Card_Id(
                        Credit_Card_Id_Registered, p_User_Id_Owner, p_Creating_User_Id);
                }
            }

            return new_Registered_Credit_Card_To_Return;
        }

        internal bool Update_Credit_Card_Details(
            int p_Credit_Card_Id, 
            int p_Bank_Account_Id,
            string p_Card_Name, 
            string p_Four_Ending_Digits,
            DateTime? p_Expiration_Date, 
            bool p_Is_Active,
            int p_Updating_User_Id )
        {
            bool updated_Successfully = false;

            SqlParameter spCredit_Card_Id = new SqlParameter("@Credit_Card_Id", SqlDbType.Int);
            SqlParameter spBank_Account_Id = new SqlParameter("@Bank_Account_Id", SqlDbType.Int);
            SqlParameter spCard_Name = new SqlParameter("@Card_Name", SqlDbType.NVarChar, 40);
            SqlParameter spFour_Ending_Digits = new SqlParameter("@Four_Ending_Digits", SqlDbType.NVarChar, 4);
            SqlParameter spExpiration_Date = new SqlParameter("@Expiration_Date", SqlDbType.SmallDateTime);
            SqlParameter spIs_Active = new SqlParameter("@Is_Active", SqlDbType.Bit);
            SqlParameter spUpdating_User_Id = new SqlParameter("@Updating_User_Id", SqlDbType.Int);

            spCredit_Card_Id.Value = p_Credit_Card_Id;
            spBank_Account_Id.Value = p_Bank_Account_Id;
            spCard_Name.Value = p_Card_Name;
            spFour_Ending_Digits.Value = p_Four_Ending_Digits;

            if (p_Expiration_Date.HasValue)
                spExpiration_Date.Value = p_Expiration_Date;
            else
                spExpiration_Date.Value = DBNull.Value;

            spIs_Active.Value = p_Is_Active;
            spUpdating_User_Id.Value = p_Updating_User_Id;

            int affected_Rows = SQLHelper.ExecuteStoredProcedure_ReturnAffectedRowsNumber_WithDefaultAppConfigConnectionString("p_TLBoard_Update_Credit_Card_Details",
                new List<SqlParameter>() {
                    spCredit_Card_Id,
                    spBank_Account_Id,
                    spCard_Name,
                    spFour_Ending_Digits,
                    spExpiration_Date,
                    spIs_Active,
                    spUpdating_User_Id
                });

            if (affected_Rows > 0)
            {
                updated_Successfully = true;
            }

            return updated_Successfully;
        }

        internal List<Credit_Cards> Get_All_By_User_Id(
            int p_User_Id_To_Return_Credit_Cards, 
            int p_Authenticated_User_ID)
        {
            return this.Get_Search(p_User_Id_To_Return_Credit_Cards, null);
        }

        private Credit_Cards Create_Credit_Card_Details_From_Data_Row(DataRow dbRow)
        {
            Credit_Cards Credit_Card_To_Return = new Credit_Cards();

            Credit_Card_To_Return.Credit_Card_Id = Convert.ToInt32(dbRow["Credit_Card_Id"]);
            Credit_Card_To_Return.Bank_Account_Id = Convert.ToInt32(dbRow["Bank_Account_Id"]);

            if (dbRow.Table.Columns.IndexOf("Bank_Account_Name") > -1 &&
                 dbRow["Bank_Account_Name"] != DBNull.Value )
            {
                Credit_Card_To_Return.Bank_Account_Name = dbRow["Bank_Account_Name"].ToString();
            }

            Credit_Card_To_Return.User_Id = Convert.ToInt32(dbRow["User_Id"]);

            Credit_Card_To_Return.Card_Name = dbRow["Card_Name"].ToString();
            Credit_Card_To_Return.Four_Ending_Digits = dbRow["Four_Ending_Digits"].ToString();

            if ( dbRow["Expiration_Date"] != DBNull.Value )
            {
                Credit_Card_To_Return.Expiration_Date = (DateTime)dbRow["Expiration_Date"];
            }

            Credit_Card_To_Return.Is_Active = (bool)dbRow["Is_Active"];

            if (dbRow.Table.Columns.IndexOf("Record_Creation_DateTime_UTC") >-1)
            { 
                Credit_Card_To_Return.Record_Created_By_User_Id = Convert.ToInt32(dbRow["Record_Created_By_User_Id"]);
                Credit_Card_To_Return.Record_Created_By_User_Details = new Users();
                Credit_Card_To_Return.Record_Created_By_User_Details.User_Id = Credit_Card_To_Return.Record_Created_By_User_Id;
                if (dbRow.Table.Columns.IndexOf("Created_By_First_Name") > -1)
                {
                    Credit_Card_To_Return.Record_Created_By_User_Details.First_Name = dbRow["Created_By_First_Name"].ToString();
                    Credit_Card_To_Return.Record_Created_By_User_Details.Last_Name = dbRow["Created_By_Last_Name"].ToString();
                }
                Credit_Card_To_Return.Record_Creation_DateTime_UTC = (DateTime)dbRow["Record_Creation_DateTime_UTC"];

                Credit_Card_To_Return.Record_Last_Updated_By_User_Id = Convert.ToInt32(dbRow["Record_Last_Updated_By_User_Id"]);
                Credit_Card_To_Return.Record_Last_Updated_By_User_Details = new Users();
                Credit_Card_To_Return.Record_Last_Updated_By_User_Details.User_Id = Credit_Card_To_Return.Record_Last_Updated_By_User_Id;
                if (dbRow.Table.Columns.IndexOf("Last_Updated_By_First_Name") > -1)
                {
                    Credit_Card_To_Return.Record_Last_Updated_By_User_Details.First_Name = dbRow["Last_Updated_By_First_Name"].ToString();
                    Credit_Card_To_Return.Record_Last_Updated_By_User_Details.Last_Name = dbRow["Last_Updated_By_Last_Name"].ToString();
                }
                Credit_Card_To_Return.Record_Last_Updated_DateTime_UTC = (DateTime)dbRow["Record_Last_Updated_DateTime_UTC"];
            }

            Credit_Card_To_Return.Is_Deleted = (bool)dbRow["Is_Deleted"];

            return Credit_Card_To_Return;
        }
    }
}

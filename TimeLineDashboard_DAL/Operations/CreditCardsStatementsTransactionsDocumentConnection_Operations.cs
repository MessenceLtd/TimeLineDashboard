using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TimeLineDashboard.Shared.Models;
using TimeLineDashboard.Shared.Responses;

namespace TimeLineDashboard.DAL.Operations
{
    internal class Credit_Card_Statement_Transaction_Document_Connection_Operations
    {
        #region Singleton
        private static readonly Credit_Card_Statement_Transaction_Document_Connection_Operations instance = new Credit_Card_Statement_Transaction_Document_Connection_Operations();
        // Explicit static constructor to tell C# compiler  
        // not to mark type as beforefieldinit  
        static Credit_Card_Statement_Transaction_Document_Connection_Operations()
        {
        }
        private Credit_Card_Statement_Transaction_Document_Connection_Operations()
        {
        }
        public static Credit_Card_Statement_Transaction_Document_Connection_Operations Instance
        {
            get
            {
                return instance;
            }
        }
        #endregion

        internal long Insert_Credit_Card_Statement_Transaction_Document_Connection(
            int p_User_Id_Bank_Owner,
            long p_Credit_Card_Statement_Transaction_Id,
            byte p_Connection_Type,
            int p_Document_Record_Id,
            bool p_Is_Visible_To_Anonymous_Users,
            bool p_Is_Available_For_Download_For_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users,
            bool p_Is_Available_For_Download_For_Followers_Users,
            int p_Creating_User_Id)
        {
            long l_New_Document_Connection_Id_To_Return = 0;

            SqlParameter sp_User_Id_Bank_Owner = new SqlParameter("@User_Id_Bank_Owner", SqlDbType.Int);
            SqlParameter sp_Credit_Card_Statement_Transaction_Id = new SqlParameter("@Credit_Card_Statement_Transaction_Id", SqlDbType.BigInt);
            SqlParameter sp_Connection_Type = new SqlParameter("@Connection_Type", SqlDbType.TinyInt);
            SqlParameter sp_Document_Record_Id = new SqlParameter("@Document_Record_Id", SqlDbType.Int);
            SqlParameter spIs_Visible_To_Anonymous_Users = new SqlParameter("@Is_Visible_To_Anonymous_Users", SqlDbType.Bit);
            SqlParameter spIs_Available_For_Download_For_Anonymous_Users = new SqlParameter("@Is_Available_For_Download_For_Anonymous_Users", SqlDbType.Bit);
            SqlParameter spIs_Visible_To_Followers_Users = new SqlParameter("@Is_Visible_To_Followers_Users", SqlDbType.Bit);
            SqlParameter spIs_Available_For_Download_For_Followers_Users = new SqlParameter("@Is_Available_For_Download_For_Followers_Users", SqlDbType.Bit);
            SqlParameter spCreating_User_Id = new SqlParameter("@Creating_User_Id", SqlDbType.Int);

            sp_User_Id_Bank_Owner.Value = p_User_Id_Bank_Owner;
            sp_Credit_Card_Statement_Transaction_Id.Value = p_Credit_Card_Statement_Transaction_Id;
            sp_Connection_Type.Value = p_Connection_Type;
            sp_Document_Record_Id.Value = p_Document_Record_Id;
            spIs_Visible_To_Anonymous_Users.Value = p_Is_Visible_To_Anonymous_Users;
            spIs_Available_For_Download_For_Anonymous_Users.Value = p_Is_Available_For_Download_For_Anonymous_Users;
            spIs_Visible_To_Followers_Users.Value = p_Is_Visible_To_Followers_Users;
            spIs_Available_For_Download_For_Followers_Users.Value = p_Is_Available_For_Download_For_Followers_Users;
            spCreating_User_Id.Value = p_Creating_User_Id;

            object new_ccStatement_Transaction_Document_Connection_Id = SQLHelper.ExecuteStoredProcedure_ReturnDataObjectResult(
                "p_TLBoard_Insert_Credit_Card_Statement_Transaction_Document_Connection",
                    new List<SqlParameter>() {
                        sp_User_Id_Bank_Owner,
                        sp_Credit_Card_Statement_Transaction_Id,
                        sp_Connection_Type,
                        sp_Document_Record_Id,
                        spIs_Visible_To_Anonymous_Users,
                        spIs_Available_For_Download_For_Anonymous_Users,
                        spIs_Visible_To_Followers_Users,
                        spIs_Available_For_Download_For_Followers_Users,
                        spCreating_User_Id
                    });

            if (new_ccStatement_Transaction_Document_Connection_Id != null)
            {
                l_New_Document_Connection_Id_To_Return = Convert.ToInt64(new_ccStatement_Transaction_Document_Connection_Id);
            }

            return l_New_Document_Connection_Id_To_Return;
        }

        internal bool Delete_Credit_Card_Statement_Transaction_Document_Connection(
            int p_User_Id_Bank_Owner,
            long p_Document_Connection_Id ,
            int p_Deleting_User_Id )
        {
            bool updated_Successfully = false;

            SqlParameter spUser_Id_Bank_Owner = new SqlParameter("@User_Id_Bank_Owner", SqlDbType.Int);
            SqlParameter spDocument_Connection_Id = new SqlParameter("@Document_Connection_Id", SqlDbType.BigInt);
            SqlParameter spDeleting_User_Id = new SqlParameter("@Deleting_User_Id", SqlDbType.Int);

            spUser_Id_Bank_Owner.Value = p_User_Id_Bank_Owner;
            spDocument_Connection_Id.Value = p_Document_Connection_Id;
            spDeleting_User_Id.Value = p_Deleting_User_Id;

            int affected_Rows = SQLHelper.ExecuteStoredProcedure_ReturnAffectedRowsNumber_WithDefaultAppConfigConnectionString(
                "p_TLBoard_Delete_Credit_Card_Statement_Transaction_Document_Connection",
                    new List<SqlParameter>() {
                        spUser_Id_Bank_Owner, 
                        spDocument_Connection_Id,
                        spDeleting_User_Id
                    });

            if (affected_Rows > 0)
            {
                updated_Successfully = true;
            }

            return updated_Successfully;
        }

    }
}

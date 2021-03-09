using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TimeLineDashboard.Shared.Models;

namespace TimeLineDashboard.DAL.Operations
{
    internal class General_Documents_Operations
    {
        #region Singleton
        private static readonly General_Documents_Operations instance = new General_Documents_Operations();
        // Explicit static constructor to tell C# compiler  
        // not to mark type as beforefieldinit  
        static General_Documents_Operations()
        {
        }
        private General_Documents_Operations()
        {
        }
        public static General_Documents_Operations Instance
        {
            get
            {
                return instance;
            }
        }
        #endregion

        internal List<General_Documents> Get_Search(
            int p_User_Id,
            short? p_Filter_By_Type,
            short? p_Filter_By_Country,
            short? p_Filter_By_State,
            string p_Filter_By_City_Or_Address_Or_ZipCode,
            string p_Filter_By_CompanyName_Or_Person_Fullname)
        {
            List<General_Documents> General_Documents_To_Return = new List<General_Documents>();

            SqlParameter spUser_Id = new SqlParameter("@User_Id", SqlDbType.Int);
            SqlParameter spFilter_By_Type = new SqlParameter("@Filter_By_Type", SqlDbType.SmallInt);
            SqlParameter spFilter_By_Country = new SqlParameter("@Filter_By_Country", SqlDbType.SmallInt);
            SqlParameter spFilter_By_State = new SqlParameter("@Filter_By_State", SqlDbType.SmallInt);
            SqlParameter spFilter_By_City_Or_Address_Or_ZipCode = new SqlParameter("@Filter_By_City_Or_Address_Or_ZipCode", SqlDbType.NVarChar, 50);
            SqlParameter spFilter_By_CompanyName_Or_Person_Fullname = new SqlParameter("@Filter_By_CompanyName_Or_Person_Fullname", SqlDbType.NVarChar, 50);

            spUser_Id.Value = p_User_Id;
            if (p_Filter_By_Type.HasValue)
                spFilter_By_Type.Value = p_Filter_By_Type.Value;
            else
                spFilter_By_Type.Value = DBNull.Value;

            if (p_Filter_By_Country.HasValue)
                spFilter_By_Country.Value = p_Filter_By_Country.Value;
            else
                spFilter_By_Country.Value = DBNull.Value;

            if (p_Filter_By_State.HasValue)
                spFilter_By_State.Value = p_Filter_By_State.Value;
            else
                spFilter_By_State.Value = DBNull.Value;

            spFilter_By_City_Or_Address_Or_ZipCode.Value = p_Filter_By_City_Or_Address_Or_ZipCode;
            spFilter_By_CompanyName_Or_Person_Fullname.Value = p_Filter_By_CompanyName_Or_Person_Fullname;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_General_Documents_Search",
                new List<SqlParameter>() { 
                    spUser_Id,
                    spFilter_By_Type,
                    spFilter_By_Country,
                    spFilter_By_State,
                    spFilter_By_City_Or_Address_Or_ZipCode,
                    spFilter_By_CompanyName_Or_Person_Fullname });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                General_Documents_To_Return = new List<General_Documents>(dataSet.Tables[0].Rows.Count);

                for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                {
                    General_Documents_To_Return.Add(Create_General_Document_Details_From_Data_Row(dataSet.Tables[0].Rows[i]));
                }
            }

            return General_Documents_To_Return;
        }

        internal General_Documents Get_Document_Details_By_Record_Id(
            int p_General_Document_Id,
            int p_User_Id_Document_Owner,
            int p_User_Id_Searching_For_Document_Details)
        {
            General_Documents general_Document_To_Return = null;

            SqlParameter spGeneral_Document_Id = new SqlParameter("@General_Document_Id", SqlDbType.Int);
            SqlParameter spUser_Id_Document_Owner = new SqlParameter("@User_Id_Document_Owner", SqlDbType.Int);
            SqlParameter spUser_Id_Searching_For_Document_Details = new SqlParameter("@User_Id_Searching_For_Document_Details", SqlDbType.Int);

            spGeneral_Document_Id.Value = p_General_Document_Id;
            spUser_Id_Document_Owner.Value = p_User_Id_Document_Owner;
            spUser_Id_Searching_For_Document_Details.Value = p_User_Id_Searching_For_Document_Details;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_General_Document_Details",
                new List<SqlParameter>() { spGeneral_Document_Id, spUser_Id_Document_Owner, spUser_Id_Searching_For_Document_Details });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                general_Document_To_Return = Create_General_Document_Details_From_Data_Row(dataSet.Tables[0].Rows[0]);
            }

            return general_Document_To_Return;
        }

        internal General_Documents Insert_New_General_Document_Details(
            int p_User_Id, short p_General_Document_Type, string p_Title,
            string p_Description, DateTime? p_Document_Creation_DateTime,

            string p_Sent_By_Entity_Name, short? p_Sent_By_Entity_Country_Id,
            short? p_Sent_By_Entity_State_Id, string p_Sent_By_Entity_City,
            string p_Sent_By_Entity_Address, string p_Sent_By_Entity_ZipCode,
            DateTime? p_Sent_By_Entity_DateTime, string p_Sent_By_Entity_Email_Address,

            string p_Sent_To_Entity_Name, short? p_Sent_To_Entity_Country_Id,
            short? p_Sent_To_Entity_State_Id, string p_Sent_To_Entity_City,
            string p_Sent_To_Entity_Address, string p_Sent_To_Entity_ZipCode,
            string p_Sent_To_Entity_Email_Address,

            DateTime? p_Recieved_Document_DateTime,
            short? p_Recieved_In_Country_Id, short? p_Recieved_In_State_Id,
            string p_Recieved_In_City, string p_Recieved_In_Address,
            string p_Recieved_In_ZipCode, string p_Recieved_In_Email_Address,

            string p_User_Comments, int? p_Recieved_By_User_Id, DateTime? p_Recieved_DateTime,
            string p_Original_File_Name, string p_Azure_Block_Blob_Reference,
            bool p_Is_Visible_To_Anonymous_Users, bool p_Is_Available_For_Download_For_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users, bool p_Is_Available_For_Download_For_Followers_Users,
            int p_Record_Created_By_User_Id, DateTime p_Record_Creation_DateTime_UTC,
            int p_Record_Last_Updated_By_User_Id, DateTime p_Record_Last_Updated_DateTime_UTC,
            bool p_Is_Active)
        {
            General_Documents new_Registered_Entity_To_Return = null;

            SqlParameter spUser_Id = new SqlParameter("@User_Id", SqlDbType.Int);
            SqlParameter spGeneral_Document_Type = new SqlParameter("@General_Document_Type", SqlDbType.SmallInt);
            SqlParameter spTitle = new SqlParameter("@Title", SqlDbType.NVarChar, 200);
            SqlParameter spDescription = new SqlParameter("@Description", SqlDbType.NVarChar, 1500);
            SqlParameter spDocument_Creation_DateTime = new SqlParameter("@Document_Creation_DateTime", SqlDbType.DateTime);

            SqlParameter spSent_By_Entity_Name = new SqlParameter("@Sent_By_Entity_Name", SqlDbType.NVarChar, 100);
            SqlParameter spSent_By_Entity_Country_Id = new SqlParameter("@Sent_By_Entity_Country_Id", SqlDbType.SmallInt);
            SqlParameter spSent_By_Entity_State_Id = new SqlParameter("@Sent_By_Entity_State_Id", SqlDbType.SmallInt);
            SqlParameter spSent_By_Entity_City = new SqlParameter("@Sent_By_Entity_City", SqlDbType.NVarChar, 100);
            SqlParameter spSent_By_Entity_Address = new SqlParameter("@Sent_By_Entity_Address", SqlDbType.NVarChar, 150);
            SqlParameter spSent_By_Entity_ZipCode = new SqlParameter("@Sent_By_Entity_ZipCode", SqlDbType.NVarChar, 20);
            SqlParameter spSent_By_Entity_DateTime = new SqlParameter("@Sent_By_Entity_DateTime", SqlDbType.DateTime);
            SqlParameter spSent_By_Entity_Email_Address = new SqlParameter("@Sent_By_Entity_Email_Address", SqlDbType.NVarChar, 100);

            SqlParameter spSent_To_Entity_Name = new SqlParameter("@Sent_To_Entity_Name", SqlDbType.NVarChar, 100);
            SqlParameter spSent_To_Entity_Country_Id = new SqlParameter("@Sent_To_Entity_Country_Id", SqlDbType.SmallInt);
            SqlParameter spSent_To_Entity_State_Id = new SqlParameter("@Sent_To_Entity_State_Id", SqlDbType.SmallInt);
            SqlParameter spSent_To_Entity_City = new SqlParameter("@Sent_To_Entity_City", SqlDbType.NVarChar, 100);
            SqlParameter spSent_To_Entity_Address = new SqlParameter("@Sent_To_Entity_Address", SqlDbType.NVarChar, 150);
            SqlParameter spSent_To_Entity_ZipCode = new SqlParameter("@Sent_To_Entity_ZipCode", SqlDbType.NVarChar, 20);
            SqlParameter spSent_To_Entity_Email_Address = new SqlParameter("@Sent_To_Entity_Email_Address", SqlDbType.NVarChar, 150);

            SqlParameter spRecieved_Document_DateTime = new SqlParameter("@Recieved_Document_DateTime", SqlDbType.DateTime);
            SqlParameter spRecieved_In_Country_Id = new SqlParameter("@Recieved_In_Country_Id", SqlDbType.SmallInt);
            SqlParameter spRecieved_In_State_Id = new SqlParameter("@Recieved_In_State_Id", SqlDbType.SmallInt);
            SqlParameter spRecieved_In_City = new SqlParameter("@Recieved_In_City", SqlDbType.NVarChar, 100);
            SqlParameter spRecieved_In_Address = new SqlParameter("@Recieved_In_Address", SqlDbType.NVarChar, 150);
            SqlParameter spRecieved_In_ZipCode = new SqlParameter("@Recieved_In_ZipCode", SqlDbType.NVarChar, 20);
            SqlParameter spRecieved_In_Email_Address = new SqlParameter("@Recieved_In_Email_Address", SqlDbType.NVarChar, 100);
            SqlParameter spUser_Comments = new SqlParameter("@User_Comments", SqlDbType.NVarChar, 500);
            SqlParameter spRecieved_By_User_Id = new SqlParameter("@Recieved_By_User_Id", SqlDbType.Int);
            SqlParameter spRecieved_DateTime = new SqlParameter("@Recieved_DateTime", SqlDbType.DateTime);

            SqlParameter spOriginal_File_Name = new SqlParameter("@Original_File_Name", SqlDbType.NVarChar, 255);
            SqlParameter spAzure_Block_Blob_Reference = new SqlParameter("@Azure_Block_Blob_Reference", SqlDbType.NVarChar, 255);

            SqlParameter spIs_Visible_To_Anonymous_Users = new SqlParameter("@Is_Visible_To_Anonymous_Users", SqlDbType.Bit);
            SqlParameter spIs_Available_For_Download_For_Anonymous_Users = new SqlParameter("@Is_Available_For_Download_For_Anonymous_Users", SqlDbType.Bit);
            SqlParameter spIs_Visible_To_Followers_Users = new SqlParameter("@Is_Visible_To_Followers_Users", SqlDbType.Bit);
            SqlParameter spIs_Available_For_Download_For_Followers_Users = new SqlParameter("@Is_Available_For_Download_For_Followers_Users", SqlDbType.Bit);

            SqlParameter spRecord_Created_By_User_Id = new SqlParameter("@Record_Created_By_User_Id", SqlDbType.Int);
            SqlParameter spRecord_Creation_DateTime_UTC = new SqlParameter("@Record_Creation_DateTime_UTC", SqlDbType.DateTime);
            SqlParameter spRecord_Last_Updated_By_User_Id = new SqlParameter("@Record_Last_Updated_By_User_Id", SqlDbType.Int);
            SqlParameter spRecord_Last_Updated_DateTime_UTC = new SqlParameter("@Record_Last_Updated_DateTime_UTC", SqlDbType.DateTime);
            SqlParameter spIs_Active = new SqlParameter("@Is_Active", SqlDbType.Bit);

            spUser_Id.Value = p_User_Id;
            spGeneral_Document_Type.Value = p_General_Document_Type;
            spTitle.Value = p_Title;
            spDescription.Value = p_Description;

            if (p_Document_Creation_DateTime.HasValue)
                spDocument_Creation_DateTime.Value = p_Document_Creation_DateTime.Value;
            else
                spDocument_Creation_DateTime.Value = DBNull.Value;

            spSent_By_Entity_Name.Value = p_Sent_By_Entity_Name;
            if (p_Sent_By_Entity_Country_Id.HasValue)
                spSent_By_Entity_Country_Id.Value = p_Sent_By_Entity_Country_Id;
            else
                spSent_By_Entity_Country_Id.Value = DBNull.Value;
            if (p_Sent_By_Entity_State_Id.HasValue)
                spSent_By_Entity_State_Id.Value = p_Sent_By_Entity_State_Id;
            else
                spSent_By_Entity_State_Id.Value = DBNull.Value;
            spSent_By_Entity_City.Value = p_Sent_By_Entity_City;
            spSent_By_Entity_Address.Value = p_Sent_By_Entity_Address;
            spSent_By_Entity_ZipCode.Value = p_Sent_By_Entity_ZipCode;

            if (p_Sent_By_Entity_DateTime.HasValue)
                spSent_By_Entity_DateTime.Value = p_Sent_By_Entity_DateTime.Value;
            else
                spSent_By_Entity_DateTime.Value = DBNull.Value;

            spSent_By_Entity_Email_Address.Value = p_Sent_By_Entity_Email_Address;

            spSent_To_Entity_Name.Value = p_Sent_To_Entity_Name;
            if (p_Sent_To_Entity_Country_Id.HasValue)
                spSent_To_Entity_Country_Id.Value = p_Sent_To_Entity_Country_Id;
            else
                spSent_To_Entity_Country_Id.Value = DBNull.Value;
            if (p_Sent_To_Entity_State_Id.HasValue)
                spSent_To_Entity_State_Id.Value = p_Sent_To_Entity_State_Id;
            else
                spSent_To_Entity_State_Id.Value = DBNull.Value;
            spSent_To_Entity_City.Value = p_Sent_To_Entity_City;
            spSent_To_Entity_Address.Value = p_Sent_To_Entity_Address;
            spSent_To_Entity_ZipCode.Value = p_Sent_To_Entity_ZipCode;
            spSent_To_Entity_Email_Address.Value = p_Sent_To_Entity_Email_Address;

            spRecieved_Document_DateTime.Value = p_Recieved_Document_DateTime;
            if (p_Recieved_In_Country_Id.HasValue)
                spRecieved_In_Country_Id.Value = p_Recieved_In_Country_Id;
            else
                spRecieved_In_Country_Id.Value = DBNull.Value;
            if (p_Recieved_In_State_Id.HasValue)
                spRecieved_In_State_Id.Value = p_Recieved_In_State_Id;
            else
                spRecieved_In_State_Id.Value = DBNull.Value;
            spRecieved_In_City.Value = p_Recieved_In_City;
            spRecieved_In_Address.Value = p_Recieved_In_Address;
            spRecieved_In_ZipCode.Value = p_Recieved_In_ZipCode;
            spRecieved_In_Email_Address.Value = p_Recieved_In_Email_Address;
            spUser_Comments.Value = p_User_Comments;
            if (p_Recieved_By_User_Id.HasValue)
                spRecieved_By_User_Id.Value = p_Recieved_By_User_Id;
            else
                spRecieved_By_User_Id.Value = DBNull.Value;
            spRecieved_DateTime.Value = p_Recieved_DateTime;

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

            object new_General_Document_Id = SQLHelper.ExecuteStoredProcedure_ReturnDataObjectResult("p_TLBoard_Insert_General_Document_Details",
                new List<SqlParameter>() {
                    spUser_Id , spGeneral_Document_Type,
                    spTitle, spDescription, spDocument_Creation_DateTime,

                    spSent_By_Entity_Name, spSent_By_Entity_Country_Id,
                    spSent_By_Entity_State_Id, spSent_By_Entity_City,
                    spSent_By_Entity_Address, spSent_By_Entity_ZipCode,
                    spSent_By_Entity_DateTime, spSent_By_Entity_Email_Address,

                    spSent_To_Entity_Name,  spSent_To_Entity_Country_Id,
                    spSent_To_Entity_State_Id, spSent_To_Entity_City,
                    spSent_To_Entity_Address, spSent_To_Entity_ZipCode,
                    spSent_To_Entity_Email_Address,

                    spRecieved_Document_DateTime,  spRecieved_In_Country_Id,
                    spRecieved_In_State_Id, spRecieved_In_City,
                    spRecieved_In_Address, spRecieved_In_ZipCode,
                    spRecieved_In_Email_Address,

                    spUser_Comments, spRecieved_By_User_Id,
                    spRecieved_DateTime,

                    spOriginal_File_Name, spAzure_Block_Blob_Reference,
                    spIs_Visible_To_Anonymous_Users, spIs_Available_For_Download_For_Anonymous_Users,
                    spIs_Visible_To_Followers_Users, spIs_Available_For_Download_For_Followers_Users,
                    spRecord_Created_By_User_Id, spRecord_Creation_DateTime_UTC,
                    spRecord_Last_Updated_By_User_Id, spRecord_Last_Updated_DateTime_UTC,
                    spIs_Active
        });

            if (new_General_Document_Id != null)
            {
                int General_Document_Id_Registered = Convert.ToInt32(new_General_Document_Id);
                if (General_Document_Id_Registered > 0)
                {
                    new_Registered_Entity_To_Return = Get_Document_Details_By_Record_Id(General_Document_Id_Registered, p_User_Id, p_Record_Created_By_User_Id);
                }
            }

            return new_Registered_Entity_To_Return;
        }

        internal bool Update_General_Document_Details(
            int p_General_Document_Id, short p_General_Document_Type, string p_Title,
            string p_Description, DateTime? p_Document_Creation_DateTime,
            string p_Sent_By_Entity_Name, short? p_Sent_By_Entity_Country_Id,
            short? p_Sent_By_Entity_State_Id, string p_Sent_By_Entity_City,
            string p_Sent_By_Entity_Address, string p_Sent_By_Entity_ZipCode,
            DateTime? p_Sent_By_Entity_DateTime, string p_Sent_By_Entity_Email_Address,
            string p_Sent_To_Entity_Name, short? p_Sent_To_Entity_Country_Id,
            short? p_Sent_To_Entity_State_Id, string p_Sent_To_Entity_City,
            string p_Sent_To_Entity_Address, string p_Sent_To_Entity_ZipCode,
            string p_Sent_To_Entity_Email_Address, DateTime? p_Recieved_Document_DateTime,
            short? p_Recieved_In_Country_Id, short? p_Recieved_In_State_Id,
            string p_Recieved_In_City, string p_Recieved_In_Address,
            string p_Recieved_In_ZipCode, string p_Recieved_In_Email_Address,
            string p_User_Comments, int? p_Recieved_By_User_Id, DateTime? p_Recieved_DateTime,
            bool p_Is_Visible_To_Anonymous_Users, bool p_Is_Available_For_Download_For_Anonymous_Users,
            bool p_Is_Visible_To_Followers_Users, bool p_Is_Available_For_Download_For_Followers_Users,
            bool p_Is_Active, int p_Updating_User_Id)
        {
            bool updated_Successfully = false;

            SqlParameter spGeneral_Document_Id = new SqlParameter("@General_Document_Id", SqlDbType.Int);
            SqlParameter spGeneral_Document_Type = new SqlParameter("@General_Document_Type", SqlDbType.SmallInt);
            SqlParameter spTitle = new SqlParameter("@Title", SqlDbType.NVarChar, 200);
            SqlParameter spDescription = new SqlParameter("@Description", SqlDbType.NVarChar, 1500);
            SqlParameter spDocument_Creation_DateTime = new SqlParameter("@Document_Creation_DateTime", SqlDbType.DateTime);

            SqlParameter spSent_By_Entity_Name = new SqlParameter("@Sent_By_Entity_Name", SqlDbType.NVarChar, 100);
            SqlParameter spSent_By_Entity_Country_Id = new SqlParameter("@Sent_By_Entity_Country_Id", SqlDbType.SmallInt);
            SqlParameter spSent_By_Entity_State_Id = new SqlParameter("@Sent_By_Entity_State_Id", SqlDbType.SmallInt);
            SqlParameter spSent_By_Entity_City = new SqlParameter("@Sent_By_Entity_City", SqlDbType.NVarChar, 100);
            SqlParameter spSent_By_Entity_Address = new SqlParameter("@Sent_By_Entity_Address", SqlDbType.NVarChar, 150);
            SqlParameter spSent_By_Entity_ZipCode = new SqlParameter("@Sent_By_Entity_ZipCode", SqlDbType.NVarChar, 20);
            SqlParameter spSent_By_Entity_DateTime = new SqlParameter("@Sent_By_Entity_DateTime", SqlDbType.DateTime);
            SqlParameter spSent_By_Entity_Email_Address = new SqlParameter("@Sent_By_Entity_Email_Address", SqlDbType.NVarChar, 100);

            SqlParameter spSent_To_Entity_Name = new SqlParameter("@Sent_To_Entity_Name", SqlDbType.NVarChar, 100);
            SqlParameter spSent_To_Entity_Country_Id = new SqlParameter("@Sent_To_Entity_Country_Id", SqlDbType.SmallInt);
            SqlParameter spSent_To_Entity_State_Id = new SqlParameter("@Sent_To_Entity_State_Id", SqlDbType.SmallInt);
            SqlParameter spSent_To_Entity_City = new SqlParameter("@Sent_To_Entity_City", SqlDbType.NVarChar, 100);
            SqlParameter spSent_To_Entity_Address = new SqlParameter("@Sent_To_Entity_Address", SqlDbType.NVarChar, 150);
            SqlParameter spSent_To_Entity_ZipCode = new SqlParameter("@Sent_To_Entity_ZipCode", SqlDbType.NVarChar, 20);
            SqlParameter spSent_To_Entity_Email_Address = new SqlParameter("@Sent_To_Entity_Email_Address", SqlDbType.NVarChar, 150);

            SqlParameter spRecieved_Document_DateTime = new SqlParameter("@Recieved_Document_DateTime", SqlDbType.DateTime);
            SqlParameter spRecieved_In_Country_Id = new SqlParameter("@Recieved_In_Country_Id", SqlDbType.SmallInt);
            SqlParameter spRecieved_In_State_Id = new SqlParameter("@Recieved_In_State_Id", SqlDbType.SmallInt);
            SqlParameter spRecieved_In_City = new SqlParameter("@Recieved_In_City", SqlDbType.NVarChar, 100);
            SqlParameter spRecieved_In_Address = new SqlParameter("@Recieved_In_Address", SqlDbType.NVarChar, 150);
            SqlParameter spRecieved_In_ZipCode = new SqlParameter("@Recieved_In_ZipCode", SqlDbType.NVarChar, 20);
            SqlParameter spRecieved_In_Email_Address = new SqlParameter("@Recieved_In_Email_Address", SqlDbType.NVarChar, 100);
            SqlParameter spUser_Comments = new SqlParameter("@User_Comments", SqlDbType.NVarChar, 500);
            SqlParameter spRecieved_By_User_Id = new SqlParameter("@Recieved_By_User_Id", SqlDbType.Int);
            SqlParameter spRecieved_DateTime = new SqlParameter("@Recieved_DateTime", SqlDbType.DateTime);

            SqlParameter spIs_Visible_To_Anonymous_Users = new SqlParameter("@Is_Visible_To_Anonymous_Users", SqlDbType.Bit);
            SqlParameter spIs_Available_For_Download_For_Anonymous_Users = new SqlParameter("@Is_Available_For_Download_For_Anonymous_Users", SqlDbType.Bit);
            SqlParameter spIs_Visible_To_Followers_Users = new SqlParameter("@Is_Visible_To_Followers_Users", SqlDbType.Bit);
            SqlParameter spIs_Available_For_Download_For_Followers_Users = new SqlParameter("@Is_Available_For_Download_For_Followers_Users", SqlDbType.Bit);

            SqlParameter spIs_Active = new SqlParameter("@Is_Active", SqlDbType.Bit);
            SqlParameter spUpdating_User_Id = new SqlParameter("@Updating_User_Id", SqlDbType.Int);

            spGeneral_Document_Id.Value = p_General_Document_Id;
            spGeneral_Document_Type.Value = p_General_Document_Type;
            spTitle.Value = p_Title;
            spDescription.Value = p_Description;

            if (p_Document_Creation_DateTime.HasValue)
                spDocument_Creation_DateTime.Value = p_Document_Creation_DateTime.Value;
            else
                spDocument_Creation_DateTime.Value = DBNull.Value;

            spSent_By_Entity_Name.Value = p_Sent_By_Entity_Name;
            if (p_Sent_By_Entity_Country_Id.HasValue)
                spSent_By_Entity_Country_Id.Value = p_Sent_By_Entity_Country_Id;
            else
                spSent_By_Entity_Country_Id.Value = DBNull.Value;
            if (p_Sent_By_Entity_State_Id.HasValue)
                spSent_By_Entity_State_Id.Value = p_Sent_By_Entity_State_Id;
            else
                spSent_By_Entity_State_Id.Value = DBNull.Value;
            spSent_By_Entity_City.Value = p_Sent_By_Entity_City;
            spSent_By_Entity_Address.Value = p_Sent_By_Entity_Address;
            spSent_By_Entity_ZipCode.Value = p_Sent_By_Entity_ZipCode;

            if (p_Sent_By_Entity_DateTime.HasValue)
                spSent_By_Entity_DateTime.Value = p_Sent_By_Entity_DateTime.Value;
            else
                spSent_By_Entity_DateTime.Value = DBNull.Value;

            spSent_By_Entity_Email_Address.Value = p_Sent_By_Entity_Email_Address;

            spSent_To_Entity_Name.Value = p_Sent_To_Entity_Name;
            if (p_Sent_To_Entity_Country_Id.HasValue)
                spSent_To_Entity_Country_Id.Value = p_Sent_To_Entity_Country_Id;
            else
                spSent_To_Entity_Country_Id.Value = DBNull.Value;
            if (p_Sent_To_Entity_State_Id.HasValue)
                spSent_To_Entity_State_Id.Value = p_Sent_To_Entity_State_Id;
            else
                spSent_To_Entity_State_Id.Value = DBNull.Value;
            spSent_To_Entity_City.Value = p_Sent_To_Entity_City;
            spSent_To_Entity_Address.Value = p_Sent_To_Entity_Address;
            spSent_To_Entity_ZipCode.Value = p_Sent_To_Entity_ZipCode;
            spSent_To_Entity_Email_Address.Value = p_Sent_To_Entity_Email_Address;

            spRecieved_Document_DateTime.Value = p_Recieved_Document_DateTime;
            if (p_Recieved_In_Country_Id.HasValue)
                spRecieved_In_Country_Id.Value = p_Recieved_In_Country_Id;
            else
                spRecieved_In_Country_Id.Value = DBNull.Value;
            if (p_Recieved_In_State_Id.HasValue)
                spRecieved_In_State_Id.Value = p_Recieved_In_State_Id;
            else
                spRecieved_In_State_Id.Value = DBNull.Value;
            spRecieved_In_City.Value = p_Recieved_In_City;
            spRecieved_In_Address.Value = p_Recieved_In_Address;
            spRecieved_In_ZipCode.Value = p_Recieved_In_ZipCode;
            spRecieved_In_Email_Address.Value = p_Recieved_In_Email_Address;
            spUser_Comments.Value = p_User_Comments;
            if (p_Recieved_By_User_Id.HasValue)
                spRecieved_By_User_Id.Value = p_Recieved_By_User_Id;
            else
                spRecieved_By_User_Id.Value = DBNull.Value;
            spRecieved_DateTime.Value = p_Recieved_DateTime;

            spIs_Visible_To_Anonymous_Users.Value = p_Is_Visible_To_Anonymous_Users;
            spIs_Available_For_Download_For_Anonymous_Users.Value = p_Is_Available_For_Download_For_Anonymous_Users;
            spIs_Visible_To_Followers_Users.Value = p_Is_Visible_To_Followers_Users;
            spIs_Available_For_Download_For_Followers_Users.Value = p_Is_Available_For_Download_For_Followers_Users;

            spIs_Active.Value = p_Is_Active;
            spUpdating_User_Id.Value = p_Updating_User_Id;

            int affected_Rows = SQLHelper.ExecuteStoredProcedure_ReturnAffectedRowsNumber_WithDefaultAppConfigConnectionString("p_TLBoard_Update_General_Document_Details",
                new List<SqlParameter>() {
                    spGeneral_Document_Id , spGeneral_Document_Type,
                    spTitle, spDescription, spDocument_Creation_DateTime,
                    spSent_By_Entity_Name, spSent_By_Entity_Country_Id,
                    spSent_By_Entity_State_Id, spSent_By_Entity_City,
                    spSent_By_Entity_Address, spSent_By_Entity_ZipCode,
                    spSent_By_Entity_DateTime, spSent_By_Entity_Email_Address,
                    spSent_To_Entity_Name,  spSent_To_Entity_Country_Id,
                    spSent_To_Entity_State_Id, spSent_To_Entity_City,
                    spSent_To_Entity_Address, spSent_To_Entity_ZipCode,
                    spSent_To_Entity_Email_Address,
                    spRecieved_Document_DateTime,  spRecieved_In_Country_Id,
                    spRecieved_In_State_Id, spRecieved_In_City,
                    spRecieved_In_Address, spRecieved_In_ZipCode,
                    spRecieved_In_Email_Address,
                    spUser_Comments, spRecieved_By_User_Id, spRecieved_DateTime,
                    spIs_Visible_To_Anonymous_Users, spIs_Available_For_Download_For_Anonymous_Users,
                    spIs_Visible_To_Followers_Users, spIs_Available_For_Download_For_Followers_Users,
                    spIs_Active, spUpdating_User_Id });

            if (affected_Rows > 0)
            {
                updated_Successfully = true;
            }

            return updated_Successfully;
        }

        private General_Documents Create_General_Document_Details_From_Data_Row(DataRow dataRow)
        {
            General_Documents General_Document_To_Return = new General_Documents();

            General_Document_To_Return.General_Document_Id = (int)dataRow["General_Document_Id"];
            General_Document_To_Return.User_Id = (int)dataRow["User_Id"];
            if (dataRow["General_Document_Type"] != DBNull.Value)
            {
                General_Document_To_Return.General_Document_Type = (short)dataRow["General_Document_Type"];
            }
            General_Document_To_Return.Title = dataRow["Title"].ToString();
            General_Document_To_Return.Description = dataRow["Description"].ToString();

            if (dataRow["Document_Creation_DateTime"] != DBNull.Value)
                General_Document_To_Return.Document_Creation_DateTime = (DateTime)dataRow["Document_Creation_DateTime"];

            General_Document_To_Return.Sent_By_Entity_Name = dataRow["Sent_By_Entity_Name"].ToString();
            if (dataRow["Sent_By_Entity_Country_Id"] != DBNull.Value)
            {
                General_Document_To_Return.Sent_By_Entity_Country_Id = (short)dataRow["Sent_By_Entity_Country_Id"];
                if (dataRow.Table.Columns.IndexOf("Sent_By_Entity_Country_Name") > -1)
                {
                    General_Document_To_Return.Sent_By_Entity_Country_Name = dataRow["Sent_By_Entity_Country_Name"].ToString();
                }

                if (dataRow["Sent_By_Entity_State_Id"] != DBNull.Value)
                {
                    General_Document_To_Return.Sent_By_Entity_State_Id = (short)dataRow["Sent_By_Entity_State_Id"];
                }
            }
            General_Document_To_Return.Sent_By_Entity_City = dataRow["Sent_By_Entity_City"].ToString();
            if (dataRow.Table.Columns.IndexOf("Sent_By_Entity_Address") > -1)
            {
                General_Document_To_Return.Sent_By_Entity_Address = dataRow["Sent_By_Entity_Address"].ToString();
                General_Document_To_Return.Sent_By_Entity_ZipCode = dataRow["Sent_By_Entity_ZipCode"].ToString();
            }

            if (dataRow.Table.Columns.IndexOf("Sent_By_Entity_DateTime") > -1)
            {
                if (dataRow["Sent_By_Entity_DateTime"] != DBNull.Value)
                {
                    General_Document_To_Return.Sent_By_Entity_DateTime = (DateTime)dataRow["Sent_By_Entity_DateTime"];
                }
            }

            if (dataRow.Table.Columns.IndexOf("Sent_By_Entity_Email_Address") > -1)
            {
                General_Document_To_Return.Sent_By_Entity_Email_Address = dataRow["Sent_By_Entity_Email_Address"].ToString();
            }

            if (dataRow.Table.Columns.IndexOf("Sent_To_Entity_Name") > -1)
            {

                General_Document_To_Return.Sent_To_Entity_Name = dataRow["Sent_To_Entity_Name"].ToString();
                if (dataRow["Sent_To_Entity_Country_Id"] != DBNull.Value)
                {
                    General_Document_To_Return.Sent_To_Entity_Country_Id = (short)dataRow["Sent_To_Entity_Country_Id"];
                    if (dataRow["Sent_To_Entity_State_Id"] != DBNull.Value)
                    {
                        General_Document_To_Return.Sent_To_Entity_State_Id = (short)dataRow["Sent_To_Entity_State_Id"];
                    }
                }
                General_Document_To_Return.Sent_To_Entity_City = dataRow["Sent_To_Entity_City"].ToString();
                General_Document_To_Return.Sent_To_Entity_Address = dataRow["Sent_To_Entity_Address"].ToString();
                General_Document_To_Return.Sent_To_Entity_ZipCode = dataRow["Sent_To_Entity_ZipCode"].ToString();
                General_Document_To_Return.Sent_To_Entity_Email_Address = dataRow["Sent_To_Entity_Email_Address"].ToString();
            }

            if (dataRow.Table.Columns.IndexOf("Recieved_Document_DateTime") > -1)
            {
                if (dataRow["Recieved_Document_DateTime"] != DBNull.Value)
                {
                    General_Document_To_Return.Recieved_Document_DateTime = (DateTime)dataRow["Recieved_Document_DateTime"];
                }
            }

            if (dataRow.Table.Columns.IndexOf("Recieved_In_Country_Id") > -1)
            {
                if (dataRow["Recieved_In_Country_Id"] != DBNull.Value)
                {
                    General_Document_To_Return.Recieved_In_Country_Id = (short)dataRow["Recieved_In_Country_Id"];
                    if (dataRow["Recieved_In_State_Id"] != DBNull.Value)
                    {
                        General_Document_To_Return.Recieved_In_State_Id = (short)dataRow["Recieved_In_State_Id"];
                    }
                }
            }

            if (dataRow.Table.Columns.IndexOf("Recieved_In_City") > -1)
            {
                General_Document_To_Return.Recieved_In_City = dataRow["Recieved_In_City"].ToString();
                General_Document_To_Return.Recieved_In_Address = dataRow["Recieved_In_Address"].ToString();
                General_Document_To_Return.Recieved_In_ZipCode = dataRow["Recieved_In_ZipCode"].ToString();
                General_Document_To_Return.Recieved_In_Email_Address = dataRow["Recieved_In_Email_Address"].ToString();
            }

            if (dataRow.Table.Columns.IndexOf("User_Comments") > -1)
            {
                General_Document_To_Return.User_Comments = dataRow["User_Comments"].ToString();
            }

            if (dataRow.Table.Columns.IndexOf("Recieved_By_User_Id") > -1)
            {
                if (dataRow["Recieved_By_User_Id"] != DBNull.Value)
                {
                    General_Document_To_Return.Recieved_By_User_Id = (int)dataRow["Recieved_By_User_Id"];
                }
            }

            if (dataRow.Table.Columns.IndexOf("Recieved_DateTime") > -1)
            {
                if (dataRow["Recieved_DateTime"] != DBNull.Value)
                {
                    General_Document_To_Return.Recieved_DateTime = (DateTime)dataRow["Recieved_DateTime"];
                }
            }

            if (dataRow.Table.Columns.IndexOf("Original_File_Name") > -1)
            {
                General_Document_To_Return.Original_File_Name = dataRow["Original_File_Name"].ToString();
                General_Document_To_Return.Azure_Block_Blob_Reference = dataRow["Azure_Block_Blob_Reference"].ToString();
            }

            General_Document_To_Return.Is_Visible_To_Anonymous_Users = (bool)dataRow["Is_Visible_To_Anonymous_Users"];
            General_Document_To_Return.Is_Available_For_Download_For_Anonymous_Users = (bool)dataRow["Is_Available_For_Download_For_Anonymous_Users"];
            General_Document_To_Return.Is_Visible_To_Followers_Users = (bool)dataRow["Is_Visible_To_Followers_Users"];
            General_Document_To_Return.Is_Available_For_Download_For_Followers_Users = (bool)dataRow["Is_Available_For_Download_For_Followers_Users"];
            General_Document_To_Return.Is_Active = (bool)dataRow["Is_Active"];

            if (dataRow.Table.Columns.IndexOf("Record_Created_By_User_Id") > -1)
            {
                General_Document_To_Return.Record_Created_By_User_Id = (int)dataRow["Record_Created_By_User_Id"];
                if (dataRow.Table.Columns.IndexOf("Created_By_First_Name") > -1)
                {
                    General_Document_To_Return.Record_Created_By_User_Details = new Users();
                    General_Document_To_Return.Record_Created_By_User_Details.First_Name = dataRow["Created_By_First_Name"].ToString();
                    General_Document_To_Return.Record_Created_By_User_Details.Last_Name = dataRow["Created_By_Last_Name"].ToString();
                }
                General_Document_To_Return.Record_Creation_DateTime_UTC = (DateTime)dataRow["Record_Creation_DateTime_UTC"];
                General_Document_To_Return.Record_Last_Updated_By_User_Id = (int)dataRow["Record_Last_Updated_By_User_Id"];
                if (dataRow.Table.Columns.IndexOf("Last_Updated_By_First_Name") > -1)
                {
                    General_Document_To_Return.Record_Last_Updated_By_User_Details = new Users();
                    General_Document_To_Return.Record_Last_Updated_By_User_Details.First_Name = dataRow["Last_Updated_By_First_Name"].ToString();
                    General_Document_To_Return.Record_Last_Updated_By_User_Details.Last_Name = dataRow["Last_Updated_By_Last_Name"].ToString();
                }
                General_Document_To_Return.Record_Last_Updated_DateTime_UTC = (DateTime)dataRow["Record_Last_Updated_DateTime_UTC"];
            }

            return General_Document_To_Return;
        }

    }
}

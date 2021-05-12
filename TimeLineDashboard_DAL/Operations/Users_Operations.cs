using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TimeLineDashboard.Shared.Models;

namespace TimeLineDashboard.DAL.Operations
{
    internal class Users_Operations
    {
        #region Singleton
        private static readonly Users_Operations instance = new Users_Operations();
        // Explicit static constructor to tell C# compiler  
        // not to mark type as beforefieldinit  
        static Users_Operations()
        {
        }
        private Users_Operations()
        {
        }
        public static Users_Operations Instance
        {
            get
            {
                return instance;
            }
        }
        #endregion

        internal List<Users> Get_Users_Search( string p_Search_Criteria )
        {
            List<Users> usersToReturn = new List<Users>();

            SqlParameter spSearch_Criteria = new SqlParameter("@Search_Criteria", SqlDbType.NVarChar, 50);
            spSearch_Criteria.Value = p_Search_Criteria;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Users_Search", 
                new List<SqlParameter>() { spSearch_Criteria });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                usersToReturn = new List<Users>(dataSet.Tables[0].Rows.Count);

                for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                {
                    usersToReturn.Add(CreateUserDetailsFromDataRow(dataSet.Tables[0].Rows[i]));
                }
            }

            return usersToReturn;
        }

        internal Users Get_User_Details_By_User_Id(int p_User_Id, int p_Authenticated_User_Id)
        {
            Users usersToReturn = new Users();

            SqlParameter spUser_Id = new SqlParameter("@user_Id", SqlDbType.Int);
            spUser_Id.Value = p_User_Id;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_User_Details",
                new List<SqlParameter>() { spUser_Id });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                usersToReturn = CreateUserDetailsFromDataRow(dataSet.Tables[0].Rows[0]); 
            }

            return usersToReturn;
        }

        internal bool Delete_User_By_User_Id(int p_User_Id_To_Delete, string p_Delete_Reason , int p_Deleted_By_User_Id)
        {
            Users usersToReturn = new Users();

            SqlParameter spUser_Id_To_Delete = new SqlParameter("@User_Id_To_Delete", SqlDbType.Int);
            SqlParameter spDelete_Reason = new SqlParameter("@Delete_Reason", SqlDbType.NVarChar , 500);
            SqlParameter spDeleted_By_User_Id = new SqlParameter("@Deleted_By_User_Id", SqlDbType.Int);

            spUser_Id_To_Delete.Value = p_User_Id_To_Delete;
            spDelete_Reason.Value = p_Delete_Reason;
            spDeleted_By_User_Id.Value = p_Deleted_By_User_Id;

            int affected_Rows = SQLHelper.ExecuteStoredProcedure_ReturnAffectedRowsNumber_WithDefaultAppConfigConnectionString("p_TLBoard_Delete_User_By_Id_Administrative_Side",
                new List<SqlParameter>() { spUser_Id_To_Delete, spDelete_Reason, spDeleted_By_User_Id });

            return affected_Rows > 0;
        }

        internal List<Users> Get_Users_Administration_List(int p_User_Id_Authorized_Employee_Searching_Users)
        {
            List<Users> usersToReturn = new List<Users>();

            SqlParameter spUser_Id_Authorized_Employee_Searching_Users = new SqlParameter("@User_Id_Authorized_Employee_Searching_Users", SqlDbType.NVarChar, 50);
            spUser_Id_Authorized_Employee_Searching_Users.Value = p_User_Id_Authorized_Employee_Searching_Users;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Users_Administration_List",
                new List<SqlParameter>() { spUser_Id_Authorized_Employee_Searching_Users });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                usersToReturn = new List<Users>(dataSet.Tables[0].Rows.Count);

                for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                {
                    usersToReturn.Add(CreateUserBasicDetailsFromDataRow(dataSet.Tables[0].Rows[i]));
                }
            }

            return usersToReturn;
        }

        internal Users Insert_New_User_Administrative_Registration_Process(
            string p_Username, 
            string p_Encrypted_Password, 
            string p_Encryption_Random_Salt, 
            byte p_App_Permission_Type_Id,
            string p_First_Name, 
            string p_Middle_Name, 
            string p_Last_Name, 
            string p_Email, 
            short p_Country_Id, 
            short? p_State_Id, 
            string p_City, 
            string p_Address, 
            string p_ZipCode,
            byte? p_Default_Currency_Id,
            string p_Mobile_Phone, 
            string p_Additional_Phone_Number,
            DateTime p_BirthDate,
            byte p_Gender,
            string p_Heard_About_Application_From,
            string p_Our_Administrative_Side_Notes,
            int p_Logged_In_Administrative_User_Id)
        {
            Users new_Registered_User_To_Return = null;

            SqlParameter spUsername = new SqlParameter("@Username", SqlDbType.VarChar, 50);
            SqlParameter spEncrypted_Password = new SqlParameter("@Encrypted_Password", SqlDbType.VarChar, 120);
            SqlParameter spEncryption_Random_Salt = new SqlParameter("@Encryption_Random_Salt", SqlDbType.VarChar, 50);
            SqlParameter spApp_Permission_Type_Id = new SqlParameter("@App_Permission_Type_Id", SqlDbType.TinyInt);
            SqlParameter spFirst_Name = new SqlParameter("@First_Name", SqlDbType.NVarChar, 60);
            SqlParameter spMiddle_Name = new SqlParameter("@Middle_Name", SqlDbType.NVarChar, 60);
            SqlParameter spLast_Name = new SqlParameter("@Last_Name", SqlDbType.NVarChar, 60);
            SqlParameter spEmail = new SqlParameter("@Email", SqlDbType.VarChar, 100);
            SqlParameter spCountry_Id = new SqlParameter("@Country_Id", SqlDbType.SmallInt);
            SqlParameter spState_Id = new SqlParameter("@State_Id", SqlDbType.SmallInt);
            SqlParameter spCity = new SqlParameter("@City", SqlDbType.NVarChar, 80);
            SqlParameter spAddress = new SqlParameter("@Address", SqlDbType.NVarChar, 120);
            SqlParameter spZipCode = new SqlParameter("@ZipCode", SqlDbType.NVarChar, 10);
            SqlParameter spDefault_Currency_Id = new SqlParameter("@Default_Currency_Id", SqlDbType.TinyInt);
            SqlParameter spMobile_Phone = new SqlParameter("@Mobile_Phone", SqlDbType.VarChar, 20);
            SqlParameter spAdditional_Phone_Number = new SqlParameter("@Additional_Phone_Number", SqlDbType.VarChar, 20);
            SqlParameter spBirth_Date = new SqlParameter("@Birth_Date", SqlDbType.DateTime);
            SqlParameter spGender = new SqlParameter("@Gender", SqlDbType.TinyInt);
            SqlParameter spHeard_About_Application_From = new SqlParameter("@Heard_About_Application_From", SqlDbType.NVarChar, 500);
            SqlParameter spOur_Administrative_Side_Notes = new SqlParameter("@Our_Administrative_Side_Notes", SqlDbType.NVarChar, 500);

            SqlParameter spRecord_Created_By_User_Id = new SqlParameter("@Record_Created_By_User_Id", SqlDbType.Int);

            spUsername.Value = p_Username;
            spEncrypted_Password.Value = p_Encrypted_Password;
            spEncryption_Random_Salt.Value = p_Encryption_Random_Salt;
            spApp_Permission_Type_Id.Value = p_App_Permission_Type_Id;
            spFirst_Name.Value = p_First_Name;
            spMiddle_Name.Value = p_Middle_Name;
            spLast_Name.Value = p_Last_Name;
            spEmail.Value = p_Email;
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

            spMobile_Phone.Value = p_Mobile_Phone;
            spAdditional_Phone_Number.Value = p_Additional_Phone_Number;
            spBirth_Date.Value = p_BirthDate;
            spGender.Value = p_Gender;
            spHeard_About_Application_From.Value = p_Heard_About_Application_From;
            spOur_Administrative_Side_Notes.Value = p_Our_Administrative_Side_Notes;
            spRecord_Created_By_User_Id.Value = p_Logged_In_Administrative_User_Id;
            
            object new_User_Id = SQLHelper.ExecuteStoredProcedure_ReturnDataObjectResult("p_TLBoard_Insert_User_Details_Administrative_Registration_Process",
                new List<SqlParameter>() { 
                    spUsername, 
                    spEncrypted_Password, 
                    spEncryption_Random_Salt,
                    spApp_Permission_Type_Id, 
                    spFirst_Name, 
                    spMiddle_Name, 
                    spLast_Name, 
                    spEmail, 
                    spCountry_Id, 
                    spState_Id, 
                    spCity,
                    spAddress,
                    spZipCode,
                    spDefault_Currency_Id,
                    spMobile_Phone,
                    spAdditional_Phone_Number,
                    spBirth_Date,
                    spGender,
                    spHeard_About_Application_From,
                    spOur_Administrative_Side_Notes, 
                    spRecord_Created_By_User_Id
                });

            if (new_User_Id != null)
            {
                int user_Id_Registered = Convert.ToInt32(new_User_Id);
                if (user_Id_Registered > 0)
                {
                    new_Registered_User_To_Return = Get_User_Details_By_User_Id(user_Id_Registered, p_Logged_In_Administrative_User_Id);
                }
            }

            return new_Registered_User_To_Return;
        }

        internal Users Get_User_Details_By_Username_For_Authentication(string p_Username_For_Authentication)
        {
            Users usersToReturn = new Users();

            SqlParameter spUsername_For_Authentication = new SqlParameter("@Username_For_Authentication", SqlDbType.NVarChar, 50);
            spUsername_For_Authentication.Value = p_Username_For_Authentication;

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_User_Details_By_Username_For_Authentication",
                new List<SqlParameter>() { spUsername_For_Authentication });

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                if (dataSet.Tables[0].Rows.Count > 1)
                {
                    // More then 1 user has been found. Throw exception
                    throw new Exception("Too many users were found for the given username.");
                }

                usersToReturn = CreateUserDetailsFromDataRow(dataSet.Tables[0].Rows[0]);
            }

            return usersToReturn;
        }

        internal bool Are_There_Any_Users_In_Database()
        {
            bool are_There_Any_Users_In_Database_Result_To_Return = false;
            
            var object_Result_Are_There_Any_Users_In_Database = SQLHelper.ExecuteStoredProcedure_ReturnDataObjectResult("p_TLBoard_Get_Users_Are_There_Any_Users");
            
            if (object_Result_Are_There_Any_Users_In_Database != null && object_Result_Are_There_Any_Users_In_Database is bool)
            {
                are_There_Any_Users_In_Database_Result_To_Return = (bool)object_Result_Are_There_Any_Users_In_Database;
            }

            return are_There_Any_Users_In_Database_Result_To_Return;
        }

        internal bool Update_User_Details(
            int p_User_Id, string p_Username, string p_First_Name, string p_Middle_Name,
            string p_Last_Name, string p_Email, short p_Country_Id, short? p_State_Id,
            string p_City, string p_Address, string p_ZipCode, byte? p_Default_Currency_Id , string p_Mobile_Phone,
            string p_Additional_Phone_Number, DateTime? p_Birth_Date, byte? p_Gender,
            DateTime? p_Registration_Date, string p_Azure_Container_Ref,
            string p_Heard_About_Application_From, string p_Our_Administrative_Side_Notes,
            bool p_Is_Active, int p_Updating_User_Id)
        {
            bool updated_Successfully = false;

            SqlParameter spUser_Id = new SqlParameter("@User_Id", SqlDbType.Int);
            SqlParameter spUsername = new SqlParameter("@Username", SqlDbType.VarChar, 50);
            SqlParameter spFirst_Name = new SqlParameter("@First_Name", SqlDbType.NVarChar, 60);
            SqlParameter spMiddle_Name = new SqlParameter("@Middle_Name", SqlDbType.NVarChar, 60);
            SqlParameter spLast_Name = new SqlParameter("@Last_Name", SqlDbType.NVarChar, 60);
            SqlParameter spEmail = new SqlParameter("@Email", SqlDbType.VarChar, 100);
            SqlParameter spCountry_Id = new SqlParameter("@Country_Id", SqlDbType.SmallInt);
            SqlParameter spState_Id = new SqlParameter("@State_Id", SqlDbType.SmallInt);
            SqlParameter spCity = new SqlParameter("@City", SqlDbType.NVarChar, 80);
            SqlParameter spAddress = new SqlParameter("@Address", SqlDbType.NVarChar, 120);
            SqlParameter spZipCode = new SqlParameter("@ZipCode", SqlDbType.VarChar, 20);
            SqlParameter spDefault_Currency_Id = new SqlParameter("@Default_Currency_Id", SqlDbType.TinyInt);
            SqlParameter spMobile_Phone = new SqlParameter("@Mobile_Phone", SqlDbType.VarChar, 20);
            SqlParameter spAdditional_Phone_Number = new SqlParameter("@Additional_Phone_Number", SqlDbType.VarChar, 20);
            SqlParameter spBirth_Date = new SqlParameter("@Birth_Date", SqlDbType.DateTime);
            SqlParameter spGender = new SqlParameter("@Gender", SqlDbType.TinyInt);
            SqlParameter spRegistration_DateTime_UTC = new SqlParameter("@Registration_DateTime_UTC", SqlDbType.DateTime);
            SqlParameter spAzure_Container_Ref = new SqlParameter("@Azure_Container_Ref", SqlDbType.VarChar, 60);
            SqlParameter spHeard_About_Application_From = new SqlParameter("@Heard_About_Application_From", SqlDbType.NVarChar, 500);
            SqlParameter spOur_Administrative_Side_Notes = new SqlParameter("@Our_Administrative_Side_Notes", SqlDbType.NVarChar, 500);
            SqlParameter spIs_Active = new SqlParameter("@Is_Active", SqlDbType.Bit);
            SqlParameter spUpdating_User_Id = new SqlParameter("@Updating_User_Id", SqlDbType.Int);

            spUser_Id.Value = p_User_Id;
            spUsername.Value = p_Username;
            spFirst_Name.Value = p_First_Name;
            spMiddle_Name.Value = p_Middle_Name;
            spLast_Name.Value = p_Last_Name;
            spEmail.Value = p_Email;
            spCountry_Id.Value = p_Country_Id;

            if (p_State_Id.HasValue)
                spState_Id.Value = p_State_Id;
            else
                spState_Id.Value = DBNull.Value;

            spCity.Value = p_City;
            spAddress.Value = p_Address;
            spZipCode.Value = p_ZipCode;
            
            if (p_Default_Currency_Id.HasValue)
                spDefault_Currency_Id.Value = p_Default_Currency_Id;
            else
                spDefault_Currency_Id.Value = DBNull.Value;

            spMobile_Phone.Value = p_Mobile_Phone;
            spAdditional_Phone_Number.Value = p_Additional_Phone_Number;

            if (p_Birth_Date.HasValue)
                spBirth_Date.Value = p_Birth_Date.Value;
            else
                spBirth_Date.Value = DBNull.Value;

            if (p_Gender.HasValue)
                spGender.Value = p_Gender.Value;
            else
                spGender.Value = DBNull.Value;

            if (p_Registration_Date.HasValue)
                spRegistration_DateTime_UTC.Value = p_Registration_Date.Value;
            else
                spRegistration_DateTime_UTC.Value = DBNull.Value;

            spAzure_Container_Ref.Value = p_Azure_Container_Ref;
            spHeard_About_Application_From.Value = p_Heard_About_Application_From;
            spOur_Administrative_Side_Notes.Value = p_Our_Administrative_Side_Notes;
            spIs_Active.Value = p_Is_Active;
            spUpdating_User_Id.Value = p_Updating_User_Id;

            int affected_Rows = SQLHelper.ExecuteStoredProcedure_ReturnAffectedRowsNumber_WithDefaultAppConfigConnectionString("p_TLBoard_Update_User_Details",
                new List<SqlParameter>() {
                    spUser_Id, 
                    spUsername, 
                    spFirst_Name, 
                    spMiddle_Name, 
                    spLast_Name, 
                    spEmail, 
                    spCountry_Id , 
                    spState_Id, 
                    spCity,  
                    spAddress, 
                    spZipCode,
                    spDefault_Currency_Id, 
                    spMobile_Phone, 
                    spAdditional_Phone_Number, 
                    spBirth_Date, 
                    spGender,spRegistration_DateTime_UTC, 
                    spAzure_Container_Ref, 
                    spHeard_About_Application_From, 
                    spOur_Administrative_Side_Notes, 
                    spIs_Active, 
                    spUpdating_User_Id 
                });

            if (affected_Rows > 0)
            {
                updated_Successfully = true;
            }

            return updated_Successfully;
        }

        internal bool Update_User_Details_New_Password(
            int p_User_Id, 
            string p_Encrypted_Password, 
            string p_Encryption_Random_Salt, 
            int p_Updating_User_Id)
        {
            bool updated_Successfully = false;

            SqlParameter spUser_Id = new SqlParameter("@User_Id", SqlDbType.Int);
            SqlParameter spEncrypted_Password = new SqlParameter("@Encrypted_Password", SqlDbType.VarChar, 120);
            SqlParameter spEncryption_Random_Salt = new SqlParameter("@Encryption_Random_Salt", SqlDbType.VarChar, 120);
            SqlParameter spUpdating_User_Id = new SqlParameter("@Updating_User_Id", SqlDbType.Int);

            spUser_Id.Value = p_User_Id;
            spEncrypted_Password.Value = p_Encrypted_Password;
            spEncryption_Random_Salt.Value = p_Encryption_Random_Salt;
            spUpdating_User_Id.Value = p_Updating_User_Id;

            int affected_Rows = SQLHelper.ExecuteStoredProcedure_ReturnAffectedRowsNumber_WithDefaultAppConfigConnectionString("p_TLBoard_Update_User_Details_Set_New_Password",
                new List<SqlParameter>() {
                    spUser_Id, spEncrypted_Password, 
                    spEncryption_Random_Salt, spUpdating_User_Id
                });

            if (affected_Rows > 0)
            {
                updated_Successfully = true;
            }

            return updated_Successfully;
        }


        private Users CreateUserDetailsFromDataRow(DataRow dbRowDetailsForUserInitialization)
        {
            Users userToReturn = new Users();

            userToReturn.User_Id = (int)dbRowDetailsForUserInitialization["User_Id"];
            userToReturn.Username = dbRowDetailsForUserInitialization["Username"].ToString();
            userToReturn.App_Permission_Type_Id = (App_Permission_Type.Permission_Type)Enum.Parse(typeof(App_Permission_Type.Permission_Type), dbRowDetailsForUserInitialization["App_Permission_Type_Id"].ToString());
            userToReturn.First_Name = dbRowDetailsForUserInitialization["First_Name"].ToString();
            userToReturn.Middle_Name = dbRowDetailsForUserInitialization["Middle_Name"].ToString();
            userToReturn.Last_Name = dbRowDetailsForUserInitialization["Last_Name"].ToString();
            userToReturn.Email = dbRowDetailsForUserInitialization["Email"].ToString();
            if (dbRowDetailsForUserInitialization.Table.Columns.IndexOf("Encrypted_Password") > -1)
            { 
                userToReturn.Encrypted_Password = dbRowDetailsForUserInitialization["Encrypted_Password"].ToString();
                userToReturn.Encryption_Random_Salt = dbRowDetailsForUserInitialization["Encryption_Random_Salt"].ToString();
            }

            if (dbRowDetailsForUserInitialization["Country_Id"] != DBNull.Value)
            { 
                userToReturn.Country_Id = (short)dbRowDetailsForUserInitialization["Country_Id"];
                if (dbRowDetailsForUserInitialization.Table.Columns.IndexOf("Country_Name") > -1)
                {
                    userToReturn.Country_English_Name = dbRowDetailsForUserInitialization["Country_Name"].ToString();
                }
            }

            if (dbRowDetailsForUserInitialization["State_Id"] != DBNull.Value)
            {
                userToReturn.State_Id = (short)dbRowDetailsForUserInitialization["State_Id"];
                if (dbRowDetailsForUserInitialization.Table.Columns.IndexOf("State_Name") > -1)
                {
                    userToReturn.State_Name = dbRowDetailsForUserInitialization["State_Name"].ToString();
                }
            }

            if (dbRowDetailsForUserInitialization.Table.Columns.IndexOf("City") > -1)
            {
                userToReturn.City = dbRowDetailsForUserInitialization["City"].ToString();
                userToReturn.Address = dbRowDetailsForUserInitialization["Address"].ToString();
                userToReturn.ZipCode = dbRowDetailsForUserInitialization["ZipCode"].ToString();
            }

            if (dbRowDetailsForUserInitialization.Table.Columns.IndexOf("Default_Currency_Id") > -1)
            {
                if (dbRowDetailsForUserInitialization["Default_Currency_Id"] != DBNull.Value)
                { 
                    userToReturn.Default_Currency_Id = (byte)dbRowDetailsForUserInitialization["Default_Currency_Id"];
                }
            }

            userToReturn.Mobile_Phone = dbRowDetailsForUserInitialization["Mobile_Phone"].ToString();
            userToReturn.Additional_Phone_Number = dbRowDetailsForUserInitialization["Additional_Phone_Number"].ToString();

            if (dbRowDetailsForUserInitialization["Birth_Date"] != DBNull.Value)
            {
                userToReturn.Birth_Date = (DateTime)dbRowDetailsForUserInitialization["Birth_Date"];
            }

            userToReturn.Gender = (byte)dbRowDetailsForUserInitialization["Gender"];
            if (dbRowDetailsForUserInitialization.Table.Columns.IndexOf("Gender_Name") > -1)
            {
                userToReturn.Gender_Name = dbRowDetailsForUserInitialization["Gender_Name"].ToString();
            }

            if (dbRowDetailsForUserInitialization["Registration_DateTime_UTC"] != DBNull.Value)
            {
                userToReturn.Registration_DateTime_UTC = (DateTime)dbRowDetailsForUserInitialization["Registration_DateTime_UTC"];
            }

            if (dbRowDetailsForUserInitialization.Table.Columns.IndexOf("Azure_Container_Ref") > -1)
            {
                userToReturn.Azure_Container_Ref = dbRowDetailsForUserInitialization["Azure_Container_Ref"].ToString();
            }

            if (dbRowDetailsForUserInitialization.Table.Columns.IndexOf("Heard_About_Application_From") > -1)
            {
                userToReturn.Heard_About_Application_From = dbRowDetailsForUserInitialization["Heard_About_Application_From"].ToString();
            }

            if (dbRowDetailsForUserInitialization.Table.Columns.IndexOf("Our_Administrative_Side_Notes") > -1)
            {
                userToReturn.Our_Administrative_Side_Notes = dbRowDetailsForUserInitialization["Our_Administrative_Side_Notes"].ToString();
            }

            if (dbRowDetailsForUserInitialization.Table.Columns.IndexOf("Record_Created_By_User_Id") > -1  )
            {
                userToReturn.Record_Created_By_User_Id = Convert.ToInt32(dbRowDetailsForUserInitialization["Record_Created_By_User_Id"]);

                userToReturn.Record_Created_By_User_Details = new Users();
                userToReturn.Record_Created_By_User_Details.User_Id = userToReturn.Record_Created_By_User_Id;
                if (dbRowDetailsForUserInitialization.Table.Columns.IndexOf("Created_By_First_Name") > -1)
                {
                    userToReturn.Record_Created_By_User_Details.First_Name = dbRowDetailsForUserInitialization["Created_By_First_Name"].ToString();
                    userToReturn.Record_Created_By_User_Details.Last_Name = dbRowDetailsForUserInitialization["Created_By_Last_Name"].ToString();
                }

                userToReturn.Record_Creation_DateTime_UTC = (DateTime)dbRowDetailsForUserInitialization["Record_Creation_DateTime_UTC"];

                userToReturn.Record_Last_Updated_DateTime_UTC = (DateTime)dbRowDetailsForUserInitialization["Record_Last_Updated_DateTime_UTC"];
                userToReturn.Record_Last_Updated_By_User_Id = Convert.ToInt32(dbRowDetailsForUserInitialization["Record_Last_Updated_By_User_Id"]);

                userToReturn.Record_Last_Updated_By_User_Details = new Users();
                userToReturn.Record_Last_Updated_By_User_Details.User_Id = userToReturn.Record_Created_By_User_Id;
                if (dbRowDetailsForUserInitialization.Table.Columns.IndexOf("Last_Updated_By_First_Name") > -1)
                {
                    userToReturn.Record_Last_Updated_By_User_Details.First_Name = dbRowDetailsForUserInitialization["Last_Updated_By_First_Name"].ToString();
                    userToReturn.Record_Last_Updated_By_User_Details.Last_Name = dbRowDetailsForUserInitialization["Last_Updated_By_Last_Name"].ToString();
                }
            }

            userToReturn.Is_Deleted = (bool)dbRowDetailsForUserInitialization["Is_Deleted"];
            if (userToReturn.Is_Deleted)
            {
                if (dbRowDetailsForUserInitialization.Table.Columns.IndexOf("Deleted_By_User_Id") > -1)
                { 
                    userToReturn.Deleted_By_User_Id = (int)dbRowDetailsForUserInitialization["Deleted_By_User_Id"];
                    userToReturn.Deleted_DateTime_UTC = (DateTime)dbRowDetailsForUserInitialization["Deleted_DateTime_UTC"];
                    userToReturn.Delete_Reason = dbRowDetailsForUserInitialization["Delete_Reason"].ToString();
                }
            }

            userToReturn.Is_Active = (bool)dbRowDetailsForUserInitialization["Is_Active"];
            if (!userToReturn.Is_Active)
            {
                if (dbRowDetailsForUserInitialization.Table.Columns.IndexOf("Active_Last_Updated_By_User_Id") > -1)
                {
                    userToReturn.Active_Last_Updated_By_User_Id = (int)dbRowDetailsForUserInitialization["Active_Last_Updated_By_User_Id"];
                    userToReturn.Active_Last_Updated_dateTime_UTC = (DateTime)dbRowDetailsForUserInitialization["Active_Last_Updated_dateTime_UTC"];
                    userToReturn.Active_Last_Updated_Comments = dbRowDetailsForUserInitialization["Active_Last_Updated_Comments"].ToString();
                }
            }

            return userToReturn;
        }

        private Users CreateUserBasicDetailsFromDataRow(DataRow dbRowDetailsForUserInitialization)
        {
            Users userToReturn = new Users();

            userToReturn.User_Id = (int)dbRowDetailsForUserInitialization["User_Id"];
            userToReturn.Username = dbRowDetailsForUserInitialization["Username"].ToString();
            userToReturn.First_Name = dbRowDetailsForUserInitialization["First_Name"].ToString();
            userToReturn.Middle_Name = dbRowDetailsForUserInitialization["Middle_Name"].ToString();
            userToReturn.Last_Name = dbRowDetailsForUserInitialization["Last_Name"].ToString();
            userToReturn.Email = dbRowDetailsForUserInitialization["Email"].ToString();
            userToReturn.App_Permission_Type_Id = 
                (App_Permission_Type.Permission_Type)Enum.Parse(typeof(App_Permission_Type.Permission_Type), dbRowDetailsForUserInitialization["App_Permission_Type_Id"].ToString());

            return userToReturn;
        }
    }
}

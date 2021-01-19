using SharedLayer.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataAccessLayer.Operations
{
    internal class UsersOperations
    {
        #region Singleton
        private static readonly UsersOperations instance = new UsersOperations();
        // Explicit static constructor to tell C# compiler  
        // not to mark type as beforefieldinit  
        static UsersOperations()
        {
        }
        private UsersOperations()
        {
        }
        public static UsersOperations Instance
        {
            get
            {
                return instance;
            }
        }
        #endregion

        private const string k_UserId_ColumnName = "UserId";
        private const string k_FirstName_ColumnName = "FirstName";
        private const string k_LastName_ColumnName = "LastName";
        private const string k_MiddleName_ColumnName = "MiddleName";
        private const string k_Username_ColumnName = "Username";
        private const string k_Email_ColumnName = "Email";
        private const string k_EcryptedPassword_ColumnName = "EcryptedPassword";
        private const string k_EncryptionRandomSalt_ColumnName = "EncryptionRandomSalt";
        private const string k_LastPasswordChangeDate_ColumnName = "LastPasswordChangeDate";
        private const string k_BirthDate_ColumnName = "BirthDate";
        private const string k_CountryCode_ColumnName = "CountryCode";
        private const string k_CountryName_ColumnName = "CountryName";
        private const string k_RegistrationDate_ColumnName = "RegistrationDate";
        private const string k_IsActive_ColumnName = "IsActive";
        private const string k_IsArchived_ColumnName = "IsArchived";
        private const string k_IsDeleted_ColumnName = "IsDeleted";

        internal List<Users> GetAll()
        {
            List<Users> usersToReturn = new List<Users>();

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("spTLDB_SelectUsers");

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                usersToReturn = new List<Users>(dataSet.Tables[0].Rows.Count);

                for (int i=0; i< dataSet.Tables[0].Rows.Count; i++)
                {
                    usersToReturn[i] = CreateUserDetailsFromDataRow(dataSet.Tables[0].Rows[i]);
                }
            }

            return usersToReturn;
        }

        internal Users InsertUser(Users userDetailsToInsert)
        {
            Users newUserDetailsToReturn = null;

            SqlParameter spFirstName = new SqlParameter("@"+ k_FirstName_ColumnName, SqlDbType.NVarChar, 50);
            SqlParameter spLastName = new SqlParameter("@"+ k_LastName_ColumnName, SqlDbType.NVarChar, 50);
            SqlParameter spMiddleName = new SqlParameter("@"+ k_MiddleName_ColumnName, SqlDbType.NVarChar, 50);
            SqlParameter spUsername = new SqlParameter("@"+ k_Username_ColumnName, SqlDbType.NVarChar, 100);
            SqlParameter spEmail = new SqlParameter("@"+ k_Email_ColumnName, SqlDbType.NVarChar, 100);
            SqlParameter spEcryptedPassword = new SqlParameter("@"+k_EcryptedPassword_ColumnName, SqlDbType.NVarChar, 100);
            SqlParameter spEncryptionRandomSalt = new SqlParameter("@"+k_EncryptionRandomSalt_ColumnName, SqlDbType.NVarChar, 100);
            SqlParameter spBirthDate = new SqlParameter("@" + k_BirthDate_ColumnName, SqlDbType.DateTime);
            SqlParameter spCountryCode = new SqlParameter("@" + k_CountryCode_ColumnName, SqlDbType.NVarChar, 20);
            SqlParameter spCountryName = new SqlParameter("@" + k_CountryName_ColumnName, SqlDbType.NVarChar, 80);
            SqlParameter spRegistrationDate = new SqlParameter("@" + k_RegistrationDate_ColumnName, SqlDbType.DateTime);
            SqlParameter spIsActive = new SqlParameter("@" + k_IsActive_ColumnName, SqlDbType.Bit);

            spFirstName.Value = userDetailsToInsert.FirstName;
            spLastName.Value = userDetailsToInsert.LastName;
            if (string.IsNullOrEmpty(userDetailsToInsert.MiddleName))
                spMiddleName.Value = DBNull.Value;
            else
                spMiddleName.Value = userDetailsToInsert.MiddleName;

            spUsername.Value = userDetailsToInsert.Username;
            spEmail.Value = userDetailsToInsert.Email;
            spEcryptedPassword.Value = userDetailsToInsert.EcryptedPassword;
            spEncryptionRandomSalt.Value = userDetailsToInsert.EncryptionRandomSalt;
            spBirthDate.Value = userDetailsToInsert.BirthDate;
            spCountryCode.Value = userDetailsToInsert.CountryCode;
            spCountryName.Value = userDetailsToInsert.CountryName;
            spRegistrationDate.Value = userDetailsToInsert.RegistrationDate;
            spIsActive.Value = userDetailsToInsert.IsActive;

            DataSet newUserDetailDataset = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString(
                "spTLDB_InsertUser", new List<SqlParameter> { spFirstName, spLastName, spMiddleName, spUsername, spEmail, spEcryptedPassword, spEncryptionRandomSalt, spBirthDate, spCountryCode, spCountryName, spRegistrationDate, spIsActive });

            if (newUserDetailDataset!= null && newUserDetailDataset.Tables[0].Rows.Count>0)
            {
                newUserDetailsToReturn = CreateUserDetailsFromDataRow(newUserDetailDataset.Tables[0].Rows[0]);
            }

            return newUserDetailsToReturn;
        }

        internal Users GetUserDetailsById(int userId)
        {
            Users userDetailsToReturn = null;

            SqlParameter spUserId = new SqlParameter("@" + k_UserId_ColumnName, SqlDbType.Int);
            spUserId.Value = userId;

            var userDetailsDBResult = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString(
                "spTLDB_SelectUserDetailsByUserId", new List<SqlParameter> { spUserId });

            if (userDetailsDBResult!= null && userDetailsDBResult.Tables[0].Rows.Count == 1)
            {
                userDetailsToReturn = CreateUserDetailsFromDataRow(userDetailsDBResult.Tables[0].Rows[0]);
            }

            return userDetailsToReturn;
        }

        internal Users GetUserDetailsByUsername(string userName)
        {
            Users userDetailsToReturn = null;

            SqlParameter spUserName = new SqlParameter("@" + k_Username_ColumnName, SqlDbType.NVarChar, 100);
            spUserName.Value = userName;

            var userDetailsDBResult = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString(
                "spTLDB_SelectUserDetailsByUsername", new List<SqlParameter> { spUserName });

            if (userDetailsDBResult != null && userDetailsDBResult.Tables[0].Rows.Count == 1)
            {
                userDetailsToReturn = CreateUserDetailsFromDataRow(userDetailsDBResult.Tables[0].Rows[0]);
            }

            return userDetailsToReturn;
        }

        private Users CreateUserDetailsFromDataRow(DataRow dbRowDetailsForUserInitialization)
        {
            Users userToReturn = new Users();
            
            userToReturn.UserId = (int)dbRowDetailsForUserInitialization[k_UserId_ColumnName];

            userToReturn.FirstName = dbRowDetailsForUserInitialization[k_FirstName_ColumnName].ToString();
            userToReturn.LastName = dbRowDetailsForUserInitialization[k_LastName_ColumnName].ToString();
            userToReturn.MiddleName = dbRowDetailsForUserInitialization[k_MiddleName_ColumnName].ToString();
            userToReturn.Username = dbRowDetailsForUserInitialization[k_Username_ColumnName].ToString();
            userToReturn.Email = dbRowDetailsForUserInitialization[k_Email_ColumnName].ToString();
            userToReturn.EcryptedPassword = dbRowDetailsForUserInitialization[k_EcryptedPassword_ColumnName].ToString();
            userToReturn.EncryptionRandomSalt = dbRowDetailsForUserInitialization[k_EncryptionRandomSalt_ColumnName].ToString();

            if (dbRowDetailsForUserInitialization[k_LastPasswordChangeDate_ColumnName] != DBNull.Value)
                userToReturn.LastPasswordChangeDate = (DateTime)dbRowDetailsForUserInitialization[k_LastPasswordChangeDate_ColumnName];

            userToReturn.BirthDate = (DateTime)dbRowDetailsForUserInitialization[k_BirthDate_ColumnName];
            userToReturn.CountryCode = dbRowDetailsForUserInitialization[k_CountryCode_ColumnName].ToString();
            userToReturn.CountryName = dbRowDetailsForUserInitialization[k_CountryName_ColumnName].ToString();
            userToReturn.RegistrationDate = (DateTime)dbRowDetailsForUserInitialization[k_RegistrationDate_ColumnName];

            userToReturn.IsActive = (bool)dbRowDetailsForUserInitialization[k_IsActive_ColumnName];
            userToReturn.IsArchived = (bool)dbRowDetailsForUserInitialization[k_IsArchived_ColumnName];
            userToReturn.IsDeleted = (bool)dbRowDetailsForUserInitialization[k_IsDeleted_ColumnName];

            return userToReturn;
        }

    }
}

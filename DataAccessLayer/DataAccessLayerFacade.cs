using System;
using System.Collections.Generic;
using SharedLayer.Models;
using DataAccessLayer.Operations;

namespace DataAccessLayer
{
    public class DataAccessLayerFacade
    {
        #region Singleton
        private static readonly DataAccessLayerFacade instance = new DataAccessLayerFacade();
        // Explicit static constructor to tell C# compiler  
        // not to mark type as beforefieldinit  
        static DataAccessLayerFacade()
        {
        }
        private DataAccessLayerFacade()
        {
        }
        public static DataAccessLayerFacade Instance
        {
            get
            {
                return instance;
            }
        }
        #endregion

        public List<Users> Users_GetAll()
        {
            return UsersOperations.Instance.GetAll();
        }

        public Users Users_GetByUserId(int userId)
        {
            return UsersOperations.Instance.GetUserDetailsById(userId);
        }

        public Users Users_GetByUsername(string userName)
        {
            return UsersOperations.Instance.GetUserDetailsByUsername(userName);
        }

        public Users Users_InsertUser(Users newUserDetailToCreateInDatabase)
        {
            return UsersOperations.Instance.InsertUser(newUserDetailToCreateInDatabase);
        }


        public List<UserEntityBankAccounts> BankAccounts_GetAll()
        {
            // 
            //SQLHelper.SelectUsingStoredProcedure.
            return null;
        }
    }
}

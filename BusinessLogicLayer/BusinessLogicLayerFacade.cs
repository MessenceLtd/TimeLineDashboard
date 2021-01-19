using System;
using System.Collections.Generic;
using SharedLayer.Models;
using DataAccessLayer;

namespace TimeLineDashboard.BusinessLogicLayer
{
    public class BusinessLogicLayerFacade
    {
        #region Singleton
        private static readonly BusinessLogicLayerFacade instance = new BusinessLogicLayerFacade();
        // Explicit static constructor to tell C# compiler  
        // not to mark type as beforefieldinit  
        static BusinessLogicLayerFacade()
        {
        }

        private BusinessLogicLayerFacade()
        {
        }

        public static BusinessLogicLayerFacade Instance
        {
            get
            {
                return instance;
            }
        }
        #endregion


        public List<Users> Users_GetAll()
        {
            return DataAccessLayerFacade.Instance.Users_GetAll();
        }

        public Users Users_GetByUserId(int userId)
        {
            return DataAccessLayerFacade.Instance.Users_GetByUserId(userId);
        }

        public Users Users_GetByUsername(string userName)
        {
            return DataAccessLayerFacade.Instance.Users_GetByUsername(userName);
        }

        public Users Users_InsertUser(Users newUserDetailToCreateInDatabase)
        {
            return DataAccessLayerFacade.Instance.Users_InsertUser(newUserDetailToCreateInDatabase);
        }

        public List<UserEntityBankAccounts> BankAccounts_GetAll()
        {
            return DataAccessLayerFacade.Instance.BankAccounts_GetAll();
        }
    }
}

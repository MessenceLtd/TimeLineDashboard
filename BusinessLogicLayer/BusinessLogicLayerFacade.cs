using System;
using System.Collections.Generic;
using SharedLayer.Models;
using DataAccessLayer;

namespace TimeLineDashboard.BusinessLogicLayer
{
    public class Business_Logic_Layer_Facade
    {
        #region Singleton
        private static readonly Business_Logic_Layer_Facade instance = new Business_Logic_Layer_Facade();
        // Explicit static constructor to tell C# compiler  
        // not to mark type as beforefieldinit  
        static Business_Logic_Layer_Facade()
        {
        }

        private Business_Logic_Layer_Facade()
        {
        }

        public static Business_Logic_Layer_Facade Instance
        {
            get
            {
                return instance;
            }
        }
        #endregion


        public List<Users> Users_GetAll()
        {
            return Data_Access_Layer_Facade.Instance.Users_GetAll();
        }

        public Users Users_GetByUserId(int userId)
        {
            return Data_Access_Layer_Facade.Instance.Users_GetByUserId(userId);
        }

        public Users Users_GetByUsername(string userName)
        {
            return Data_Access_Layer_Facade.Instance.Users_GetByUsername(userName);
        }

        public Users Users_InsertUser(Users newUserDetailToCreateInDatabase)
        {
            return Data_Access_Layer_Facade.Instance.Users_InsertUser(newUserDetailToCreateInDatabase);
        }

        public List<UserEntityBankAccounts> BankAccounts_GetAll()
        {
            return Data_Access_Layer_Facade.Instance.BankAccounts_GetAll();
        }

        #region Countries 

        //public List<Countries>
        public List<Countries> Countries_GetAll()
        {
            // Todo: add caching here or on the data access layer

            return Data_Access_Layer_Facade.Instance.Countries_GetAll();
        }

        #endregion


    }
}

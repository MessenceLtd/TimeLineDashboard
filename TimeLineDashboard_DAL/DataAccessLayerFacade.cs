using System;
using System.Collections.Generic;

using TimeLineDashboard.Shared.Models;
using TimeLineDashboard.DAL.Operations;
using System.Data;
using TimeLineDashboard.DAL.Operations;

namespace TimeLineDashboard.DAL
{
    public class Data_Access_Layer_Facade
    {
        #region Singleton
        private static readonly Data_Access_Layer_Facade instance = new Data_Access_Layer_Facade();
        // Explicit static constructor to tell C# compiler  
        // not to mark type as beforefieldinit  
        static Data_Access_Layer_Facade()
        {
        }
        private Data_Access_Layer_Facade()
        {
        }
        public static Data_Access_Layer_Facade Instance
        {
            get
            {
                return instance;
            }
        }
        #endregion

        //public List<Users> Users_GetAll()
        //{
        //    return UsersOperations.Instance.GetAll();
        //}

        //public Users Users_GetByUserId(int userId)
        //{
        //    return UsersOperations.Instance.GetUserDetailsById(userId);
        //}

        //public Users Users_GetByUsername(string userName)
        //{
        //    return UsersOperations.Instance.GetUserDetailsByUsername(userName);
        //}

        //public Users Users_InsertUser(Users newUserDetailToCreateInDatabase)
        //{
        //    return UsersOperations.Instance.InsertUser(newUserDetailToCreateInDatabase);
        //}


        //public List<UserEntityBankAccounts> BankAccounts_GetAll()
        //{
        //    // 
        //    //SQLHelper.SelectUsingStoredProcedure.
        //    return null;
        //}

        public List<Countries> Countries_GetAll()
        {
            return Countries_Operations.Instance.GetAll();
        }

        public List<Users> Get_Users_Search(string search_Criteria)
        {
            return Users_Operations.Instance.Get_Users_Search(search_Criteria);
        }
    }
}

using System;
using System.Collections.Generic;
using TimeLineDashboard.DAL;
using TimeLineDashboard.Shared.Models;
using TimeLineDashboard.DAL;

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


        //public List<Users> Users_GetAll()
        //{
        //    return Data_Access_Layer_Facade.Instance.Users_GetAll();
        //}

        //public Users Users_GetByUserId(int userId)
        //{
        //    return Data_Access_Layer_Facade.Instance.Users_GetByUserId(userId);
        //}

        //public Users Users_GetByUsername(string userName)
        //{
        //    return Data_Access_Layer_Facade.Instance.Users_GetByUsername(userName);
        //}

        //public Users Users_InsertUser(Users newUserDetailToCreateInDatabase)
        //{
        //    return Data_Access_Layer_Facade.Instance.Users_InsertUser(newUserDetailToCreateInDatabase);
        //}

        //public List<UserEntityBankAccounts> BankAccounts_GetAll()
        //{
        //    return Data_Access_Layer_Facade.Instance.BankAccounts_GetAll();
        //}

        #region Users

        public List<Users> Get_Users_Search(string search_Criteria)
        {
            return Data_Access_Layer_Facade.Instance.Get_Users_Search(search_Criteria);
        }

        public Users Get_User_Details_By_User_Id(int User_Id)
        {
            throw new NotImplementedException();
        }

        public Users Update_User_Details(Users p_New_User_Details , int p_Updating_User)
        {
            throw new NotImplementedException();
        }

        public Users Insert_User_Details_Administrative_Registration_Process(Users p_New_User_Details, int p_Administrative_User)
        {
            throw new NotImplementedException();
        }

        public bool Delete_User_By_User_Id(int User_Id)
        {
            throw new NotImplementedException();
        }

        #endregion

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

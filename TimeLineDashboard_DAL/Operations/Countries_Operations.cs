using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TimeLineDashboard.Shared.Models;
using TimeLineDashboard.DAL;

namespace TimeLineDashboard.DAL.Operations
{
    internal class Countries_Operations
    {
        #region Singleton
        private static readonly Countries_Operations instance = new Countries_Operations();
        // Explicit static constructor to tell C# compiler  
        // not to mark type as beforefieldinit  
        static Countries_Operations()
        {
        }
        private Countries_Operations()
        {
        }
        public static Countries_Operations Instance
        {
            get
            {
                return instance;
            }
        }
        #endregion

        internal List<Countries> GetAll()
        {
            List<Countries> countriesToReturn = new List<Countries>();

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Counties_List");

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                countriesToReturn = new List<Countries>(dataSet.Tables[0].Rows.Count);

                for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                {
                    countriesToReturn.Add(Create_Country_Entity_From_DataRow(dataSet.Tables[0].Rows[i]));
                }
            }

            return countriesToReturn;
        }

        private Countries Create_Country_Entity_From_DataRow(DataRow db_Row_Details_For_Country_Initialization)
        {
            Countries userToReturn = new Countries();

            userToReturn.Country_Id = (short)db_Row_Details_For_Country_Initialization["Country_Id"];
            userToReturn.Country_English_Name = db_Row_Details_For_Country_Initialization["Country_English_Name"].ToString();
            userToReturn.Country_Code = db_Row_Details_For_Country_Initialization["Country_Code"].ToString();

            return userToReturn;
        }


    }
}

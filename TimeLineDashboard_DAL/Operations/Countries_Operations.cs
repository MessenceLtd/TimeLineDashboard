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

        private static readonly List<Countries> r_List_Countries = new List<Countries>();

        internal List<Countries> GetAll()
        {
            if (r_List_Countries == null || r_List_Countries.Count <= 0)
            {
                var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Countries_List");

                if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
                {
                    r_List_Countries.Clear();

                    for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                    {
                        r_List_Countries.Add(Create_Country_Entity_From_DataRow(dataSet.Tables[0].Rows[i]));
                    }
                }
            }

            return r_List_Countries;
        }

        internal Countries Get_By_Country_Id( short p_Country_Id)
        {
            Countries country_To_Return = null;

            for (int i = 0; i < r_List_Countries.Count; i++)
            {
                if (r_List_Countries[i].Country_Id == p_Country_Id)
                {
                    country_To_Return = r_List_Countries[i];
                    break;
                }
            }

            return country_To_Return;
        }

        private Countries Create_Country_Entity_From_DataRow(DataRow db_Row_Details_For_Country_Initialization)
        {
            Countries countryToReturn = new Countries();

            countryToReturn.Country_Id = (short)db_Row_Details_For_Country_Initialization["Country_Id"];
            countryToReturn.Country_English_Name = db_Row_Details_For_Country_Initialization["Country_English_Name"].ToString();
            countryToReturn.Country_Code = db_Row_Details_For_Country_Initialization["Country_Code"].ToString();

            if (db_Row_Details_For_Country_Initialization["Primary_Currency_Id"] != DBNull.Value)
                countryToReturn.Primary_Currency_Id = (byte)db_Row_Details_For_Country_Initialization["Primary_Currency_Id"];

            return countryToReturn;
        }


    }
}

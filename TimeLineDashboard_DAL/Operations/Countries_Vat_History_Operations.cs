using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TimeLineDashboard.Shared.Models;
using TimeLineDashboard.DAL;

namespace TimeLineDashboard.DAL.Operations
{
    internal class Countries_Vat_History_Operations
    {
        #region Singleton
        private static readonly Countries_Vat_History_Operations instance = new Countries_Vat_History_Operations();
        // Explicit static constructor to tell C# compiler  
        // not to mark type as beforefieldinit  
        static Countries_Vat_History_Operations()
        {
        }
        private Countries_Vat_History_Operations()
        {
        }
        public static Countries_Vat_History_Operations Instance
        {
            get
            {
                return instance;
            }
        }
        #endregion


        private static readonly List<Countries_Vat_History> r_List_Countries_Vat_History = new List<Countries_Vat_History>();

        internal List<Countries_Vat_History> GetAll()
        {
            if (r_List_Countries_Vat_History == null || r_List_Countries_Vat_History.Count <= 0)
            {
                var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Countries_Vat_History_Get_All");

                if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
                {
                    r_List_Countries_Vat_History.Clear();

                    for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                    {
                        r_List_Countries_Vat_History.Add(Create_Country_Vat_History_Entity_From_DataRow(dataSet.Tables[0].Rows[i]));
                    }
                }
            }

            return r_List_Countries_Vat_History;
        }

        internal List<Countries_Vat_History> Get_All_By_Country(short p_Country_Id)
        {
            List<Countries_Vat_History> country_Vat_History_To_Return = new List<Countries_Vat_History>();

            if (r_List_Countries_Vat_History == null || r_List_Countries_Vat_History.Count <= 0)
            {
                this.GetAll();
            }

            for (int i = 0; i < r_List_Countries_Vat_History.Count; i++)
            {
                if (r_List_Countries_Vat_History[i].Country_Id == p_Country_Id)
                {
                    country_Vat_History_To_Return.Add(r_List_Countries_Vat_History[i]);
                }
            }

            return country_Vat_History_To_Return;
        }
        internal Countries_Vat_History Get_Latest_Vat_History_By_Country_And_Date(short p_Country_Id, DateTime p_Approximate_DateTime_For_Searches)
        {
            Countries_Vat_History country_Latest_Vat_History_By_Country_And_Date_To_Return = new Countries_Vat_History();

            List<Countries_Vat_History> country_All_Vat_History = this.Get_All_By_Country(p_Country_Id);

            // the vat history list is initialized from the database p_TLBoard_Get_Countries_Vat_History_Get_All with changed data in ascending order
            for (int i = 0; i < r_List_Countries_Vat_History.Count; i++)
            {
                if (r_List_Countries_Vat_History[i].Vat_Changed_Date < p_Approximate_DateTime_For_Searches)
                {
                    country_Latest_Vat_History_By_Country_And_Date_To_Return = r_List_Countries_Vat_History[i];
                    break;
                }
            }

            return country_Latest_Vat_History_By_Country_And_Date_To_Return;
        }

        private Countries_Vat_History Create_Country_Vat_History_Entity_From_DataRow(DataRow db_Row_Details_For_Country_Vat_History_Initialization)
        {
            Countries_Vat_History country_Vat_History_To_Return = new Countries_Vat_History();

            country_Vat_History_To_Return.Vat_History_Record_Id = Convert.ToInt32(db_Row_Details_For_Country_Vat_History_Initialization["Country_Id"]);
            country_Vat_History_To_Return.Country_Id = (short)db_Row_Details_For_Country_Vat_History_Initialization["Country_Id"];

            if (db_Row_Details_For_Country_Vat_History_Initialization.Table.Columns.IndexOf("Country_English_Name")>-1)
            {
                country_Vat_History_To_Return.Country_English_Name = db_Row_Details_For_Country_Vat_History_Initialization["Country_English_Name"].ToString();
            }

            country_Vat_History_To_Return.Vat_Changed_Date = (DateTime)db_Row_Details_For_Country_Vat_History_Initialization["Vat_Changed_Date"];
            country_Vat_History_To_Return.Vat_Percentage = (decimal)db_Row_Details_For_Country_Vat_History_Initialization["Vat_Percentage"];
            country_Vat_History_To_Return.Record_Created_By_User_Id = (int)db_Row_Details_For_Country_Vat_History_Initialization["Record_Created_By_User_Id"];
            country_Vat_History_To_Return.Record_Creation_DateTime_UTC = (DateTime)db_Row_Details_For_Country_Vat_History_Initialization["Record_Creation_DateTime_UTC"];
            country_Vat_History_To_Return.Record_Last_Updated_By_User_Id = (int)db_Row_Details_For_Country_Vat_History_Initialization["Record_Last_Updated_By_User_Id"];
            country_Vat_History_To_Return.Record_Last_Updated_DateTime_UTC = (DateTime)db_Row_Details_For_Country_Vat_History_Initialization["Record_Last_Updated_DateTime_UTC"];

            return country_Vat_History_To_Return;
        }


    }
}

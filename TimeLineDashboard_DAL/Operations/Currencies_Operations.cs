using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TimeLineDashboard.DAL;
using TimeLineDashboard.Shared.Models;

namespace TimeLineDashboard.DAL.Operations
{
    internal class Currencies_Operations
    {
        #region Singleton
        private static readonly Currencies_Operations instance = new Currencies_Operations();
        // Explicit static constructor to tell C# compiler  
        // not to mark type as beforefieldinit  
        static Currencies_Operations()
        {
        }
        private Currencies_Operations()
        {
        }
        public static Currencies_Operations Instance
        {
            get
            {
                return instance;
            }
        }
        #endregion

        private static readonly List<Currencies> r_List_Currencies = new List<Currencies>();

        internal List<Currencies> Get_Currecies()
        {
            if (r_List_Currencies == null || r_List_Currencies.Count <= 0)
            {
                var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Currencies_List");

                if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
                {
                    lock (r_List_Currencies)
                    {
                        r_List_Currencies.Clear();

                        for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                        {
                            r_List_Currencies.Add(Create_Currency_Details_From_Data_Row(dataSet.Tables[0].Rows[i]));
                        }
                    }
                }
            }

            return r_List_Currencies;
        }


        private Currencies Create_Currency_Details_From_Data_Row(DataRow dataRow)
        {
            Currencies client_Type_To_Return = new Currencies();

            client_Type_To_Return.Currency_Id = Convert.ToByte(dataRow["Currency_Id"]);
            client_Type_To_Return.Currency_Name = dataRow["Currency_Name"].ToString();
            client_Type_To_Return.Currency_Code = dataRow["Currency_Code"].ToString();
            client_Type_To_Return.Currency_Symbol = dataRow["Currency_Symbol"].ToString();

            if (dataRow["Wiki_Daily_Trades_Stats_2019"] != DBNull.Value)
            { 
                client_Type_To_Return.Wiki_Daily_Trades_Stats_2019 = (decimal)dataRow["Wiki_Daily_Trades_Stats_2019"];
            }

            return client_Type_To_Return;
        }

    }
}

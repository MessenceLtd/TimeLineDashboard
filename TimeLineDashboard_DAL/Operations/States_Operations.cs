using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using TimeLineDashboard.Shared.Models;
using TimeLineDashboard.DAL;
using System.Collections.Concurrent;

namespace TimeLineDashboard.DAL.Operations
{
    internal class States_Operations
    {
        #region Singleton
        private static readonly States_Operations instance = new States_Operations();
        // Explicit static constructor to tell C# compiler  
        // not to mark type as beforefieldinit  
        static States_Operations()
        {
        }
        private States_Operations()
        {
        }
        public static States_Operations Instance
        {
            get
            {
                return instance;
            }
        }
        #endregion

        private static readonly ConcurrentDictionary<short, List<States>> list_Countries_States = new ConcurrentDictionary<short, List<States>>();

        internal List<States> Get_All()
        {
            List<States> statesToReturn = new List<States>();

            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_States");

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                statesToReturn = new List<States>(dataSet.Tables[0].Rows.Count);

                for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                {
                    statesToReturn.Add(Create_State_Entity_From_DataRow(dataSet.Tables[0].Rows[i]));
                }
            }

            return statesToReturn;
        }

        internal List<States> Get_By_Country_Id(short Country_Id)
        {
            List<States> returnedStatesList = new List<States>();

            // check if the countries states list mapping is empty
            if (list_Countries_States.Keys.Count <= 0 )
            {
                this.Fill_Up_State_Countries();
            }

            // check if the country id parameter has states
            if (list_Countries_States.ContainsKey(Country_Id))
            {
                returnedStatesList = list_Countries_States[Country_Id];
            }

            return returnedStatesList;
        }

        private void Fill_Up_State_Countries()
        {
            List<States> states_To_Save = this.Get_All();

            for (int i = 0; i < states_To_Save.Count; i++)
            {
                short country_Id = states_To_Save[i].Country_Id;

                if (!list_Countries_States.ContainsKey(country_Id))
                {
                    list_Countries_States.TryAdd(country_Id, new List<States>());
                }

                list_Countries_States[country_Id].Add(states_To_Save[i]);
            }
        }
        internal States Get_By_State_Id(short p_State_Id)
        {
            States state_To_Return = null;
            bool state_Details_Found = false;

            foreach (var key in list_Countries_States.Keys)
            {
                foreach (States state in list_Countries_States[key])
                {
                    if (state.State_Id == p_State_Id)
                    {
                        state_To_Return = state;
                        state_Details_Found = true;
                        break;
                    }
                }

                if (state_Details_Found) 
                    break;
            }

            return state_To_Return;
        }

        private States Create_State_Entity_From_DataRow(DataRow db_Row_Details_For_State_Initialization)
        {
            States stateToReturn = new States();

            stateToReturn.State_Id = (short)db_Row_Details_For_State_Initialization["State_Id"];
            stateToReturn.State_Name = db_Row_Details_For_State_Initialization["State_Name"].ToString();
            stateToReturn.State_Code = db_Row_Details_For_State_Initialization["State_Code"].ToString();
            stateToReturn.Country_Id = (short)db_Row_Details_For_State_Initialization["Country_Id"];

            return stateToReturn;
        }

       
    }
}

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
    internal class ClientTypes_Operations
    {
        #region Singleton
        private static readonly ClientTypes_Operations instance = new ClientTypes_Operations();
        // Explicit static constructor to tell C# compiler  
        // not to mark type as beforefieldinit  
        static ClientTypes_Operations()
        {
        }
        private ClientTypes_Operations()
        {
        }
        public static ClientTypes_Operations Instance
        {
            get
            {
                return instance;
            }
        }
        #endregion

        private static readonly List<ClientType> r_List_Client_Types = new List<ClientType>();

        internal List<ClientType> Get_Client_Types()
        {
            if (r_List_Client_Types == null || r_List_Client_Types.Count <= 0)
            {
                var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Client_Types");

                if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
                {
                    lock (r_List_Client_Types)
                    {
                        r_List_Client_Types.Clear();

                        for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                        {
                            r_List_Client_Types.Add(Create_Client_Type_Details_From_Data_Row(dataSet.Tables[0].Rows[i]));
                        }
                    }
                }
            }

            return r_List_Client_Types;
        }

        internal ClientType Get_By_Id(short p_Client_Type_Id)
        {
            ClientType client_Type_To_Return = null;

            if (r_List_Client_Types.Count == 0 )
            {
                this.Get_Client_Types();
            }

            for (int i=0;i< r_List_Client_Types.Count;i++)
            {
                if (r_List_Client_Types[i].Client_Type_Id == p_Client_Type_Id)
                { 
                    client_Type_To_Return = r_List_Client_Types[i];
                    break;
                }
            }

            return client_Type_To_Return;
        }

        private ClientType Create_Client_Type_Details_From_Data_Row(DataRow dataRow)
        {
            ClientType client_Type_To_Return = new ClientType();

            client_Type_To_Return.Client_Type_Id = Convert.ToInt16(dataRow["Client_Type_Id"]);
            client_Type_To_Return.Type_Name = dataRow["Type_Name"].ToString();
            client_Type_To_Return.Type_Code = dataRow["Type_Code"].ToString();
            client_Type_To_Return.Description = dataRow["Description"].ToString();

            if (dataRow.Table.Columns.IndexOf("Record_Created_By_User_Id") > -1)
            {
                client_Type_To_Return.Record_Created_By_User_Id = (int)dataRow["Record_Created_By_User_Id"];
                client_Type_To_Return.Record_Creation_DateTime_UTC = (DateTime)dataRow["Record_Creation_DateTime_UTC"];
            }

            if (dataRow.Table.Columns.IndexOf("Record_Last_Updated_By_User_Id") > -1)
            {
                client_Type_To_Return.Record_Last_Updated_By_User_Id = (int)dataRow["Record_Last_Updated_By_User_Id"];
                client_Type_To_Return.Record_Last_Updated_DateTime_UTC = (DateTime)dataRow["Record_Last_Updated_DateTime_UTC"];
            }

            if (dataRow.Table.Columns.IndexOf("Is_Active") > -1)
            {
                client_Type_To_Return.Is_Active = (bool)dataRow["Is_Active"];
            }

            if (dataRow.Table.Columns.IndexOf("Is_Visible") > -1)
            {
                client_Type_To_Return.Is_Active = (bool)dataRow["Is_Visible"];
            }

            return client_Type_To_Return;
        }
    }
}

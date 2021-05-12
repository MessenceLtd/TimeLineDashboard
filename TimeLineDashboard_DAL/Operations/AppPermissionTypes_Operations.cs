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
    internal class App_Permission_Type_Operations
    {
        #region Singleton
        private static readonly App_Permission_Type_Operations instance = new App_Permission_Type_Operations();
        // Explicit static constructor to tell C# compiler  
        // not to mark type as beforefieldinit  
        static App_Permission_Type_Operations()
        {
        }
        private App_Permission_Type_Operations()
        {
        }
        public static App_Permission_Type_Operations Instance
        {
            get
            {
                return instance;
            }
        }
        #endregion

        private static readonly List<App_Permission_Type> r_List_App_Permission_Types = new List<App_Permission_Type>();

        internal List<App_Permission_Type> Get_App_Permission_Types()
        {
            if (r_List_App_Permission_Types == null || r_List_App_Permission_Types.Count <= 0)
            {
                var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_App_Permission_Types");

                if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
                {
                    lock (r_List_App_Permission_Types)
                    {
                        r_List_App_Permission_Types.Clear();

                        for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                        {
                            r_List_App_Permission_Types.Add(Create_App_Permission_Type_Details_From_Data_Row(dataSet.Tables[0].Rows[i]));
                        }
                    }
                }
            }

            return r_List_App_Permission_Types;
        }

        internal App_Permission_Type Get_App_Permission_Type_By_Type_Id(byte p_App_Permission_Type_Id)
        {
            App_Permission_Type app_Permission_Type_Details_To_Return = null;

            if (r_List_App_Permission_Types == null || r_List_App_Permission_Types.Count <= 0)
            {
                this.Get_App_Permission_Types();
            }

            for (int i = 0; i < r_List_App_Permission_Types.Count; i++)
            {
                if ((byte)r_List_App_Permission_Types[i].App_Permission_Type_Id == p_App_Permission_Type_Id)
                {
                    app_Permission_Type_Details_To_Return = r_List_App_Permission_Types[i];
                    break;
                }
            }

            return app_Permission_Type_Details_To_Return;
        }

        internal App_Permission_Type Get_App_Permission_Type_By_Permission_Type_Code(string p_Permission_Type_Code)
        {
            App_Permission_Type app_Permission_Type_Details_To_Return = null;

            if (r_List_App_Permission_Types == null || r_List_App_Permission_Types.Count <= 0)
            {
                this.Get_App_Permission_Types();
            }

            for (int i = 0; i < r_List_App_Permission_Types.Count; i++)
            {
                if (r_List_App_Permission_Types[i].App_Permission_Type_Code == p_Permission_Type_Code)
                {
                    app_Permission_Type_Details_To_Return = r_List_App_Permission_Types[i];
                    break;
                }
            }

            return app_Permission_Type_Details_To_Return;
        }

        private App_Permission_Type Create_App_Permission_Type_Details_From_Data_Row(DataRow dataRow)
        {
            App_Permission_Type App_Permission_Type_To_Return = new App_Permission_Type();

            App_Permission_Type_To_Return.App_Permission_Type_Id = (App_Permission_Type.Permission_Type)Enum.Parse(typeof(App_Permission_Type.Permission_Type), dataRow["App_Permission_Type_Id"].ToString());
            App_Permission_Type_To_Return.App_Permission_Type_Name = dataRow["App_Permission_Type_Name"].ToString();
            App_Permission_Type_To_Return.App_Permission_Type_Code = dataRow["App_Permission_Type_Code"].ToString();
            App_Permission_Type_To_Return.App_Permission_Type_Description = dataRow["App_Permission_Type_Description"].ToString();

            return App_Permission_Type_To_Return;
        }

        
    }
}

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
    internal class Document_Types_Operations
    {
        #region Singleton
        private static readonly Document_Types_Operations instance = new Document_Types_Operations();
        // Explicit static constructor to tell C# compiler  
        // not to mark type as beforefieldinit  
        static Document_Types_Operations()
        {
        }
        private Document_Types_Operations()
        {
        }
        public static Document_Types_Operations Instance
        {
            get
            {
                return instance;
            }
        }
        #endregion

        private static readonly List<Document_Types> r_List_Document_Types = new List<Document_Types>();

        internal List<Document_Types> Get_Document_Types()
        {
            if (r_List_Document_Types == null || r_List_Document_Types.Count <= 0)
            {
                var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_General_Document_Types");

                if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
                {
                    lock(r_List_Document_Types)
                    {
                        r_List_Document_Types.Clear();

                        for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                        {
                            r_List_Document_Types.Add(Create_Document_Type_Details_From_Data_Row(dataSet.Tables[0].Rows[i]));
                        }
                    }
                }
            }

            return r_List_Document_Types;
        }


        private Document_Types Create_Document_Type_Details_From_Data_Row(DataRow dataRow)
        {
            Document_Types document_Type_To_Return = new Document_Types();

            document_Type_To_Return.General_Document_Type_Id = Convert.ToByte(dataRow["General_Document_Type_Id"]);
            document_Type_To_Return.Document_Type_Name = dataRow["Document_Type_Name"].ToString();
            document_Type_To_Return.Sort_Order = (short)dataRow["Sort_Order"];
            document_Type_To_Return.Suggested_By_User_Id = (int)dataRow["Suggested_By_User_Id"];

            if (dataRow.Table.Columns.IndexOf("Record_Created_By_User_Id") > -1)
            {
                document_Type_To_Return.Record_Created_By_User_Id = (int)dataRow["Record_Created_By_User_Id"];
                document_Type_To_Return.Record_Creation_DateTime_UTC = (DateTime)dataRow["Record_Creation_DateTime_UTC"];
            }

            if (dataRow.Table.Columns.IndexOf("Record_Last_Updated_By_User_Id") > -1)
            {
                document_Type_To_Return.Record_Last_Updated_By_User_Id = (int)dataRow["Record_Last_Updated_By_User_Id"];
                document_Type_To_Return.Record_Last_Updated_DateTime_UTC = (DateTime)dataRow["Record_Last_Updated_DateTime_UTC"];
            }

            if (dataRow.Table.Columns.IndexOf("Is_Active") > -1)
            {
                document_Type_To_Return.Is_Active = (bool)dataRow["Is_Active"];
            }

            if (dataRow.Table.Columns.IndexOf("Is_Visible") > -1)
            {
                document_Type_To_Return.Is_Active = (bool)dataRow["Is_Visible"];
            }

            return document_Type_To_Return;
        }

    }
}

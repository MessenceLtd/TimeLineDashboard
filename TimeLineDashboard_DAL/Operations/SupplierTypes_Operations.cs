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
    internal class SupplierTypes_Operations
    {
        #region Singleton
        private static readonly SupplierTypes_Operations instance = new SupplierTypes_Operations();
        // Explicit static constructor to tell C# compiler  
        // not to mark type as beforefieldinit  
        static SupplierTypes_Operations()
        {
        }
        private SupplierTypes_Operations()
        {
        }
        public static SupplierTypes_Operations Instance
        {
            get
            {
                return instance;
            }
        }
        #endregion

        private static readonly List<SupplierType> r_List_Supplier_Types = new List<SupplierType>();

        internal List<SupplierType> Get_Supplier_Types()
        {
            if (r_List_Supplier_Types == null || r_List_Supplier_Types.Count <= 0)
            {
                var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Supplier_Types");

                if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
                {
                    r_List_Supplier_Types.Clear();

                    for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                    {
                        r_List_Supplier_Types.Add(Create_Supplier_Type_Details_From_Data_Row(dataSet.Tables[0].Rows[i]));
                    }
                }
            }

            return r_List_Supplier_Types;
        }


        private SupplierType Create_Supplier_Type_Details_From_Data_Row(DataRow dataRow)
        {
            SupplierType Supplier_Type_To_Return = new SupplierType();

            Supplier_Type_To_Return.Supplier_Type_Id = Convert.ToInt16(dataRow["Supplier_Type_Id"]);
            Supplier_Type_To_Return.Type_Name = dataRow["Type_Name"].ToString();
            Supplier_Type_To_Return.Type_Code = dataRow["Type_Code"].ToString();
            Supplier_Type_To_Return.Description = dataRow["Description"].ToString();

            if (dataRow.Table.Columns.IndexOf("Record_Created_By_User_Id") > -1)
            {
                Supplier_Type_To_Return.Record_Created_By_User_Id = (int)dataRow["Record_Created_By_User_Id"];
                Supplier_Type_To_Return.Record_Creation_DateTime_UTC = (DateTime)dataRow["Record_Creation_DateTime_UTC"];
            }

            if (dataRow.Table.Columns.IndexOf("Record_Last_Updated_By_User_Id") > -1)
            {
                Supplier_Type_To_Return.Record_Last_Updated_By_User_Id = (int)dataRow["Record_Last_Updated_By_User_Id"];
                Supplier_Type_To_Return.Record_Last_Updated_DateTime_UTC = (DateTime)dataRow["Record_Last_Updated_DateTime_UTC"];
            }

            if (dataRow.Table.Columns.IndexOf("Is_Active") > -1)
            {
                Supplier_Type_To_Return.Is_Active = (bool)dataRow["Is_Active"];
            }

            if (dataRow.Table.Columns.IndexOf("Is_Visible") > -1)
            {
                Supplier_Type_To_Return.Is_Active = (bool)dataRow["Is_Visible"];
            }

            return Supplier_Type_To_Return;
        }

    }
}

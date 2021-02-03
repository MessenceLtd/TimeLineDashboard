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
    internal class ExpenseTypes_Operations
    {
        #region Singleton
        private static readonly ExpenseTypes_Operations instance = new ExpenseTypes_Operations();
        // Explicit static constructor to tell C# compiler  
        // not to mark type as beforefieldinit  
        static ExpenseTypes_Operations()
        {
        }
        private ExpenseTypes_Operations()
        {
        }
        public static ExpenseTypes_Operations Instance
        {
            get
            {
                return instance;
            }
        }
        #endregion

        private static readonly List<ExpenseType> r_List_Expense_Types = new List<ExpenseType>();

        internal List<ExpenseType> Get_Expense_Types()
        {
            if (r_List_Expense_Types == null || r_List_Expense_Types.Count <= 0)
            {
                var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Expense_Types");

                if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
                {
                    lock (r_List_Expense_Types)
                    {
                        r_List_Expense_Types.Clear();

                        for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                        {
                            r_List_Expense_Types.Add(Create_Expense_Type_Details_From_Data_Row(dataSet.Tables[0].Rows[i]));
                        }
                    }
                }
            }

            return r_List_Expense_Types;
        }


        private ExpenseType Create_Expense_Type_Details_From_Data_Row(DataRow dataRow)
        {
            ExpenseType Expense_Type_To_Return = new ExpenseType();

            Expense_Type_To_Return.Expense_Type_Id = Convert.ToInt16(dataRow["Expense_Type_Id"]);
            Expense_Type_To_Return.Expense_Type_Name = dataRow["Expense_Type_Name"].ToString();
            Expense_Type_To_Return.Description = dataRow["Description"].ToString();

            Expense_Type_To_Return.Record_Created_By_User_Id = (int)dataRow["Record_Created_By_User_Id"];
            Expense_Type_To_Return.Record_Creation_DateTime_UTC = (DateTime)dataRow["Record_Creation_DateTime_UTC"];

            Expense_Type_To_Return.Record_Last_Updated_By_User_Id = (int)dataRow["Record_Last_Updated_By_User_Id"];
            Expense_Type_To_Return.Record_Last_Updated_DateTime_UTC = (DateTime)dataRow["Record_Last_Updated_DateTime_UTC"];

            Expense_Type_To_Return.Is_Active = (bool)dataRow["Is_Active"];
            Expense_Type_To_Return.Is_Active = (bool)dataRow["Is_Visible"];

            return Expense_Type_To_Return;
        }
    }
}

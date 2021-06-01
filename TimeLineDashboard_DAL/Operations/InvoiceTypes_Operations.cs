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
    internal class InvoiceTypes_Operations
    {
        #region Singleton
        private static readonly InvoiceTypes_Operations instance = new InvoiceTypes_Operations();
        // Explicit static constructor to tell C# compiler  
        // not to mark type as beforefieldinit  
        static InvoiceTypes_Operations()
        {
        }
        private InvoiceTypes_Operations()
        {
        }
        public static InvoiceTypes_Operations Instance
        {
            get
            {
                return instance;
            }
        }
        #endregion

        private static readonly List<InvoiceType> r_List_Invoice_Types = new List<InvoiceType>();

        internal List<InvoiceType> Get_Invoice_Types()
        {
            if (r_List_Invoice_Types == null || r_List_Invoice_Types.Count <= 0)
            {
                this.Populate_Invoice_Types();
            }

            return r_List_Invoice_Types;
        }

        private void Populate_Invoice_Types()
        {
            var dataSet = SQLHelper.SelectUsingStoredProcedure_WithDefaultAppConfigConnectionString("p_TLBoard_Get_Invoice_Types");

            if (dataSet != null && dataSet.Tables[0].Rows.Count > 0)
            {
                lock (r_List_Invoice_Types)
                {
                    r_List_Invoice_Types.Clear();

                    for (int i = 0; i < dataSet.Tables[0].Rows.Count; i++)
                    {
                        r_List_Invoice_Types.Add(Create_Invoice_Type_Details_From_Data_Row(dataSet.Tables[0].Rows[i]));
                    }
                }
            }
        }

        internal InvoiceType Get_By_Id(byte p_Invoice_Type_Id)
        {
            InvoiceType invoice_Type_To_Return = null;

            if (r_List_Invoice_Types == null || r_List_Invoice_Types.Count <= 0)
            {
                this.Populate_Invoice_Types();
            }

            invoice_Type_To_Return = r_List_Invoice_Types.SingleOrDefault(invType => invType.Invoice_Type_Id == p_Invoice_Type_Id);

            return invoice_Type_To_Return;
        }

        private InvoiceType Create_Invoice_Type_Details_From_Data_Row(DataRow dataRow)
        {
            InvoiceType Invoice_Type_To_Return = new InvoiceType();

            Invoice_Type_To_Return.Invoice_Type_Id = Convert.ToInt16(dataRow["Invoice_Type_Id"]);
            Invoice_Type_To_Return.Invoice_Type_Name = dataRow["Invoice_Type_Name"].ToString();
            Invoice_Type_To_Return.Description = dataRow["Description"].ToString();

            Invoice_Type_To_Return.Record_Created_By_User_Id = (int)dataRow["Record_Created_By_User_Id"];
            Invoice_Type_To_Return.Record_Creation_DateTime_UTC = (DateTime)dataRow["Record_Creation_DateTime_UTC"];

            Invoice_Type_To_Return.Record_Last_Updated_By_User_Id = (int)dataRow["Record_Last_Updated_By_User_Id"];
            Invoice_Type_To_Return.Record_Last_Updated_DateTime_UTC = (DateTime)dataRow["Record_Last_Updated_DateTime_UTC"];

            Invoice_Type_To_Return.Is_Active = (bool)dataRow["Is_Active"];
            Invoice_Type_To_Return.Is_Active = (bool)dataRow["Is_Visible"];

            return Invoice_Type_To_Return;
        }
    }
}

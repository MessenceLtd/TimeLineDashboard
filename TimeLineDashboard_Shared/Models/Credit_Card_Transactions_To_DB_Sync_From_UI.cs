using System;
using System.Collections.Generic;
using System.Text;

namespace TimeLineDashboard.Shared.Models
{
    [Serializable]
    public class Credit_Card_Transactions_To_DB_Sync_From_UI
    {
        public long Credit_Card_Statement_Transaction_Id { get; set; }
        public DateTime? Transaction_Date { get; set; }
        public string Business_Name { get; set; }
        public decimal? Transaction_Amount { get; set; }
        public byte? Transaction_Amount_Currency_Id { get; set; }
        public string Transaction_Amount_Currency_Name { get; set; }
        public decimal? Transaction_Actual_Payment_Amount { get; set; }
        public string Description { get; set; }
        public bool Has_Been_Actually_Charged_In_Statement { get; set; }
        public decimal? Total_Charged_In_Statement { get; set; }
        public bool Has_Pending_Changes { get; set; }
        public bool Is_New_Record { get; set; }
        public bool Is_Deleted { get; set; }
    }
}

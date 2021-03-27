using System;
using System.Collections.Generic;
using System.Text;

namespace TimeLineDashboard.Shared.Models
{
    public class Bank_Account_Transactions_To_DB_Sync_From_UI
    {
        public int Bank_Account_Transaction_Id { get; set; }
        public int Bank_Account_Id { get; set; }
        public decimal Transaction_Account_Balance { get; set; }
        public DateTime Transaction_Actual_DateTime { get; set; }
        public decimal Positive_Amount_Entered { get; set; }
        public decimal Negative_Amount_Paid { get; set; }
        public DateTime? Transaction_Value_DateTime { get; set; }
        public string Reference_Number { get; set; }
        public string Transaction_Bank_Description { get; set; }
        public string Transaction_Bank_Inner_Reference_Code { get; set; }
        public bool Is_Visible_To_Anonymous_Users { get; set; }
        public bool Is_Visible_To_Followers_Users { get; set; }
        public bool Has_Pending_Changes { get; set; }
        public bool Is_New_Record { get; set; }
        public bool Is_Deleted { get; set; }
    }
}

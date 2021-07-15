using System;
using System.Collections.Generic;
using System.Text;

namespace TimeLineDashboard.Shared.Models
{
    public class Bank_Account_Transactions
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
        public string Transaction_User_Description { get; set; }
        public string Transaction_User_Comments { get; set; }
        public bool Is_Visible_To_Anonymous_Users { get; set; }
        public bool Is_Visible_To_Followers_Users { get; set; }
        public bool Is_Credit_Card_Statement_Transaction { get; set; }
        public int Credit_Card_Statement_Id { get; set; }
        public int Record_Created_By_User_Id { get; set; }
        public Users Record_Created_By_User_Details { get; set; }
        public DateTime Record_Creation_DateTime_UTC { get; set; }
        public int Record_Last_Updated_By_User_Id { get; set; }
        public Users Record_Last_Updated_By_User_Details { get; set; }
        public DateTime Record_Last_Updated_DateTime_UTC { get; set; }
        public bool Is_Deleted { get; set; }
        public int Record_Deleted_By_User_Id { get; set; }
        public DateTime? Record_Deleted_DateTime_UTC { get; set; }
    }
}

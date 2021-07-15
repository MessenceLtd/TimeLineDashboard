using System;
using System.Collections.Generic;
using System.Text;

namespace TimeLineDashboard.Shared.Models
{
    public class Credit_Cards_Statement_Transaction
    {
        public long Credit_Card_Statement_Transaction_Id { get; set; }
        public int Bank_Account_Credit_Card_Statement_Id { get; set; }
        public int Bank_Account_Owner_User_Id { get; set; }
        public DateTime? Transaction_Date { get; set; }
        public string Business_Name { get; set; }
        public decimal? Transaction_Amount { get; set; }
        public byte? Transaction_Amount_Currency_Id { get; set; }
        public decimal? Transaction_Actual_Payment_Amount { get; set; }
        public string Description { get; set; }
        public bool Has_Been_Actually_Charged_In_Statement { get; set; }
        public decimal? Total_Charged_In_Statement { get; set; }
        public string User_Description { get; set; }
        public string User_Comments { get; set; }
        public short? Transaction_Sort_Order_View { get; set; }
        public bool Is_Visible_To_Anonymous_Users { get; set; }
        public bool Is_Available_For_Download_For_Anonymous_Users { get; set; }
        public bool Is_Visible_To_Followers_Users { get; set; }
        public bool Is_Available_For_Download_For_Followers_Users { get; set; }
        public int Record_Created_By_User_Id { get; set; }
        public Users Record_Created_By_User_Details { get; set; }
        public DateTime Record_Creation_DateTime_UTC { get; set; }
        public int Record_Last_Updated_By_User_Id { get; set; }
        public Users Record_Last_Updated_By_User_Details { get; set; }
        public DateTime Record_Last_Updated_DateTime_UTC { get; set; }
        public bool Is_Deleted { get; set; }
        public int? Record_Deleted_By_User_Id { get; set; }
        public DateTime? Record_Deleted_DateTime_UTC { get; set; }
    }
}

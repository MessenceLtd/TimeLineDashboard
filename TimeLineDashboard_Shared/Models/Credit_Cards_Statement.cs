using System;
using System.Collections.Generic;
using System.Text;

namespace TimeLineDashboard.Shared.Models
{
    public class Credit_Cards_Statement
    {
        public int Credit_Card_Statement_Id { get; set; }
        public int Bank_Account_Id { get; set; }
        public string Bank_Account_Name { get; set; }
        public int Bank_Account_Owner_User_Id { get; set; }
        public int Credit_Card_Id { get; set; }
        public string Card_Name { get; set; }
        public DateTime Statement_Date { get; set; }
        public decimal Total_Amount { get; set; }
        public byte Currency_Id { get; set; }
        public string Currency_Symbol { get; set; }
        public string Original_File_Name { get; set; }
        public string Azure_Block_Blob_Reference { get; set; }
        public long Bank_Account_Transaction_Id_Connection { get; set; }
        public int Record_Created_By_User_Id { get; set; }
        public Users Record_Created_By_User_Details { get; set; }
        public DateTime Record_Creation_DateTime_UTC { get; set; }
        public int Record_Last_Updated_By_User_Id { get; set; }
        public Users Record_Last_Updated_By_User_Details { get; set; }
        public DateTime Record_Last_Updated_DateTime_UTC { get; set; }
        public bool Is_Visible_To_Anonymous_Users { get; set; }
        public bool Is_Available_For_Download_For_Anonymous_Users { get; set; }
        public bool Is_Visible_To_Followers_Users { get; set; }
        public bool Is_Available_For_Download_For_Followers_Users { get; set; }
        public bool Is_Deleted { get; set; }
        public int Record_Deleted_By_User_Id { get; set; }
        public DateTime? Record_Deleted_DateTime_UTC { get; set; }
        public Credit_Card_Transactions_To_DB_Sync_From_UI Credit_Card_Transactions { get; set; }
        public int Total_Purchases { get; set; }
    }
}

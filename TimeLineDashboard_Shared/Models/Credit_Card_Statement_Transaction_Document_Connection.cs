using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TimeLineDashboard.Shared.Models
{
    public class Credit_Card_Statement_Transaction_Document_Connection
    {
        public long Document_Connection_Id { get; set; }
        public long Credit_Card_Statement_Transaction_Id { get; set; }
        public int Bank_Account_Credit_Card_Statement_Id { get; set; }
        public byte Connection_Type { get; set; }
        public int Document_Record_Id { get; set; }
        public DateTime? Document_Date { get; set; }
        public byte? Document_Currency_Id { get; set; }
        public decimal? Document_Total_Amount { get; set; }
        public string Document_Original_File_Name { get; set; }
        public bool Is_Visible_To_Anonymous_Users { get; set; }
        public bool Is_Available_For_Download_For_Anonymous_Users { get; set; }
        public bool Is_Visible_To_Followers_Users { get; set; }
        public bool Is_Available_For_Download_For_Followers_Users { get; set; }
        public int Record_Created_By_User_Id { get; set; }
        public Users Record_Created_By_User_Details { get; set; }
        public DateTime Record_Creation_DateTime_UTC { get; set; }
        public bool Is_Deleted { get; set; }
        public int Record_Deleted_By_User_Id { get; set; }
        public DateTime? Record_Deleted_DateTime_UTC { get; set; }
    }
}

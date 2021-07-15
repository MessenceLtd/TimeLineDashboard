using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TimeLineDashboard.Shared.Models
{
    public class Bank_Account_Transaction_Document_Connection_Suggestion
    {
        public Transaction_Type Transaction_Type { get; set; }

        public byte Connection_Type { get; set; }

        public int Document_Record_Id { get; set; }

        public string Title { get; set; }

        public DateTime Document_Date { get; set; }

        public string Description { get; set; }

        public string Country_Name { get; set; }

        public string City { get; set; }

        public string Email_Address { get; set; }

        public DateTime Creation_DateTime { get; set; }

        public bool Is_Visible_To_Anonymous_Users { get; set; }

        public bool Is_Available_For_Download_For_Anonymous_Users { get; set; }

        public bool Is_Visible_To_Followers_Users { get; set; }

        public bool Is_Available_For_Download_For_Followers_Users { get; set; }

        public int Record_Created_By_User_Id { get; set; }

        public DateTime Record_Creation_DateTime_UTC { get; set; }

        public string Record_Creation_By_User_Fullname { get; set; }

        public int Record_Last_Updated_By_User_Id { get; set; }

        public DateTime Record_Last_Updated_DateTime_UTC { get; set; }

        public string Record_Last_Updated_By_User_Fullname { get; set; }
        
        public bool Is_Deleted { get; set; }

        public int Record_Deleted_By_User_Id { get; set; }

        public DateTime? Record_Deleted_DateTime_UTC { get; set; }
    }

    public enum Transaction_Type
    {
        Bank_Account_Transaction = 1 , 
        Credit_Card_Statement_Transaction = 2  
    }
}

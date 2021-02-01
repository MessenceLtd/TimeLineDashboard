using System;
using System.Collections.Generic;
using System.Text;

namespace TimeLineDashboard.Shared.Models
{
    public class Countries_Vat_History
    {
        public int Vat_History_Record_Id { get; set; }

        public short Country_Id { get; set; }

        public string Country_English_Name { get; set; }

        public DateTime Vat_Changed_Date { get; set; }

        public decimal Vat_Percentage { get; set; }

        public int Record_Created_By_User_Id { get; set; }

        public DateTime Record_Creation_DateTime_UTC { get; set; }

        public int Record_Last_Updated_By_User_Id { get; set; }

        public DateTime Record_Last_Updated_DateTime_UTC { get; set; }
    }
}

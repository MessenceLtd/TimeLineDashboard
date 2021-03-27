using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using TimeLineDashboard.Shared.Models;

namespace TimeLineDashboard.Shared.Responses
{
    public class Bank_Account_Transactions_Response_For_UI
    {
        public int Page_Index { get; set; }

        public int Number_Of_Records { get; set; }

        public List<Bank_Account_Transactions> Bank_Account_Transactions_From_DB { get; set; }

        public DataTable Bank_Account_Transactions_DataTable { get; set; }

        public List<Bank_Account_Transactions_To_DB_Sync_From_UI> Bank_Account_Transactions_To_DB_Sync_From_Or_To_UI { get; set; }

        public int Total_Number_Of_Records { get; set; }
    }
}

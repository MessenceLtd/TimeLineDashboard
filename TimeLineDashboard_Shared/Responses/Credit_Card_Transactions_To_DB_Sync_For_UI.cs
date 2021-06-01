using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using TimeLineDashboard.Shared.Models;

namespace TimeLineDashboard.Shared.Responses
{
    [Serializable]
    public class Credit_Card_Transactions_Response_For_UI
    {
        public List<Credit_Card_Transactions_To_DB_Sync_From_UI> Credit_Card_Transactions_To_DB_Sync_From_Or_To_UI { get; set; }

        public int Total_Number_Of_Records { get; set; }
    }
}

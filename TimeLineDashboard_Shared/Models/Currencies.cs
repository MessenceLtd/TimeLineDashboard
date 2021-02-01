using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TimeLineDashboard.Shared.Models
{
    public class Currencies
    {
        public byte Currency_Id { get; set; }
        public string Currency_Name { get; set; }
        public string Currency_Code { get; set; }
        public string Currency_Symbol { get; set; }
        public decimal Wiki_Daily_Trades_Stats_2019 { get; set; }

        public string Formatted_Currency_Display_For_Selection
        {
            get
            {
                return string.Concat(Currency_Code, " - ", Currency_Symbol);
            }
        }
    }
}

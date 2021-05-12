using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TimeLineDashboard.Shared.Responses
{
    public class Expense_Auto_Complete_Suggestion_Based_On_Uploaded_File_Name_As_Response_For_UI
    {
        public DateTime? Expense_Invoice_DateTime { get; set; }
        public byte? Currency_Id { get; set; }
        public decimal? Total_Amount { get; set; }
        public decimal? Vat_Percentage { get; set; }
        public decimal? Total_Without_Vat { get; set; }
        public decimal? Total_Vat { get; set; }
        public short? Invoiced_Client_To_Country_Id { get; set; }
        public short? Invoiced_Client_To_State_Id { get; set; }
        public int? Supplier_Id { get; set; }
        public short? Invoice_Supplier_Country_Id { get; set; }
        public short? Invoice_Supplier_State_Id { get; set; }
        public string Invoice_Content_Long_Description { get; set; }
    }
}

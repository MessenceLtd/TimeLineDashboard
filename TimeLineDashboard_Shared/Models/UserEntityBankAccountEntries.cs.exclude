using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SharedLayer.Models
{
    public class UserEntityBankAccountEntries
    {
        [Key]
        public int UserEntityBankAccountEntryId { get; set; }

        [Required]
        public int UserEntityBankAccountId { get; set; }

        public virtual UserEntityBankAccounts BankAccountDetails { get; set; }

        public double? CurrentEntryBalanceCredit { get; set; }

        public DateTime? CurrentEntryValueDateTime { get; set; }

        public double? PositiveCreditToBalance { get; set; }

        public double? NagativeCreditToBalance { get; set; }

        [Required]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime BankAccountEntryDateTime { get; set; }

        [Required]
        [StringLength(20)]
        public string EntryReference1 { get; set; }

        [Required]
        [StringLength(40)]
        public string EntryReferenceDescription { get; set; }

        [Required]
        [StringLength(20)]
        public string EntryReference2 { get; set; }

        [StringLength(250)]
        public string EntryUserEntityDescription { get; set; }

        [Required]
        public DateTime BankAccountEntryRowCreationDateTime { get; set; }
    }
}
 
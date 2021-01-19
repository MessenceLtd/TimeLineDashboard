using System;
using System.ComponentModel.DataAnnotations;

namespace SharedLayer.Models
{
    public class UserEntityBankAccounts
    {
        [Key]
        public int UserEntityBankAccountId { get; set; }

        [Required]
        public int UserEntityId { get; set; }

        public virtual UserEntities UserEntityDetails { get; set; }

        [Required]
        [StringLength(15)]
        public string BankAccountNumber { get; set; }

        [Required]
        [StringLength(10)]
        public string BankBranchNumber { get; set; }

        [Required]
        [StringLength(50)]
        public string BranchName { get; set; }

        [Required]
        public int BankNumber { get; set; }

        [Required]
        [StringLength(50)]
        public string BankName { get; set; }

        [Required]
        [StringLength(50)]
        public string BankAccountIBANNumber { get; set; }

        [Required]
        [StringLength(50)]
        public string BankAccountSwiftCode { get; set; }

        public DateTime? BankAccountCreationDateTime { get; set; }

        [Required]
        public DateTime BankAccountRecordCreationDateTime { get; set; }

        public bool IsActive { get; set; }

        public bool IsArchived { get; set; }

        public bool IsDeleted { get; set; }

        public bool IsBankAccountClosed { get; set; }

        public DateTime? BankAccountClosureDateTime { get; set; }
    }
}

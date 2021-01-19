using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using System.Data;

namespace SharedLayer.Models
{
    public class Users
    {
        public Users()
        {

        }

        [Key]
        public int UserId { get; set; }

        [Required]
        [StringLength(50)]
        public string FirstName { get; set; }

        [Required]
        [StringLength(50)]
        public string LastName { get; set; }

        [StringLength(50)]
        public string MiddleName { get; set; }

        [Required]
        [StringLength(100)]
        public string Username { get; set; }

        [Required]
        [StringLength(100)]
        public string Email { get; set; }

        [StringLength(100)]
        public string EcryptedPassword { get; set; }

        [StringLength(100)]
        public string EncryptionRandomSalt { get; set; }

        public DateTime? LastPasswordChangeDate { get; set; }

        [Required]
        public DateTime BirthDate { get; set; }

        [Required]
        [StringLength(20)]
        public string CountryCode { get; set; }

        [Required]
        [StringLength(80)]
        public string CountryName { get; set; }

        [Required]
        public DateTime RegistrationDate { get; set; }

        public bool IsActive { get; set; }

        public bool IsArchived { get; set; }

        public bool IsDeleted { get; set; }
    }
}

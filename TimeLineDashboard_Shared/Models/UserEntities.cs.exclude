using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SharedLayer.Models
{
    public class UserEntities
    {
        [Key]
        public int UserEntityId { get; set; }

        [Required]
        public int UserId { get; set; }

        [Required]
        public DateTime CreationDateTime { get; set; }

        [Required]
        [StringLength(100)]
        public string EntityName { get; set; }

        [Required]
        [StringLength(100)]
        [EmailAddress]
        public string EntityEmail { get; set; }

        [Required]
        [StringLength(50)]
        public string EntityType { get; set; }

        public bool IsActive { get; set; }

        public bool IsArchived { get; set; }

        public bool IsDeleted { get; set; }

        // Foreign key table references "Users"
        public virtual Users UserDetails { get; set; }
    }
}

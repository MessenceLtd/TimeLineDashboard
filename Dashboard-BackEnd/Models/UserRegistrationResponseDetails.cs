using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Dashboard_BackEnd.Models
{
    public class UserRegistrationResponseDetails
    {
        [Required]
        [StringLength(30)]
        public string Username { get; set; }

        
    }
}

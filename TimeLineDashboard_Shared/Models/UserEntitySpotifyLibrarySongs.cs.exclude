//using Microsoft.AspNetCore.SignalR;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SharedLayer.Models
{
    public class UserEntitySpotifyLibrarySongs
    {
        [Key]
        public int UserLibrarySongId { get; set; }

        [Required]
        public int UserId { get; set; }

        public Users UserDetails { get; set; }

        [Required]
        [StringLength(200)]
        public string SongName { get; set; }

        [Required]
        public DateTime addedOn { get; set; }

        [Required]
        [StringLength(300)]
        public string Artists { get; set; }

        [Required]
        [StringLength(200)]
        public string StreamUrl { get; set; }

    }
}

using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace SharedLayer.Models
{
    public class UserEntitySocialActivityYoutubeVideosLikes
    {
        [Key]
        public int UserEntityYoutubeLikeId { get; set; }

        [Required]
        public int UserEntityId { get; set; }

        public UserEntities UserEntityDetails { get; set; }

        [Required]
        [StringLength(20)]
        // string value for the ending direct share link -- example : youtu.be/s6MzaZerMsk (storing the value after youtu.be/)
        public string YoutubeVideoLink { get; set; } 

        [Required]
        public DateTime ScanDate { get; set; }

    }
}

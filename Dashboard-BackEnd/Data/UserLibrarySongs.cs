using Microsoft.AspNetCore.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Dashboard_BackEnd.Data
{
    public class UserLibrarySongs
    {
        public int UserId { get; set; }

        public int SongLibraryId { get; set; }

        public string SongName { get; set; }

        public DateTime addedOn { get; set; }

    }
}

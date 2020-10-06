using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Dashboard_BackEnd.Data
{
    public class DashBoardTimeLineDbContext : DbContext
    {
        public DashBoardTimeLineDbContext(DbContextOptions<DashBoardTimeLineDbContext> options) : base(options)
        {

        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            //optionsBuilder.Usesq("Data Source=blog.db");
        }

        public DbSet<Users> Users { get; set;}

        public DbSet<UserLibrarySongs> UserLibrarySongs { get; set; }

    }
}

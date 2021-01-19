using Dashboard_BackEnd.Models;
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

        public DbSet<UserEntities> UserEntities { get; set; }

        public DbSet<UserEntitySpotifyLibrarySongs> UserEntitySpotifyLibrarySongs { get; set; }

        public DbSet<UserEntityBankAccounts> UserEntityBankAccounts { get; set; }

        public DbSet<UserEntityBankAccountEntries> UserEntityBankAccountEntries { get; set; }

    }
}

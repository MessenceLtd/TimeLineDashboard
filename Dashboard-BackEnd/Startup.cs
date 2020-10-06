using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Dashboard_BackEnd.Data;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.EntityFrameworkCore;

namespace Dashboard_BackEnd
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers();

            // Validatate dbConnection string and that exists in local environment 

            string safelyStoredConnectionString = this.Configuration.GetConnectionString("DashBoardTimeLineDBConnectionString");

            if ( ! string.IsNullOrEmpty( safelyStoredConnectionString ))
            {
                services.AddDbContext<DashBoardTimeLineDbContext>(option => option.UseSqlServer(
                   safelyStoredConnectionString
               ));
            }
            else
            {
                throw new Exception(@"Database connection is missing from configuration settings! 
                    Have you read the readme.txt file? where are the ""appsettings.Development.json"" and ""appsettings.Production.json"" files? 
                    They are not in github for security reasons...");
            }
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, DashBoardTimeLineDbContext dbContext)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            //app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            // Ensure the database is up tp date  
            // dbContext.Database.EnsureCreated();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}


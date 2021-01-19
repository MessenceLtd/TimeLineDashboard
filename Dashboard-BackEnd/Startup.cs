using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
//using Dashboard_BackEnd.Data;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using SharedLayer;

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
            ConfigurationHelper.Instance.SetConfigurations(this.Configuration);

            services.AddControllers();

            // Validatate dbConnection string and that exists in local environment 

            string safelyStoredConnectionString = this.Configuration.GetConnectionString("DashBoardTimeLineDBConnectionString");

            if (string.IsNullOrEmpty(safelyStoredConnectionString))
            {
                // services.AddDbContext<DashBoardTimeLineDbContext>(option => option.UseSqlServer(
                //    safelyStoredConnectionString
                //));

                throw new Exception(@"Database connection is missing from configuration settings! 
                    Have you read the readme.txt file? where are the ""appsettings.Development.json"" and ""appsettings.Production.json"" files? 
                    They are not in github for security reasons...");
            }

            services.AddCors();
            services.AddControllers().AddJsonOptions(x => x.JsonSerializerOptions.IgnoreNullValues = true);

            string serverSideSecurityTokenSaltForJwtAuthentication = Configuration["Jwt:SecretJwtAuthEncryptionKey"];

            services.AddAuthentication(x =>
            {
                x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(x =>
            {
                x.RequireHttpsMetadata = true;
                x.SaveToken = true;
                x.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuer = true,
                    ValidIssuer = Configuration["Jwt:Issuer"],
                    ValidateIssuerSigningKey = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.ASCII.GetBytes(Configuration["Jwt:SecretJwtAuthEncryptionKey"])),
                    ValidAudience = Configuration["Jwt:Issuer"],
                    ValidateAudience = true,
                    ValidateLifetime = true,
                    ClockSkew = TimeSpan.FromMinutes(1)
                };
            });

            services.AddMvc();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            //app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthentication();
            app.UseAuthorization();
            // Order application to include authentication for the Jwt settings

            // Ensure the database is up tp date
            //dbContext.Database.EnsureCreated();

            //// migrate database changes on startup (includes initial db creation)
            //dbContext.Database.Migrate();

            // custom jwt auth middleware
            //app.UseMiddleware<JwtMiddleware>();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }



    

}


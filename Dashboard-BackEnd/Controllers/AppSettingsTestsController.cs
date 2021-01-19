using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;

namespace Dashboard_BackEnd.Controllers
{
    [ApiController]
    [Route("[controller]")]
    [Authorize]
    public class AppSettingsTestsController : ControllerBase
    {
        IConfiguration _configuration; 

        public AppSettingsTestsController(IConfiguration configuration)
        {
            this._configuration = configuration;
        }

        [HttpGet]
        public string Get()
        {
            return this._configuration.GetConnectionString("DashBoardTimeLineDBConnectionString");
        }

        //public IActionResult Index()
        //{
        //    return View();
        //}
    }
}
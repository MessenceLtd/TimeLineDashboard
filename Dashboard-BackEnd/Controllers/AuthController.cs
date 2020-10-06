using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Dashboard_BackEnd.Data;
using Microsoft.AspNetCore.Mvc;

namespace Dashboard_BackEnd.Controllers
{
    public class AuthController : Controller
    {
        private DashBoardTimeLineDbContext _dashBoardTimeLineDbContext;

        public AuthController(DashBoardTimeLineDbContext dashBoardTimeLineDbContext)
        {
            this._dashBoardTimeLineDbContext = dashBoardTimeLineDbContext;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult GetAllUsers()
        {
            var usersList = this._dashBoardTimeLineDbContext.Users.Find();
            if (usersList == null)
            {
                return NotFound();
            }

            return View(usersList);
        }
    }
}
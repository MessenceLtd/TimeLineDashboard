using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Dashboard_BackEnd.Models;
using Microsoft.AspNetCore.Authorization;
using SharedLayer.Models;
using TimeLineDashboard.BusinessLogicLayer;

namespace Dashboard_BackEnd.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class UserEntityBankAccountsController : ControllerBase
    {
        

        public UserEntityBankAccountsController()
        {
            
        }

        // GET: api/UserEntityBankAccounts
        //[HttpGet]
        //public async Task<ActionResult<IEnumerable<UserEntityBankAccounts>>> GetUserEntityBankAccounts()
        //{
        //    var userId = 2;

        //    var query = (IQueryable<UserEntityBankAccounts>)( from bankAccounts in _context.Set<UserEntityBankAccounts>()
        //                join userEntities in _context.Set<UserEntities>()
        //                    on bankAccounts.UserEntityId equals userEntities.UserEntityId
        //                where userEntities.UserId == userId
        //                select new { bankAccounts });

        //    var query2 = _context.UserEntityBankAccounts.AsQueryable();

        //    //return await _context.UserEntityBankAccounts.ToListAsync();

        //    return await query.ToListAsync();
        //}

        private IQueryable<UserEntityBankAccounts> GetAllBankAccounts()
        {
            //return _context.UserEntityBankAccounts.AsQueryable();
            //return BusinessLogicLayerFacade.Instance.
            return null;
        }

        [HttpGet]
        public Task<ActionResult<List<UserEntityBankAccounts>>> Index()
        {
            var userId = 2;

            //return GetAllBankAccounts().Where(u => u.UserEntityDetails.UserId == userId).ToListAsync();
            return null;
        }

    }
}

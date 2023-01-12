using BoardWebApp.Data;
using BoardWebApp.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Query.Internal;
using System.Diagnostics;

namespace BoardWebApp.Controllers
{
    public class HomeController : Controller
    {
        //private readonly ILogger<HomeController> _logger;

        //이게 있어야 DB랑 연결
        private readonly ApplicationDbContext _context;

        public HomeController(ApplicationDbContext context)
        {
            _context = context;
        }

        //생성자


        //public HomeController(ILogger<HomeController> logger)
        //{
        //    _logger = logger;
        //}


        public IActionResult Index()
        {
            //DB에서 데이터 로드
            var query = @"SELECT TOP 1 *
                            FROM Profiles 
                           WHERE Division = 'TOP' 
                        ORDER BY id desc";
            Profile top = _context.Profiles.FromSqlRaw(query).FirstOrDefault();
            if (top == null)
            {
                top = new Profile // DB에 데이터가 없을 때 가짜 데이터
                {
                    Title = "공사중입니다.",
                    Division = string.Empty,
                    Url = string.Empty,
                    FileName = string.Empty
                };
            }

            query = @"SELECT TOP 1 *
                            FROM Profiles 
                           WHERE Division = 'Card1' 
                        ORDER BY id desc";

            Profile Card1 = _context.Profiles.FromSqlRaw(query).FirstOrDefault();
            if (Card1 == null)
            {
                Card1 = new Profile
                {
                    Title = "Card1 영역입니다.",
                    Division = string.Empty,
                    Url = string.Empty,
                    FileName = string.Empty
                };
            }

            List<Profile> list = new List<Profile>();
            list.Add(top);
            list.Add(Card1);

            return View(list);
        }

        public IActionResult Privacy()
        {

            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
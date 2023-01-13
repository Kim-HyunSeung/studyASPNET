using BoardWebApp.Data;
using BoardWebApp.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Query.Internal;
using System.Diagnostics;
using static Microsoft.EntityFrameworkCore.DbLoggerCategory;

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
			//DB에서 데이터 로드 (Top영역에서 DB로드)
			var query = @"SELECT TOP 1 *
                            FROM Profiles 
                           WHERE Division = 'TOP' 
                        ORDER BY id desc";
			ProfileModel top = _context.Profiles.FromSqlRaw(query).FirstOrDefault();
			if (top == null)
			{
				top = new ProfileModel // DB에 데이터가 없을 때 가짜 데이터
				{
					Title = "공사중입니다.",
					Division = "Top",
					Description = string.Empty,
					Url = string.Empty,
					FileName = string.Empty
				};
			}

			// card1 영역 db에서 로드
			query = @"SELECT TOP 1 *
                            FROM Profiles 
                           WHERE Division = 'Card1' 
                        ORDER BY id desc";

			ProfileModel Card1 = _context.Profiles.FromSqlRaw(query).FirstOrDefault();
			if (Card1 == null)
			{
				Card1 = new ProfileModel
				{
					Title = "Card1 영역입니다.",
					Division = "Card1",
					Description = "Card1 영역입니다.",
					Url = string.Empty,
					FileName = "https://placeimg.com/900/400/any"
				};
			}

			// card2 영역 db에서 로드
			query = @"SELECT TOP 1 *
                            FROM Profiles 
                           WHERE Division = 'Card2' 
                        ORDER BY id desc";

			ProfileModel Card2 = _context.Profiles.FromSqlRaw(query).FirstOrDefault();
			if (Card2 == null)
			{
				Card2 = new ProfileModel
				{
					Title = "Card2 영역입니다.",
					Division = "Card2",
					Description = "Card2 영역입니다.",
					Url = string.Empty,
					FileName = "https://placeimg.com/900/400/any"
				};
			}

			// card3 영역 db에서 로드
			query = @"SELECT TOP 1 *
                            FROM Profiles 
                           WHERE Division = 'Card3' 
                        ORDER BY id desc";

			ProfileModel Card3 = _context.Profiles.FromSqlRaw(query).FirstOrDefault();
			if (Card3 == null)
			{
				Card3 = new ProfileModel
				{
					Title = "Card3 영역입니다.",
					Division = "Card3",
					Description = "Card3 영역입니다.",
					Url = string.Empty,
					FileName = "https://placeimg.com/900/400/any"
				};
			}



			List<ProfileModel> list = new List<ProfileModel> { top, Card1, Card2, Card3 };

			return View(list);
		}

		[HttpGet]
		public IActionResult About()
		{
			// card1 영역 db에서 로드
			var query = @"SELECT TOP 1 *
                            FROM Profiles 
                           WHERE Division = 'Card1' 
                        ORDER BY id desc"
			;

			ProfileModel Card1 = _context.Profiles.FromSqlRaw(query).FirstOrDefault();
			if (Card1 == null)
			{
				Card1 = new ProfileModel
				{
					Title = "Card1 영역입니다.",
					Division = "Card1",
					Description = "Card1 영역입니다.",
					Url = string.Empty,
					FileName = "https://placeimg.com/900/400/any"
				};
			}

			// card2 영역 db에서 로드
			query = @"SELECT TOP 1 *
                            FROM Profiles 
                           WHERE Division = 'Card2' 
                        ORDER BY id desc"
			;

			ProfileModel Card2 = _context.Profiles.FromSqlRaw(query).FirstOrDefault();
			if (Card2 == null)
			{
				Card2 = new ProfileModel
				{
					Title = "Card2 영역입니다.",
					Division = "Card2",
					Description = "Card2 영역입니다.",
					Url = string.Empty,
					FileName = "https://placeimg.com/900/400/any"
				};
			}

			// card3 영역 db에서 로드
			query = @"SELECT TOP 1 *
                            FROM Profiles 
                           WHERE Division = 'Card3' 
                        ORDER BY id desc"
			;

			ProfileModel Card3 = _context.Profiles.FromSqlRaw(query).FirstOrDefault();
			if (Card3 == null)
			{
				Card3 = new ProfileModel
				{
					Title = "Card3 영역입니다.",
					Division = "Card3",
					Description = "Card3 영역입니다.",
					Url = string.Empty,
					FileName = string.Empty
				};
			}



			List<ProfileModel> list = new List<ProfileModel> { Card1, Card2, Card3 };

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
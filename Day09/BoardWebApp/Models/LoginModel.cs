using System.ComponentModel.DataAnnotations;

namespace BoardWebApp.Models
{
	public class LoginModel
	{		
		[Required(AllowEmptyStrings = false, ErrorMessage = "아이디를 입력하세요.")]
		[Display(Name = "아이디")]
		public string UserName { get; set; }

		[Required(AllowEmptyStrings = false, ErrorMessage = "패스워드를 입력하세요.")]
		[DataType(DataType.Password)]
		[Display(Name = "패스워드")]
		public string Password { get; set; }

		[Display(Name = "아이디 저장")]
		public bool RememberMe { get; set; }
	}
}

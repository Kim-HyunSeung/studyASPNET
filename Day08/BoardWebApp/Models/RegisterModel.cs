using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;
using System.Net;

namespace BoardWebApp.Models
{
	
	public class RegisterModel
	{
		[Key]

		public int Id { get; set; }

		[Required(AllowEmptyStrings = false, ErrorMessage = "유저 아이디를 입력하세요.")]
		[Display(Name = "유저아이디")]
		public string UserName { get; set; }

		[Required(AllowEmptyStrings = false, ErrorMessage = "이메일을 입력하세요.")]
		[EmailAddress(ErrorMessage = "이메일형식에 맞지 않습니다.")]
		[Display(Name = "이메일")]
		public string Email { get; set; }

		[Required(AllowEmptyStrings = false, ErrorMessage = "패스워드를 입력하세요.")]
		[DataType(DataType.Password)]
		[Display(Name = "패스워드")]
		public string Password { get; set; }

		[Required(AllowEmptyStrings = false, ErrorMessage = "패스워드를 확인 하세요.")]
		[DataType(DataType.Password)]
		[Display(Name ="패스워드 확인")]
		[Compare("Password",ErrorMessage = "패스워드가 일치하지 않습니다.")]
		public string ConfirmPassword { get; set; }

		[Display(Name ="핸드폰 번호")]				
		public string? PhoneNumber { get; set; }
	}
}

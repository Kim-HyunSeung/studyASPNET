using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace BoardWebApp.Models
{
	public class Note
	{
		[Key]
		public int Id { get; set; }
		[Required]
		[DisplayName("아이디")]
		public string UserId { get; set; }
		[DisplayName("이름")]
		public string Name { get; set; }
		[Required]
		[DisplayName("제목")]
		public string Title { get; set; }
		[DisplayName("조회수")]
		public int ReadCount { get; set; } = 0;
		[DisplayName("작성일")]
		public DateTime PostDate { get; set; } = DateTime.Now;
		[DisplayName("작성글")]
		public string Contents { get; set; }
	}
}

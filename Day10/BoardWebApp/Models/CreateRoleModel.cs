using System.ComponentModel.DataAnnotations;

namespace BoardWebApp.Models
{
	public class CreateRoleModel
	{
		[Required]
		public string RoleName { get; set; }
	}
}

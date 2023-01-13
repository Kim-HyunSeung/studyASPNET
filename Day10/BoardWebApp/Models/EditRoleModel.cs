using System.ComponentModel.DataAnnotations;

namespace BoardWebApp.Models
{
	public class EditRoleModel
	{
		public EditRoleModel()
		{
			Users = new List<string>();
		}

		public string Id { get; set; }

		[Required(ErrorMessage = "롤이름은 필수입니다.")]
		public string RoleName { get; set; }

		public List<string> Users { get; set; }
	}
}

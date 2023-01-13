using BoardWebApp.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace BoardWebApp.Controllers
{
	//[Authorize(Roles = "Admin")]
	public class AdminController : Controller
	{
		private readonly RoleManager<IdentityRole> roleManager;
		private readonly UserManager<IdentityUser> userManager;

		public AdminController(RoleManager<IdentityRole> roleManager, UserManager<IdentityUser> userManager)
		{
			this.roleManager = roleManager;
			this.userManager = userManager;
		}

		[HttpGet]
		public IActionResult CreateRole()
		{
			return View();
		}

		[HttpPost]
		public async Task<IActionResult> CreateRole(CreateRoleModel model)
		{
			if (ModelState.IsValid)
			{
				IdentityRole role = new IdentityRole
				{
					Name = model.RoleName
				};

				IdentityResult result = await roleManager.CreateAsync(role);

				if (result.Succeeded)
				{
					return RedirectToAction("ListRoles","Admin");
				}

				foreach(IdentityError error in result.Errors)
				{
					ModelState.AddModelError("", error.Description);
				}
			}

			return View(model);
		}

		[HttpGet]
		public IActionResult ListRoles()
		{
			var roles = roleManager.Roles;
			return View(roles);
		}

		[HttpGet]
		//[Authorize(Policy = "EditRolePolicy")]
		public async Task<IActionResult> EditRole(string id)
		{
			var role = await roleManager.FindByIdAsync(id);
			if (role == null)
			{
				ViewBag.ErrorMessage = $"Role with Id = {id} cannot be found";
				return View("NotFound");
			}

			var model = new EditRoleModel
			{
				Id = role.Id,
				RoleName = role.Name
			};

			var userList = await userManager.Users.ToListAsync();

			foreach (var user in userList)
			{
				if (await userManager.IsInRoleAsync(user, role.Name))
				{
					model.Users.Add(user.UserName);
				}
			}

			return View(model);
		}

		[HttpPost]
		//[Authorize(Policy = "EditRolePolicy")]
		public async Task<IActionResult> EditRole(EditRoleModel model)
		{
			var role = await roleManager.FindByIdAsync(model.Id);
			if (role == null)
			{
				ViewBag.ErrorMessage = $"Role with Id = {model.Id} cannot be found";
				return View("NotFound");
			}
			else
			{
				role.Name = model.RoleName;
				var result = await roleManager.UpdateAsync(role);

				if (result.Succeeded)
				{
					return RedirectToAction("ListRoles","Admin");
				}

				foreach (var error in result.Errors)
				{
					ModelState.AddModelError("", error.Description);
				}

				return View(model);
			}
		}

        [HttpGet]
        public async Task<IActionResult> EditUsersInRole(string roleId)
        {
            ViewBag.roleId = roleId;

            var role = await roleManager.FindByIdAsync(roleId);

            if (role == null)
            {
                ViewBag.ErrorMessage = $"Role with Id = {roleId} cannot be found";
                return View("NotFound");
            }

            var model = new List<UserRoleModel>();

            var userList = await userManager.Users.ToListAsync();

            foreach (var user in userList)
            {
                var userRoleViewModel = new UserRoleModel
                {
                    UserId = user.Id,
                    UserName = user.UserName,
                };

                if (await userManager.IsInRoleAsync(user, role.Name))
                {
                    userRoleViewModel.IsSelected = true;
                }
                else
                {
                    userRoleViewModel.IsSelected = false;
                }

                model.Add(userRoleViewModel);
            }

            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> EditUsersInRole(List<UserRoleModel> model, string roleId)
        {
            ViewBag.roleId = roleId;

            var role = await roleManager.FindByIdAsync(roleId);

            if (role == null)
            {
                ViewBag.ErrorMessage = $"Role with Id = {roleId} cannot be found";
                return View("NotFound");
            }

            IdentityResult result = null;

            foreach (var user in model)
            {
                var userObj = await userManager.FindByIdAsync(user.UserId);

                if (user.IsSelected && !(await userManager.IsInRoleAsync(userObj, role.Name)))
                {
                    result = await userManager.AddToRoleAsync(userObj, role.Name);
                }
                else if (!user.IsSelected && await userManager.IsInRoleAsync(userObj, role.Name))
                {
                    result = await userManager.RemoveFromRoleAsync(userObj, role.Name);
                }
            }

            return RedirectToAction("EditRole", new { Id = roleId });
        }

    }
}

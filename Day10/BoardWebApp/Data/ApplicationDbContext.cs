using BoardWebApp.Models;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;


namespace BoardWebApp.Data
{
    public class ApplicationDbContext : IdentityDbContext
    {
        public ApplicationDbContext(DbContextOptions options) : base(options)
        {

        }

		protected override void OnModelCreating(ModelBuilder builder)
		{
			base.OnModelCreating(builder);
		}

		public DbSet<NoteModel> Notes { get; set; }    

		public DbSet<BoardWebApp.Models.RegisterModel> RegisterModel { get; set; }

		public DbSet<ProfileModel> Profiles { get; set; }

	}
}

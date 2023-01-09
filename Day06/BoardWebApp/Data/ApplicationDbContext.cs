using BoardWebApp.Models;
using Microsoft.EntityFrameworkCore;

namespace BoardWebApp.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions options) : base(options)
        {
        }

        public DbSet<Note> Notes { get; set; }    
    }
}

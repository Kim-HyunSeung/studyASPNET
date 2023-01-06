using BasicWeb.Models;
using Microsoft.EntityFrameworkCore;

namespace BasicWeb.Data
{
    /// <summary>
    /// Db접속하고 관리하기 위한 총괄클래스
    /// </summary>
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions options) : base(options)
        {
        }

        public DbSet<Category> Categories { get; set; }
    }
}

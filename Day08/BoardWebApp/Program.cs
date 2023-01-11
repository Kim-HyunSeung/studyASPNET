using BoardWebApp.Data;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

namespace BoardWebApp
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            builder.Services.AddControllersWithViews();
            //DB구성추가
            builder.Services.AddDbContext<ApplicationDbContext>(
                    options => options.UseSqlServer(
                        builder.Configuration.GetConnectionString("DbConnection")
                        )
                );


            // ASP.NET Identity 서비스 추가
            builder.Services.AddIdentity<IdentityUser, IdentityRole>()
                .AddEntityFrameworkStores<ApplicationDbContext>()
                .AddDefaultTokenProviders();

            // 패스워드 정책 변경하는 설정
            builder.Services.Configure<IdentityOptions>(
                    opt =>
                    {
                        opt.Password.RequiredLength = 4; // 글자길이 제한
                        opt.Password.RequireNonAlphanumeric = false; // 특수문자 사용
                        opt.Password.RequireDigit = false; // 영문자 사용
                        opt.Password.RequireLowercase = false; // 소문자 사용
                        opt.Password.RequireUppercase = false; // 대문자사용
                    }
                );

            var app = builder.Build();

            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthentication(); // 이제부터 계정을 사용.
            app.UseAuthorization();

            app.MapControllerRoute(
                name: "default",
                pattern: "{controller=Home}/{action=Index}/{id?}");

            app.Run();
        }
    }
}
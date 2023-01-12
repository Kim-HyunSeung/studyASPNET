using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace BoardWebApp.Models
{
    // 실제 저장용 모델 - 파일데이터 바로 받을수 없다.
    public class Profile
    {
        [Key]
        public int Id { get; set; }

        [Required]
        public string Division { get; set; }

        [Required]
        public string Title { get; set; }

        [Required]
        public string Description { get; set; }

      
        public string? Url { get; set; }


        // 저장될 파일명
        [FileExtensions(Extensions = ".jpg,.png,.jpeg", ErrorMessage = "이미지 파일을 선택하세요.")]
        public string? FileName { get; set; }
    }

    //파일을 업로드하기위해 중간단계 모델
    public class TempProfile
    {
        public int Id { get; set; }

        [Required]
        public string Division { get; set; }

        [Required]
        public string Title { get; set; }

        [Required]
        public string Description { get; set; }
      
        public string? Url { get; set; }

        // 핵심!!!!
        [Display(Name = "이미지파일")]
        public IFormFile? ProfileImage { get; set; }

        public string? FileName { get; set; }
    }
}

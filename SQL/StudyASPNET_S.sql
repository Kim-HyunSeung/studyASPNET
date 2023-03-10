USE [studyASPNET]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2023-01-13 오후 2:23:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DisplayOrder] [nvarchar](20) NULL,
	[PostDate] [datetime] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notes]    Script Date: 2023-01-13 오후 2:23:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[ReadCount] [int] NOT NULL,
	[PostDate] [datetime2](7) NOT NULL,
	[Contents] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Notes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Profiles]    Script Date: 2023-01-13 오후 2:23:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Profiles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Division] [nvarchar](50) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Url] [nvarchar](500) NULL,
	[FileName] [nvarchar](500) NULL,
 CONSTRAINT [PK_Profiles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegisterModel]    Script Date: 2023-01-13 오후 2:23:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegisterModel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[ConfirmPassword] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NULL,
 CONSTRAINT [PK_RegisterModel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [DisplayOrder], [PostDate]) VALUES (1, N'Apple', N'1', CAST(N'2023-01-06T15:18:20.000' AS DateTime))
INSERT [dbo].[Categories] ([Id], [Name], [DisplayOrder], [PostDate]) VALUES (2, N'삼성전자', N'2', CAST(N'2023-01-06T15:19:30.000' AS DateTime))
INSERT [dbo].[Categories] ([Id], [Name], [DisplayOrder], [PostDate]) VALUES (3, N'LG전자', N'3', CAST(N'2023-01-06T15:19:50.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Notes] ON 

INSERT [dbo].[Notes] ([Id], [UserId], [Name], [Title], [ReadCount], [PostDate], [Contents]) VALUES (4, N'admin', N'김현승', N'이제 DB로 내용을 넣습니다.', 17, CAST(N'2023-01-09T12:34:00.0000000' AS DateTime2), N'게시글 내용부분입니다. DB에 들어갑니다.')
INSERT [dbo].[Notes] ([Id], [UserId], [Name], [Title], [ReadCount], [PostDate], [Contents]) VALUES (5, N'admin', N'김현승', N'에디터 추가후 새글', 7, CAST(N'2023-01-09T17:13:27.8939490' AS DateTime2), N'<p>새글 입니다.</p><p><br></p><p>아아<img src="https://image.ytn.co.kr/general/jpg/2022/0907/202209071036571860_d.jpg" style="background-color: var(--bs-body-bg); font-family: var(--bs-body-font-family); font-size: var(--bs-body-font-size); font-weight: var(--bs-body-font-weight); text-align: var(--bs-body-text-align);" alt="문채원"></p><p><a href="www.naver.com" target="_self width="300">네이버</a><br></p>')
INSERT [dbo].[Notes] ([Id], [UserId], [Name], [Title], [ReadCount], [PostDate], [Contents]) VALUES (9, N'BBB', N'김현승', N'7일차 시작입니다.', 25, CAST(N'2023-01-10T09:17:31.1083295' AS DateTime2), N'<p><span class="media_end_summary" style="display: block; overflow: hidden; position: relative; margin: -5px 10px 31px 1px; padding-left: 14px; font-family: HelveticaNeue-Medium, AppleSDGothicNeo-Medium, Arial, sans-serif; color: rgb(48, 48, 56); font-size: 17px; letter-spacing: -0.3px;"><span class="u_word_dic" data-hook="tip" data-type="arken" data-lang="en"><br></span></span><span class="media_end_summary" style="display: block; overflow: hidden; position: relative; margin: -5px 10px 31px 1px; padding-left: 14px; font-family: HelveticaNeue-Medium, AppleSDGothicNeo-Medium, Arial, sans-serif; color: rgb(48, 48, 56); font-size: 17px; letter-spacing: -0.3px;"><span class="u_word_dic" data-hook="tip" data-type="arken" data-lang="en"><br></span></span><span class="media_end_summary" style="display: block; overflow: hidden; position: relative; margin: -5px 10px 31px 1px; padding-left: 14px; font-family: HelveticaNeue-Medium, AppleSDGothicNeo-Medium, Arial, sans-serif; color: rgb(48, 48, 56); font-size: 17px; letter-spacing: -0.3px;"><span class="u_word_dic" data-hook="tip" data-type="arken" data-lang="en">SKT</span>, 재택근무 주 1회로 제한…거점오피스 ''스피어(<span data-type="ore" data-lang="en">sphere</span>)'' 적극 활용<br>카카오, ''오피스 퍼스트'' 근무 체제 전환</span><span class="media_end_summary" style="text-align: center; display: block; overflow: hidden; position: relative; margin: -5px 10px 31px 1px; padding-left: 14px; font-family: HelveticaNeue-Medium, AppleSDGothicNeo-Medium, Arial, sans-serif; color: rgb(48, 48, 56); font-size: 17px; letter-spacing: -0.3px;">네이버 뉴스 스크랩</span></p><p class="nbd_im_w _LAZY_LOADING_WRAP " style="clear: both; margin: 0px; padding-top: 0px; text-align: center;"><p class="nbd_a _LAZY_LOADING_ERROR_HIDE" id="img_a1" style="position: relative;"><img id="img1" class="_LAZY_LOADING" src="https://imgnews.pstatic.net/image/277/2023/01/10/0005203089_001_20230110085801422.jpg?type=w647" style="border: 0px; vertical-align: top; width: 700px; margin-bottom: 14px;"></p></p><p><span class="end_photo_org" style="position: relative; z-index: 1; display: block; margin: 0px; padding-top: 1px; text-align: center; zoom: 1; color: rgb(48, 48, 56); font-family: HelveticaNeue, AppleSDGothicNeo-Regular, Arial, sans-serif; font-size: 17px; letter-spacing: -0.3px;"></span><br style="color: rgb(48, 48, 56); font-family: HelveticaNeue, AppleSDGothicNeo-Regular, Arial, sans-serif; font-size: 17px; letter-spacing: -0.3px;"><br style="color: rgb(48, 48, 56); font-family: HelveticaNeue, AppleSDGothicNeo-Regular, Arial, sans-serif; font-size: 17px; letter-spacing: -0.3px;"><span style="color: rgb(48, 48, 56); font-family: HelveticaNeue, AppleSDGothicNeo-Regular, Arial, sans-serif; font-size: 17px; letter-spacing: -0.3px;">코로나19가 확산세가 잦아들면서&nbsp;</span><span data-type="ore" data-lang="en" style="color: rgb(48, 48, 56); font-family: HelveticaNeue, AppleSDGothicNeo-Regular, Arial, sans-serif; font-size: 17px; letter-spacing: -0.3px;">IT</span><span style="color: rgb(48, 48, 56); font-family: HelveticaNeue, AppleSDGothicNeo-Regular, Arial, sans-serif; font-size: 17px; letter-spacing: -0.3px;">업계 트렌드로 자리 잡았던 ‘재택 근무’도 점점 사라져가고 있다. 기업들은 직원들을 사무실로 복귀시켜 본격적인 근무 생산성 제고에 나서는 모습이다.</span><br style="color: rgb(48, 48, 56); font-family: HelveticaNeue, AppleSDGothicNeo-Regular, Arial, sans-serif; font-size: 17px; letter-spacing: -0.3px;"><br style="color: rgb(48, 48, 56); font-family: HelveticaNeue, AppleSDGothicNeo-Regular, Arial, sans-serif; font-size: 17px; letter-spacing: -0.3px;"><span style="color: rgb(48, 48, 56); font-family: HelveticaNeue, AppleSDGothicNeo-Regular, Arial, sans-serif; font-size: 17px; letter-spacing: -0.3px;">10일&nbsp;</span><span data-type="ore" data-lang="en" style="color: rgb(48, 48, 56); font-family: HelveticaNeue, AppleSDGothicNeo-Regular, Arial, sans-serif; font-size: 17px; letter-spacing: -0.3px;">SK</span><span style="color: rgb(48, 48, 56); font-family: HelveticaNeue, AppleSDGothicNeo-Regular, Arial, sans-serif; font-size: 17px; letter-spacing: -0.3px;">텔레콤은 다음달부터 ''메인 오피스'' 근무를 원칙으로 하는 내용의 ''워크 프롬 애니웨어(</span><span data-type="ore" data-lang="en" style="color: rgb(48, 48, 56); font-family: HelveticaNeue, AppleSDGothicNeo-Regular, Arial, sans-serif; font-size: 17px; letter-spacing: -0.3px;">Work</span><span style="color: rgb(48, 48, 56); font-family: HelveticaNeue, AppleSDGothicNeo-Regular, Arial, sans-serif; font-size: 17px; letter-spacing: -0.3px;">&nbsp;</span><span data-type="ore" data-lang="en" style="color: rgb(48, 48, 56); font-family: HelveticaNeue, AppleSDGothicNeo-Regular, Arial, sans-serif; font-size: 17px; letter-spacing: -0.3px;">From</span><span style="color: rgb(48, 48, 56); font-family: HelveticaNeue, AppleSDGothicNeo-Regular, Arial, sans-serif; font-size: 17px; letter-spacing: -0.3px;">&nbsp;</span><span data-type="ore" data-lang="en" style="color: rgb(48, 48, 56); font-family: HelveticaNeue, AppleSDGothicNeo-Regular, Arial, sans-serif; font-size: 17px; letter-spacing: -0.3px;">Anywhere·WFA</span><span style="color: rgb(48, 48, 56); font-family: HelveticaNeue, AppleSDGothicNeo-Regular, Arial, sans-serif; font-size: 17px; letter-spacing: -0.3px;">)2.0을 시작한다. 이에 따라 그동안 조직별 특성에 따라 자율적으로 운영되던 재택근무가 주 1회로 제한된다. 다만 기저질환자나 임신기 구성원 등 감염 취약 계층은 조직장 승인에 따라 재택근무 횟수를 탄력적으로 조절하도록 했다.</span><br style="color: rgb(48, 48, 56); font-family: HelveticaNeue, AppleSDGothicNeo-Regular, Arial, sans-serif; font-size: 17px; letter-spacing: -0.3px;"><br style="color: rgb(48, 48, 56); font-family: HelveticaNeue, AppleSDGothicNeo-Regular, Arial, sans-serif; font-size: 17px; letter-spacing: -0.3px;"><span data-type="ore" data-lang="en" style="color: rgb(48, 48, 56); font-family: HelveticaNeue, AppleSDGothicNeo-Regular, Arial, sans-serif; font-size: 17px; letter-spacing: -0.3px;">SK</span><span style="color: rgb(48, 48, 56); font-family: HelveticaNeue, AppleSDGothicNeo-Regular, Arial, sans-serif; font-size: 17px; letter-spacing: -0.3px;">텔레콤은 거점오피스인 ''스피어(</span><span data-type="ore" data-lang="en" style="color: rgb(48, 48, 56); font-family: HelveticaNeue, AppleSDGothicNeo-Regular, Arial, sans-serif; font-size: 17px; letter-spacing: -0.3px;">sphere</span><span style="color: rgb(48, 48, 56); font-family: HelveticaNeue, AppleSDGothicNeo-Regular, Arial, sans-serif; font-size: 17px; letter-spacing: -0.3px;">)''를 적극 활용할 계획이다. 이 곳으로 출근하면 메인오피스 출근으로 인정된다.&nbsp;</span><span data-type="ore" data-lang="en" style="color: rgb(48, 48, 56); font-family: HelveticaNeue, AppleSDGothicNeo-Regular, Arial, sans-serif; font-size: 17px; letter-spacing: -0.3px;">SK</span><span style="color: rgb(48, 48, 56); font-family: HelveticaNeue, AppleSDGothicNeo-Regular, Arial, sans-serif; font-size: 17px; letter-spacing: -0.3px;">텔레콤은 지난해 4월부터 구성원 업무효율과 근무 만족도 상승을 위해 거점 오피스를 운영하고 있다.</span><br></p>')
INSERT [dbo].[Notes] ([Id], [UserId], [Name], [Title], [ReadCount], [PostDate], [Contents]) VALUES (11, N'admin', N'김현승', N'8번째글 이번엔 안지움', 0, CAST(N'2023-01-10T09:43:10.3331425' AS DateTime2), N'<p>안지울꺼에요</p>')
INSERT [dbo].[Notes] ([Id], [UserId], [Name], [Title], [ReadCount], [PostDate], [Contents]) VALUES (12, N'admin', N'김현승', N'9번째 토스트메시지 테스트용', 1, CAST(N'2023-01-10T10:08:14.8317395' AS DateTime2), N'<p>안나타날껄??</p>')
INSERT [dbo].[Notes] ([Id], [UserId], [Name], [Title], [ReadCount], [PostDate], [Contents]) VALUES (13, N'admin', N'김현승', N'10번째 글~(수정)', 3, CAST(N'2023-01-10T14:59:01.9592629' AS DateTime2), N'<p>이제는 토스트가 나타날껄?</p>')
INSERT [dbo].[Notes] ([Id], [UserId], [Name], [Title], [ReadCount], [PostDate], [Contents]) VALUES (14, N'hugo74', N'김현승', N'일곱번째 글합니다', 8, CAST(N'2023-01-10T14:58:47.8578859' AS DateTime2), N'<p>블라블라블라</p>')
INSERT [dbo].[Notes] ([Id], [UserId], [Name], [Title], [ReadCount], [PostDate], [Contents]) VALUES (15, N'hhhh', N'Apple', N'fsdfds', 9, CAST(N'2023-01-10T12:40:41.7659921' AS DateTime2), N'<p>dsfdsf</p>')
INSERT [dbo].[Notes] ([Id], [UserId], [Name], [Title], [ReadCount], [PostDate], [Contents]) VALUES (16, N'fghhgfn', N'eqwe', N'rgege', 3, CAST(N'2023-01-10T10:37:11.1570403' AS DateTime2), N'<p>wetwhn</p>')
INSERT [dbo].[Notes] ([Id], [UserId], [Name], [Title], [ReadCount], [PostDate], [Contents]) VALUES (17, N'ddddd', N'문채원', N'ㅇㄹㄴㄹㄴ', 8, CAST(N'2023-01-10T10:37:18.3537426' AS DateTime2), N'<p>ㅇㄹㄴㄹㅇㄴ</p>')
INSERT [dbo].[Notes] ([Id], [UserId], [Name], [Title], [ReadCount], [PostDate], [Contents]) VALUES (18, N'dfgdfgn', N'wqeqwe', N'ghdgdg', 4, CAST(N'2023-01-10T10:37:53.9620790' AS DateTime2), N'<p>fssfdsfs</p>')
INSERT [dbo].[Notes] ([Id], [UserId], [Name], [Title], [ReadCount], [PostDate], [Contents]) VALUES (20, N'dsfdfvb', N'rgsfg', N'gbdfgb', 12, CAST(N'2023-01-10T14:34:16.8948163' AS DateTime2), N'<p>fraf</p>')
INSERT [dbo].[Notes] ([Id], [UserId], [Name], [Title], [ReadCount], [PostDate], [Contents]) VALUES (21, N'dsfds', N'dfsdsf', N'bhndfghdf', 46, CAST(N'2023-01-11T13:48:37.1546268' AS DateTime2), N'<p>dsggsd</p>')
INSERT [dbo].[Notes] ([Id], [UserId], [Name], [Title], [ReadCount], [PostDate], [Contents]) VALUES (22, N'das', N'das', N'das', 9, CAST(N'2023-01-10T16:47:58.6062848' AS DateTime2), N'<p>dsa</p>')
INSERT [dbo].[Notes] ([Id], [UserId], [Name], [Title], [ReadCount], [PostDate], [Contents]) VALUES (23, N'moon03', N'moon03', N'dfs', 6, CAST(N'2023-01-11T13:48:31.2995210' AS DateTime2), N'<p>dfs</p>')
INSERT [dbo].[Notes] ([Id], [UserId], [Name], [Title], [ReadCount], [PostDate], [Contents]) VALUES (24, N'moon03', N'moon03', N'테스트', 3, CAST(N'2023-01-12T10:17:53.6658070' AS DateTime2), N'<p>입력테스트</p><p>사용자ID로 저장됩니다.</p>')
INSERT [dbo].[Notes] ([Id], [UserId], [Name], [Title], [ReadCount], [PostDate], [Contents]) VALUES (25, N'moon01', N'moon01', N'다른사람입니다.', 7, CAST(N'2023-01-12T10:19:06.0629671' AS DateTime2), N'<p>내용추가</p>')
SET IDENTITY_INSERT [dbo].[Notes] OFF
GO
SET IDENTITY_INSERT [dbo].[Profiles] ON 

INSERT [dbo].[Profiles] ([Id], [Division], [Title], [Description], [Url], [FileName]) VALUES (9, N'Top', N'KHS`s Portfolio Web', N'<p>안녕하세요 !!~</p><p>저는 ASPNET Core 웹 개발을 이수하고있는 김현승입니다.</p><p>저의 포트폴리오 사이트에 오신걸 환영합니다!</p>', N'https://github.com/Kim-HyunSeung/studyASPNET', N'43062140-5d78-49a1-965b-82a47716fe78_Profile03.png')
INSERT [dbo].[Profiles] ([Id], [Division], [Title], [Description], [Url], [FileName]) VALUES (12, N'Card1', N'First Skill', N'<p>저는 C#을 학습했고, 간단한 WebSite, WinForm을 개발할 수 있습니다.</p><p>저는 C#을 잘해요</p>', NULL, N'80f02b68-9875-4dd5-880f-b5775869bac3_C.png')
INSERT [dbo].[Profiles] ([Id], [Division], [Title], [Description], [Url], [FileName]) VALUES (13, N'Card2', N'Second Skill', N'<p>C# Winforms Programming</p><p>Winforms 4.8과 WPF, Xamarin,MAUI를 사용했습니다.</p>', NULL, N'48820422-9c23-483e-9801-544fbce1b430_123.png')
INSERT [dbo].[Profiles] ([Id], [Division], [Title], [Description], [Url], [FileName]) VALUES (14, N'Card3', N'Last Skill', N'<p>ASPNET Core</p><p>NET Core로 된 ASP NET Core MVC웹 사이트를 개발할 수 있습니다.</p>', N'https://github.com/Kim-HyunSeung/studyASPNET', N'61607af4-1f49-4cdd-b3a0-908243410d0b_ASPNET.png')
SET IDENTITY_INSERT [dbo].[Profiles] OFF
GO
/****** Object:  StoredProcedure [dbo].[USP_PagingNotes]    Script Date: 2023-01-13 오후 2:23:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		김현승
-- Create date: 2023-01-10
-- Description:	게시판 페이징용 SP
-- =============================================
CREATE   PROCEDURE [dbo].[USP_PagingNotes]
	@StartCount INT, -- 페이징 시작카운트
	@EndCount INT    -- 페이징 종료카운트

AS
BEGIN	
	SET NOCOUNT ON;

    -- 페이징용 쿼리 시작		
		SELECT *
			FROM(
			SELECT ROW_NUMBER() OVER (ORDER BY Id DESC) AS rowNum
					, Id
					, UserId
					, [Name]
					, Title
					, ReadCount
					, PostDate
					, Contents
				 FROM Notes
				)  AS Base
		WHERE Base.rowNum BETWEEN @StartCount AND @EndCount

END
GO

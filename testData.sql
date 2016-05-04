SET ANSI_PADDING OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'Admins')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'01822773-0624-4bc2-897f-d380780e9d57', N'1')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [IsActive]) VALUES (N'01822773-0624-4bc2-897f-d380780e9d57', N'subash@subash.com', 0, N'APcnpY9HBXFDUwGaJTD37ot7z3WuxZlh0WfYJc6UM3Kav1PojZuj1Ou77abFiaDAkg==', N'9b26ff64-724e-4d16-a885-8c4515dde5ed', NULL, 0, 0, NULL, 1, 0, N'subashpaudyal', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [IsActive]) VALUES (N'64086bb9-02ca-4f59-a6b7-f79e73fdfde6', N'c@c.c', 0, N'AAL/W0NXQD35c4VZk2VT1AvQP4mh8jieAFXmGJdQHX164gg68a3yN3MqCdL3rCny9g==', N'ff50fa04-29e0-44d9-b58e-83478a55b760', NULL, 0, 0, NULL, 1, 0, N'cccc', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [IsActive]) VALUES (N'a65e27c2-c4a5-42ea-ab4e-210ae29b1d2a', N'test345', 0, N'AFe71JJBSF5ADqzxfDFPlkG0lYTFYocIZOqnURloOqY08gIEVpSWmyvnf9QRDVqDuw==', N'56526f6a-8efb-42fd-bd98-f30244c8d54c', NULL, 0, 0, NULL, 1, 0, N'test345', NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [IsActive]) VALUES (N'a7e2e75f-8a34-43b2-908f-ce5a0f2a16c5', N'test@test.test', 0, N'AHNWH3MJlDEDQVqEFEQRzORb3v7OhMHdvBiiYvh7HZ4paup9QK/70dRN/5JAVwcrTQ==', N'5851c24c-6399-4b91-8db2-14c9c2002759', NULL, 0, 0, NULL, 1, 0, N'test', NULL)
SET IDENTITY_INSERT [dbo].[Batches] ON 

INSERT [dbo].[Batches] ([Id], [CID], [Code], [StartDate], [EndDate], [IsActive]) VALUES (1, 1, N'.NET-Winter-Morning', CAST(N'2017-01-01 00:00:00.000' AS DateTime), CAST(N'2018-01-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Batches] ([Id], [CID], [Code], [StartDate], [EndDate], [IsActive]) VALUES (2, 1, N'.NET-Spring-Morning', CAST(N'2017-01-01 00:00:00.000' AS DateTime), CAST(N'2018-01-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Batches] ([Id], [CID], [Code], [StartDate], [EndDate], [IsActive]) VALUES (3, 2, N'JAVA-Winter-Morning', CAST(N'2017-01-06 00:00:00.000' AS DateTime), CAST(N'2018-01-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Batches] ([Id], [CID], [Code], [StartDate], [EndDate], [IsActive]) VALUES (4, 2, N'JAVA-Spring-Morning', CAST(N'2017-01-06 00:00:00.000' AS DateTime), CAST(N'2018-01-01 00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Batches] ([Id], [CID], [Code], [StartDate], [EndDate], [IsActive]) VALUES (5, 6, N'aaabbb', CAST(N'2012-02-02 00:00:00.000' AS DateTime), CAST(N'2014-04-04 00:00:00.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Batches] OFF
SET IDENTITY_INSERT [dbo].[BatchStudents] ON 

INSERT [dbo].[BatchStudents] ([Id], [BID], [SID], [EnrollmentDate], [Completed], [CompletionDate], [IsActive]) VALUES (1, 1, 1, CAST(N'2016-01-01 00:00:00.000' AS DateTime), 0, NULL, 1)
INSERT [dbo].[BatchStudents] ([Id], [BID], [SID], [EnrollmentDate], [Completed], [CompletionDate], [IsActive]) VALUES (2, 1, 2, CAST(N'2016-02-01 00:00:00.000' AS DateTime), 0, NULL, 1)
INSERT [dbo].[BatchStudents] ([Id], [BID], [SID], [EnrollmentDate], [Completed], [CompletionDate], [IsActive]) VALUES (3, 3, 1, CAST(N'2016-02-01 00:00:00.000' AS DateTime), 0, NULL, 1)
INSERT [dbo].[BatchStudents] ([Id], [BID], [SID], [EnrollmentDate], [Completed], [CompletionDate], [IsActive]) VALUES (4, 3, 2, CAST(N'2016-02-01 00:00:00.000' AS DateTime), 0, NULL, 1)
INSERT [dbo].[BatchStudents] ([Id], [BID], [SID], [EnrollmentDate], [Completed], [CompletionDate], [IsActive]) VALUES (5, 3, 3, CAST(N'2016-02-01 00:00:00.000' AS DateTime), 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[BatchStudents] OFF
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([Id], [Name], [Description], [IsActive]) VALUES (1, N'ASP.NET MVC 6', N'Description goes here', 1)
INSERT [dbo].[Courses] ([Id], [Name], [Description], [IsActive]) VALUES (2, N'JAVA Spring Framework', N'Description goes here2', 1)
INSERT [dbo].[Courses] ([Id], [Name], [Description], [IsActive]) VALUES (3, N'Starling Flash Game Development', N'Description goes here3', 1)
INSERT [dbo].[Courses] ([Id], [Name], [Description], [IsActive]) VALUES (5, N'b', N'bb', 0)
INSERT [dbo].[Courses] ([Id], [Name], [Description], [IsActive]) VALUES (6, N'uuiui', N'uiuiu', 1)
SET IDENTITY_INSERT [dbo].[Courses] OFF
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([Id], [Name], [Email]) VALUES (1, N'minesh', N'minesh@minesh.com')
INSERT [dbo].[Students] ([Id], [Name], [Email]) VALUES (2, N'subash', N'subash@subash.com')
INSERT [dbo].[Students] ([Id], [Name], [Email]) VALUES (3, N'pooja45678', N'pojatest78')
INSERT [dbo].[Students] ([Id], [Name], [Email]) VALUES (5, N'youyou', N'you')
INSERT [dbo].[Students] ([Id], [Name], [Email]) VALUES (6, N'yyyyy12345', N'yyyyy')
INSERT [dbo].[Students] ([Id], [Name], [Email]) VALUES (7, N'tttttttt566', N'ttt566')
SET IDENTITY_INSERT [dbo].[Students] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [UserName], [Password], [IsActive]) VALUES (1, N'subash', N'123', 1)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [IsActive]) VALUES (2, N'minesh', N'123', 1)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [IsActive]) VALUES (3, N'puja', N'123', 1)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [IsActive]) VALUES (4, N'test', N'test', 1)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [IsActive]) VALUES (5, N'a', N'a', 1)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [IsActive]) VALUES (6, N'b', N'b', 1)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [IsActive]) VALUES (7, N'c', N'c', 1)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [IsActive]) VALUES (9, N'd', N'd', 1)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [IsActive]) VALUES (8, N'qq', N'qq', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET ANSI_PADDING ON

GO
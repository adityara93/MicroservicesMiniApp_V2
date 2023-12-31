USE [SAMPLE]
GO
/****** Object:  Table [dbo].[Demografi]    Script Date: 16/01/2023 05:27:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Demografi](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NIK] [nvarchar](20) NULL,
	[Nama] [nvarchar](50) NULL,
	[Tempat_Lahir] [nvarchar](50) NULL,
	[Tanggal_Lahir] [date] NULL,
	[Jenis_Kelamin] [nvarchar](50) NULL,
	[Golongan_Darah] [nvarchar](2) NULL,
	[Alamat] [nvarchar](max) NULL,
	[RT] [nvarchar](5) NULL,
	[RW] [nvarchar](5) NULL,
	[Kelurahan] [nvarchar](50) NULL,
	[Desa] [nvarchar](50) NULL,
	[Kecamatan] [nvarchar](50) NULL,
	[Kota] [nvarchar](50) NULL,
	[Provinsi] [nvarchar](50) NULL,
	[Agama] [nvarchar](50) NULL,
	[KodePos] [nvarchar](6) NULL,
	[StatusPerkawinan] [nvarchar](50) NULL,
	[Pekerjaan] [nvarchar](50) NULL,
	[Kewarganegaraan] [nvarchar](5) NULL,
	[Masa_Berlaku] [date] NULL,
 CONSTRAINT [PK_Demografi] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhotoID]    Script Date: 16/01/2023 05:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhotoID](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NIK] [nvarchar](50) NULL,
	[Path_Photo] [nvarchar](max) NULL,
 CONSTRAINT [PK_Photo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Demografi_Delete]    Script Date: 16/01/2023 05:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Demografi_Delete] 
@Id As Int
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Message as nvarchar(max)
	IF EXISTS (SELECT * FROM Demografi WHERE Id = @Id) BEGIN
		DELETE FROM Demografi WHERE Id = @Id
		SET @Message = 'Success'
	END
	ELSE BEGIN
		SET @Message = 'Failed'
	END
	
	SELECT @Message AS ResultProcess
END
GO
/****** Object:  StoredProcedure [dbo].[Demografi_Get]    Script Date: 16/01/2023 05:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Demografi_Get] 
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Demografi
END
GO
/****** Object:  StoredProcedure [dbo].[Demografi_GetById]    Script Date: 16/01/2023 05:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Demografi_GetById] 
@Id As Int
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Demografi WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[Demografi_Insert]    Script Date: 16/01/2023 05:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Demografi_Insert] 
@NIK as nvarchar(20),
@Nama as nvarchar(50),
@Tempat_Lahir as nvarchar(50),
@Tanggal_Lahir as date,
@Jenis_Kelamin as nvarchar(20),
@Golongan_Darah as nvarchar(5),
@Alamat as nvarchar(max),
@RT as nvarchar(max),
@RW as nvarchar(max),
@Kelurahan as nvarchar(max),
@Desa as nvarchar(max),
@Kecamatan as nvarchar(max),
@Kota as nvarchar(max),
@Provinsi as nvarchar(max),
@Agama as nvarchar(20),
@KodePos as nvarchar(20),
@StatusPerkawinan as nvarchar(20),
@Pekerjaan as nvarchar(50),
@Kewarganegaraan as nvarchar(20),
@Masa_Berlaku as date
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Message as nvarchar(max)
    IF NOT EXISTS (SELECT * FROM Demografi WHERE NIK = @NIK) BEGIN
		INSERT INTO Demografi ([NIK],[Nama],[Tempat_Lahir],[Tanggal_Lahir],[Jenis_Kelamin],[Golongan_Darah],[Alamat],[RT],[RW],[Kelurahan],[Desa],[Kecamatan],[Kota],[Provinsi],[Agama],[KodePos],[StatusPerkawinan],[Pekerjaan],[Kewarganegaraan],[Masa_Berlaku])
		VALUES (@NIK, @Nama, @Tempat_Lahir, @Tanggal_Lahir, @Jenis_Kelamin, @Golongan_Darah, @Alamat, @RT, @RW, @Kelurahan, @Desa, @Kecamatan, @Kota, @Provinsi, @Agama, @KodePos, @StatusPerkawinan, @Pekerjaan, @Kewarganegaraan, @Masa_Berlaku)
		
		SET @Message = 'Success'
	END
	ELSE BEGIN
		SET @Message = 'Failed'
	END
	SELECT @Message AS ResultProcess
	SELECT * FROM Demografi WHERE NIK = @NIK

END
GO
/****** Object:  StoredProcedure [dbo].[Demografi_Update]    Script Date: 16/01/2023 05:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Demografi_Update] 
@Id as int,
@NIK as nvarchar(20),
@Nama as nvarchar(50),
@Tempat_Lahir as nvarchar(50),
@Tanggal_Lahir as date,
@Jenis_Kelamin as nvarchar(20),
@Golongan_Darah as nvarchar(5),
@Alamat as nvarchar(max),
@RT as nvarchar(max),
@RW as nvarchar(max),
@Kelurahan as nvarchar(max),
@Desa as nvarchar(max),
@Kecamatan as nvarchar(max),
@Kota as nvarchar(max),
@Provinsi as nvarchar(max),
@Agama as nvarchar(20),
@KodePos as nvarchar(20),
@StatusPerkawinan as nvarchar(20),
@Pekerjaan as nvarchar(50),
@Kewarganegaraan as nvarchar(20),
@Masa_Berlaku as date
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Message as nvarchar(max)
    IF EXISTS (SELECT * FROM Demografi WHERE Id = @Id) BEGIN
		UPDATE Demografi 
		SET 
		[NIK] = @NIK,
		[Nama] = @Nama,
		[Tempat_Lahir] = @Tempat_Lahir,
		[Tanggal_Lahir] = @Tanggal_Lahir,
		[Jenis_Kelamin] = @Jenis_Kelamin,
		[Golongan_Darah] = @Golongan_Darah,
		[Alamat] = @Alamat,
		[RT] = @RT,
		[RW] = @RW,
		[Kelurahan] = @Kelurahan,
		[Desa] = @Desa,
		[Kecamatan] = @Kecamatan,
		[Kota] = @Kota,
		[Provinsi] = @Provinsi,
		[Agama] = @Agama,
		[KodePos] = @KodePos,
		[StatusPerkawinan] = @StatusPerkawinan,
		[Pekerjaan] = @Pekerjaan,
		[Kewarganegaraan] = @Kewarganegaraan,
		[Masa_Berlaku] = @Masa_Berlaku
		WHERE Id = @Id
		
		SET @Message = 'Success'
	END
	ELSE BEGIN
		SET @Message = 'Failed'
	END
	SELECT @Message AS ResultProcess
	SELECT * FROM Demografi WHERE Id = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[PhotoID_Delete]    Script Date: 16/01/2023 05:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[PhotoID_Delete] 
@Id As Int
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Message as nvarchar(max)
	IF EXISTS (SELECT * FROM PhotoID WHERE Id = @Id) BEGIN
		DELETE FROM PhotoID WHERE Id = @Id
		SET @Message = 'Success'
	END
	ELSE BEGIN
		SET @Message = 'Failed'
	END
	
	SELECT @Message AS ResultProcess
END
GO
/****** Object:  StoredProcedure [dbo].[PhotoID_Get]    Script Date: 16/01/2023 05:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PhotoID_Get] 
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM PhotoID
END
GO
/****** Object:  StoredProcedure [dbo].[PhotoID_GetById]    Script Date: 16/01/2023 05:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[PhotoID_GetById]
@Id As Int
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM PhotoID WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[PhotoID_Insert]    Script Date: 16/01/2023 05:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[PhotoID_Insert] 
@NIK as nvarchar(20),
@Path_Photo as nvarchar(max)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Message as nvarchar(max)
    IF NOT EXISTS (SELECT * FROM PhotoID WHERE NIK = @NIK) BEGIN
		INSERT INTO PhotoID ([NIK],[Path_Photo]) VALUES (@NIK, @Path_Photo)
		
		SET @Message = 'Success'
	END
	ELSE BEGIN
		SET @Message = 'Failed'
	END
	SELECT @Message AS ResultProcess
	SELECT * FROM PhotoID WHERE NIK = @NIK

END
GO
/****** Object:  StoredProcedure [dbo].[PhotoID_Update]    Script Date: 16/01/2023 05:27:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



Create PROCEDURE [dbo].[PhotoID_Update] 
@Id as int,
@NIK as nvarchar(20),
@Path_Photo as nvarchar(max)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Message as nvarchar(max)
    IF EXISTS (SELECT * FROM PhotoID WHERE Id = @Id) BEGIN
		UPDATE PhotoID 
		SET 
		[NIK] = @NIK,
		[Path_Photo] = @Path_Photo
		WHERE Id = @Id
		
		SET @Message = 'Success'
	END
	ELSE BEGIN
		SET @Message = 'Failed'
	END
	SELECT @Message AS ResultProcess
	SELECT * FROM PhotoID WHERE Id = @Id

END
GO

USE [master]
GO

-- DROP DATABASE [CasoEstudioJN]
-- GO

CREATE DATABASE [CasoEstudioJN]
GO

USE [CasoEstudioJN]
GO

-- Tables.
CREATE TABLE [dbo].[CasasSistema](
	[IdCasa] [BigInt] IDENTITY(1,1) NOT NULL,
	[DescripcionCasa] [varchar](30) NOT NULL,
	[PrecioCasa] [decimal](10, 2) NOT NULL,
	[UsuarioAlquiler] [varchar](30),
	[FechaAlquiler] [datetime]
 CONSTRAINT [PK_CasasSistema] PRIMARY KEY CLUSTERED 
(
	[IdCasa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- INSERTS.

GO
INSERT INTO [dbo].[CasasSistema] ([DescripcionCasa], [PrecioCasa], [UsuarioAlquiler], [FechaAlquiler]) 
	VALUES ('Casa en San José', 190000, null, null)
INSERT INTO [dbo].[CasasSistema] ([DescripcionCasa], [PrecioCasa], [UsuarioAlquiler], [FechaAlquiler]) 
	VALUES ('Casa en Alajuela', 145000, null, null)
INSERT INTO [dbo].[CasasSistema] ([DescripcionCasa], [PrecioCasa], [UsuarioAlquiler], [FechaAlquiler]) 
	VALUES ('Casa en Cartago', 115000, null, null)
INSERT INTO [dbo].[CasasSistema] ([DescripcionCasa], [PrecioCasa], [UsuarioAlquiler], [FechaAlquiler]) 
	VALUES ('Casa en Heredia', 122000, null, null)
INSERT INTO [dbo].[CasasSistema] ([DescripcionCasa], [PrecioCasa], [UsuarioAlquiler], [FechaAlquiler]) 
	VALUES ('Casa en Guanacaste', 105000, null, null)

GO

-- SP.
CREATE PROCEDURE [dbo].[ConsultarCasas]
AS
BEGIN

	SELECT	IdCasa,
			DescripcionCasa,
			PrecioCasa,
			UsuarioAlquiler,
			FechaAlquiler
	  FROM	[dbo].[CasasSistema]
	  ORDER BY UsuarioAlquiler

END
GO

CREATE PROCEDURE [dbo].[ConsultarCasa]
	@IdCasa BIGINT
AS
BEGIN

	SELECT	IdCasa,
			DescripcionCasa,
			PrecioCasa,
			UsuarioAlquiler,
			FechaAlquiler
	  FROM	[dbo].[CasasSistema]
	  WHERE IdCasa = @IdCasa

END
GO

CREATE PROCEDURE [dbo].[AlquilarCasas]
	@IdCasa BIGINT,
	@UsuarioAlquiler VARCHAR(30),
	@FechaAlquiler DATETIME
AS
BEGIN

	UPDATE [dbo].[CasasSistema]
	SET UsuarioAlquiler = @UsuarioAlquiler,
	FechaAlquiler = @FechaAlquiler
	WHERE IdCasa = @IdCasa
END
GO

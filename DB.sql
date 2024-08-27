USE [master]
GO

-- DROP DATABASE [[CasoEstudioJN]]
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
INSERT INTO [dbo].[CasasSistema] ([DescripcionCasa], [PrecioCasa], [UsuarioAlquiler], [FechaAlquiler]) 
	VALUES ('Casa en San Jose', 190000, null, null)
INSERT INTO [dbo].[CasasSistema] ([DescripcionCasa], [PrecioCasa], [UsuarioAlquiler], [FechaAlquiler]) 
	VALUES ('Casa en Alajuela', 145000, null, null)
INSERT INTO [dbo].[CasasSistema] ([DescripcionCasa], [PrecioCasa], [UsuarioAlquiler], [FechaAlquiler]) 
	VALUES ('Casa en Cartago', 115000, null, null)
INSERT INTO [dbo].[CasasSistema] ([DescripcionCasa], [PrecioCasa], [UsuarioAlquiler], [FechaAlquiler]) 
	VALUES ('Casa en Heredia', 122000, null, null)
INSERT INTO [dbo].[CasasSistema] ([DescripcionCasa], [PrecioCasa], [UsuarioAlquiler], [FechaAlquiler]) 
	VALUES ('Casa en Guanacaste', 105000, null, null)

-- SP.
--CREATE PROCEDURE [dbo].[ConsultarProductos]

--AS
--BEGIN

--	SELECT	CodigoCompra,
--			Descripcion,
--			PrecioUnitario,
--			Saldo,
--			Estado
--	  FROM	dbo.Principal prod
--	  ORDER BY Estado

--END
--GO

--CREATE PROCEDURE [dbo].[ConsultarProducto]
--	@CodigoCompra INT
--AS
--BEGIN

--	SELECT	CodigoCompra,
--			Descripcion,
--			PrecioUnitario,
--			Saldo,
--			Estado
--	  FROM	dbo.Principal prod
--	  WHERE CodigoCompra = @CodigoCompra
--END
--GO

--CREATE PROCEDURE [dbo].[AbonarMonto]
--	@MontoAbono INT,
--	@CodigoCompraPrincipalID INT
--AS
--BEGIN
	
--	INSERT	INTO [dbo].[Abonos] (MontoAbono, CodigoCompraPrincipalID) 
--	VALUES (@MontoAbono, @CodigoCompraPrincipalID)

--	UPDATE Principal
--	SET Saldo = Saldo - @MontoAbono,
--	Estado = IIF(Saldo = @MontoAbono, 1, 0)
--	WHERE CodigoCompra = @CodigoCompraPrincipalID

--	SELECT	CodigoCompra,
--			Descripcion,
--			PrecioUnitario,
--			Saldo,
--			Estado
--	FROM Principal
--	WHERE CodigoCompra = @CodigoCompraPrincipalID

--END
--GO

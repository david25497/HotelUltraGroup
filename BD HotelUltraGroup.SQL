USE [master]
GO
/****** Script compatible with Microsoft SQL Server 2019 technology ******/
/****** Object:  Database [HotelUltraGroup]    Script Date: 28/10/2024 8:35:51 ******/
CREATE DATABASE [HotelUltraGroup]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HotelUltraGroup', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HotelUltraGroup.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HotelUltraGroup_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\HotelUltraGroup_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HotelUltraGroup].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [HotelUltraGroup] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [HotelUltraGroup] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [HotelUltraGroup] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [HotelUltraGroup] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [HotelUltraGroup] SET ARITHABORT OFF 
GO

ALTER DATABASE [HotelUltraGroup] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [HotelUltraGroup] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [HotelUltraGroup] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [HotelUltraGroup] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [HotelUltraGroup] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [HotelUltraGroup] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [HotelUltraGroup] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [HotelUltraGroup] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [HotelUltraGroup] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [HotelUltraGroup] SET  DISABLE_BROKER 
GO

ALTER DATABASE [HotelUltraGroup] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [HotelUltraGroup] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [HotelUltraGroup] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [HotelUltraGroup] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [HotelUltraGroup] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [HotelUltraGroup] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [HotelUltraGroup] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [HotelUltraGroup] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [HotelUltraGroup] SET  MULTI_USER 
GO

ALTER DATABASE [HotelUltraGroup] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [HotelUltraGroup] SET DB_CHAINING OFF 
GO

ALTER DATABASE [HotelUltraGroup] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [HotelUltraGroup] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [HotelUltraGroup] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [HotelUltraGroup] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [HotelUltraGroup] SET QUERY_STORE = OFF
GO

ALTER DATABASE [HotelUltraGroup] SET  READ_WRITE 
GO

GO
USE [HotelUltraGroup]
GO

/****** Object:  Table [dbo].[City]    Script Date: 28/10/2024 8:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentType]    Script Date: 28/10/2024 8:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[shortName] [nvarchar](10) NOT NULL,
	[longName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 28/10/2024 8:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[gender] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Guests]    Script Date: 28/10/2024 8:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guests](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idReservation] [int] NOT NULL,
	[firstName] [nvarchar](100) NOT NULL,
	[lastName] [nvarchar](100) NOT NULL,
	[idGender] [int] NULL,
	[documentTypeId] [int] NULL,
	[email] [nvarchar](255) NULL,
	[phone] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelInfo]    Script Date: 28/10/2024 8:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelInfo](
	[idUser] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[idCity] [int] NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[isAvailable] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 28/10/2024 8:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idHotel] [int] NOT NULL,
	[idRoom] [int] NOT NULL,
	[reservationDate] [datetime] NOT NULL,
	[checkInDate] [datetime] NOT NULL,
	[checkOutDate] [datetime] NOT NULL,
	[guestCount] [int] NOT NULL,
	[fixedNightlyRate] [decimal](10, 2) NOT NULL,
	[fullName] [nvarchar](100) NOT NULL,
	[reservationEmail] [nvarchar](100) NOT NULL,
	[reservationCode] [nvarchar](50) NOT NULL,
	[emergencyContactName] [nvarchar](100) NOT NULL,
	[emergencyContactPhone] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 28/10/2024 8:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idHotel] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[idRoomType] [int] NOT NULL,
	[nightlyRate] [decimal](10, 2) NOT NULL,
	[isAvailable] [bit] NOT NULL,
	[capacity] [int] NOT NULL,
	[location] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomTaxDetail]    Script Date: 28/10/2024 8:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomTaxDetail](
	[idRoom] [int] NOT NULL,
	[idTax] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idRoom] ASC,
	[idTax] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomType]    Script Date: 28/10/2024 8:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomType](
	[idRoomType] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[idRoomType] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 28/10/2024 8:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysdiagrams](
	[name] [sysname] NOT NULL,
	[principal_id] [int] NOT NULL,
	[diagram_id] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NULL,
	[definition] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[diagram_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_principal_name] UNIQUE NONCLUSTERED 
(
	[principal_id] ASC,
	[name] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tax]    Script Date: 28/10/2024 8:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tax](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[rate] [decimal](5, 2) NOT NULL,
	[description] [nvarchar](255) NULL,
	[idHotel] [int] NOT NULL,
 CONSTRAINT [PK__Tax__24D288393A97A3A3] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 28/10/2024 8:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[idrol] [int] NOT NULL,
	[email] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Room] ADD  DEFAULT ((1)) FOR [isAvailable]
GO
ALTER TABLE [dbo].[Guests]  WITH CHECK ADD FOREIGN KEY([documentTypeId])
REFERENCES [dbo].[DocumentType] ([id])
GO
ALTER TABLE [dbo].[Guests]  WITH CHECK ADD FOREIGN KEY([idGender])
REFERENCES [dbo].[Gender] ([id])
GO
ALTER TABLE [dbo].[Guests]  WITH CHECK ADD FOREIGN KEY([idReservation])
REFERENCES [dbo].[Reservations] ([id])
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD FOREIGN KEY([idHotel])
REFERENCES [dbo].[HotelInfo] ([id])
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD FOREIGN KEY([idRoom])
REFERENCES [dbo].[Room] ([id])
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_HotelInfo] FOREIGN KEY([idHotel])
REFERENCES [dbo].[HotelInfo] ([id])
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_HotelInfo]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD FOREIGN KEY([idHotel])
REFERENCES [dbo].[HotelInfo] ([id])
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD FOREIGN KEY([idRoomType])
REFERENCES [dbo].[RoomType] ([idRoomType])
GO
ALTER TABLE [dbo].[RoomTaxDetail]  WITH CHECK ADD FOREIGN KEY([idRoom])
REFERENCES [dbo].[Room] ([id])
GO
ALTER TABLE [dbo].[RoomTaxDetail]  WITH CHECK ADD FOREIGN KEY([idRoom])
REFERENCES [dbo].[Room] ([id])
GO
ALTER TABLE [dbo].[RoomTaxDetail]  WITH CHECK ADD  CONSTRAINT [FK__RoomTaxDe__idTax__02084FDA] FOREIGN KEY([idTax])
REFERENCES [dbo].[Tax] ([id])
GO
ALTER TABLE [dbo].[RoomTaxDetail] CHECK CONSTRAINT [FK__RoomTaxDe__idTax__02084FDA]
GO
ALTER TABLE [dbo].[RoomTaxDetail]  WITH CHECK ADD  CONSTRAINT [FK__RoomTaxDe__idTax__7F2BE32F] FOREIGN KEY([idTax])
REFERENCES [dbo].[Tax] ([id])
GO
ALTER TABLE [dbo].[RoomTaxDetail] CHECK CONSTRAINT [FK__RoomTaxDe__idTax__7F2BE32F]
GO
ALTER TABLE [dbo].[Tax]  WITH CHECK ADD FOREIGN KEY([idHotel])
REFERENCES [dbo].[HotelInfo] ([id])
GO
/****** Object:  StoredProcedure [dbo].[AssignTaxToRoom]    Script Date: 28/10/2024 8:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AssignTaxToRoom]
    @idUser INT,
    @idRoom INT,
    @idTax INT,
    @idHotel INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @existingTaxId INT;

    -- Validar si el idUser tiene permiso en el idHotel
    IF NOT EXISTS (
        SELECT 1 
        FROM HotelInfo 
        WHERE id = @idHotel AND idUser = @idUser
    )
    BEGIN
        RAISERROR('El usuario no tiene permiso para asignar impuestos en este hotel.', 16, 1);
        RETURN;
    END

    -- Validar que el impuesto exista en el hotel especificado
    SELECT @existingTaxId = id
    FROM Tax
    WHERE id = @idTax AND idHotel = @idHotel;

    IF @existingTaxId IS NULL
    BEGIN
        RAISERROR('El impuesto especificado no existe en el hotel.', 16, 1);
        RETURN;
    END

    -- Comprobar si la relación ya existe entre la habitación y el impuesto
    IF EXISTS (
        SELECT 1 
        FROM RoomTaxDetail 
        WHERE idRoom = @idRoom AND idTax = @idTax
    )
    BEGIN
        RAISERROR('El impuesto ya está asignado a la habitación.', 16, 1);
        RETURN;
    END

    -- Asignar el impuesto a la habitación
    INSERT INTO RoomTaxDetail (idRoom, idTax)
    VALUES (@idRoom, @idTax);
END;
GO
/****** Object:  StoredProcedure [dbo].[CreateHotel]    Script Date: 28/10/2024 8:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateHotel]
    @IdUser INT,
    @name NVARCHAR(100),
    @idCity INT,
    @address NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    -- Validar que el usuario exista
    IF NOT EXISTS (SELECT 1 FROM users WHERE id = @IdUser)
    BEGIN
        RAISERROR('El usuario no existe.', 16, 1);
        RETURN;
    END

    -- Validar que la ciudad exista
    IF NOT EXISTS (SELECT 1 FROM City WHERE id = @idCity)
    BEGIN
        RAISERROR('La ciudad no existe.', 16, 1);
        RETURN;
    END

    -- Insertar el nuevo hotel
    INSERT INTO HotelInfo (idUser, name, idCity, address, isAvailable)
    VALUES (@IdUser, @name, @idCity, @address, 1); -- Suponiendo que el hotel está disponible por defecto
END;
GO
/****** Object:  StoredProcedure [dbo].[CreateNewUser]    Script Date: 28/10/2024 8:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateNewUser]
    @username NVARCHAR(50),
    @password NVARCHAR(255),
    @idrol int,
    @email NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    -- Validar si el usuario o el email ya existen
    IF EXISTS (SELECT 1 FROM users WHERE username = @username OR email = @email)
    BEGIN
        RAISERROR('Nombre de usuario o email ya se encuentran en uso', 16, 1);
        RETURN;
    END

    -- Insertar nuevo usuario
    INSERT INTO users (username, password, idrol, email)
    VALUES (@username, @password, @idrol, @email);
END;
GO
/****** Object:  StoredProcedure [dbo].[CreateReservation]    Script Date: 28/10/2024 8:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CreateReservation]
    @idHotel INT,
    @idRoom INT,
    @checkInDate DATETIME,
    @checkOutDate DATETIME,
    @fullName NVARCHAR(255),
    @email NVARCHAR(255),
    @emergencyContactName NVARCHAR(255),
    @emergencyContactPhone NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @nightlyRate DECIMAL(10, 2);
    DECLARE @reservationCode NVARCHAR(50);
    DECLARE @reservationDate DATETIME = GETDATE();  -- Fecha de reserva se obtiene automáticamente
    DECLARE @numberOfPeople INT; -- Declarar la variable para la cantidad de personas

	   -- Validar que la fecha de check-in sea anterior a la de check-out
    IF @checkInDate >= @checkOutDate
    BEGIN
        RAISERROR('La fecha de check-in debe ser anterior a la fecha de check-out.', 16, 1);
        RETURN;
    END


    -- Validación de disponibilidad de la habitación y que pertenezca al hotel
    DECLARE @availability INT;
    SELECT @availability = COUNT(*) 
    FROM Room 
    WHERE id = @idRoom AND isAvailable = 1 AND idHotel = @idHotel;  -- Validar que la habitación sea del hotel

    IF @availability = 0
    BEGIN
        RAISERROR('La habitación no está disponible o no pertenece al hotel especificado.', 16, 1);
        RETURN;
    END

    -- Obtener la capacidad (número de personas) y la tarifa por noche de la habitación en un solo SELECT
    SELECT @numberOfPeople = capacity, @nightlyRate = nightlyRate 
    FROM Room 
    WHERE id = @idRoom;

    -- Validar que no haya otra reserva en la misma habitación dentro de las fechas seleccionadas
    DECLARE @conflictingReservations INT;
    SELECT @conflictingReservations = COUNT(*) 
    FROM Reservations
    WHERE idRoom = @idRoom 
      AND ((@checkInDate >= checkInDate AND @checkInDate < checkOutDate) OR
           (@checkOutDate > checkInDate AND @checkOutDate <= checkOutDate) OR
           (checkInDate >= @checkInDate AND checkInDate < @checkOutDate));

    IF @conflictingReservations > 0
    BEGIN
        RAISERROR('Ya existe una reserva en esta habitación para las fechas seleccionadas.', 16, 1);
        RETURN;
    END

    -- Generar un código de reserva (puedes ajustar la lógica según lo necesites)
    SET @reservationCode = CONVERT(NVARCHAR(50), NEWID());  -- Genera un GUID como código de reserva

    -- Inserción de la nueva reserva
    INSERT INTO Reservations (idHotel, idRoom, reservationDate, checkInDate, checkOutDate, fullName, reservationEmail, reservationCode, emergencyContactName, emergencyContactPhone, guestCount, fixedNightlyRate)
    VALUES (@idHotel, @idRoom, @reservationDate, @checkInDate, @checkOutDate, @fullName, @email, @reservationCode, @emergencyContactName, @emergencyContactPhone, @numberOfPeople, @nightlyRate);
END;
GO
/****** Object:  StoredProcedure [dbo].[CreateRoom]    Script Date: 28/10/2024 8:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateRoom]
    @idUser INT,
    @idHotel INT,
    @idRoomType INT,
	@name NVARCHAR(100),
    @location NVARCHAR(100),
    @nightlyRate DECIMAL(10, 2),
    @isAvailable BIT,
    @capacity INT
AS
BEGIN
    SET NOCOUNT ON;


    IF NOT EXISTS (SELECT 1 FROM HotelInfo WHERE id = @IdHotel AND IdUser = @idUser)
    BEGIN
        RAISERROR('El hotel especificado no existe o el usuario no tiene permisos.', 16, 1);
        RETURN;
    END

    -- Validación de la existencia del Tipo de Habitación
    IF NOT EXISTS (SELECT 1 FROM RoomType WHERE idRoomType = @idRoomType)
    BEGIN
        RAISERROR('El tipo de habitación especificado no existe.', 16, 1);
        RETURN;
    END

    INSERT INTO Room (IdHotel,name, idRoomType, Location, NightlyRate, IsAvailable, Capacity)
    VALUES (@IdHotel,@name, @idRoomType, @Location, @NightlyRate, @IsAvailable, @Capacity);
END;
GO
/****** Object:  StoredProcedure [dbo].[CreateTax]    Script Date: 28/10/2024 8:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateTax]
    @idUser INT,
    @idHotel INT,
    @name NVARCHAR(100),
    @rate DECIMAL(5, 2),
    @description NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    -- Validación de límite para la tasa del impuesto
    IF @Rate < 0 OR @Rate > 100
    BEGIN
        RAISERROR('La tasa de impuesto debe estar entre 0 y 100.', 16, 1);
        RETURN;
    END

    -- Validar si el idUser tiene permiso en el idHotel
    IF NOT EXISTS (
        SELECT 1 
        FROM HotelInfo 
        WHERE id = @idHotel AND idUser = @idUser
    )
    BEGIN
        RAISERROR('El usuario no tiene permiso para crear impuestos en este hotel.', 16, 1);
        RETURN;
    END

    -- Inserción del nuevo tipo de impuesto
    INSERT INTO Tax (idHotel, name, rate, description)
    VALUES (@idHotel, @name, @rate, @description);
END;
GO
/****** Object:  StoredProcedure [dbo].[GetAvailableHotelRooms]    Script Date: 28/10/2024 8:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAvailableHotelRooms]
    @idHotel INT,
    @checkInDate DATETIME,
    @checkOutDate DATETIME,
    @numberOfPeople INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT r.id AS RoomId,
           r.name AS RoomName,
           r.capacity,
           r.nightlyRate,
           r.isAvailable
    FROM Room r
    WHERE r.idHotel = @idHotel
      AND r.isAvailable = 1  -- Solo habitaciones disponibles
      AND r.capacity >= @numberOfPeople  -- Filtrar por capacidad
      AND NOT EXISTS (
          SELECT 1
          FROM Reservations res
          WHERE res.idRoom = r.id
            AND ((@checkInDate >= res.checkInDate AND @checkInDate < res.checkOutDate) OR
                 (@checkOutDate > res.checkInDate AND @checkOutDate <= res.checkOutDate) OR
                 (res.checkInDate >= @checkInDate AND res.checkInDate < @checkOutDate))
      );
END;
GO
/****** Object:  StoredProcedure [dbo].[GetAvailableHotels]    Script Date: 28/10/2024 8:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAvailableHotels]
    @checkInDate DATETIME,
    @checkOutDate DATETIME,
    @numberOfPeople INT,
    @idCity INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validar que la fecha de check-in sea anterior a la de check-out
    IF @checkInDate >= @checkOutDate
    BEGIN
        RAISERROR('La fecha de check-in debe ser anterior a la de check-out.', 16, 1);
        RETURN;
    END

    SELECT DISTINCT h.id AS HotelId,
                    h.name AS HotelName,
                    h.idCity AS idCity,
                    h.address AS Address
    FROM HotelInfo h
    JOIN Room r ON h.id = r.idHotel
    WHERE r.isAvailable = 1  -- Solo habitaciones disponibles
      AND h.idCity = @idCity  -- Filtrar por ciudad
      AND r.capacity >= @numberOfPeople  -- Filtrar por capacidad
      AND NOT EXISTS (
          SELECT 1
          FROM Reservations res
          WHERE res.idRoom = r.id
            AND ((@checkInDate >= res.checkInDate AND @checkInDate < res.checkOutDate) OR
                 (@checkOutDate > res.checkInDate AND @checkOutDate <= res.checkOutDate) OR
                 (res.checkInDate >= @checkInDate AND res.checkInDate < @checkOutDate))
      );  -- Asegurarse de que no haya reservas en conflicto
END;
GO
/****** Object:  StoredProcedure [dbo].[GetHotels]    Script Date: 28/10/2024 8:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetHotels]
    @idUser INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Seleccionar hoteles donde el usuario tiene permisos
    SELECT 		
        h.id as idHotel,
        h.name,
        h.idCity,
		c.name as namecity,
        h.address,
        h.isAvailable
    FROM 
        HotelInfo h
	INNER JOIN City c on c.id=h.idCity
    WHERE 
        idUser = @idUser;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetRoomsByHotel]    Script Date: 28/10/2024 8:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRoomsByHotel]
    @idHotel INT,
    @idUser INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validación de permisos de acceso del usuario al hotel
    IF NOT EXISTS (
        SELECT 1
        FROM HotelInfo
        WHERE id = @idHotel AND idUser = @idUser
    )
    BEGIN
        RAISERROR('No tiene permiso para ver las habitaciones de este hotel.', 16, 1);
        RETURN;
    END

    -- Selección de habitaciones con sus respectivos tipos
    SELECT 
        r.id,
        r.name AS RoomName,
        r.nightlyRate,
        r.isAvailable,
        r.capacity,
        r.location,
        rt.name AS RoomTypeName
    FROM 
        Room r
    INNER JOIN 
        RoomType rt ON r.idRoomType = rt.idRoomType
    WHERE 
        r.idHotel = @idHotel;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetUserAccess]    Script Date: 28/10/2024 8:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserAccess]
    @username NVARCHAR(50),
    @password NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT id
    FROM users
    WHERE username = @username AND  password = @password COLLATE Latin1_General_BIN;  
END;
GO
/****** Object:  StoredProcedure [dbo].[RegisterGuest]    Script Date: 28/10/2024 8:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RegisterGuest]
    @reservationCode NVARCHAR(50),
    @firstName NVARCHAR(100),
    @lastName NVARCHAR(100),
    @idGender INT,
    @idDocumentType INT,
    @email NVARCHAR(255),
    @phone NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @idReservation INT;
    DECLARE @currentGuestCount INT;
    DECLARE @maxGuestCount INT;

    -- Obtener el ID de la reserva usando el reservationCode
    SELECT @idReservation = id
    FROM Reservations
    WHERE reservationCode = @reservationCode;

    -- Validar que se haya encontrado la reserva
    IF @idReservation IS NULL
    BEGIN
        RAISERROR('No se encontró una reserva con el código especificado.', 16, 1);
        RETURN;
    END

    -- Obtener la cantidad actual de huéspedes de la reserva
    SELECT @currentGuestCount = COUNT(*)
    FROM Guests
    WHERE idReservation = @idReservation;

    -- Obtener la capacidad máxima de huéspedes de la reserva
    SELECT @maxGuestCount = guestCount
    FROM Reservations
    WHERE id = @idReservation;

    -- Validar que la cantidad de huéspedes no supere el límite
    IF @currentGuestCount >= @maxGuestCount
    BEGIN
        RAISERROR('No se puede registrar más huéspedes. El límite de huéspedes para esta reserva ya ha sido alcanzado.', 16, 1);
        RETURN;
    END

    -- Inserción del nuevo huésped
    INSERT INTO Guests (firstName, lastName, idGender, documentTypeId, email, phone, idReservation)
    VALUES (@firstName, @lastName, @idGender, @idDocumentType, @email, @phone, @idReservation);
END;
GO
/****** Object:  StoredProcedure [dbo].[RemoveTaxFromRoom]    Script Date: 28/10/2024 8:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RemoveTaxFromRoom]
    @idUser INT,
    @idRoom INT,
    @idTax INT,
    @idHotel INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validar si el idUser tiene permiso en el idHotel
    IF NOT EXISTS (
        SELECT 1 
        FROM HotelInfo 
        WHERE id = @idHotel AND idUser = @idUser
    )
    BEGIN
        RAISERROR('El usuario no tiene permiso para eliminar impuestos de este hotel.', 16, 1);
        RETURN;
    END

    -- Comprobar si la relación existe
    IF NOT EXISTS (
        SELECT 1 
        FROM RoomTaxDetail 
        WHERE idRoom = @idRoom AND idTax = @idTax
    )
    BEGIN
        RAISERROR('El impuesto no está asignado a la habitación.', 16, 1);
        RETURN;
    END

    -- Eliminar el impuesto de la habitación
    DELETE FROM RoomTaxDetail 
    WHERE idRoom = @idRoom AND idTax = @idTax;
END;
GO

/****** Object:  StoredProcedure [dbo].[UpdateHotel]    Script Date: 28/10/2024 8:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateHotel]
    @idHotel INT,
    @idUser INT,
    @name NVARCHAR(100),
    @idCity INT,
    @address NVARCHAR(255),
    @isAvailable BIT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validar que el hotel exista
    IF NOT EXISTS (SELECT 1 FROM HotelInfo WHERE id = @idHotel)
    BEGIN
        RAISERROR('El hotel no existe.', 16, 1);
        RETURN;
    END

    -- Validar que el usuario que intenta actualizar sea el propietario del hotel
    IF NOT EXISTS (SELECT 1 FROM HotelInfo WHERE id = @idHotel AND idUser = @idUser)
    BEGIN
        RAISERROR('No tienes permiso para actualizar este hotel.', 16, 1);
        RETURN;
    END

    -- Actualizar la información del hotel
    UPDATE HotelInfo
    SET name = @name,
        idCity = @idCity,
        address = @address,
        isAvailable = @isAvailable
    WHERE id = @idHotel;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateRoom]    Script Date: 28/10/2024 8:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateRoom]
    @IdUser INT,
    @IdRoom INT,
    @IdHotel INT,
    @idRoomType INT,
	@name NVARCHAR(100),
    @Location NVARCHAR(100),
    @NightlyRate DECIMAL(10, 2),
    @Capacity INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validación de existencia y permiso del usuario en el hotel
    IF NOT EXISTS (SELECT 1 FROM HotelInfo WHERE Id = @IdHotel AND IdUser = @IdUser)
    BEGIN
        RAISERROR('El hotel especificado no existe o el usuario no tiene permisos.', 16, 1);
        RETURN;
    END

    -- Validación de existencia de la habitación en el hotel especificado
    IF NOT EXISTS (SELECT 1 FROM Room WHERE Id = @IdRoom AND IdHotel = @IdHotel)
    BEGIN
        RAISERROR('La habitación especificada no existe en el hotel indicado.', 16, 1);
        RETURN;
    END

    -- Actualización de la habitación
    UPDATE Room
    SET idRoomType = @idRoomType,
		name = @name,
        Location = @Location,
        NightlyRate = @NightlyRate,
        Capacity = @Capacity
    WHERE Id = @IdRoom;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateRoomStatus]    Script Date: 28/10/2024 8:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateRoomStatus]
    @IdUser INT,
    @idHotel INT,
    @idRoom INT,
    @isAvailable BIT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validación de permisos: verifica si el usuario tiene acceso al hotel y que la habitación pertenezca al hotel especificado
    IF NOT EXISTS (
        SELECT 1 
        FROM Room r
        INNER JOIN HotelInfo h ON r.IdHotel = h.Id
        WHERE r.Id = @idRoom AND r.IdHotel = @idHotel AND h.IdUser = @IdUser
    )
    BEGIN
        RAISERROR('No tiene permisos para actualizar esta habitación.', 16, 1);
        RETURN;
    END

    -- Actualización del estado de la habitación
    UPDATE Room
    SET IsAvailable = @IsAvailable
    WHERE Id = @idRoom AND IdHotel = @idHotel;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateStatusHotel]    Script Date: 28/10/2024 8:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateStatusHotel]
    @idHotel INT,
    @idUser INT,
    @isAvailable BIT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validar que el hotel exista
    IF NOT EXISTS (SELECT 1 FROM HotelInfo WHERE id = @idHotel)
    BEGIN
        RAISERROR('El hotel no existe.', 16, 1);
        RETURN;
    END

    -- Validar que el usuario que intenta actualizar sea el propietario del hotel
    IF NOT EXISTS (SELECT 1 FROM HotelInfo WHERE id = @idHotel AND idUser = @idUser)
    BEGIN
        RAISERROR('No tienes permiso para actualizar el estado de este hotel.', 16, 1);
        RETURN;
    END

    -- Actualizar el estado de disponibilidad del hotel
    UPDATE HotelInfo
    SET isAvailable = @isAvailable
    WHERE id = @idHotel;
END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateTax]    Script Date: 28/10/2024 8:03:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateTax]
    @idUser INT,
    @idTax INT,
    @idHotel INT,
    @name NVARCHAR(100),
    @rate DECIMAL(5, 2),
    @description NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @existingTaxId INT;

    -- Validación de límite para la tasa del impuesto
    IF @Rate < 0 OR @Rate > 100
    BEGIN
        RAISERROR('La tasa de impuesto debe estar entre 0 y 100.', 16, 1);
        RETURN;
    END

    -- Validar si el idUser tiene permiso en el idHotel
    IF NOT EXISTS (
        SELECT 1 
        FROM HotelInfo 
        WHERE id = @idHotel AND idUser = @idUser
    )
    BEGIN
        RAISERROR('El usuario no tiene permiso para actualizar impuestos en este hotel.', 16, 1);
        RETURN;
    END

    -- Validación de existencia de idTax e idHotel en la tabla Tax
    SELECT @existingTaxId = id
    FROM Tax
    WHERE id = @idTax AND idHotel = @idHotel;

    IF @existingTaxId IS NULL
    BEGIN
        RAISERROR('El impuesto especificado no existe en el hotel.', 16, 1);
        RETURN;
    END

    -- Actualización del tipo de impuesto
    UPDATE Tax
    SET name = @name,
        rate = @rate,
        description = @description
    WHERE id = @existingTaxId;
END;
GO
EXEC sys.sp_addextendedproperty @name=N'microsoft_database_tools_support', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'sysdiagrams'
GO
ALTER DATABASE [HotelUltraGroup] SET  READ_WRITE 
GO

/****** Object:  Database [HotelUltraGroup]    Script Date: 29/10/2024 8:21:45 ******/
CREATE DATABASE [HotelUltraGroup]  (EDITION = 'Basic', SERVICE_OBJECTIVE = 'Basic', MAXSIZE = 1 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
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
ALTER DATABASE [HotelUltraGroup] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HotelUltraGroup] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HotelUltraGroup] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HotelUltraGroup] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HotelUltraGroup] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HotelUltraGroup] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HotelUltraGroup] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HotelUltraGroup] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HotelUltraGroup] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [HotelUltraGroup] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HotelUltraGroup] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [HotelUltraGroup] SET  MULTI_USER 
GO
ALTER DATABASE [HotelUltraGroup] SET ENCRYPTION ON
GO
ALTER DATABASE [HotelUltraGroup] SET QUERY_STORE = ON
GO
ALTER DATABASE [HotelUltraGroup] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 7), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 10, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  UserDefinedFunction [dbo].[fn_diagramobjects]    Script Date: 29/10/2024 8:21:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE FUNCTION [dbo].[fn_diagramobjects]() 
	RETURNS int
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		declare @id_upgraddiagrams		int
		declare @id_sysdiagrams			int
		declare @id_helpdiagrams		int
		declare @id_helpdiagramdefinition	int
		declare @id_creatediagram	int
		declare @id_renamediagram	int
		declare @id_alterdiagram 	int 
		declare @id_dropdiagram		int
		declare @InstalledObjects	int

		select @InstalledObjects = 0

		select 	@id_upgraddiagrams = object_id(N'dbo.sp_upgraddiagrams'),
			@id_sysdiagrams = object_id(N'dbo.sysdiagrams'),
			@id_helpdiagrams = object_id(N'dbo.sp_helpdiagrams'),
			@id_helpdiagramdefinition = object_id(N'dbo.sp_helpdiagramdefinition'),
			@id_creatediagram = object_id(N'dbo.sp_creatediagram'),
			@id_renamediagram = object_id(N'dbo.sp_renamediagram'),
			@id_alterdiagram = object_id(N'dbo.sp_alterdiagram'), 
			@id_dropdiagram = object_id(N'dbo.sp_dropdiagram')

		if @id_upgraddiagrams is not null
			select @InstalledObjects = @InstalledObjects + 1
		if @id_sysdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 2
		if @id_helpdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 4
		if @id_helpdiagramdefinition is not null
			select @InstalledObjects = @InstalledObjects + 8
		if @id_creatediagram is not null
			select @InstalledObjects = @InstalledObjects + 16
		if @id_renamediagram is not null
			select @InstalledObjects = @InstalledObjects + 32
		if @id_alterdiagram  is not null
			select @InstalledObjects = @InstalledObjects + 64
		if @id_dropdiagram is not null
			select @InstalledObjects = @InstalledObjects + 128
		
		return @InstalledObjects 
	END
	
GO
/****** Object:  Table [dbo].[City]    Script Date: 29/10/2024 8:21:45 ******/
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
/****** Object:  Table [dbo].[DocumentType]    Script Date: 29/10/2024 8:21:45 ******/
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
/****** Object:  Table [dbo].[Gender]    Script Date: 29/10/2024 8:21:45 ******/
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
/****** Object:  Table [dbo].[Guests]    Script Date: 29/10/2024 8:21:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Guests](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idReservation] [int] NOT NULL,
	[firstName] [nvarchar](100) NOT NULL,
	[lastName] [nvarchar](100) NOT NULL,
	[idGender] [int] NOT NULL,
	[idDocumentType] [int] NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[phone] [nvarchar](20) NOT NULL,
	[documentNumber] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK__Guests__3213E83F6079FAB5] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelInfo]    Script Date: 29/10/2024 8:21:45 ******/
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
/****** Object:  Table [dbo].[Reservations]    Script Date: 29/10/2024 8:21:45 ******/
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
/****** Object:  Table [dbo].[Room]    Script Date: 29/10/2024 8:21:45 ******/
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
/****** Object:  Table [dbo].[RoomTaxDetail]    Script Date: 29/10/2024 8:21:45 ******/
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
/****** Object:  Table [dbo].[RoomType]    Script Date: 29/10/2024 8:21:45 ******/
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
/****** Object:  Table [dbo].[Tax]    Script Date: 29/10/2024 8:21:45 ******/
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
/****** Object:  Table [dbo].[users]    Script Date: 29/10/2024 8:21:45 ******/
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
ALTER TABLE [dbo].[Guests]  WITH CHECK ADD  CONSTRAINT [FK__Guests__document__395884C4] FOREIGN KEY([idDocumentType])
REFERENCES [dbo].[DocumentType] ([id])
GO
ALTER TABLE [dbo].[Guests] CHECK CONSTRAINT [FK__Guests__document__395884C4]
GO
ALTER TABLE [dbo].[Guests]  WITH CHECK ADD  CONSTRAINT [FK__Guests__idGender__3864608B] FOREIGN KEY([idGender])
REFERENCES [dbo].[Gender] ([id])
GO
ALTER TABLE [dbo].[Guests] CHECK CONSTRAINT [FK__Guests__idGender__3864608B]
GO
ALTER TABLE [dbo].[Guests]  WITH CHECK ADD  CONSTRAINT [FK__Guests__idReserv__3A4CA8FD] FOREIGN KEY([idReservation])
REFERENCES [dbo].[Reservations] ([id])
GO
ALTER TABLE [dbo].[Guests] CHECK CONSTRAINT [FK__Guests__idReserv__3A4CA8FD]
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
/****** Object:  StoredProcedure [dbo].[AssignTaxToRoom]    Script Date: 29/10/2024 8:21:45 ******/
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
/****** Object:  StoredProcedure [dbo].[CreateHotel]    Script Date: 29/10/2024 8:21:45 ******/
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
/****** Object:  StoredProcedure [dbo].[CreateNewUser]    Script Date: 29/10/2024 8:21:45 ******/
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
/****** Object:  StoredProcedure [dbo].[CreateReservation]    Script Date: 29/10/2024 8:21:45 ******/
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
       IF CONVERT(DATE, @checkInDate) >= CONVERT(DATE, @checkOutDate)
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
  -- Devolver el código de reserva asignado
    SELECT @reservationCode AS reservationCode;

END;
GO
/****** Object:  StoredProcedure [dbo].[CreateRoom]    Script Date: 29/10/2024 8:21:45 ******/
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
/****** Object:  StoredProcedure [dbo].[CreateTax]    Script Date: 29/10/2024 8:21:45 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAvailableHotelRooms]    Script Date: 29/10/2024 8:21:45 ******/
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

    SELECT r.id AS idRoom,
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
/****** Object:  StoredProcedure [dbo].[GetAvailableHotels]    Script Date: 29/10/2024 8:21:45 ******/
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
/****** Object:  StoredProcedure [dbo].[GetCityList]    Script Date: 29/10/2024 8:21:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCityList]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT id AS idCity,
           name AS cityName
    FROM City;
END;

GO
/****** Object:  StoredProcedure [dbo].[GetDocumentTypeList]    Script Date: 29/10/2024 8:21:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetDocumentTypeList]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT id AS idDocumentType,
           shortName AS documentTypeName,
		   longName  as description
    FROM DocumentType;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetGenderList]    Script Date: 29/10/2024 8:21:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetGenderList]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT id AS idGender,
           gender AS genderName
    FROM Gender;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetHotels]    Script Date: 29/10/2024 8:21:45 ******/
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
/****** Object:  StoredProcedure [dbo].[GetHotelTaxes]    Script Date: 29/10/2024 8:21:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetHotelTaxes]
    @idHotel INT,
    @idUser INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Validar que el usuario tenga permisos en el hotel
    IF NOT EXISTS (
        SELECT 1 
        FROM HotelInfo 
        WHERE id = @idHotel AND idUser = @idUser
    )
    BEGIN
        RAISERROR('El usuario no tiene permisos para acceder a la información de este hotel.', 16, 1);
        RETURN;
    END

    -- Obtener información de impuestos del hotel
    SELECT id AS TaxId,
           name AS TaxName,
           rate AS TaxRate,
           description AS TaxDescription
    FROM Tax
    WHERE idHotel = @idHotel;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetReservationDetail]    Script Date: 29/10/2024 8:21:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetReservationDetail]
    @reservationId INT,
    @userId INT,
    @hotelId INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Verificar que el usuario tenga permisos sobre el hotel especificado
    IF EXISTS (
        SELECT 1
        FROM HotelInfo h
        WHERE h.id = @hotelId
          AND h.idUser = @userId
    )
    BEGIN
        -- Obtener detalles de la reserva, habitación, capacidad y calcular el valor total y valor total con impuestos
        SELECT 
            r.id AS ReservationId,
            r.reservationCode AS ReservationCode,
            r.checkInDate AS CheckInDate,
            r.checkOutDate AS CheckOutDate,
            r.fullName AS GuestName,
            r.reservationEmail AS GuestEmail,
            ro.name AS RoomName,
            ro.nightlyRate AS NightlyRate,
            ro.capacity AS MaxGuestsAllowed,
            ro.location AS RoomLocation,
            DATEDIFF(DAY, r.checkInDate, r.checkOutDate) AS StayDuration,
            -- Calcular el valor total sin impuestos
            DATEDIFF(DAY, r.checkInDate, r.checkOutDate) * ro.nightlyRate AS ValorTotal,
            -- Calcular el valor total con impuestos
            DATEDIFF(DAY, r.checkInDate, r.checkOutDate) * ro.nightlyRate * 
            (1 + ISNULL(SUM(t.rate / 100), 0)) AS ValorTotalConImpuestos
        FROM 
            Reservations r
        INNER JOIN 
            Room ro ON r.idRoom = ro.id
        LEFT JOIN 
            RoomTaxDetail rtd ON ro.id = rtd.idRoom
        LEFT JOIN 
            Tax t ON rtd.idTax = t.id
        WHERE 
            r.id = @reservationId
            AND r.idHotel = @hotelId
        GROUP BY 
            r.id, r.reservationCode, r.checkInDate, r.checkOutDate, r.fullName, r.reservationEmail,
            ro.name, ro.nightlyRate, ro.capacity, ro.location;
    END
    ELSE
    BEGIN
        -- Si el usuario no tiene permiso, retorna un mensaje de error
        RAISERROR ('No tienes permisos para ver los detalles de esta reserva.', 16, 1);
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[GetReservationsByUserAndHotel]    Script Date: 29/10/2024 8:21:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetReservationsByUserAndHotel]
    @userId INT,
    @hotelId INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        r.id AS idReservation,
        r.reservationCode AS reservationCode,
        r.checkInDate AS checkInDate,
        r.checkOutDate AS checkOutDate,
        r.fullName AS fullName,
        r.reservationEmail AS reservationEmail
    FROM 
        Reservations r
    INNER JOIN 
        HotelInfo h ON r.idHotel = h.id    
    WHERE 
        h.idUser = @userId
        AND h.id = @hotelId
    ORDER BY 
        r.reservationDate DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetRoomsByHotel]    Script Date: 29/10/2024 8:21:45 ******/
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
/****** Object:  StoredProcedure [dbo].[GetUserAccess]    Script Date: 29/10/2024 8:21:45 ******/
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
/****** Object:  StoredProcedure [dbo].[RegisterGuest]    Script Date: 29/10/2024 8:21:45 ******/
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
    @documentNumber NVARCHAR(255), -- Ahora es obligatorio
    @email NVARCHAR(255),
    @phone NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @idReservation INT;
    DECLARE @currentGuestCount INT;
    DECLARE @maxGuestCount INT;

    -- Validar que el tipo de documento existe
    IF NOT EXISTS (SELECT 1 FROM DocumentType WHERE id = @idDocumentType)
    BEGIN
        RAISERROR('El tipo de documento especificado no es válido.', 16, 1);
        RETURN;
    END

    -- Validar que el género existe
    IF NOT EXISTS (SELECT 1 FROM Gender WHERE id = @idGender)
    BEGIN
        RAISERROR('El género especificado no es válido.', 16, 1);
        RETURN;
    END

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

	   -- Validar que no exista ya un huésped con el mismo tipo y número de documento en esta reserva
    IF EXISTS (SELECT 1 
               FROM Guests 
               WHERE idReservation = @idReservation 
                 AND idDocumentType = @idDocumentType 
                 AND documentNumber = @documentNumber)
    BEGIN
        RAISERROR('El huésped ya está registrado con el mismo tipo y número de documento para esta reserva.', 16, 1);
        RETURN;
    END

    -- Inserción del nuevo huésped, incluyendo DocumentNumber como obligatorio
    INSERT INTO Guests (firstName, lastName, idGender, idDocumentType, documentNumber, email, phone, idReservation)
    VALUES (@firstName, @lastName, @idGender, @idDocumentType, @documentNumber, @email, @phone, @idReservation);
END;
GO
/****** Object:  StoredProcedure [dbo].[RemoveTaxFromRoom]    Script Date: 29/10/2024 8:21:45 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_alterdiagram]    Script Date: 29/10/2024 8:21:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_alterdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null,
		@version 	int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId 			int
		declare @retval 		int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @ShouldChangeUID	int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid ARG', 16, 1)
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();	 
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		revert;
	
		select @ShouldChangeUID = 0
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		
		if(@DiagId IS NULL or (@IsDbo = 0 and @theId <> @UIDFound))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end
	
		if(@IsDbo <> 0)
		begin
			if(@UIDFound is null or USER_NAME(@UIDFound) is null) -- invalid principal_id
			begin
				select @ShouldChangeUID = 1 ;
			end
		end

		-- update dds data			
		update dbo.sysdiagrams set definition = @definition where diagram_id = @DiagId ;

		-- change owner
		if(@ShouldChangeUID = 1)
			update dbo.sysdiagrams set principal_id = @theId where diagram_id = @DiagId ;

		-- update dds version
		if(@version is not null)
			update dbo.sysdiagrams set version = @version where diagram_id = @DiagId ;

		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_creatediagram]    Script Date: 29/10/2024 8:21:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_creatediagram]
	(
		@diagramname 	sysname,
		@owner_id		int	= null, 	
		@version 		int,
		@definition 	varbinary(max)
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
	
		declare @theId int
		declare @retval int
		declare @IsDbo	int
		declare @userName sysname
		if(@version is null or @diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID(); 
		select @IsDbo = IS_MEMBER(N'db_owner');
		revert; 
		
		if @owner_id is null
		begin
			select @owner_id = @theId;
		end
		else
		begin
			if @theId <> @owner_id
			begin
				if @IsDbo = 0
				begin
					RAISERROR (N'E_INVALIDARG', 16, 1);
					return -1
				end
				select @theId = @owner_id
			end
		end
		-- next 2 line only for test, will be removed after define name unique
		if EXISTS(select diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @diagramname)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end
	
		insert into dbo.sysdiagrams(name, principal_id , version, definition)
				VALUES(@diagramname, @theId, @version, @definition) ;
		
		select @retval = @@IDENTITY 
		return @retval
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_dropdiagram]    Script Date: 29/10/2024 8:21:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_dropdiagram]
	(
		@diagramname 	sysname,
		@owner_id	int	= null
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
	
		if(@diagramname is null)
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT; 
		
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		delete from dbo.sysdiagrams where diagram_id = @DiagId;
	
		return 0;
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagramdefinition]    Script Date: 29/10/2024 8:21:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_helpdiagramdefinition]
	(
		@diagramname 	sysname,
		@owner_id	int	= null 		
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		set nocount on

		declare @theId 		int
		declare @IsDbo 		int
		declare @DiagId		int
		declare @UIDFound	int
	
		if(@diagramname is null)
		begin
			RAISERROR (N'E_INVALIDARG', 16, 1);
			return -1
		end
	
		execute as caller;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner');
		if(@owner_id is null)
			select @owner_id = @theId;
		revert; 
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname;
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId ))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1);
			return -3
		end

		select version, definition FROM dbo.sysdiagrams where diagram_id = @DiagId ; 
		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_helpdiagrams]    Script Date: 29/10/2024 8:21:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_helpdiagrams]
	(
		@diagramname sysname = NULL,
		@owner_id int = NULL
	)
	WITH EXECUTE AS N'dbo'
	AS
	BEGIN
		DECLARE @user sysname
		DECLARE @dboLogin bit
		EXECUTE AS CALLER;
			SET @user = USER_NAME();
			SET @dboLogin = CONVERT(bit,IS_MEMBER('db_owner'));
		REVERT;
		SELECT
			[Database] = DB_NAME(),
			[Name] = name,
			[ID] = diagram_id,
			[Owner] = USER_NAME(principal_id),
			[OwnerID] = principal_id
		FROM
			sysdiagrams
		WHERE
			(@dboLogin = 1 OR USER_NAME(principal_id) = @user) AND
			(@diagramname IS NULL OR name = @diagramname) AND
			(@owner_id IS NULL OR principal_id = @owner_id)
		ORDER BY
			4, 5, 1
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_renamediagram]    Script Date: 29/10/2024 8:21:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_renamediagram]
	(
		@diagramname 		sysname,
		@owner_id		int	= null,
		@new_diagramname	sysname
	
	)
	WITH EXECUTE AS 'dbo'
	AS
	BEGIN
		set nocount on
		declare @theId 			int
		declare @IsDbo 			int
		
		declare @UIDFound 		int
		declare @DiagId			int
		declare @DiagIdTarg		int
		declare @u_name			sysname
		if((@diagramname is null) or (@new_diagramname is null))
		begin
			RAISERROR ('Invalid value', 16, 1);
			return -1
		end
	
		EXECUTE AS CALLER;
		select @theId = DATABASE_PRINCIPAL_ID();
		select @IsDbo = IS_MEMBER(N'db_owner'); 
		if(@owner_id is null)
			select @owner_id = @theId;
		REVERT;
	
		select @u_name = USER_NAME(@owner_id)
	
		select @DiagId = diagram_id, @UIDFound = principal_id from dbo.sysdiagrams where principal_id = @owner_id and name = @diagramname 
		if(@DiagId IS NULL or (@IsDbo = 0 and @UIDFound <> @theId))
		begin
			RAISERROR ('Diagram does not exist or you do not have permission.', 16, 1)
			return -3
		end
	
		-- if((@u_name is not null) and (@new_diagramname = @diagramname))	-- nothing will change
		--	return 0;
	
		if(@u_name is null)
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @theId and name = @new_diagramname
		else
			select @DiagIdTarg = diagram_id from dbo.sysdiagrams where principal_id = @owner_id and name = @new_diagramname
	
		if((@DiagIdTarg is not null) and  @DiagId <> @DiagIdTarg)
		begin
			RAISERROR ('The name is already used.', 16, 1);
			return -2
		end		
	
		if(@u_name is null)
			update dbo.sysdiagrams set [name] = @new_diagramname, principal_id = @theId where diagram_id = @DiagId
		else
			update dbo.sysdiagrams set [name] = @new_diagramname where diagram_id = @DiagId
		return 0
	END
	
GO
/****** Object:  StoredProcedure [dbo].[sp_upgraddiagrams]    Script Date: 29/10/2024 8:21:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[sp_upgraddiagrams]
	AS
	BEGIN
		IF OBJECT_ID(N'dbo.sysdiagrams') IS NOT NULL
			return 0;
	
		CREATE TABLE dbo.sysdiagrams
		(
			name sysname NOT NULL,
			principal_id int NOT NULL,	-- we may change it to varbinary(85)
			diagram_id int PRIMARY KEY IDENTITY,
			version int,
	
			definition varbinary(max)
			CONSTRAINT UK_principal_name UNIQUE
			(
				principal_id,
				name
			)
		);


		/* Add this if we need to have some form of extended properties for diagrams */
		/*
		IF OBJECT_ID(N'dbo.sysdiagram_properties') IS NULL
		BEGIN
			CREATE TABLE dbo.sysdiagram_properties
			(
				diagram_id int,
				name sysname,
				value varbinary(max) NOT NULL
			)
		END
		*/

		IF OBJECT_ID(N'dbo.dtproperties') IS NOT NULL
		begin
			insert into dbo.sysdiagrams
			(
				[name],
				[principal_id],
				[version],
				[definition]
			)
			select	 
				convert(sysname, dgnm.[uvalue]),
				DATABASE_PRINCIPAL_ID(N'dbo'),			-- will change to the sid of sa
				0,							-- zero for old format, dgdef.[version],
				dgdef.[lvalue]
			from dbo.[dtproperties] dgnm
				inner join dbo.[dtproperties] dggd on dggd.[property] = 'DtgSchemaGUID' and dggd.[objectid] = dgnm.[objectid]	
				inner join dbo.[dtproperties] dgdef on dgdef.[property] = 'DtgSchemaDATA' and dgdef.[objectid] = dgnm.[objectid]
				
			where dgnm.[property] = 'DtgSchemaNAME' and dggd.[uvalue] like N'_EA3E6268-D998-11CE-9454-00AA00A3F36E_' 
			return 2;
		end
		return 1;
	END
	
GO
/****** Object:  StoredProcedure [dbo].[UpdateHotel]    Script Date: 29/10/2024 8:21:45 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateRoom]    Script Date: 29/10/2024 8:21:45 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateRoomStatus]    Script Date: 29/10/2024 8:21:45 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateStatusHotel]    Script Date: 29/10/2024 8:21:45 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateTax]    Script Date: 29/10/2024 8:21:45 ******/
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
ALTER DATABASE [HotelUltraGroup] SET  READ_WRITE 
GO

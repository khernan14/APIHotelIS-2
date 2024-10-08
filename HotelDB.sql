USE [HotelDB]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 10/9/2024 18:15:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[booking_id] [int] IDENTITY(1,1) NOT NULL,
	[room_id] [int] NULL,
	[completeName] [nvarchar](80) NULL,
	[telephone] [nvarchar](8) NULL,
	[email] [nvarchar](300) NULL,
	[check_in_date] [datetime] NOT NULL,
	[check_out_date] [datetime] NOT NULL,
	[total_price] [decimal](10, 2) NOT NULL,
	[booking_status] [nvarchar](50) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK__Bookings__5DE3A5B17A3794EB] PRIMARY KEY CLUSTERED 
(
	[booking_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event_Images]    Script Date: 10/9/2024 18:15:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event_Images](
	[image_id] [int] IDENTITY(1,1) NOT NULL,
	[event_id] [int] NULL,
	[image_url] [nvarchar](255) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event_Reservations]    Script Date: 10/9/2024 18:15:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event_Reservations](
	[reservation_id] [int] IDENTITY(1,1) NOT NULL,
	[event_name] [nvarchar](100) NULL,
	[description] [nvarchar](300) NULL,
	[event_date] [datetime] NULL,
	[price_per_person] [decimal](10, 2) NULL,
	[completeName] [nvarchar](80) NULL,
	[telephone] [nvarchar](8) NULL,
	[email] [nvarchar](400) NULL,
	[number_of_attendees] [int] NOT NULL,
	[reservation_status] [nvarchar](50) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK__Event_Re__31384C296B2A57E4] PRIMARY KEY CLUSTERED 
(
	[reservation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 10/9/2024 18:15:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[event_id] [int] IDENTITY(1,1) NOT NULL,
	[event_name] [nvarchar](100) NOT NULL,
	[description] [text] NULL,
	[event_date] [datetime] NOT NULL,
	[price_per_person] [decimal](10, 2) NOT NULL,
	[max_attendees] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[event_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 10/9/2024 18:15:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[payment_id] [int] IDENTITY(1,1) NOT NULL,
	[booking_id] [int] NULL,
	[event_reservation_id] [int] NULL,
	[amount] [decimal](10, 2) NOT NULL,
	[payment_date] [datetime] NULL,
	[payment_method] [nvarchar](50) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 10/9/2024 18:15:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[review_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[room_id] [int] NULL,
	[event_id] [int] NULL,
	[rating] [int] NULL,
	[comment] [text] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room_Images]    Script Date: 10/9/2024 18:15:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room_Images](
	[image_id] [int] IDENTITY(1,1) NOT NULL,
	[room_id] [int] NULL,
	[image_url] [nvarchar](max) NOT NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK__Room_Ima__DC9AC95580249F2D] PRIMARY KEY CLUSTERED 
(
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 10/9/2024 18:15:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[room_id] [int] IDENTITY(1,1) NOT NULL,
	[room_number] [nvarchar](10) NULL,
	[room_type] [nvarchar](50) NULL,
	[description] [nvarchar](400) NULL,
	[price_per_night] [decimal](10, 2) NULL,
	[max_guests] [int] NULL,
	[available] [bit] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK__Rooms__19675A8AA5B8A1A8] PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/9/2024 18:15:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[password_hash] [nvarchar](255) NOT NULL,
	[phone_number] [nvarchar](15) NULL,
	[address] [nvarchar](255) NULL,
	[city] [nvarchar](50) NULL,
	[country] [nvarchar](50) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bookings] ADD  CONSTRAINT [DF__Bookings__bookin__5629CD9C]  DEFAULT ('Pending') FOR [booking_status]
GO
ALTER TABLE [dbo].[Bookings] ADD  CONSTRAINT [DF__Bookings__create__571DF1D5]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Bookings] ADD  CONSTRAINT [DF__Bookings__update__5812160E]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[Event_Images] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Event_Images] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[Event_Reservations] ADD  CONSTRAINT [DF__Event_Res__reser__60A75C0F]  DEFAULT ('Pending') FOR [reservation_status]
GO
ALTER TABLE [dbo].[Event_Reservations] ADD  CONSTRAINT [DF__Event_Res__creat__619B8048]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Event_Reservations] ADD  CONSTRAINT [DF__Event_Res__updat__628FA481]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[Events] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Events] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT (getdate()) FOR [payment_date]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[Reviews] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Reviews] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[Room_Images] ADD  CONSTRAINT [DF__Room_Imag__creat__6E01572D]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Room_Images] ADD  CONSTRAINT [DF__Room_Imag__updat__6EF57B66]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[Rooms] ADD  CONSTRAINT [DF__Rooms__available__4F7CD00D]  DEFAULT ((1)) FOR [available]
GO
ALTER TABLE [dbo].[Rooms] ADD  CONSTRAINT [DF__Rooms__created_a__5070F446]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Rooms] ADD  CONSTRAINT [DF__Rooms__updated_a__5165187F]  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD  CONSTRAINT [FK__Bookings__room_i__5535A963] FOREIGN KEY([room_id])
REFERENCES [dbo].[Rooms] ([room_id])
GO
ALTER TABLE [dbo].[Bookings] CHECK CONSTRAINT [FK__Bookings__room_i__5535A963]
GO
ALTER TABLE [dbo].[Event_Images]  WITH CHECK ADD FOREIGN KEY([event_id])
REFERENCES [dbo].[Events] ([event_id])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK__Payments__bookin__66603565] FOREIGN KEY([booking_id])
REFERENCES [dbo].[Bookings] ([booking_id])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK__Payments__bookin__66603565]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK__Payments__event___6754599E] FOREIGN KEY([event_reservation_id])
REFERENCES [dbo].[Event_Reservations] ([reservation_id])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK__Payments__event___6754599E]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([event_id])
REFERENCES [dbo].[Events] ([event_id])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK__Reviews__room_id__778AC167] FOREIGN KEY([room_id])
REFERENCES [dbo].[Rooms] ([room_id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK__Reviews__room_id__778AC167]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Room_Images]  WITH CHECK ADD  CONSTRAINT [FK__Room_Imag__room___6D0D32F4] FOREIGN KEY([room_id])
REFERENCES [dbo].[Rooms] ([room_id])
GO
ALTER TABLE [dbo].[Room_Images] CHECK CONSTRAINT [FK__Room_Imag__room___6D0D32F4]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD CHECK  (([rating]>=(1) AND [rating]<=(5)))
GO
/****** Object:  StoredProcedure [dbo].[CRUD_Reservations]    Script Date: 10/9/2024 18:15:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CRUD_Reservations]
@accion NVARCHAR(50) = NULL,
@completeName NVARCHAR(80) = NULL,
@telephone NVARCHAR(8) = NULL,
@email NVARCHAR(300) = NULL
AS
BEGIN
	IF(@accion = 'Insertar')
	BEGIN
		INSERT INTO Customers (
			completeName,
			telephone,
			email
		) VALUES (
			@completeName,
			@telephone,
			@email
		)

		-- Devolver el cliente recién insertado
		SELECT completeName, telephone, email 
		FROM Customers
		WHERE customerID = SCOPE_IDENTITY();
	END
END
GO
/****** Object:  StoredProcedure [dbo].[CRUD_Rooms]    Script Date: 10/9/2024 18:15:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CRUD_Rooms]
    @accion NVARCHAR(50) = NULL,
    @roomID INT = NULL,
    @roomType NVARCHAR(50) = NULL,
    @check_out_date DATE = NULL,
    @check_in_date DATE = NULL,
    @room_type NVARCHAR(50) = NULL,
    @room_number NVARCHAR(10) = NULL,
    @description NVARCHAR(300) = NULL,
    @price_per_person DECIMAL(10, 2) = NULL,
    @max_guests INT = NULL,
    @image_url NVARCHAR(255) = NULL -- Añadir el parámetro para la imagen
AS
BEGIN
    -- Mostrar las habitaciones
    IF (@accion = 'Mostrar')
    BEGIN
        WITH RankedRooms AS (
            SELECT 
                A.room_id, 
                A.room_number, 
                A.room_type, 
                A.description, 
                A.price_per_night, 
                A.max_guests, 
                A.available, 
                B.image_url,
                ROW_NUMBER() OVER (PARTITION BY A.room_type ORDER BY A.room_id) AS rn
            FROM Rooms A
            INNER JOIN Room_Images B ON A.room_id = B.room_id
        )
        SELECT 
            room_id, 
            room_number, 
            room_type, 
            description, 
            price_per_night, 
            max_guests, 
            available, 
            image_url
        FROM RankedRooms
        WHERE rn = 1
        ORDER BY room_number;
    END

    -- Mostrar habitaciones por tipo
    IF (@accion = 'MostrarRooms')
    BEGIN
        SELECT A.room_id, A.room_number, A.price_per_night, A.room_type, A.description, A.max_guests, B.image_url
        FROM Rooms A
        LEFT JOIN Room_Images B ON A.room_id = B.room_id
        WHERE A.room_type = @roomType
        AND NOT EXISTS (
            SELECT 1
            FROM Bookings B2
            WHERE A.room_id = B2.room_id
            AND (
                (B2.check_in_date < @check_out_date AND B2.check_out_date > @check_in_date)
            )
        );
    END

    -- Mostrar información de habitación por ID
    IF (@accion = 'MostrarRoomsID')
    BEGIN
        SELECT TOP 1 *
        FROM Rooms A
        INNER JOIN Bookings B ON A.room_id = B.room_id
        INNER JOIN Payments C ON B.booking_id = C.booking_id
        WHERE A.room_id = @roomID
        ORDER BY B.created_at DESC;
    END

    -- Mostrar todas las habitaciones
    IF (@accion = 'getRoomsAll')
    BEGIN
        SELECT A.room_id, A.room_number, A.room_type, A.description, A.price_per_night, A.max_guests, B.image_url
        FROM Rooms A 
        INNER JOIN Room_Images B ON A.room_id = B.room_id;
    END

    -- Actualizar habitación y/o imagen
    IF (@accion = 'update')
    BEGIN
        -- Actualizar la tabla Rooms
        UPDATE [dbo].[Rooms]
        SET [room_number] = @room_number,
            [room_type] = @room_type,
            [description] = @description,
            [price_per_night] = @price_per_person,
            [max_guests] = @max_guests,
            [updated_at] = GETDATE()
        WHERE room_id = @roomID;

        -- Si se proporciona una imagen, actualizar o insertar en Room_Images
        IF (@image_url IS NOT NULL)
        BEGIN
            -- Si ya existe una imagen para esta habitación, hacer un UPDATE
            IF EXISTS (SELECT 1 FROM Room_Images WHERE room_id = @roomID)
            BEGIN
                UPDATE [dbo].[Room_Images]
                SET image_url = @image_url,
                    updated_at = GETDATE()
                WHERE room_id = @roomID;
            END
            ELSE
            BEGIN
                -- Si no existe una imagen, hacer un INSERT
                INSERT INTO [dbo].[Room_Images] (room_id, image_url, created_at)
                VALUES (@roomID, @image_url, GETDATE());
            END
        END
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[eventsHotel]    Script Date: 10/9/2024 18:15:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[eventsHotel]
@accion NVARCHAR(50) = NULL,
@event_name NVARCHAR(100) = NULL,
@description NVARCHAR(300) = NULL,
@event_date DATETIME = NULL,
@price_per_person DECIMAL(10, 2) = NULL,
@completeName NVARCHAR(50) = NULL,
@telephone NVARCHAR(8) = NULL,
@email NVARCHAR(400) = NULL,
@number_of_attendees INT = NULL,
@reservation_status NVARCHAR(15) = 'Pendiente'
AS
BEGIN
    BEGIN TRY
        IF @accion = 'insertReservation'
        BEGIN
            -- Insertar la reserva
            INSERT INTO [dbo].[Event_Reservations]
                ([event_name]
                ,[description]
                ,[event_date]
                ,[price_per_person]
                ,[completeName]
                ,[telephone]
                ,[email]
                ,[number_of_attendees]
                ,[reservation_status]
                ,[created_at]
                ,[updated_at])
            VALUES
                (@event_name
                ,@description
                ,@event_date
                ,@price_per_person
                ,@completeName
                ,@telephone
                ,@email
                ,@number_of_attendees
                ,@reservation_status
                ,GETDATE()
                ,GETDATE())
            
            -- Obtener el ID de la reserva insertada
            DECLARE @reservation_id INT;
			SET @reservation_id = SCOPE_IDENTITY();
        END

        -- Retornar un mensaje de éxito
        --SELECT 'Success' AS status, @reservation_id AS reservation_id
		SELECT @reservation_id AS reservationID, 'Success' AS Status;
    END TRY
    BEGIN CATCH
        -- Manejo de errores
        SELECT 
            ERROR_NUMBER() AS ErrorNumber,
            ERROR_SEVERITY() AS ErrorSeverity,
            ERROR_STATE() AS ErrorState,
            ERROR_PROCEDURE() AS ErrorProcedure,
            ERROR_LINE() AS ErrorLine,
            ERROR_MESSAGE() AS ErrorMessage;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[IniciarSesion]    Script Date: 10/9/2024 18:15:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IniciarSesion]
@email NVARCHAR(200) = NULL,
@password_hash NVARCHAR(200)= NULL
AS
BEGIN
	SELECT * FROM Users WHERE email = @email AND password_hash = @password_hash
END
GO
/****** Object:  StoredProcedure [dbo].[InsertBookingAndPayment]    Script Date: 10/9/2024 18:15:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertBookingAndPayment]
@room_id INT,
@completeName NVARCHAR(80),
@telephone NVARCHAR(8),
@email NVARCHAR(300),
@check_in_date DATETIME,
@check_out_date DATETIME,
@total_price DECIMAL(10, 2),
@booking_status NVARCHAR(50) = 'Reservada',
@amount DECIMAL(10, 2),
@payment_method NVARCHAR(50) = 'Tarjeta de Crédito',
@event_reservation_id INT,
@accion NVARCHAR(50)
AS
BEGIN
    IF(@accion = 'Insertar')
	BEGIN
		-- Start a transaction
		BEGIN TRANSACTION;

		BEGIN TRY
			-- Insert into Bookings table
			INSERT INTO Bookings (
				room_id,
				completeName,
				telephone,
				email,
				check_in_date,
				check_out_date,
				total_price,
				booking_status,
				created_at,
				updated_at
			)
			VALUES (
				@room_id,
				@completeName,
				@telephone,
				@email,
				@check_in_date,
				@check_out_date,
				@total_price,
				@booking_status,
				GETDATE(), -- created_at
				GETDATE()  -- updated_at
			);

			-- Get the newly inserted booking_id
			DECLARE @booking_id INT;
			SET @booking_id = SCOPE_IDENTITY();

			-- Insert into Payments table using the newly inserted booking_id
			INSERT INTO Payments (
				booking_id,
				event_reservation_id,
				amount,
				payment_date,
				payment_method,
				created_at,
				updated_at
			)
			VALUES (
				@booking_id,
				@event_reservation_id, -- event_reservation_id, you may want to adjust this depending on your requirements
				@amount,
				GETDATE(), -- payment_date
				@payment_method,
				GETDATE(), -- created_at
				GETDATE()  -- updated_at
			);

			-- Commit the transaction
			COMMIT TRANSACTION;

			-- Return success
			SELECT @booking_id AS BookingID, 'Success' AS Status;

		END TRY
		BEGIN CATCH
			-- Rollback the transaction if any error occurs
			ROLLBACK TRANSACTION;

			-- Return error information
			SELECT ERROR_MESSAGE() AS ErrorMessage;
		END CATCH
	END
END;
GO

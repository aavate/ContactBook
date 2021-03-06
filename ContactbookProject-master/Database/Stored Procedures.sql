USE [PhoneBook]
GO
-- =============================================
-- Author:		Avinash Avate
-- Create date: 20/0/2018
-- Description:	Create new record in phonebook.
-- =============================================
CREATE PROCEDURE [dbo].[AddPhonebookRecord]
	@firstName varchar(100),
	@lastName varchar(100),
	@phoneNumber varchar(15),
	@email varchar(200),
	@isActive bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with Insert statements.
	SET NOCOUNT ON;

	Insert into Phonebook (FirstName, LastName, PhoneNumber, Email, IsActive, CreatedDate) 
					Values (@firstName, @lastName, @phoneNumber, @email, @isActive, GETDATE());

	SELECT CONVERT(int,@@IDENTITY) AS Id;
END

GO
-- =============================================
-- Author:		Avinash Avate
-- Create date: 20/03/2020
-- Description:	Insert new token.
-- =============================================
CREATE PROCEDURE [dbo].[CreateToken]
	@token nvarchar(200),
	@expirationtime datetime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with Insert statements.
	SET NOCOUNT ON;

	Insert into Token (Token, ExpirationTime, CreatedDate) 
					Values (@token, @expirationtime, GETDATE());

	SELECT @@IDENTITY Id;
END



GO
-- =============================================
-- Author:		Avinash Avate
-- Create date: 20/03/2020
-- Description:	Delete phonebook record by id.
-- =============================================
CREATE PROCEDURE [dbo].[DeletePhonebookRecord]
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with delete statements.
	SET NOCOUNT ON;

	Delete FROM Phonebook WHERE Id = @id;
END

GO
-- =============================================
-- Author:		Avinash Avate
-- Create date: 20/03/2020
-- Description:	Get phonebook record by id.
-- =============================================
CREATE PROCEDURE [dbo].[GetPhonebookRecordById]
	@id int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with Select statements.
	SET NOCOUNT ON;

	SELECT    Id
			, FirstName
			, LastName
			, PhoneNumber
			, Email
			, IsActive
			, CreatedDate
			, ModifiedDate
	FROM Phonebook
	WHERE Id = @id;
END

GO
-- =============================================
-- Author:		Avinash Avate
-- Create date: 20/03/2020
-- Description:	Get phonebook records.
-- =============================================
CREATE PROCEDURE [dbo].[GetPhonebookRecords]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with Select statements.
	SET NOCOUNT ON;

	SELECT    Id
			, FirstName
			, LastName
			, PhoneNumber
			, Email
			, IsActive
			, CreatedDate
			, ModifiedDate
	FROM Phonebook;
END

GO
-- =============================================
-- Author:		Avinash Avate
-- Create date: 20/03/2020
-- Description:	Get tokenId by token.
-- =============================================
CREATE PROCEDURE [dbo].[GetTokenIdByToken]
	@token nvarchar(200)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with Select statements.
	SET NOCOUNT ON;

	SELECT  Id  FROM Token WHERE Token = @token AND ExpirationTime > GETDATE();
	
END

GO
-- =============================================
-- Author:		Avinash Avate
-- Create date: 20/03/2020
-- Description:	Update new record in phonebook.
-- =============================================
CREATE PROCEDURE [dbo].[UpdatePhonebookRecord]
	@id int,
	@firstName varchar(100),
	@lastName varchar(100),
	@phoneNumber varchar(15),
	@email varchar(200),
	@isActive bit
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with Update statements.
	SET NOCOUNT ON;

	Update Phonebook set FirstName = @firstName 
						,LastName = @lastName
						,PhoneNumber = @phoneNumber
						,Email = @email
						,IsActive = @isActive
						,ModifiedDate = GETDATE()
					where Id = @id;
END

GO

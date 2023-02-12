USE PRJ301_PGNB
CREATE TABLE [User](
	userID			NVARCHAR(6)		PRIMARY KEY,
	username		NVARCHAR(30)	NOT NULL, --Full name
	dob				DATE			NOT NULL,
	phone			NVARCHAR(11)	NOT NUll,
	[address]		NVARCHAR(50)	NOT NULL,
	email			NVARCHAR(30)	NOT NULL,
	[password]		NVARCHAR(20)	NOT NULL,
	[weight]		FLOAT			NOT NULL,
	height			FLOAT			NOT NULL,
	gender			INT				NOT NULL, --Male =1; Female = 0	
	activity		INT				NOT NULL, --Sedenatry = 1, lightly active = 2, moderately active = 3, active = 4, very active = 5
	preference		INT				NOT NULL, --No preference = 0, Asian and Pacific = 1, European and North America = 2, Mediterranean & Hispanic = 3, Vegan = 4
	goal			INT				NOT NULL, --Stay = 0, gain = 1, lose = -1
	amount			FLOAT			NOT NULL, --Default = 2kg
	duration		INT				NOT NULL, --Default = 8 weeks	
	[rank]			INT				NOT NULL, --Normal = 1, VIP = 2
	createdate		DATE			NOT NULL,

	--userID format: U*****
	CHECK (userID LIKE '[A-Z][0-9][0-9][0-9][0-9][0-9]')
)

CREATE TABLE Exercise(
	exerciseID		NVARCHAR(5)		PRIMARY KEY,
	[exname]		NVARCHAR(30)	NOT NULL,
	lowerweight		FLOAT			NOT NULL,
	upperweight		FLOAT			NOT NULL,
	calorexp		INT				NOT NULL,

	--exerciseID format: EX***
	CHECK (exerciseID LIKE 'EX[0-9][0-9][0-9]')
)

CREATE TABLE Food(
	foodID			NVARCHAR(7)		PRIMARY KEY,
	foodname		NVARCHAR(30)	NOT NULL,
	category		NVARCHAR(20)	NOT NULL,
	size			INT				NOT NULL,
	caloricintake	INT				NOT NULL,
	carbohydrate	FLOAT			NOT NULL,
	fiber			FLOAT			NOT NULL,
	protein			FLOAT			NOT NULL,
	fat				FLOAT			NOT NULL,
	water			FLOAT			NOT NULL,

	--foodID format: FD*****
	CHECK (foodID LIKE 'FD[0-9][0-9][0-9][0-9][0-9]')
)

CREATE TABLE Product(
	productID		NVARCHAR(7)		PRIMARY KEY,
	productname		NVARCHAR(50)	NOT NULL,
	[type]			NVARCHAR(10)	NOT NULL,
	price			FLOAT			NOT NULL,
	quantity		INT				NOT NULL,
	brand			NVARCHAR(30)	NOT NULL,
	origin			NVARCHAR(20)	NOT NULL,
	volume			FLOAT			NULL,
	effect			NVARCHAR(150)	NULL,
	rate			FLOAT			NULL, --Default:4.0
	purchase		FLOAT			NULL, --Default: 100

	--productID format: PRO****
	CHECK (productID LIKE 'PRO[0-9][0-9][0-9][0-9]')
)

CREATE TABLE [Type](
	foodID			NVARCHAR(7)		FOREIGN KEY REFERENCES Food(foodID),
	[type]			INT				NOT NULL,
	PRIMARY KEY(foodID, [type])
)

CREATE TABLE FoodAdvoidance(
	userID			NVARCHAR(6)		FOREIGN KEY REFERENCES [User](userID),
	foodID			NVARCHAR(7)		FOREIGN KEY REFERENCES Food(foodID),
	PRIMARY KEY(userID, foodID)
)

CREATE TABLE [Day](
	dayID			NVARCHAR(8)		PRIMARY KEY,
	userID			NVARCHAR(6)		FOREIGN KEY REFERENCES [User](userID),
	[index]			INT				NOT NULL,

	-- dayID format: DAY*****
	CHECK (dayID LIKE 'DAY[0-9][0-9][0-9][0-9][0-9][0-9]')
)

CREATE TABLE ExSession(
	sessionID		NVARCHAR(8)		PRIMARY KEY,
	exerciseID		NVARCHAR(5)		FOREIGN KEY REFERENCES Exercise(exerciseID),
	userID			NVARCHAR(6)		FOREIGN KEY REFERENCES [User](userID),
	dayID			NVARCHAR(8)		FOREIGN KEY REFERENCES [Day](dayID),

	-- sessionID format: SES*****
	CHECK (sessionID LIKE 'SES[0-9][0-9][0-9][0-9][0-9][0-9]')
)

CREATE TABLE Meal(
	mealID			NVARCHAR(9)		PRIMARY KEY,
	userID			NVARCHAR(6)		FOREIGN KEY REFERENCES [User](userID),
	dayID			NVARCHAR(8)		FOREIGN KEY REFERENCES [Day](dayID),
	[time]			NVARCHAR(15)	NOT NULL,

	-- mealID format: MEAL*****
	CHECK (mealID LIKE 'MEAL[0-9][0-9][0-9][0-9][0-9]')
)

CREATE TABLE FoodDetail(
	foodID			NVARCHAR(7)		FOREIGN KEY REFERENCES Food(foodID),
	mealID			NVARCHAR(9)		FOREIGN KEY REFERENCES Meal(mealID),
	amount			FLOAT			NOT NULL, -- in grams
	quantity		FLOAT			NOT NULL, -- in cups
	PRIMARY KEY(foodID, mealID)

)

CREATE TABLE Bill(
	billID			NVARCHAR(10)	PRIMARY KEY,
	userID			NVARCHAR(6)		FOREIGN KEY REFERENCES [User](userID),
	[date]			DATE			NOT NULL,
	delivery		NVARCHAR(15)	NULL, --Default: truck
	payment			NVARCHAR(15)	NULL, --Default: COD

	-- billID format: BILL******
	CHECK (billID LIKE 'BILL[0-9][0-9][0-9][0-9][0-9][0-9]')
)

CREATE TABLE ProductDetail(
	detailID		NVARCHAR(8)		PRIMARY KEY,
	productID		NVARCHAR(7)		FOREIGN KEY REFERENCES Product(productID),
	userID			NVARCHAR(6)		FOREIGN KEY REFERENCES [User](userID),
	billID			NVARCHAR(10)	FOREIGN KEY REFERENCES Bill(billID), --Default = 0: in the cart but not yet purchased
	quantity		INT				NOT NULL,

	-- detailID format: PD******
	CHECK (detailID LIKE 'PD[0-9][0-9][0-9][0-9][0-9][0-9]')
)

CREATE TABLE SaleOff(
	saleoffID		NVARCHAR(7)		PRIMARY KEY,
	[description]	NVARCHAR(150)	NULL,
	startdate		DATE			NULL,
	enddate			DATE			NULL,
	[target]		INT				NULL, --Default:0

	--saleoffID format: SALE***
	CHECK (saleoffID LIKE 'SALE[0-9][0-9][0-9]')
)

CREATE TABLE PopUp(
	popupID			NVARCHAR(6)		PRIMARY KEY,
	description		NVARCHAR(150)	NULL,
	status			INT				NULL, --Default: 0; off: 0, on: 1
	theme			NVARCHAR(100)	NULL --URL
)

CREATE TABLE SaleOffDetail(
	deatilID		NVARCHAR(5)		PRIMARY KEY,
	saleoffID		NVARCHAR(7)		FOREIGN KEY REFERENCES SaleOff(saleoffID),
	productID		NVARCHAR(7)		FOREIGN KEY REFERENCES Product(productID),
	percentoff		INT				NULL,
	priceoff		FLOAT			NULL,
	gift			NVARCHAR(7)		NULL FOREIGN KEY REFERENCES Product(productID) --a sample product that represents not gift
)

CREATE TABLE PopUpDetail(
	popupID			NVARCHAR(6)		FOREIGN KEY REFERENCES PopUp(popupID),
	productID		NVARCHAR(7)		FOREIGN KEY REFERENCES Product(productID),
	[description]	NVARCHAR(50)	NULL,
	PRIMARY KEY(popupID, productID)
)




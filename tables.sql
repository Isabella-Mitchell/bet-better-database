use BetBetter
go

--creating all tables for the database

drop table if exists bet_user
create table bet_user(
	userID int identity not null primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	email varchar(100) not null,
	phone varchar(20) not null,
	user_address varchar(100) not null,
	max_gbp_daily int not null,
	max_mins_daily int not null,
	betterID varchar(25) not null
)
go


drop table if exists bet_companies
create table bet_companies(
	companyID int identity not null primary key,
	company varchar(25) not null,
	website varchar(200) not null
)
go


drop table if exists bet_profiles
create table bet_profiles(
	profileID int identity not null primary key,
	--FKcompanyID int not null,
	username varchar(50) not null,
	first_name varchar(25) not null,
	last_name varchar(25) not null,
	phone_no varchar(20) not null,
	user_address varchar(100) not null,
	company_name varchar(100) not null
)
go

drop table if exists betterID_profiles
create table betterID_profiles(
	betterprofileID int identity not null primary key,
	FKbetterID varchar(25) not null,
	FKprofileID int not null
)
go

drop table if exists betting_session
create table betting_session(
	sessionID int identity not null primary key,
	FKbetter_ID varchar(25) not null,
	start_time time not null,
	end_time time not null,
	duration int not null,
	spending int not null
)
go

drop table if exists total_timespend
create table total_timespend(
	FK_betterID varchar(25) not null,
	daily_time int,
	daily_spend int,
	week_time int,
	week_spend int,
	month_time int,
	month_spend int

)
go



set dateformat dmy;

--reading in all csv files into corresponding tables
bulk insert bet_user
from 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Athena\betterDB.csv'
with (
	format = 'csv',
	firstrow = 2,
	ROWTERMINATOR = '0x0a'
);

bulk insert bet_companies
from 'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Athena\companies.csv'
with (
	DATAFILETYPE = 'char',
	firstrow = 2,
	ROWTERMINATOR = '0x0a'
);

Insert into bet_companies
values ('betfair', 'https://www.betfair.com/'), ('Paddy Power', 'https://www.paddypower.com/bet'), ('Betfred', 'https://www.betfred.com/'), ('Ladbrokes', 'https://sports.ladbrokes.com/'), ('Boyle Sports', 'https://www.boylesports.com/'), ('Coral', 'https://sports.coral.co.uk/'), ('Sporting Bet', 'https://sports.sportingbet.com/en/sports')

select* from bet_companies


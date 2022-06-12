use BetBetter
go

if object_id('ProfilesPerUser', 'P') is not null
	drop procedure ProfilesPerUser;
go

create procedure ProfilesPerUser
as
	set nocount on;

	select u.first_name as 'Name', u.last_name as 'Surname', u.betterID as 'BetBetter ID', p.username as 'Username', c.company as 'Bookmaker'
	from bet_user as u
	inner join bet_profiles as p 
	on u.phone = p.phone_no
	inner join bet_companies as c
	on c.company = p.company_name

	return;
go

exec ProfilesPerUser 
use master
go
if exists (select 1 from sys.databases where name = 'BetBetter')
begin
	alter database BetBetter set single_user with rollback immediate
	drop database BetBetter
end
go

create database BetBetter
go

if exists (select 1 from sys.databases where name = 'BetBetter')
	print 'New database BetBetter created'
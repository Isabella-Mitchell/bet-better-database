use BetBetter
go
WITH PASSWORD = 'xyz!133_AB';
FOR LOGIN selin_login;
GRANT EXECUTE ON OBJECT:: ProfilesPerUser 
TO betbetter_user;

GRANT betbette_user TO selin;
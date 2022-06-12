use BetBetter
goCREATE LOGIN selin_login
WITH PASSWORD = 'xyz!133_AB';CREATE USER selin
FOR LOGIN selin_login;CREATE ROLE betbetter_user;
GRANT EXECUTE ON OBJECT:: ProfilesPerUser 
TO betbetter_user;

GRANT betbette_user TO selin;
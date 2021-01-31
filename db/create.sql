DROP DATABASE IF EXISTS fittrackee;
DROP USER IF EXISTS fittrackee;

CREATE DATABASE fittrackee;
CREATE USER fittrackee WITH PASSWORD 'fittrackee';
GRANT ALL PRIVILEGES ON DATABASE fittrackee TO fittrackee;

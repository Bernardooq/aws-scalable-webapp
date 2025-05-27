
-- Nos conectamos a la base de datos con el siguiente comando
-- mysql -h $APP_DB_HOST -u $APP_DB_USER -p$APP_DB_PASSWORD $APP_DB_NAME

USE STUDENTS; 
-- Creamos la tabla presente en UserdataScript-phase-2.sh
CREATE TABLE students(
            id INT NOT NULL AUTO_INCREMENT,
            name VARCHAR(255) NOT NULL,
            address VARCHAR(255) NOT NULL,
            city VARCHAR(255) NOT NULL,
            state VARCHAR(255) NOT NULL,
            email VARCHAR(255) NOT NULL,
            phone VARCHAR(100) NOT NULL,
            PRIMARY KEY ( id ));
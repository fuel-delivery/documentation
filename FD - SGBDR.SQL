DROP DATABASE IF EXISTS db_fd;

CREATE DATABASE IF NOT EXISTS db_fd;
USE db_fd;
# -----------------------------------------------------------------------------
#       TABLE : TYPE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS TYPE
 (
   ID_TYPE VARCHAR(10) NOT NULL  ,
   LIBELLE VARCHAR(100) NULL  ,
   PRIX_LITRE DOUBLE NULL  
   , PRIMARY KEY (ID_TYPE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ORDER
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ORDER
 (
   ID_ORDER VARCHAR(15) NOT NULL  ,
   ID_TYPE VARCHAR(10) NOT NULL  ,
   ID_CLIENT VARCHAR(10) NOT NULL  ,
   ID_LIVREUR VARCHAR(10) NOT NULL  ,
   DATE_HEURE DATE NULL  ,
   MATRICULE VARCHAR(10) NULL  ,
   VOLUME FLOAT(4) NULL  ,
   ADDRESS VARCHAR(200) NULL  ,
   COLOR VARCHAR(20) NULL  ,
   PRIX_TOTAL DOUBLE NULL  ,
   STATUT VARCHAR(30) NULL  ,
   METHODE VARCHAR(2) NULL  
   , PRIMARY KEY (ID_ORDER) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ADMIN
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ADMIN
 (
   ID_ADMIN VARCHAR(10) NOT NULL  ,
   NOM VARCHAR(30) NULL  ,
   PRENOM VARCHAR(30) NULL  ,
   EMAIL VARCHAR(30) NULL  ,
   PASSWRD VARCHAR(30) NULL  
   , PRIMARY KEY (ID_ADMIN) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : CLIENT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CLIENT
 (
   ID_CLIENT VARCHAR(10) NOT NULL  ,
   NOM VARCHAR(30) NULL  ,
   PRENOM VARCHAR(30) NULL  ,
   EMAIL VARCHAR(30) NULL  ,
   PASSWRD VARCHAR(30) NULL  ,
   VILLE VARCHAR(30) NULL  ,
   SEXE VARCHAR(2) NULL  ,
   PHOTO VARCHAR(32) NULL  ,
   CIN VARCHAR(10) NULL  ,
   TELE VARCHAR(15) NULL  
   , PRIMARY KEY (ID_CLIENT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ENTREPRISE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ENTREPRISE
 (
   ID_ENTREPRISE VARCHAR(10) NOT NULL  ,
   TITRE VARCHAR(100) NULL  ,
   DESCRIPTION TEXT NULL  ,
   TELE VARCHAR(15) NULL  ,
   EMAIL VARCHAR(30) NULL  ,
   ADDRESS VARCHAR(200) NULL  ,
   PHOTO VARCHAR(32) NULL  ,
   LIKE INT(50) NULL  ,
   DISLIKE INT(50) NULL  
   , PRIMARY KEY (ID_ENTREPRISE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : LIVREUR
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS LIVREUR
 (
   ID_LIVREUR VARCHAR(10) NOT NULL  ,
   ID_ENTREPRISE VARCHAR(10) NOT NULL  ,
   NOM VARCHAR(30) NULL  ,
   PRENOM VARCHAR(30) NULL  ,
   EMAIL VARCHAR(30) NULL  ,
   TELE VARCHAR(15) NULL  ,
   SEXE VARCHAR(2) NULL  ,
   PHOTO VARCHAR(32) NULL  ,
   PASSWRD VARCHAR(30) NULL  ,
   STATUT VARCHAR(10) NULL  ,
   CIN VARCHAR(10) NULL  
   , PRIMARY KEY (ID_LIVREUR) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : FAVORITE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS FAVORITE
 (
   ID_ENTREPRISE VARCHAR(10) NOT NULL  ,
   ID_CLIENT VARCHAR(10) NOT NULL  
   , PRIMARY KEY (ID_ENTREPRISE,ID_CLIENT) 
 ) 
 comment = "";


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE ORDER 
  ADD FOREIGN KEY FK_ORDER_TYPE (ID_TYPE)
      REFERENCES TYPE (ID_TYPE) ;


ALTER TABLE ORDER 
  ADD FOREIGN KEY FK_ORDER_CLIENT (ID_CLIENT)
      REFERENCES CLIENT (ID_CLIENT) ;


ALTER TABLE ORDER 
  ADD FOREIGN KEY FK_ORDER_LIVREUR (ID_LIVREUR)
      REFERENCES LIVREUR (ID_LIVREUR) ;


ALTER TABLE LIVREUR 
  ADD FOREIGN KEY FK_LIVREUR_ENTREPRISE (ID_ENTREPRISE)
      REFERENCES ENTREPRISE (ID_ENTREPRISE) ;


ALTER TABLE FAVORITE 
  ADD FOREIGN KEY FK_FAVORITE_ENTREPRISE (ID_ENTREPRISE)
      REFERENCES ENTREPRISE (ID_ENTREPRISE) ;


ALTER TABLE FAVORITE 
  ADD FOREIGN KEY FK_FAVORITE_CLIENT (ID_CLIENT)
      REFERENCES CLIENT (ID_CLIENT) ;


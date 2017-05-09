-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: ucosportssecurity
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.10-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_event_entity`
--

DROP TABLE IF EXISTS `admin_event_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_event_entity` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint(20) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` varchar(2550) DEFAULT NULL,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_event_entity`
--

LOCK TABLES `admin_event_entity` WRITE;
/*!40000 ALTER TABLE `admin_event_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_event_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `associated_policy`
--

DROP TABLE IF EXISTS `associated_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `associated_policy` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `FK_FRSR5S213XCX4WNKOG82SSRFY` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `resource_server_policy` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `associated_policy`
--
-- ORDER BY:  `POLICY_ID`,`ASSOCIATED_POLICY_ID`

LOCK TABLES `associated_policy` WRITE;
/*!40000 ALTER TABLE `associated_policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `associated_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentication_execution`
--

DROP TABLE IF EXISTS `authentication_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authentication_execution` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_AUTH_EXEC_REALM` (`REALM_ID`),
  KEY `FK_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `authentication_flow` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentication_execution`
--
-- ORDER BY:  `ID`

LOCK TABLES `authentication_execution` WRITE;
/*!40000 ALTER TABLE `authentication_execution` DISABLE KEYS */;
INSERT INTO `authentication_execution` VALUES ('04729223-a09c-4ff4-9baa-07f7ab8cedb4',NULL,'idp-confirm-link','UCOSPORTS','9e767394-5426-40bf-8347-1a79ea468a2e',0,10,'\0',NULL,NULL),('0acf7f0b-2a95-4dce-9656-67e1fb252da1',NULL,'reset-credentials-choose-user','UCOSPORTS','68cb4187-f49f-4da9-a2df-5b002c6aab11',0,10,'\0',NULL,NULL),('100fa431-80df-4050-9eff-05c81a5c1a0a',NULL,NULL,'master','a7446ebd-143e-48e5-8ff1-8cb5ce9c8e48',2,30,'','4f9b47a8-0390-4209-8908-fa98ba38db2f',NULL),('133767ee-6bef-491c-80d8-ef538a17329f',NULL,'reset-credentials-choose-user','master','e1d848ae-ad01-47b1-8bfe-21248a47920a',0,10,'\0',NULL,NULL),('15959c93-35bb-49bc-82d9-617ee2382285',NULL,'registration-recaptcha-action','master','7d1a8278-e6f6-4182-9924-4f6c5d91438c',3,60,'\0',NULL,NULL),('163a7517-abca-4174-b4ce-01738f747e47',NULL,'direct-grant-validate-otp','UCOSPORTS','2a3cdc1b-8644-414a-99e3-21dd7fc7fb08',1,30,'\0',NULL,NULL),('1aba8633-2088-4c10-b41e-066e798217cb',NULL,'idp-email-verification','UCOSPORTS','9e767394-5426-40bf-8347-1a79ea468a2e',2,20,'\0',NULL,NULL),('1d362ca1-acc6-4db2-ae0e-a428bc16f80d',NULL,'direct-grant-validate-username','master','220b8152-1efb-4e3d-86ff-454c350bc95f',0,10,'\0',NULL,NULL),('21030938-18e3-43d6-a4c1-0582a7541f96',NULL,'identity-provider-redirector','master','a7446ebd-143e-48e5-8ff1-8cb5ce9c8e48',2,25,'\0',NULL,NULL),('299b24f0-feff-4c8d-8494-606266fd3c5c',NULL,NULL,'UCOSPORTS','9e767394-5426-40bf-8347-1a79ea468a2e',2,30,'','2cc4b87d-f05e-4a8a-8e36-9e65d5572414',NULL),('2b02a637-ed0c-402d-8f27-d51fa951686e',NULL,'auth-spnego','UCOSPORTS','9bf7c0ef-a13e-47c5-9ed0-f49a34f5586e',3,20,'\0',NULL,NULL),('3168e250-3bf9-49a8-865e-4da5b15e6ae0',NULL,'client-secret','master','01abba30-d642-4ac9-9c6c-dcd7e3104e39',2,10,'\0',NULL,NULL),('354a0471-5cc2-49f4-9a01-e87e935cf74e',NULL,'idp-create-user-if-unique','UCOSPORTS','84377e11-f4db-4699-b17e-f374dc6aba10',2,20,'\0',NULL,'43f4bae2-fd37-40e1-b14c-582242beaa4e'),('3579c09d-0481-4767-afd0-391baff4fcb3',NULL,'reset-password','UCOSPORTS','68cb4187-f49f-4da9-a2df-5b002c6aab11',0,30,'\0',NULL,NULL),('3991c887-cf47-428f-8a64-9a614b5c8d4a',NULL,'registration-user-creation','master','7d1a8278-e6f6-4182-9924-4f6c5d91438c',0,20,'\0',NULL,NULL),('3dbb8d00-3461-4a94-b2f9-e68ee7d41529',NULL,'auth-otp-form','master','ce98de47-f9f6-4489-84c7-ea71a13dfc50',1,20,'\0',NULL,NULL),('40ef25dd-5355-4393-a118-c9de64d86e3f',NULL,'auth-username-password-form','UCOSPORTS','d69f00fd-ae86-4667-858a-1c3534409bd1',0,10,'\0',NULL,NULL),('4149e348-93f4-434f-ad7a-d42d74d6f55d',NULL,NULL,'master','8fd83816-fd07-4a36-be71-d6ef342779c2',2,30,'','9e4cf1e2-5c2f-4109-ac2e-0f7b496ca869',NULL),('498415bb-590c-442f-8d29-34976752037b',NULL,'idp-confirm-link','master','9e4cf1e2-5c2f-4109-ac2e-0f7b496ca869',0,10,'\0',NULL,NULL),('50c7ee94-d0a5-4a34-b24c-69586d56bfd1',NULL,'identity-provider-redirector','UCOSPORTS','9bf7c0ef-a13e-47c5-9ed0-f49a34f5586e',2,25,'\0',NULL,NULL),('541daee3-c10e-416e-95a1-ac14e0b5c6dc',NULL,'registration-user-creation','UCOSPORTS','1b7ad949-ac9f-4251-979f-f69b529ff575',0,20,'\0',NULL,NULL),('5ee43ff1-2dc2-4190-aa24-715cd08b65a0',NULL,'reset-password','master','e1d848ae-ad01-47b1-8bfe-21248a47920a',0,30,'\0',NULL,NULL),('62351680-a3c0-401c-893e-bea46ee1d85e',NULL,'client-jwt','UCOSPORTS','24df371f-5e9f-488c-a93f-da9aeae47504',2,20,'\0',NULL,NULL),('623a8d3d-4275-48e2-9e9f-7d8e4aaa7c70',NULL,'direct-grant-validate-password','master','220b8152-1efb-4e3d-86ff-454c350bc95f',0,20,'\0',NULL,NULL),('6812c4eb-61b0-4dd2-b5f9-ab8ebe178ebb',NULL,'auth-cookie','UCOSPORTS','9bf7c0ef-a13e-47c5-9ed0-f49a34f5586e',2,10,'\0',NULL,NULL),('6a6c07db-c8d7-49db-acbd-9228426b2e13',NULL,'reset-credential-email','UCOSPORTS','68cb4187-f49f-4da9-a2df-5b002c6aab11',0,20,'\0',NULL,NULL),('71858f88-3c46-4961-88e2-1c104c449d6d',NULL,'auth-otp-form','master','4f9b47a8-0390-4209-8908-fa98ba38db2f',1,20,'\0',NULL,NULL),('769f86d3-9bef-439a-8bfb-a2822719ee54',NULL,'reset-credential-email','master','e1d848ae-ad01-47b1-8bfe-21248a47920a',0,20,'\0',NULL,NULL),('7999432b-5ec7-4ce9-9829-00afb21c7a64',NULL,'registration-password-action','UCOSPORTS','1b7ad949-ac9f-4251-979f-f69b529ff575',0,50,'\0',NULL,NULL),('7ddb101d-993b-4d3c-ac5d-6e1325b3340c',NULL,'direct-grant-validate-otp','master','220b8152-1efb-4e3d-86ff-454c350bc95f',1,30,'\0',NULL,NULL),('7f729ec0-9804-4700-8627-5ba7436a9418',NULL,'registration-profile-action','master','7d1a8278-e6f6-4182-9924-4f6c5d91438c',0,40,'\0',NULL,NULL),('7f9d0418-faff-488f-92a2-cff3732570dd',NULL,'registration-recaptcha-action','UCOSPORTS','1b7ad949-ac9f-4251-979f-f69b529ff575',3,60,'\0',NULL,NULL),('88661abc-d5c9-4d02-8f82-d29aa53a71bd',NULL,'client-secret','UCOSPORTS','24df371f-5e9f-488c-a93f-da9aeae47504',2,10,'\0',NULL,NULL),('8a78c3a6-a95b-4270-80a4-aa01bea8be88',NULL,'registration-profile-action','UCOSPORTS','1b7ad949-ac9f-4251-979f-f69b529ff575',0,40,'\0',NULL,NULL),('8f49fca3-af28-4441-9cc7-4fd65ff08f83',NULL,'idp-review-profile','master','8fd83816-fd07-4a36-be71-d6ef342779c2',0,10,'\0',NULL,'aff0d0f6-0c59-4325-a56f-b8db0cfd6b26'),('92e26e5e-4584-4c69-83de-0790624e35f7',NULL,'reset-otp','UCOSPORTS','68cb4187-f49f-4da9-a2df-5b002c6aab11',1,40,'\0',NULL,NULL),('99b1ddd5-54c9-4c23-8c51-76f0cd1d2de4',NULL,'auth-otp-form','UCOSPORTS','2cc4b87d-f05e-4a8a-8e36-9e65d5572414',1,20,'\0',NULL,NULL),('9c2bb9c4-6899-4349-a19a-3bd7f800785e',NULL,'http-basic-authenticator','UCOSPORTS','59927283-a40f-4dab-8620-92e34f41a389',0,10,'\0',NULL,NULL),('9c43acd4-2cd9-4295-a602-cecb4ff5411c',NULL,NULL,'master','9e4cf1e2-5c2f-4109-ac2e-0f7b496ca869',2,30,'','ce98de47-f9f6-4489-84c7-ea71a13dfc50',NULL),('9d393401-dea8-4a70-bfca-d5b28afd6100',NULL,'registration-page-form','UCOSPORTS','5da31f34-e1fc-4add-99e6-e05f1b0194be',0,10,'','1b7ad949-ac9f-4251-979f-f69b529ff575',NULL),('9e8a7c66-4a50-43d9-a986-c640e386f7bd',NULL,'direct-grant-validate-password','UCOSPORTS','2a3cdc1b-8644-414a-99e3-21dd7fc7fb08',0,20,'\0',NULL,NULL),('a135e00e-50de-45d7-874a-2df8d8d635cb',NULL,'registration-password-action','master','7d1a8278-e6f6-4182-9924-4f6c5d91438c',0,50,'\0',NULL,NULL),('a5bb8846-b3df-45cb-9570-ebc1beea361d',NULL,'idp-email-verification','master','9e4cf1e2-5c2f-4109-ac2e-0f7b496ca869',2,20,'\0',NULL,NULL),('a65c46d4-632a-4dd2-aff0-41e879629026',NULL,'auth-username-password-form','master','4f9b47a8-0390-4209-8908-fa98ba38db2f',0,10,'\0',NULL,NULL),('b4424a8a-3bbd-4d48-a24c-a680a0c16ae1',NULL,'auth-cookie','master','a7446ebd-143e-48e5-8ff1-8cb5ce9c8e48',2,10,'\0',NULL,NULL),('bbdd6b5e-04c0-45bf-96c9-142e81f131db',NULL,'registration-page-form','master','993bbcdc-88ea-40d3-b9bc-cc7acbf23c38',0,10,'','7d1a8278-e6f6-4182-9924-4f6c5d91438c',NULL),('c4d5f8f4-6d08-44c0-a9be-75b5e11e9eca',NULL,'auth-otp-form','UCOSPORTS','d69f00fd-ae86-4667-858a-1c3534409bd1',1,20,'\0',NULL,NULL),('c6bb6f0c-edbf-471d-b5d9-b4fbe2b082c5',NULL,'direct-grant-validate-username','UCOSPORTS','2a3cdc1b-8644-414a-99e3-21dd7fc7fb08',0,10,'\0',NULL,NULL),('cb6c4e9b-0475-41f0-a806-fd98f9c650b2',NULL,'idp-username-password-form','master','ce98de47-f9f6-4489-84c7-ea71a13dfc50',0,10,'\0',NULL,NULL),('d657e538-bd72-483e-9523-cd1f173935ba',NULL,'http-basic-authenticator','master','11e916b8-7a25-497c-9c73-dda40c0147f0',0,10,'\0',NULL,NULL),('e669dcf7-c226-43a5-a4aa-730c091aead2',NULL,'auth-spnego','master','a7446ebd-143e-48e5-8ff1-8cb5ce9c8e48',3,20,'\0',NULL,NULL),('eb99c1a3-5da0-4a05-bda2-f6c24744b83a',NULL,'reset-otp','master','e1d848ae-ad01-47b1-8bfe-21248a47920a',1,40,'\0',NULL,NULL),('ec6f0429-3342-4a10-be6f-77671f2d8b99',NULL,NULL,'UCOSPORTS','84377e11-f4db-4699-b17e-f374dc6aba10',2,30,'','9e767394-5426-40bf-8347-1a79ea468a2e',NULL),('f4ebcc46-aafc-44ab-82dd-8920a2562a3f',NULL,NULL,'UCOSPORTS','9bf7c0ef-a13e-47c5-9ed0-f49a34f5586e',2,30,'','d69f00fd-ae86-4667-858a-1c3534409bd1',NULL),('f57b32e9-9918-454b-9cc0-f9e07d69fd30',NULL,'idp-create-user-if-unique','master','8fd83816-fd07-4a36-be71-d6ef342779c2',2,20,'\0',NULL,'63865143-ee0c-4350-b33f-998911b11686'),('f6fc1f93-ccf6-443a-9220-83d7c6f03f63',NULL,'idp-username-password-form','UCOSPORTS','2cc4b87d-f05e-4a8a-8e36-9e65d5572414',0,10,'\0',NULL,NULL),('fa1f1f49-e267-4770-aa4e-6ba0b0638027',NULL,'client-jwt','master','01abba30-d642-4ac9-9c6c-dcd7e3104e39',2,20,'\0',NULL,NULL),('fc325add-019d-4911-9741-1836486aaff2',NULL,'idp-review-profile','UCOSPORTS','84377e11-f4db-4699-b17e-f374dc6aba10',0,10,'\0',NULL,'a1457eee-267a-4597-b06d-629aba5cf0df');
/*!40000 ALTER TABLE `authentication_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentication_flow`
--

DROP TABLE IF EXISTS `authentication_flow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authentication_flow` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `FK_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentication_flow`
--
-- ORDER BY:  `ID`

LOCK TABLES `authentication_flow` WRITE;
/*!40000 ALTER TABLE `authentication_flow` DISABLE KEYS */;
INSERT INTO `authentication_flow` VALUES ('01abba30-d642-4ac9-9c6c-dcd7e3104e39','clients','Base authentication for clients','master','client-flow','',''),('11e916b8-7a25-497c-9c73-dda40c0147f0','saml ecp','SAML ECP Profile Authentication Flow','master','basic-flow','',''),('1b7ad949-ac9f-4251-979f-f69b529ff575','registration form','registration form','UCOSPORTS','form-flow','\0',''),('220b8152-1efb-4e3d-86ff-454c350bc95f','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow','',''),('24df371f-5e9f-488c-a93f-da9aeae47504','clients','Base authentication for clients','UCOSPORTS','client-flow','',''),('2a3cdc1b-8644-414a-99e3-21dd7fc7fb08','direct grant','OpenID Connect Resource Owner Grant','UCOSPORTS','basic-flow','',''),('2cc4b87d-f05e-4a8a-8e36-9e65d5572414','Verify Existing Account by Re-authentication','Reauthentication of existing account','UCOSPORTS','basic-flow','\0',''),('4f9b47a8-0390-4209-8908-fa98ba38db2f','forms','Username, password, otp and other auth forms.','master','basic-flow','\0',''),('59927283-a40f-4dab-8620-92e34f41a389','saml ecp','SAML ECP Profile Authentication Flow','UCOSPORTS','basic-flow','',''),('5da31f34-e1fc-4add-99e6-e05f1b0194be','registration','registration flow','UCOSPORTS','basic-flow','',''),('68cb4187-f49f-4da9-a2df-5b002c6aab11','reset credentials','Reset credentials for a user if they forgot their password or something','UCOSPORTS','basic-flow','',''),('7d1a8278-e6f6-4182-9924-4f6c5d91438c','registration form','registration form','master','form-flow','\0',''),('84377e11-f4db-4699-b17e-f374dc6aba10','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','UCOSPORTS','basic-flow','',''),('8fd83816-fd07-4a36-be71-d6ef342779c2','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow','',''),('993bbcdc-88ea-40d3-b9bc-cc7acbf23c38','registration','registration flow','master','basic-flow','',''),('9bf7c0ef-a13e-47c5-9ed0-f49a34f5586e','browser','browser based authentication','UCOSPORTS','basic-flow','',''),('9e4cf1e2-5c2f-4109-ac2e-0f7b496ca869','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow','\0',''),('9e767394-5426-40bf-8347-1a79ea468a2e','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','UCOSPORTS','basic-flow','\0',''),('a7446ebd-143e-48e5-8ff1-8cb5ce9c8e48','browser','browser based authentication','master','basic-flow','',''),('ce98de47-f9f6-4489-84c7-ea71a13dfc50','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow','\0',''),('d69f00fd-ae86-4667-858a-1c3534409bd1','forms','Username, password, otp and other auth forms.','UCOSPORTS','basic-flow','\0',''),('e1d848ae-ad01-47b1-8bfe-21248a47920a','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow','','');
/*!40000 ALTER TABLE `authentication_flow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authenticator_config`
--

DROP TABLE IF EXISTS `authenticator_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authenticator_config` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_AUTH_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authenticator_config`
--
-- ORDER BY:  `ID`

LOCK TABLES `authenticator_config` WRITE;
/*!40000 ALTER TABLE `authenticator_config` DISABLE KEYS */;
INSERT INTO `authenticator_config` VALUES ('43f4bae2-fd37-40e1-b14c-582242beaa4e','create unique user config','UCOSPORTS'),('63865143-ee0c-4350-b33f-998911b11686','create unique user config','master'),('a1457eee-267a-4597-b06d-629aba5cf0df','review profile config','UCOSPORTS'),('aff0d0f6-0c59-4325-a56f-b8db0cfd6b26','review profile config','master');
/*!40000 ALTER TABLE `authenticator_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authenticator_config_entry`
--

DROP TABLE IF EXISTS `authenticator_config_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authenticator_config_entry` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authenticator_config_entry`
--
-- ORDER BY:  `AUTHENTICATOR_ID`,`NAME`

LOCK TABLES `authenticator_config_entry` WRITE;
/*!40000 ALTER TABLE `authenticator_config_entry` DISABLE KEYS */;
INSERT INTO `authenticator_config_entry` VALUES ('43f4bae2-fd37-40e1-b14c-582242beaa4e','false','require.password.update.after.registration'),('63865143-ee0c-4350-b33f-998911b11686','false','require.password.update.after.registration'),('a1457eee-267a-4597-b06d-629aba5cf0df','missing','update.profile.on.first.login'),('aff0d0f6-0c59-4325-a56f-b8db0cfd6b26','missing','update.profile.on.first.login');
/*!40000 ALTER TABLE `authenticator_config_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `broker_link`
--

DROP TABLE IF EXISTS `broker_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `broker_link` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `broker_link`
--
-- ORDER BY:  `IDENTITY_PROVIDER`,`USER_ID`

LOCK TABLES `broker_link` WRITE;
/*!40000 ALTER TABLE `broker_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `broker_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int(11) DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_TEMPLATE_ID` varchar(36) DEFAULT NULL,
  `USE_TEMPLATE_CONFIG` bit(1) NOT NULL DEFAULT b'0',
  `USE_TEMPLATE_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  `USE_TEMPLATE_MAPPERS` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `FK_CLI_TMPLT_CLIENT` (`CLIENT_TEMPLATE_ID`),
  CONSTRAINT `FK_CLI_TMPLT_CLIENT` FOREIGN KEY (`CLIENT_TEMPLATE_ID`) REFERENCES `client_template` (`ID`),
  CONSTRAINT `FK_P56CTINXXB9GSK57FO49F9TAC` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--
-- ORDER BY:  `ID`

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES ('125f1e4c-38c5-4e0f-8a53-d4290905139a','','\0','security-admin-console',0,'','187cfb7f-0dc3-4bed-a8fe-ad29aa198ff3','/auth/admin/UCOSPORTS/console/index.html','\0',NULL,'\0','UCOSPORTS',NULL,0,'\0','\0','${client_security-admin-console}','\0','client-secret',NULL,NULL,NULL,'','\0','\0',NULL,'\0','\0','\0'),('1b585834-2f2e-47dd-9484-b552e1e701e4','','\0','broker',0,'\0','21ce5cfc-9595-47a3-9ecc-2bbb79dfb3fa',NULL,'\0',NULL,'\0','master',NULL,0,'\0','\0','${client_broker}','\0','client-secret',NULL,NULL,NULL,'','\0','\0',NULL,'\0','\0','\0'),('81535c9c-7c23-4199-a976-6c20fbe1e636','','\0','security-admin-console',0,'','0dc07616-e31b-48ec-86a0-c76732ecd3ae','/auth/admin/master/console/index.html','\0',NULL,'\0','master',NULL,0,'\0','\0','${client_security-admin-console}','\0','client-secret',NULL,NULL,NULL,'','\0','\0',NULL,'\0','\0','\0'),('ac5992c6-37bc-465c-9b25-5aabca0b8433','','\0','broker',0,'\0','a0426e33-d50a-4d29-80a8-c7a9ba694b01',NULL,'\0',NULL,'\0','UCOSPORTS',NULL,0,'\0','\0','${client_broker}','\0','client-secret',NULL,NULL,NULL,'','\0','\0',NULL,'\0','\0','\0'),('b4575469-6578-45ec-87ee-6d67ab5bf236','','\0','account',0,'\0','99de4891-1c08-4e58-83a0-2ef343bfa68c','/auth/realms/master/account','\0',NULL,'\0','master',NULL,0,'\0','\0','${client_account}','\0','client-secret',NULL,NULL,NULL,'','\0','\0',NULL,'\0','\0','\0'),('b53fdbc2-3bc2-403f-a3e8-fb6af868086e','','','UCOSPORTS-realm',0,'\0','1541cb87-2e03-43b6-a273-826cc7f3b876',NULL,'',NULL,'\0','master',NULL,0,'\0','\0','UCOSPORTS Realm','\0','client-secret',NULL,NULL,NULL,'','\0','\0',NULL,'\0','\0','\0'),('b5dedaa1-72ef-44d2-b46c-396c47932111','','\0','admin-cli',0,'','3e3de30c-7827-4481-a493-b02cb8f1cc0f',NULL,'\0',NULL,'\0','UCOSPORTS',NULL,0,'\0','\0','${client_admin-cli}','\0','client-secret',NULL,NULL,NULL,'\0','\0','',NULL,'\0','\0','\0'),('bbe84378-9c83-4064-94ed-24a30f18f6c3','','','ucosports-web',0,'','74e699ef-5663-4542-95c6-7611b52cd834',NULL,'\0','http://localhost:8081/','\0','UCOSPORTS','openid-connect',-1,'\0','\0',NULL,'\0','client-secret','http://localhost:8081/',NULL,NULL,'','\0','',NULL,'\0','\0','\0'),('c2a4c629-9e85-4345-9536-da8c0ba928e4','','\0','admin-cli',0,'','d24d6c6f-0d70-49df-9bea-c27fecb2819f',NULL,'\0',NULL,'\0','master',NULL,0,'\0','\0','${client_admin-cli}','\0','client-secret',NULL,NULL,NULL,'\0','\0','',NULL,'\0','\0','\0'),('c5889f5f-afec-4db9-b7ab-e340d97e6c53','','\0','realm-management',0,'\0','acaf34a1-463b-47bc-b8fa-1f429b4eec86',NULL,'',NULL,'\0','UCOSPORTS',NULL,0,'\0','\0','${client_realm-management}','\0','client-secret',NULL,NULL,NULL,'','\0','\0',NULL,'\0','\0','\0'),('d8df134d-909b-4407-9546-057fa65d7441','','\0','account',0,'\0','ea6a8c27-c0a6-472a-8ee2-a8850bdd9ec2','/auth/realms/UCOSPORTS/account','\0',NULL,'\0','UCOSPORTS',NULL,0,'\0','\0','${client_account}','\0','client-secret',NULL,NULL,NULL,'','\0','\0',NULL,'\0','\0','\0'),('efcba2f7-f725-4f7c-acc7-2766f7163b10','','','master-realm',0,'\0','e7d32758-2c25-485b-b7d0-c6e6f531e8df',NULL,'',NULL,'\0','master',NULL,0,'\0','\0','master Realm','\0','client-secret',NULL,NULL,NULL,'','\0','\0',NULL,'\0','\0','\0');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_attributes`
--

DROP TABLE IF EXISTS `client_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_attributes` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_attributes`
--
-- ORDER BY:  `CLIENT_ID`,`NAME`

LOCK TABLES `client_attributes` WRITE;
/*!40000 ALTER TABLE `client_attributes` DISABLE KEYS */;
INSERT INTO `client_attributes` VALUES ('bbe84378-9c83-4064-94ed-24a30f18f6c3','false','saml.assertion.signature'),('bbe84378-9c83-4064-94ed-24a30f18f6c3','false','saml.authnstatement'),('bbe84378-9c83-4064-94ed-24a30f18f6c3','false','saml.client.signature'),('bbe84378-9c83-4064-94ed-24a30f18f6c3','false','saml.encrypt'),('bbe84378-9c83-4064-94ed-24a30f18f6c3','false','saml.force.post.binding'),('bbe84378-9c83-4064-94ed-24a30f18f6c3','false','saml.multivalued.roles'),('bbe84378-9c83-4064-94ed-24a30f18f6c3','false','saml.server.signature'),('bbe84378-9c83-4064-94ed-24a30f18f6c3','false','saml.server.signature.keyinfo.ext'),('bbe84378-9c83-4064-94ed-24a30f18f6c3','false','saml_force_name_id_format');
/*!40000 ALTER TABLE `client_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_default_roles`
--

DROP TABLE IF EXISTS `client_default_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_default_roles` (
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  UNIQUE KEY `UK_8AELWNIBJI49AVXSRTUF6XJOW` (`ROLE_ID`),
  KEY `FK_NUILTS7KLWQW2H8M2B5JOYTKY` (`CLIENT_ID`),
  CONSTRAINT `FK_8AELWNIBJI49AVXSRTUF6XJOW` FOREIGN KEY (`ROLE_ID`) REFERENCES `keycloak_role` (`ID`),
  CONSTRAINT `FK_NUILTS7KLWQW2H8M2B5JOYTKY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_default_roles`
--
-- ORDER BY:  `ROLE_ID`

LOCK TABLES `client_default_roles` WRITE;
/*!40000 ALTER TABLE `client_default_roles` DISABLE KEYS */;
INSERT INTO `client_default_roles` VALUES ('b4575469-6578-45ec-87ee-6d67ab5bf236','299bf21b-5895-4011-88c8-022e5404145a'),('d8df134d-909b-4407-9546-057fa65d7441','7eb82ac0-4908-44a5-8e2c-4ed93afec2e8'),('d8df134d-909b-4407-9546-057fa65d7441','b4d37a8b-674a-4301-9862-ce8c656caee5'),('b4575469-6578-45ec-87ee-6d67ab5bf236','ece49bda-656b-4d7a-bac3-481cc9cec854');
/*!40000 ALTER TABLE `client_default_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_identity_prov_mapping`
--

DROP TABLE IF EXISTS `client_identity_prov_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_identity_prov_mapping` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `RETRIEVE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  UNIQUE KEY `UK_7CAELWNIBJI49AVXSRTUF6XJ12` (`IDENTITY_PROVIDER_ID`,`CLIENT_ID`),
  KEY `FK_56ELWNIBJI49AVXSRTUF6XJ23` (`CLIENT_ID`),
  CONSTRAINT `FK_56ELWNIBJI49AVXSRTUF6XJ23` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`),
  CONSTRAINT `FK_7CELWNIBJI49AVXSRTUF6XJ12` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `identity_provider` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_identity_prov_mapping`
--
-- ORDER BY:  `IDENTITY_PROVIDER_ID`,`CLIENT_ID`

LOCK TABLES `client_identity_prov_mapping` WRITE;
/*!40000 ALTER TABLE `client_identity_prov_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_identity_prov_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_node_registrations`
--

DROP TABLE IF EXISTS `client_node_registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_node_registrations` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_node_registrations`
--
-- ORDER BY:  `CLIENT_ID`,`NAME`

LOCK TABLES `client_node_registrations` WRITE;
/*!40000 ALTER TABLE `client_node_registrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_node_registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_session`
--

DROP TABLE IF EXISTS `client_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_session` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_B4AO2VCVAT6UKAU74WBWTFQO1` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `user_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_session`
--
-- ORDER BY:  `ID`

LOCK TABLES `client_session` WRITE;
/*!40000 ALTER TABLE `client_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_session_auth_status`
--

DROP TABLE IF EXISTS `client_session_auth_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_session_auth_status` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_session_auth_status`
--
-- ORDER BY:  `CLIENT_SESSION`,`AUTHENTICATOR`

LOCK TABLES `client_session_auth_status` WRITE;
/*!40000 ALTER TABLE `client_session_auth_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_session_auth_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_session_note`
--

DROP TABLE IF EXISTS `client_session_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_session_note` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_session_note`
--
-- ORDER BY:  `CLIENT_SESSION`,`NAME`

LOCK TABLES `client_session_note` WRITE;
/*!40000 ALTER TABLE `client_session_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_session_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_session_prot_mapper`
--

DROP TABLE IF EXISTS `client_session_prot_mapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_session_prot_mapper` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_session_prot_mapper`
--
-- ORDER BY:  `CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`

LOCK TABLES `client_session_prot_mapper` WRITE;
/*!40000 ALTER TABLE `client_session_prot_mapper` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_session_prot_mapper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_session_role`
--

DROP TABLE IF EXISTS `client_session_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_session_role` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_session_role`
--
-- ORDER BY:  `CLIENT_SESSION`,`ROLE_ID`

LOCK TABLES `client_session_role` WRITE;
/*!40000 ALTER TABLE `client_session_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_session_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_template`
--

DROP TABLE IF EXISTS `client_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_template` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_TEMPLATE` (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_REALM_CLI_TMPLT` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_template`
--
-- ORDER BY:  `ID`

LOCK TABLES `client_template` WRITE;
/*!40000 ALTER TABLE `client_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_template_attributes`
--

DROP TABLE IF EXISTS `client_template_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_template_attributes` (
  `TEMPLATE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`TEMPLATE_ID`,`NAME`),
  CONSTRAINT `FK_CL_TEMPL_ATTR_TEMPL` FOREIGN KEY (`TEMPLATE_ID`) REFERENCES `client_template` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_template_attributes`
--
-- ORDER BY:  `TEMPLATE_ID`,`NAME`

LOCK TABLES `client_template_attributes` WRITE;
/*!40000 ALTER TABLE `client_template_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_template_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_user_session_note`
--

DROP TABLE IF EXISTS `client_user_session_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client_user_session_note` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `client_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_user_session_note`
--
-- ORDER BY:  `CLIENT_SESSION`,`NAME`

LOCK TABLES `client_user_session_note` WRITE;
/*!40000 ALTER TABLE `client_user_session_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_user_session_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `component`
--

DROP TABLE IF EXISTS `component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `component` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_COMPONENT_REALM` (`REALM_ID`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component`
--
-- ORDER BY:  `ID`

LOCK TABLES `component` WRITE;
/*!40000 ALTER TABLE `component` DISABLE KEYS */;
INSERT INTO `component` VALUES ('06f2972f-6ed8-46d2-b2ed-9a11f50c8137','Consent Required','UCOSPORTS','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','UCOSPORTS','anonymous'),('15290b7a-7710-48d9-8289-35bebb1d3f3f','Allowed Protocol Mapper Types','UCOSPORTS','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','UCOSPORTS','authenticated'),('152d4746-945d-4dbb-b227-0b043ca1cd5d','Allowed Client Templates','UCOSPORTS','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','UCOSPORTS','anonymous'),('1545f1a3-eadd-483f-9adc-da745db2046d','hmac-generated','UCOSPORTS','hmac-generated','org.keycloak.keys.KeyProvider','UCOSPORTS',NULL),('354b17e2-eb95-4929-8cc1-3c0ae53d1232','Full Scope Disabled','UCOSPORTS','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','UCOSPORTS','anonymous'),('4359e174-e1b3-4995-8017-eaa11b06a0ac','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('4ca9247a-7d90-4d1f-8d1b-7daaeabe2ad1','hmac-generated','master','hmac-generated','org.keycloak.keys.KeyProvider','master',NULL),('4ed183db-139c-4450-813e-1a2e7f6b67c0','Allowed Protocol Mapper Types','UCOSPORTS','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','UCOSPORTS','anonymous'),('536594c3-986a-4793-b11d-9bb4e03c69cc','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('91a3ed32-dc41-45eb-8d79-96ccd13f2a3e','Consent Required','master','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('97801aa7-3fcf-4395-a868-2d998cc347f6','rsa-generated','master','rsa-generated','org.keycloak.keys.KeyProvider','master',NULL),('c0b7a285-0b7f-421b-b33a-5e96559dde0c','Allowed Client Templates','UCOSPORTS','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','UCOSPORTS','authenticated'),('c37430a9-47c3-477d-962e-bfa2fdd36212','Allowed Client Templates','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('c7444dbf-17e5-42eb-a9ad-01382d799169','rsa-generated','UCOSPORTS','rsa-generated','org.keycloak.keys.KeyProvider','UCOSPORTS',NULL),('c8b19923-72d4-4040-b28a-a0e1f1e1c32e','Trusted Hosts','master','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('d0af0e30-6035-458b-b525-f5c112574243','Max Clients Limit','UCOSPORTS','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','UCOSPORTS','anonymous'),('da481441-4d71-4c48-8d47-08c065a2e479','Max Clients Limit','master','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('df0e5c57-5bf9-4854-97e9-572f0f768546','Trusted Hosts','UCOSPORTS','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','UCOSPORTS','anonymous'),('e2740a03-6c33-4f02-b391-00a68540ad38','Allowed Client Templates','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('e474a053-d6b2-4581-b6c5-fa714ead50c0','Full Scope Disabled','master','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous');
/*!40000 ALTER TABLE `component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `component_config`
--

DROP TABLE IF EXISTS `component_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `component_config` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_COMPONENT_CONFIG` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `component` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `component_config`
--
-- ORDER BY:  `ID`

LOCK TABLES `component_config` WRITE;
/*!40000 ALTER TABLE `component_config` DISABLE KEYS */;
INSERT INTO `component_config` VALUES ('0071efc2-131b-44b6-a499-5f8f4ba769a2','15290b7a-7710-48d9-8289-35bebb1d3f3f','allowed-protocol-mapper-types','saml-role-list-mapper'),('055d5ebd-1b7c-4184-a4ac-5633006a2544','15290b7a-7710-48d9-8289-35bebb1d3f3f','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('06272ab5-1195-4abb-89c2-fb937f8c22aa','536594c3-986a-4793-b11d-9bb4e03c69cc','consent-required-for-all-mappers','true'),('08fa7a8e-b962-43d4-a8ec-1ca5b07488ca','da481441-4d71-4c48-8d47-08c065a2e479','max-clients','200'),('0c3cf175-7e13-43cf-8449-fc9603d706ca','536594c3-986a-4793-b11d-9bb4e03c69cc','allowed-protocol-mapper-types','oidc-full-name-mapper'),('0cfc3ca8-81d6-46da-b52d-19be53ff8f1d','df0e5c57-5bf9-4854-97e9-572f0f768546','host-sending-registration-request-must-match','true'),('138d7551-0e96-4a3d-bf98-daf7321e5973','c7444dbf-17e5-42eb-a9ad-01382d799169','certificate','MIICoTCCAYkCBgFb2U+7ljANBgkqhkiG9w0BAQsFADAUMRIwEAYDVQQDDAlVQ09TUE9SVFMwHhcNMTcwNTA1MTU1MDMyWhcNMjcwNTA1MTU1MjEyWjAUMRIwEAYDVQQDDAlVQ09TUE9SVFMwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCGv4kG48yT31izsM12WTIhxk0T0b1RRyPHiQAHwpAQyjjT6PHaWduu34LOaCvc62hGfyCnodKqkwkE6G4CEbPje4QN0oYqghdSaaDmyaZoDHiuXoV56pimKaoltFYwfUsRaJGiWBVUbhWVj07gKiALiDEDSsIvv3XkN7AbErdKLpmYicPihm8TeSdbeeUzgKrp7SIlpMGwZPKpp7SsIISD/XxQp9uvS5qkqz0G8j/Bh8EnB6TRrW45l6mjYE71B6ptR9cpWxlBV2+1kCFWIi++V9kIhTy+jk2qdM8ho/UWYhP1RX5W2caQghKIFZwj5QoJjR0HtZ7qWsgRCEDvVAxXAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAGw60xLIW7pS2M4SwWJ0gA4qj+MezVj1dBCMRrssYcC0IW5Mdgb32opYEcczNIO9/uEJWi3LSDofjfdITYGep6XVYrYbZpYYB29R/uk2q5O+VQZTe4cUmfQJ/5x6dVYU2RKag+90AsKIN1eQd39B+X2AHiUNRXLYJjUoZ5t6x43XK+1/W6V7RR1X8bsgv9ED8Pn8jn0J7mSUG7y4P/llnrdwWi+/KT1CKhXBTrj9yNTK2/fi/GeeibqlAciYaAThTIONwuI9NKMd61pDiLrCU1NdYh/SuPWmh7OjNezHJdeckS+R/P1WaJE3g1B3e3l35UsXSezZRDnA2NBWaczaTyY='),('1526a8b2-c3e3-4b60-a577-da9102414c1a','15290b7a-7710-48d9-8289-35bebb1d3f3f','consent-required-for-all-mappers','true'),('19516eaa-15d6-43ec-95e3-7e9d8240f59b','1545f1a3-eadd-483f-9adc-da745db2046d','secret','ASrVO4R6AfkIZ8Lepa4ihiTu_CiU8eF9YRkCcFkSpuY'),('30670458-79d7-4107-817c-80b307cb85d7','536594c3-986a-4793-b11d-9bb4e03c69cc','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('3249128c-b551-44a7-bdd3-9f6703b8671c','d0af0e30-6035-458b-b525-f5c112574243','max-clients','200'),('3626f1c8-0c8f-4221-96bd-5724daa743d4','536594c3-986a-4793-b11d-9bb4e03c69cc','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('36926e9f-c254-42c6-9057-4d79bd2e945f','4359e174-e1b3-4995-8017-eaa11b06a0ac','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('36db5fea-8b7e-4831-acaf-7fab83e43996','4ed183db-139c-4450-813e-1a2e7f6b67c0','allowed-protocol-mapper-types','saml-user-property-mapper'),('3850d308-42fb-48ec-bae3-7dd395b6e964','4ca9247a-7d90-4d1f-8d1b-7daaeabe2ad1','priority','100'),('38d05821-8f71-47fd-b7f1-7b3168fbb913','4359e174-e1b3-4995-8017-eaa11b06a0ac','allowed-protocol-mapper-types','oidc-address-mapper'),('3d35543e-0337-4495-a977-ea017bc2546a','4ed183db-139c-4450-813e-1a2e7f6b67c0','allowed-protocol-mapper-types','saml-role-list-mapper'),('4450fd8e-051e-4660-91cf-58f4bdc35bc6','536594c3-986a-4793-b11d-9bb4e03c69cc','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('4465e863-287e-44c1-b20a-b34fbbe7e995','4359e174-e1b3-4995-8017-eaa11b06a0ac','allowed-protocol-mapper-types','saml-role-list-mapper'),('46aab871-cb9d-43f1-b56b-70b2249cff06','c8b19923-72d4-4040-b28a-a0e1f1e1c32e','host-sending-registration-request-must-match','true'),('476c5096-fed9-4870-801d-04fcfb784c37','4ed183db-139c-4450-813e-1a2e7f6b67c0','consent-required-for-all-mappers','true'),('50398f24-d770-4c1b-906f-86b82aa8f075','4359e174-e1b3-4995-8017-eaa11b06a0ac','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('54f2f4f6-2c43-4437-a235-cad8a9d82761','4ca9247a-7d90-4d1f-8d1b-7daaeabe2ad1','secret','1oQAzkTvK1rMiiS1nItW1_3L_BVjQovBvPAq9L4swnM'),('5cc7a37c-c7ab-4ad6-b709-8ac2174941d9','4359e174-e1b3-4995-8017-eaa11b06a0ac','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('603fc5fb-6c14-4f16-b74d-b2983d77b4c1','4ed183db-139c-4450-813e-1a2e7f6b67c0','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('68dc4dec-352f-4418-80db-d5a811ff2e28','1545f1a3-eadd-483f-9adc-da745db2046d','priority','100'),('70c2c4f1-36dc-4fc1-a66c-372542dcc8c9','97801aa7-3fcf-4395-a868-2d998cc347f6','priority','100'),('71696932-ffec-49f1-9d51-417e7856337c','536594c3-986a-4793-b11d-9bb4e03c69cc','allowed-protocol-mapper-types','oidc-address-mapper'),('73cd1676-e81e-4194-bd18-fc2d68a6384f','4359e174-e1b3-4995-8017-eaa11b06a0ac','allowed-protocol-mapper-types','saml-user-property-mapper'),('773c55cc-7382-4c05-962d-82beb0fa364d','536594c3-986a-4793-b11d-9bb4e03c69cc','allowed-protocol-mapper-types','saml-role-list-mapper'),('7cb571b5-a687-465f-ab8f-b51ceb7ef83f','4ed183db-139c-4450-813e-1a2e7f6b67c0','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('83e6667b-d990-4740-b367-7f7f87c22740','97801aa7-3fcf-4395-a868-2d998cc347f6','certificate','MIICmzCCAYMCBgFb2UHQlzANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMTcwNTA1MTUzNTIwWhcNMjcwNTA1MTUzNzAwWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCmVk+uc4+oRf9z3iHcx3AOK85rFBle86+Hq2ATB4F+/JMjEjfpXluT3phJPx0donFKGzCSoeFAlNYdO+JbgJnNrefYVndtZ50yVYUywT+t2Jf4oHt4iqmwD+25SU/ETANOWOiKjZqtBM8ACKPSAAX+vslp6NhOpHgMLxbLDfMwIqwX6W2JbNCEQePFguCElwoH2wkM7SubLDvkXQYAs5uvm2NF1ek+Kix0iwY7/JVnR4hkVJXEYgAZ8DZM/M0c9r0062baZIEddi51cT5jD3D2d6myfBL5Agss+wViFcNZx34MQ5s/LINORHXNB2AmNmC9C2C4dXTT9kIO5yYUuKHNAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAJTuTEC0afuy8Ttnm76hiW2Q/sVBHLQXeULzMnoMMzPDClkarPh6NaGgbsM1LmO+nJeOl5cvLKiOqrlCSnbnd3g5Gq84m2Ptf1eyjyNDz2Fqzu0nOuMFuAr6no1wwy5SYWxzK4Q5YBWKp2mjpvCjUKPU2h9ICZQPDrTKrTRKiuZY5d/iypb7s83O+Id/3GzM4kvfInbHxA79asiRn7e9n8IQgzg0KuYXODGOneOC+JAvfsd02YP/MaIqYYl8Psou25Jwqdz2vlS2G1CyprBh/FqZrvhUNrdxzGFAryLQ1IqsYCYXObfNtIJgERJKhSQzcbppAPWC3pajPyRfDfHMYGI='),('862030c2-beaf-4eda-8d26-0326c4403055','15290b7a-7710-48d9-8289-35bebb1d3f3f','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('86b263c8-487d-42ef-b048-d584c1321935','97801aa7-3fcf-4395-a868-2d998cc347f6','privateKey','MIIEowIBAAKCAQEAplZPrnOPqEX/c94h3MdwDivOaxQZXvOvh6tgEweBfvyTIxI36V5bk96YST8dHaJxShswkqHhQJTWHTviW4CZza3n2FZ3bWedMlWFMsE/rdiX+KB7eIqpsA/tuUlPxEwDTljoio2arQTPAAij0gAF/r7JaejYTqR4DC8Wyw3zMCKsF+ltiWzQhEHjxYLghJcKB9sJDO0rmyw75F0GALObr5tjRdXpPiosdIsGO/yVZ0eIZFSVxGIAGfA2TPzNHPa9NOtm2mSBHXYudXE+Yw9w9nepsnwS+QILLPsFYhXDWcd+DEObPyyDTkR1zQdgJjZgvQtguHV00/ZCDucmFLihzQIDAQABAoIBAD4gcrZ31ypEqrr+Nqudmg7Q8dIwuaErZ15G9iVlYkqpz9MDlPqHEbFTLJH/DsLoz2OccDH0YIuci7Rzj4IZsFiQIc49zXGBh8crBgsE/uHRykFEv5kwQVzPNj1EUpTAx2NV9dT6OtFwwFgE4hsngxW48MWsAE6vQ19ZnyvMVA6f6UskpDUUpkuNqgkivGkjrSGv1sY8WUpDp/G0CxLH8wrx4yC34TSC3Lasxe0p+1H4BBfDYUSIEbhVolu85p9CuRpfsa+vxEb1+9ofyg+FuUAzrNLsRbBkFHSyQEC//jihrw8OsQVbRakCR6cNSoYHlG1Cld4+J4sF39JQJ4ewpckCgYEA6bKrbPrXtVkLI2kC3rql2LUt9GZHkA4QFYeWamlbqehkN2xhp2dQz0YPwredcC91r62x2viinbGiwVV78zYtFP+AhRj8HnIFLyryxAwVIPMKFECbkLERYCEchi7MoTghLByoEZI/0ySlgR7eRU3TigMvyaLLgOtNpOBTg+qxQgMCgYEAtjX98OSqsuA09PVksciaQoXu0TGVx1LTdkVkGkvSylHiP6FdpaECOPVns0agW9UJcU2o+RY9MitQ6/1YyrbaeGcGEAJGuxPAHeQcQD2A4f364vS91+2aZg4JfeSdgFV7fF5H2V4mKB396S7fUKZ07U6reElZUisTTSxmz34Mq+8CgYBGpcC0/U/gfr6jQcegVYR1crAlxhW0Mswh9g8+tAMF5j8FkjojRVRklKWHE8MAexh0t2mg7LEcQusUzybda29Nfb/4fIkbGxT+IVmqcoygnVharv1YTG8YRGo/Fj6+Lh25HCCizzeEOPvfgNlo0hI1EqmLpy8mFfwu77HPm09iyQKBgAth6BEqV7eA5g3/XmD0xR4uu7J5xH+FHwyeXRh/cBWPc/DBpdX47uib+/RpDw9tiX94eHvG9d+ycQWs9+UB8zfeR7SsT7rUCwZS/6jLrsdvVELlQw7AGwsRCWrB40znCiXExfxAM2YCKaBteynQnDFO3stO2bOWWUhS48FGgIglAoGBAMn0sl+CbmTZJMuUAFdVgDzTM+jBvp6jnQRNGk0cjLE07PmncJG/+ihipl2jW7l+Nw7pL4uJlg2BbWbx/oKSr8tqDi9r+HLaMirJ6Olb4h4ORizUflzw5Ttl69w5B1Skj1TLDKqgHImYTStusi7fTEHFeFWzsHXeMPa7vlQFxW9U'),('941f11e1-2d19-495b-83ea-336fbbdcb97c','c7444dbf-17e5-42eb-a9ad-01382d799169','privateKey','MIIEowIBAAKCAQEAhr+JBuPMk99Ys7DNdlkyIcZNE9G9UUcjx4kAB8KQEMo40+jx2lnbrt+Czmgr3OtoRn8gp6HSqpMJBOhuAhGz43uEDdKGKoIXUmmg5smmaAx4rl6FeeqYpimqJbRWMH1LEWiRolgVVG4VlY9O4CogC4gxA0rCL7915DewGxK3Si6ZmInD4oZvE3knW3nlM4Cq6e0iJaTBsGTyqae0rCCEg/18UKfbr0uapKs9BvI/wYfBJwek0a1uOZepo2BO9QeqbUfXKVsZQVdvtZAhViIvvlfZCIU8vo5NqnTPIaP1FmIT9UV+VtnGkIISiBWcI+UKCY0dB7We6lrIEQhA71QMVwIDAQABAoIBAGlv3Dfg7gZTQKQyV0Mg3kJhWZSFjL7ZjJyojbaEvpf0tGzUnNJ/d4+pY0BBcPkH1us6tIGW9TH1pZwKh3HlCj6ZOqZaMhN3AerBrl6IMUa/Y3sFiSnxsIpsla+1IbAFikTP7wz6IY6UKR2DKnPrYnHDmp550+LqzMPL82fryDIpikKzK9EUh75hB/QPTOQ8B7+y8g5EK5n2LDoRCisZdmuXEVEBQxLHBVyz/lkDZMiQe/BQlWB3g6SBE68GNrt8Iesx5pdnr7mFZO/LTsaI5KXR46W3UgNK2xPtonTE/2XSY+72LpADjSt+jvjeK0/qLAW5FRFBTZWeyyt7L2cFaGECgYEAzqV1jjSO8JxCJTt+gmTKrOja6vtFawnY9LZfka9UXxOZ4wRC5fJIB74dJjbbsSGcsFcBVQM1NsQLMFSJES+2p6nlMvvbX5lcx3FGGWKwJ4Kotr3y5fj/EKeSJh7aJ7QhnVL5cH1v1kZeo0ACcO4MFEBUCjqrVts4Ve75416BT+cCgYEApu4o2XWN5Z4xv/018Y3QYCPpna6peMu/xi1nS9PCW/ACfOhwiow3N2gfjwhZs7D1vcPWGXy5dn6OThX57DJCgHFYlAv16Z/OdHZ39J9QsGIwxYKSvVs6eHfhuYmoW/58VwRpSkwzn6bl5QxQT6hCUt/REavJMfwDTl+MDBf0khECgYBGMEUBjDCQ4UJGSzLpLzr4CA9ziO1HMg0S8W78mMTblljKlwPx/p0gpB5agH+WZohGDQdSzMgiVexG+i+kOsSbpkVHT+xvSDQPOhZJQQ/8G5EaoOID4tMf4QrvD8OhgLl6Kli3MKPv7+7tHCy4FuLbbg4de1f/JG66IXWXGN5rOQKBgE5h5BKADVn1Vxz0U8ERuvd5xXeCDReobGss5KUJUOkEoNZv+nBD+KVuoerym9QxUqKBc2XSV++Y608lKI5M50cScepKV3UU0ceD3T2jFStNX+NONYLudF0exYHubnyL2WyuqJX3hAICR06u4oMU2de6OpxWkomC8TZ6zPLcyL1RAoGBAKl0d871ncPlN/2P510Rs9UvLN5dAqJCkcLPZ0+uU4IOjHj1pf6QBuIwBOCIXYjUMytmPsvwCMt1ebUwxlba/zF5wK9vMwa8AJzN+i6Pil49HWPJaYCU3ADH/zXVYvSszqpjZrh7OK+/e+ym5jE9YCHLpCITnzRhDR32pmEmvPav'),('9475a350-7848-4439-af6d-05fca9a91466','4ed183db-139c-4450-813e-1a2e7f6b67c0','allowed-protocol-mapper-types','oidc-address-mapper'),('9760df94-578f-46eb-bf7a-a4e1238e5c9c','15290b7a-7710-48d9-8289-35bebb1d3f3f','allowed-protocol-mapper-types','saml-user-property-mapper'),('9a78b726-38c6-4abf-9b9d-d3c3bdc13a78','c7444dbf-17e5-42eb-a9ad-01382d799169','priority','100'),('a1051065-6764-4e55-bdc3-ce48db802bbe','c8b19923-72d4-4040-b28a-a0e1f1e1c32e','client-uris-must-match','true'),('aa01859a-f864-4664-8c33-b5487ab4544e','4359e174-e1b3-4995-8017-eaa11b06a0ac','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('ac7a3f94-a41f-463d-81d6-69402741c5d0','15290b7a-7710-48d9-8289-35bebb1d3f3f','allowed-protocol-mapper-types','oidc-address-mapper'),('c2e6c6b9-0ac9-4ce0-ba83-4434768c0807','536594c3-986a-4793-b11d-9bb4e03c69cc','allowed-protocol-mapper-types','saml-user-property-mapper'),('c50557f0-50ab-4558-b3ba-d5ae0c63f702','15290b7a-7710-48d9-8289-35bebb1d3f3f','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('cfd851ed-8b5c-448f-aedb-9dac0ace5098','536594c3-986a-4793-b11d-9bb4e03c69cc','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('d1b5cbf2-3bad-45f6-8a89-884b5e80b005','4359e174-e1b3-4995-8017-eaa11b06a0ac','consent-required-for-all-mappers','true'),('d3f3b24e-3a9a-45d3-8a7e-998b538c04e1','4ca9247a-7d90-4d1f-8d1b-7daaeabe2ad1','kid','d33b89b7-c1cb-4e17-9e57-c6faf97dbe8b'),('d49339bd-42e0-49d4-8f69-9bbf93cd92d4','4359e174-e1b3-4995-8017-eaa11b06a0ac','allowed-protocol-mapper-types','oidc-full-name-mapper'),('d724f6af-ad85-4c24-af65-e502319af6bb','1545f1a3-eadd-483f-9adc-da745db2046d','kid','895f5579-b3cf-4344-a4e9-0a8dffa3014f'),('df5b605a-072d-49cb-a535-9fbc1e57eb4e','df0e5c57-5bf9-4854-97e9-572f0f768546','client-uris-must-match','true'),('e631a02b-e3ce-49ae-898a-501d0632535c','4ed183db-139c-4450-813e-1a2e7f6b67c0','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('e9286e7b-6e52-4c55-a3c3-67e8c688518a','4ed183db-139c-4450-813e-1a2e7f6b67c0','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('e960d7a9-3ebc-44cb-93c9-6aee2c049968','15290b7a-7710-48d9-8289-35bebb1d3f3f','allowed-protocol-mapper-types','oidc-full-name-mapper'),('f300dfb1-fb83-4d07-909d-450cb8dc73c0','4ed183db-139c-4450-813e-1a2e7f6b67c0','allowed-protocol-mapper-types','oidc-full-name-mapper'),('f923f536-4914-4c7d-8a61-800f93045105','15290b7a-7710-48d9-8289-35bebb1d3f3f','allowed-protocol-mapper-types','saml-user-attribute-mapper');
/*!40000 ALTER TABLE `component_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `composite_role`
--

DROP TABLE IF EXISTS `composite_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `composite_role` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  KEY `FK_A63WVEKFTU8JO1PNJ81E7MCE2` (`COMPOSITE`),
  KEY `FK_GR7THLLB9LU8Q4VQA4524JJY8` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `keycloak_role` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `keycloak_role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composite_role`
--

LOCK TABLES `composite_role` WRITE;
/*!40000 ALTER TABLE `composite_role` DISABLE KEYS */;
INSERT INTO `composite_role` VALUES ('0b04ccd0-1a8d-4c1a-8392-0891905165ea','87847922-a461-454e-ad78-86c2b1b51e50'),('0b04ccd0-1a8d-4c1a-8392-0891905165ea','4aa59a5d-722e-4e5e-bd9d-c89a687407fa'),('0b04ccd0-1a8d-4c1a-8392-0891905165ea','359d6e5c-23e9-41a0-9d18-afe43ed81a34'),('0b04ccd0-1a8d-4c1a-8392-0891905165ea','b86b5df3-38a7-41ba-afa3-9333756ba41d'),('0b04ccd0-1a8d-4c1a-8392-0891905165ea','46a0c228-5dcd-4310-9d56-bfd226f6bbd4'),('0b04ccd0-1a8d-4c1a-8392-0891905165ea','d8ce733a-8bc2-4fba-8446-9037ec5f8bc5'),('0b04ccd0-1a8d-4c1a-8392-0891905165ea','f06e145d-68ac-4458-b98f-a891b6e8d269'),('0b04ccd0-1a8d-4c1a-8392-0891905165ea','54aacb1a-2def-43e4-99c5-4daf369496fb'),('0b04ccd0-1a8d-4c1a-8392-0891905165ea','bc5aa8eb-3b51-4a60-a281-ad656019b45a'),('0b04ccd0-1a8d-4c1a-8392-0891905165ea','c1e61dfe-97a0-4dde-808f-7dbe41f5ea54'),('0b04ccd0-1a8d-4c1a-8392-0891905165ea','a7cfa7fb-97f5-45ea-af34-3c26299543af'),('0b04ccd0-1a8d-4c1a-8392-0891905165ea','bb96eb54-dec3-4b8e-82f8-60ff35a8cbdd'),('0b04ccd0-1a8d-4c1a-8392-0891905165ea','1f2c7582-3d82-42ec-9ce0-b07a4b2b0de9'),('0b04ccd0-1a8d-4c1a-8392-0891905165ea','6b932d8f-5d81-4593-9714-66d478e9173a'),('0b04ccd0-1a8d-4c1a-8392-0891905165ea','b7e7f647-2400-49bf-a5d1-c383620a8101'),('0b04ccd0-1a8d-4c1a-8392-0891905165ea','75af9709-b58b-434e-904f-52e47264e790'),('0b04ccd0-1a8d-4c1a-8392-0891905165ea','d11e26fe-f45e-4dc8-9f8f-5ce3bf096e18'),('0b04ccd0-1a8d-4c1a-8392-0891905165ea','ba159b32-bde0-44f7-a22d-fe3bcf0ac43c'),('0b04ccd0-1a8d-4c1a-8392-0891905165ea','d043f73d-e3ee-47ec-80af-63ee1c059933'),('0b04ccd0-1a8d-4c1a-8392-0891905165ea','603df2a6-f573-4175-93dd-186410ebbb3b'),('0b04ccd0-1a8d-4c1a-8392-0891905165ea','4c1d85fc-f7c9-4de8-bb9b-6316db8c7ee2'),('0b04ccd0-1a8d-4c1a-8392-0891905165ea','5e42e702-2194-41c7-8463-f202aa81c2de'),('0b04ccd0-1a8d-4c1a-8392-0891905165ea','63874f29-21e6-465d-bb6f-40bcb18d1701'),('0b04ccd0-1a8d-4c1a-8392-0891905165ea','a0c270ab-d30e-4748-8c5e-4a13d582eb21'),('0b04ccd0-1a8d-4c1a-8392-0891905165ea','99d3d2c5-b61a-4af6-9e1b-11c2bf19fd47'),('0b04ccd0-1a8d-4c1a-8392-0891905165ea','41e0434f-4e07-456e-ad51-950ffc8512e1'),('0b04ccd0-1a8d-4c1a-8392-0891905165ea','2dccb39a-65ee-405d-a229-02106f7af9c2'),('0b04ccd0-1a8d-4c1a-8392-0891905165ea','e22256c3-0a5c-4e7a-9dbb-4ae8af8af7da'),('0b04ccd0-1a8d-4c1a-8392-0891905165ea','98f3c463-6ad2-4e3f-954e-19ab27dc99dc'),('fed17a81-3027-4a00-bbc7-1aef177b7401','d1532b66-e866-4834-9f8f-55d8af5008f7'),('fed17a81-3027-4a00-bbc7-1aef177b7401','66d4f42e-5809-4207-b551-003566202d25'),('fed17a81-3027-4a00-bbc7-1aef177b7401','e9ed9050-f8a2-4903-a582-5ab5ca912032'),('fed17a81-3027-4a00-bbc7-1aef177b7401','79a7fcff-3993-4397-bff0-0edbc08c8239'),('fed17a81-3027-4a00-bbc7-1aef177b7401','b168b493-8a6d-40d3-952c-d93f69a3040b'),('fed17a81-3027-4a00-bbc7-1aef177b7401','cc113fe6-52b6-4bf6-af26-dbaf4123ab6a'),('fed17a81-3027-4a00-bbc7-1aef177b7401','8f4c2e1f-ddc5-4b52-999e-3a104824d244'),('fed17a81-3027-4a00-bbc7-1aef177b7401','ebf4e59b-3a26-4630-aecc-769503ec0135'),('fed17a81-3027-4a00-bbc7-1aef177b7401','8e8e78db-8e51-4819-b960-a54578a4e82e'),('fed17a81-3027-4a00-bbc7-1aef177b7401','f29d87e8-edb8-46f7-8013-669b02b67627'),('fed17a81-3027-4a00-bbc7-1aef177b7401','12f6de88-cfba-4f9f-aed3-0df49fb417e2'),('fed17a81-3027-4a00-bbc7-1aef177b7401','2d2c3e32-841c-4310-8fd4-0b055f4c6d24'),('fed17a81-3027-4a00-bbc7-1aef177b7401','be454b31-2a53-40b5-88af-100c86ebe669'),('fed17a81-3027-4a00-bbc7-1aef177b7401','15508a31-71f6-4caa-9217-f5ab478d2dcd');
/*!40000 ALTER TABLE `composite_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credential`
--

DROP TABLE IF EXISTS `credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credential` (
  `ID` varchar(36) NOT NULL,
  `DEVICE` varchar(255) DEFAULT NULL,
  `HASH_ITERATIONS` int(11) DEFAULT NULL,
  `SALT` blob,
  `TYPE` varchar(255) DEFAULT NULL,
  `VALUE` varchar(4000) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `COUNTER` int(11) DEFAULT '0',
  `DIGITS` int(11) DEFAULT '6',
  `PERIOD` int(11) DEFAULT '30',
  `ALGORITHM` varchar(36),
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credential`
--
-- ORDER BY:  `ID`

LOCK TABLES `credential` WRITE;
/*!40000 ALTER TABLE `credential` DISABLE KEYS */;
INSERT INTO `credential` VALUES ('931701f0-9925-4069-b903-2c0ae525d325',NULL,20000,'%NvÄA9⁄í~0\‡r∞Z©ˆ','password','jef/1o3jadBeEYq37OikOEFl/aptGJc1/M0J1PWd4xeZdMxxREchHhjSoEmEVzFHge0pxEnC8En+iiP/28DY+g==','dc756918-6211-4b6b-b04a-811fd4f7dace',1493999623728,0,0,0,'pbkdf2'),('c22db5a5-401b-4714-8602-25eb2141faba',NULL,20000,'Å\‰\ƒA∂Áö®∂U‹¨ûFq±','password','d/F9QawMjs9qcyh5F0fyTI1N0/bIKBPiLQliOMrKfigvFSYI7gUm7FlLHpniNg84bG0zIVQX2RQGqpmUULkF6A==','6333f35b-a719-4400-98b6-b0cf0c251733',1493998665119,0,0,0,'pbkdf2'),('c73f4500-e699-48a5-b0e7-939425de48b4',NULL,20000,'ˆb\ ›üå∂pí\Î1j\Â','password','3AsNXqcfI9thQtA+c3snk84eoOHZy6KFsrbOY9zb8/D4m0NkAaUF3prsufY4L7SwUf1K1WMn5fRKOV4j0GAmlg==','9cf54475-a357-42ed-ba3f-785d10ad276a',1493999979445,0,0,0,'pbkdf2');
/*!40000 ALTER TABLE `credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credential_attribute`
--

DROP TABLE IF EXISTS `credential_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `credential_attribute` (
  `ID` varchar(36) NOT NULL,
  `CREDENTIAL_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) DEFAULT NULL,
  KEY `FK_CRED_ATTR` (`CREDENTIAL_ID`),
  CONSTRAINT `FK_CRED_ATTR` FOREIGN KEY (`CREDENTIAL_ID`) REFERENCES `credential` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credential_attribute`
--

LOCK TABLES `credential_attribute` WRITE;
/*!40000 ALTER TABLE `credential_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `credential_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `databasechangelog`
--

DROP TABLE IF EXISTS `databasechangelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `databasechangelog` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `databasechangelog`
--

LOCK TABLES `databasechangelog` WRITE;
/*!40000 ALTER TABLE `databasechangelog` DISABLE KEYS */;
INSERT INTO `databasechangelog` VALUES ('1.0.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2017-05-05 10:36:10',1,'EXECUTED','7:00a57f7a6fb456639b34e62972e0ec02','createTable (x29), addPrimaryKey (x21), addUniqueConstraint (x9), addForeignKeyConstraint (x32)','',NULL,'3.4.1',NULL,NULL),('1.0.0.Final','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2017-05-05 10:36:10',2,'MARK_RAN','7:f061c3934594ee60a9b2343f5100ae4e','createTable (x29), addPrimaryKey (x21), addUniqueConstraint (x6), addForeignKeyConstraint (x30)','',NULL,'3.4.1',NULL,NULL),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2017-05-05 10:36:11',3,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete (x3), createTable (x3), addColumn (x5), addPrimaryKey (x3), addForeignKeyConstraint (x3), customChange','',NULL,'3.4.1',NULL,NULL),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2017-05-05 10:36:11',4,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn','',NULL,'3.4.1',NULL,NULL),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2017-05-05 10:36:15',5,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete (x4), createTable (x8), addColumn (x2), addPrimaryKey (x6), addForeignKeyConstraint (x9), addUniqueConstraint (x2), addColumn, dropForeignKeyConstraint (x2), dropUniqueConstraint, renameColumn (x3), addUniqueConstraint, addForeignKeyConstra...','',NULL,'3.4.1',NULL,NULL),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2017-05-05 10:36:15',6,'MARK_RAN','7:2e01012df20974c1c2a605ef8afe25b7','delete (x4), createTable (x8), addColumn (x2), addPrimaryKey (x6), addForeignKeyConstraint (x9), addUniqueConstraint (x2), addColumn, dropForeignKeyConstraint (x2), dropUniqueConstraint, renameColumn (x3), customChange, dropForeignKeyConstraint, d...','',NULL,'3.4.1',NULL,NULL),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2017-05-05 10:36:23',7,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete (x5), createTable (x3), addColumn, createTable (x4), addPrimaryKey (x7), addForeignKeyConstraint (x6), renameColumn, addColumn (x2), update, dropColumn, dropForeignKeyConstraint, renameColumn, addForeignKeyConstraint, dropForeignKeyConstrai...','',NULL,'3.4.1',NULL,NULL),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2017-05-05 10:36:23',8,'MARK_RAN','7:a77ea2ad226b345e7d689d366f185c8c','delete (x5), createTable (x3), addColumn, createTable (x4), addPrimaryKey (x7), addForeignKeyConstraint (x6), renameColumn, addUniqueConstraint, addColumn (x2), update, dropColumn, dropForeignKeyConstraint, renameColumn, addForeignKeyConstraint, r...','',NULL,'3.4.1',NULL,NULL),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2017-05-05 10:36:23',9,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update (x3)','',NULL,'3.4.1',NULL,NULL),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2017-05-05 10:36:30',10,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete (x6), createTable (x7), addColumn, createTable, addColumn (x2), update, dropDefaultValue, dropColumn, addColumn, update (x4), addPrimaryKey (x4), dropPrimaryKey, dropColumn, addPrimaryKey (x4), addForeignKeyConstraint (x8), dropDefaultValue...','',NULL,'3.4.1',NULL,NULL),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2017-05-05 10:36:33',11,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete (x7), addColumn (x5), dropColumn, renameTable (x2), update (x10), createTable (x3), customChange, dropPrimaryKey, addPrimaryKey (x4), addForeignKeyConstraint (x2), dropColumn, addColumn','',NULL,'3.4.1',NULL,NULL),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2017-05-05 10:36:33',12,'MARK_RAN','7:d909180b2530479a716d3f9c9eaea3d7','delete (x7), addColumn (x5), dropColumn, renameTable, dropForeignKeyConstraint, renameTable, addForeignKeyConstraint, update (x10), createTable (x3), customChange, dropPrimaryKey, addPrimaryKey (x4), addForeignKeyConstraint (x2), dropColumn, addCo...','',NULL,'3.4.1',NULL,NULL),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2017-05-05 10:36:33',13,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete (x7), dropDefaultValue, dropColumn, addColumn (x3)','',NULL,'3.4.1',NULL,NULL),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2017-05-05 10:36:34',14,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn (x3), createTable (x2), addPrimaryKey (x2)','',NULL,'3.4.1',NULL,NULL),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2017-05-05 10:36:34',15,'MARK_RAN','7:980ba23cc0ec39cab731ce903dd01291','delete (x2)','',NULL,'3.4.1',NULL,NULL),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2017-05-05 10:36:34',16,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey (x2), addColumn, update, dropColumn, addColumn, update, dropColumn, addPrimaryKey (x2)','',NULL,'3.4.1',NULL,NULL),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2017-05-05 10:36:34',17,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','Empty','',NULL,'3.4.1',NULL,NULL),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2017-05-05 10:36:37',18,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable (x5), addColumn (x2), dropDefaultValue, dropColumn, addPrimaryKey, addForeignKeyConstraint, addPrimaryKey, addForeignKeyConstraint, addPrimaryKey, addForeignKeyConstraint, addPrimaryKey, addForeignKeyConstraint (x2), addUniqueConstrain...','',NULL,'3.4.1',NULL,NULL),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2017-05-05 10:36:39',19,'EXECUTED','7:c31d1646dfa2618a9335c00e07f89f24','addColumn, createTable (x3), dropNotNullConstraint, addColumn (x2), createTable, addPrimaryKey, addUniqueConstraint, addForeignKeyConstraint (x5), addPrimaryKey, addForeignKeyConstraint (x2), addPrimaryKey, addForeignKeyConstraint, update','',NULL,'3.4.1',NULL,NULL),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2017-05-05 10:36:39',20,'EXECUTED','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue, update','',NULL,'3.4.1',NULL,NULL),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2017-05-05 10:36:39',21,'MARK_RAN','7:f987971fe6b37d963bc95fee2b27f8df','addColumn, createTable (x3), dropNotNullConstraint, addColumn (x2), createTable, addPrimaryKey, addUniqueConstraint, addForeignKeyConstraint (x5), addPrimaryKey, addForeignKeyConstraint (x2), addPrimaryKey, addForeignKeyConstraint, update','',NULL,'3.4.1',NULL,NULL),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2017-05-05 10:36:39',22,'MARK_RAN','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue, update','',NULL,'3.4.1',NULL,NULL),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2017-05-05 10:36:40',23,'EXECUTED','7:ed2dc7f799d19ac452cbcda56c929e47','update (x9), customChange, dropForeignKeyConstraint (x2), dropUniqueConstraint, dropTable, dropForeignKeyConstraint (x2), dropTable, dropForeignKeyConstraint (x2), dropUniqueConstraint, dropTable, createIndex','',NULL,'3.4.1',NULL,NULL),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2017-05-05 10:36:40',24,'EXECUTED','7:80b5db88a5dda36ece5f235be8757615','modifyDataType (x3)','',NULL,'3.4.1',NULL,NULL),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2017-05-05 10:36:40',25,'MARK_RAN','7:1437310ed1305a9b93f8848f301726ce','modifyDataType (x2)','',NULL,'3.4.1',NULL,NULL),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2017-05-05 10:36:41',26,'EXECUTED','7:b82ffb34850fa0836be16deefc6a87c4','createIndex (x11)','',NULL,'3.4.1',NULL,NULL),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2017-05-05 10:36:45',27,'EXECUTED','7:9cc98082921330d8d9266decdd4bd658','createTable, addPrimaryKey, addUniqueConstraint, createTable, addPrimaryKey, addForeignKeyConstraint, addUniqueConstraint, createTable, addPrimaryKey, addForeignKeyConstraint, addUniqueConstraint, createTable, addPrimaryKey, addForeignKeyConstrain...','',NULL,'3.4.1',NULL,NULL),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2017-05-05 10:36:45',28,'EXECUTED','7:03d64aeed9cb52b969bd30a7ac0db57e','update','',NULL,'3.4.1',NULL,NULL),('2.1.0','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2017-05-05 10:36:47',29,'EXECUTED','7:e01599a82bf8d6dc22a9da506e22e868','createTable (x11), addPrimaryKey (x11), addForeignKeyConstraint (x2)','',NULL,'3.4.1',NULL,NULL),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2017-05-05 10:36:48',30,'EXECUTED','7:53188c3eb1107546e6f765835705b6c1','addColumn, createTable (x2), modifyDataType, addForeignKeyConstraint (x2)','',NULL,'3.4.1',NULL,NULL),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2017-05-05 10:36:49',31,'EXECUTED','7:d6e6f3bc57a0c5586737d1351725d4d4','createTable, addPrimaryKey, dropDefaultValue, dropColumn, addColumn (x2), customChange, dropColumn (x4), addColumn','',NULL,'3.4.1',NULL,NULL),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2017-05-05 10:36:49',32,'EXECUTED','7:454d604fbd755d9df3fd9c6329043aa5','customChange','',NULL,'3.4.1',NULL,NULL),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2017-05-05 10:36:50',33,'EXECUTED','7:57e98a3077e29caf562f7dbf80c72600','customChange, modifyDataType','',NULL,'3.4.1',NULL,NULL),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2017-05-05 10:36:50',34,'MARK_RAN','7:e4c7e8f2256210aee71ddc42f538b57a','modifyDataType (x13), addColumn, sql, dropColumn, renameColumn, modifyDataType (x2)','',NULL,'3.4.1',NULL,NULL),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2017-05-05 10:36:53',35,'EXECUTED','7:09a43c97e49bc626460480aa1379b522','modifyDataType (x5), dropUniqueConstraint, modifyDataType (x3), addUniqueConstraint, dropPrimaryKey, modifyDataType, addNotNullConstraint, addPrimaryKey, modifyDataType (x5), dropUniqueConstraint, modifyDataType, addUniqueConstraint, modifyDataType','',NULL,'3.4.1',NULL,NULL),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2017-05-05 10:36:54',36,'EXECUTED','7:26bfc7c74fefa9126f2ce702fb775553','addColumn','',NULL,'3.4.1',NULL,NULL),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2017-05-05 10:36:54',37,'EXECUTED','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint','',NULL,'3.4.1',NULL,NULL),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2017-05-05 10:36:54',38,'EXECUTED','7:37fc1781855ac5388c494f1442b3f717','addColumn','',NULL,'3.4.1',NULL,NULL);
/*!40000 ALTER TABLE `databasechangelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `databasechangeloglock`
--

DROP TABLE IF EXISTS `databasechangeloglock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `databasechangeloglock` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `databasechangeloglock`
--
-- ORDER BY:  `ID`

LOCK TABLES `databasechangeloglock` WRITE;
/*!40000 ALTER TABLE `databasechangeloglock` DISABLE KEYS */;
INSERT INTO `databasechangeloglock` VALUES (1,'\0',NULL,NULL);
/*!40000 ALTER TABLE `databasechangeloglock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_entity`
--

DROP TABLE IF EXISTS `event_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_entity` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` varchar(2550) DEFAULT NULL,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint(20) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_entity`
--
-- ORDER BY:  `ID`

LOCK TABLES `event_entity` WRITE;
/*!40000 ALTER TABLE `event_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fed_credential_attribute`
--

DROP TABLE IF EXISTS `fed_credential_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fed_credential_attribute` (
  `ID` varchar(36) NOT NULL,
  `CREDENTIAL_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) DEFAULT NULL,
  KEY `FK_FED_CRED_ATTR` (`CREDENTIAL_ID`),
  CONSTRAINT `FK_FED_CRED_ATTR` FOREIGN KEY (`CREDENTIAL_ID`) REFERENCES `fed_user_credential` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fed_credential_attribute`
--

LOCK TABLES `fed_credential_attribute` WRITE;
/*!40000 ALTER TABLE `fed_credential_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `fed_credential_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fed_user_attribute`
--

DROP TABLE IF EXISTS `fed_user_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fed_user_attribute` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` varchar(2024) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fed_user_attribute`
--
-- ORDER BY:  `ID`

LOCK TABLES `fed_user_attribute` WRITE;
/*!40000 ALTER TABLE `fed_user_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `fed_user_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fed_user_consent`
--

DROP TABLE IF EXISTS `fed_user_consent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fed_user_consent` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fed_user_consent`
--
-- ORDER BY:  `ID`

LOCK TABLES `fed_user_consent` WRITE;
/*!40000 ALTER TABLE `fed_user_consent` DISABLE KEYS */;
/*!40000 ALTER TABLE `fed_user_consent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fed_user_consent_prot_mapper`
--

DROP TABLE IF EXISTS `fed_user_consent_prot_mapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fed_user_consent_prot_mapper` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`PROTOCOL_MAPPER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fed_user_consent_prot_mapper`
--
-- ORDER BY:  `USER_CONSENT_ID`,`PROTOCOL_MAPPER_ID`

LOCK TABLES `fed_user_consent_prot_mapper` WRITE;
/*!40000 ALTER TABLE `fed_user_consent_prot_mapper` DISABLE KEYS */;
/*!40000 ALTER TABLE `fed_user_consent_prot_mapper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fed_user_consent_role`
--

DROP TABLE IF EXISTS `fed_user_consent_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fed_user_consent_role` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fed_user_consent_role`
--
-- ORDER BY:  `USER_CONSENT_ID`,`ROLE_ID`

LOCK TABLES `fed_user_consent_role` WRITE;
/*!40000 ALTER TABLE `fed_user_consent_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `fed_user_consent_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fed_user_credential`
--

DROP TABLE IF EXISTS `fed_user_credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fed_user_credential` (
  `ID` varchar(36) NOT NULL,
  `DEVICE` varchar(255) DEFAULT NULL,
  `HASH_ITERATIONS` int(11) DEFAULT NULL,
  `SALT` blob,
  `TYPE` varchar(255) DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `COUNTER` int(11) DEFAULT '0',
  `DIGITS` int(11) DEFAULT '6',
  `PERIOD` int(11) DEFAULT '30',
  `ALGORITHM` varchar(36) DEFAULT 'HmacSHA1',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fed_user_credential`
--
-- ORDER BY:  `ID`

LOCK TABLES `fed_user_credential` WRITE;
/*!40000 ALTER TABLE `fed_user_credential` DISABLE KEYS */;
/*!40000 ALTER TABLE `fed_user_credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fed_user_group_membership`
--

DROP TABLE IF EXISTS `fed_user_group_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fed_user_group_membership` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fed_user_group_membership`
--
-- ORDER BY:  `GROUP_ID`,`USER_ID`

LOCK TABLES `fed_user_group_membership` WRITE;
/*!40000 ALTER TABLE `fed_user_group_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `fed_user_group_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fed_user_required_action`
--

DROP TABLE IF EXISTS `fed_user_required_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fed_user_required_action` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fed_user_required_action`
--
-- ORDER BY:  `REQUIRED_ACTION`,`USER_ID`

LOCK TABLES `fed_user_required_action` WRITE;
/*!40000 ALTER TABLE `fed_user_required_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `fed_user_required_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fed_user_role_mapping`
--

DROP TABLE IF EXISTS `fed_user_role_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fed_user_role_mapping` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fed_user_role_mapping`
--
-- ORDER BY:  `ROLE_ID`,`USER_ID`

LOCK TABLES `fed_user_role_mapping` WRITE;
/*!40000 ALTER TABLE `fed_user_role_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `fed_user_role_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `federated_identity`
--

DROP TABLE IF EXISTS `federated_identity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `federated_identity` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `federated_identity`
--
-- ORDER BY:  `IDENTITY_PROVIDER`,`USER_ID`

LOCK TABLES `federated_identity` WRITE;
/*!40000 ALTER TABLE `federated_identity` DISABLE KEYS */;
/*!40000 ALTER TABLE `federated_identity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `federated_user`
--

DROP TABLE IF EXISTS `federated_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `federated_user` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `federated_user`
--
-- ORDER BY:  `ID`

LOCK TABLES `federated_user` WRITE;
/*!40000 ALTER TABLE `federated_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `federated_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_attribute`
--

DROP TABLE IF EXISTS `group_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_attribute` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_GROUP_ATTRIBUTE_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `keycloak_group` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_attribute`
--
-- ORDER BY:  `ID`

LOCK TABLES `group_attribute` WRITE;
/*!40000 ALTER TABLE `group_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_role_mapping`
--

DROP TABLE IF EXISTS `group_role_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_role_mapping` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `FK_GROUP_ROLE_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `keycloak_group` (`ID`),
  CONSTRAINT `FK_GROUP_ROLE_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `keycloak_role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_role_mapping`
--
-- ORDER BY:  `ROLE_ID`,`GROUP_ID`

LOCK TABLES `group_role_mapping` WRITE;
/*!40000 ALTER TABLE `group_role_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_role_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identity_provider`
--

DROP TABLE IF EXISTS `identity_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `identity_provider` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `FK2B4EBC52AE5C3B34` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identity_provider`
--
-- ORDER BY:  `INTERNAL_ID`

LOCK TABLES `identity_provider` WRITE;
/*!40000 ALTER TABLE `identity_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `identity_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identity_provider_config`
--

DROP TABLE IF EXISTS `identity_provider_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `identity_provider_config` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `identity_provider` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identity_provider_config`
--
-- ORDER BY:  `IDENTITY_PROVIDER_ID`,`NAME`

LOCK TABLES `identity_provider_config` WRITE;
/*!40000 ALTER TABLE `identity_provider_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `identity_provider_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identity_provider_mapper`
--

DROP TABLE IF EXISTS `identity_provider_mapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `identity_provider_mapper` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_IDPM_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identity_provider_mapper`
--
-- ORDER BY:  `ID`

LOCK TABLES `identity_provider_mapper` WRITE;
/*!40000 ALTER TABLE `identity_provider_mapper` DISABLE KEYS */;
/*!40000 ALTER TABLE `identity_provider_mapper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idp_mapper_config`
--

DROP TABLE IF EXISTS `idp_mapper_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idp_mapper_config` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `identity_provider_mapper` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idp_mapper_config`
--
-- ORDER BY:  `IDP_MAPPER_ID`,`NAME`

LOCK TABLES `idp_mapper_config` WRITE;
/*!40000 ALTER TABLE `idp_mapper_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `idp_mapper_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keycloak_group`
--

DROP TABLE IF EXISTS `keycloak_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keycloak_group` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `PARENT_GROUP` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`),
  CONSTRAINT `FK_GROUP_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keycloak_group`
--
-- ORDER BY:  `ID`

LOCK TABLES `keycloak_group` WRITE;
/*!40000 ALTER TABLE `keycloak_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `keycloak_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keycloak_role`
--

DROP TABLE IF EXISTS `keycloak_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keycloak_role` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(36) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  `SCOPE_PARAM_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` (`REALM`),
  KEY `FK_KJHO5LE2C0RAL09FL8CM9WFW9` (`CLIENT`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `realm` (`ID`),
  CONSTRAINT `FK_KJHO5LE2C0RAL09FL8CM9WFW9` FOREIGN KEY (`CLIENT`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keycloak_role`
--
-- ORDER BY:  `ID`

LOCK TABLES `keycloak_role` WRITE;
/*!40000 ALTER TABLE `keycloak_role` DISABLE KEYS */;
INSERT INTO `keycloak_role` VALUES ('0b04ccd0-1a8d-4c1a-8392-0891905165ea','master','\0','${role_admin}','admin','master',NULL,'master','\0'),('12f6de88-cfba-4f9f-aed3-0df49fb417e2','c5889f5f-afec-4db9-b7ab-e340d97e6c53','','${role_manage-events}','manage-events','UCOSPORTS','c5889f5f-afec-4db9-b7ab-e340d97e6c53',NULL,'\0'),('15508a31-71f6-4caa-9217-f5ab478d2dcd','c5889f5f-afec-4db9-b7ab-e340d97e6c53','','${role_impersonation}','impersonation','UCOSPORTS','c5889f5f-afec-4db9-b7ab-e340d97e6c53',NULL,'\0'),('1f2c7582-3d82-42ec-9ce0-b07a4b2b0de9','efcba2f7-f725-4f7c-acc7-2766f7163b10','','${role_manage-identity-providers}','manage-identity-providers','master','efcba2f7-f725-4f7c-acc7-2766f7163b10',NULL,'\0'),('246ef868-a52f-40ba-99df-a11635896a67','UCOSPORTS','\0','${role_offline-access}','offline_access','UCOSPORTS',NULL,'UCOSPORTS',''),('2507a1e8-33fe-4b6e-afb2-d4be4e11c5a9','bbe84378-9c83-4064-94ed-24a30f18f6c3','',NULL,'admin','UCOSPORTS','bbe84378-9c83-4064-94ed-24a30f18f6c3',NULL,'\0'),('27dbd605-0fa5-4be5-9fa3-f173cb8951bc','master','\0','${role_uma_authorization}','uma_authorization','master',NULL,'master','\0'),('299bf21b-5895-4011-88c8-022e5404145a','b4575469-6578-45ec-87ee-6d67ab5bf236','','${role_manage-account}','manage-account','master','b4575469-6578-45ec-87ee-6d67ab5bf236',NULL,'\0'),('2d2c3e32-841c-4310-8fd4-0b055f4c6d24','c5889f5f-afec-4db9-b7ab-e340d97e6c53','','${role_manage-identity-providers}','manage-identity-providers','UCOSPORTS','c5889f5f-afec-4db9-b7ab-e340d97e6c53',NULL,'\0'),('2dccb39a-65ee-405d-a229-02106f7af9c2','b53fdbc2-3bc2-403f-a3e8-fb6af868086e','','${role_manage-identity-providers}','manage-identity-providers','master','b53fdbc2-3bc2-403f-a3e8-fb6af868086e',NULL,'\0'),('359d6e5c-23e9-41a0-9d18-afe43ed81a34','efcba2f7-f725-4f7c-acc7-2766f7163b10','','${role_view-realm}','view-realm','master','efcba2f7-f725-4f7c-acc7-2766f7163b10',NULL,'\0'),('417282aa-d36d-4629-919b-74124db0fa5e','ac5992c6-37bc-465c-9b25-5aabca0b8433','','${role_read-token}','read-token','UCOSPORTS','ac5992c6-37bc-465c-9b25-5aabca0b8433',NULL,'\0'),('41e0434f-4e07-456e-ad51-950ffc8512e1','b53fdbc2-3bc2-403f-a3e8-fb6af868086e','','${role_manage-events}','manage-events','master','b53fdbc2-3bc2-403f-a3e8-fb6af868086e',NULL,'\0'),('46a0c228-5dcd-4310-9d56-bfd226f6bbd4','efcba2f7-f725-4f7c-acc7-2766f7163b10','','${role_view-clients}','view-clients','master','efcba2f7-f725-4f7c-acc7-2766f7163b10',NULL,'\0'),('4aa59a5d-722e-4e5e-bd9d-c89a687407fa','efcba2f7-f725-4f7c-acc7-2766f7163b10','','${role_create-client}','create-client','master','efcba2f7-f725-4f7c-acc7-2766f7163b10',NULL,'\0'),('4c1d85fc-f7c9-4de8-bb9b-6316db8c7ee2','b53fdbc2-3bc2-403f-a3e8-fb6af868086e','','${role_view-identity-providers}','view-identity-providers','master','b53fdbc2-3bc2-403f-a3e8-fb6af868086e',NULL,'\0'),('4d8b33fe-99c2-4296-b708-861d6a8b4354','UCOSPORTS','\0','${role_uma_authorization}','uma_authorization','UCOSPORTS',NULL,'UCOSPORTS','\0'),('54aacb1a-2def-43e4-99c5-4daf369496fb','efcba2f7-f725-4f7c-acc7-2766f7163b10','','${role_view-authorization}','view-authorization','master','efcba2f7-f725-4f7c-acc7-2766f7163b10',NULL,'\0'),('5e42e702-2194-41c7-8463-f202aa81c2de','b53fdbc2-3bc2-403f-a3e8-fb6af868086e','','${role_view-authorization}','view-authorization','master','b53fdbc2-3bc2-403f-a3e8-fb6af868086e',NULL,'\0'),('603df2a6-f573-4175-93dd-186410ebbb3b','b53fdbc2-3bc2-403f-a3e8-fb6af868086e','','${role_view-events}','view-events','master','b53fdbc2-3bc2-403f-a3e8-fb6af868086e',NULL,'\0'),('63874f29-21e6-465d-bb6f-40bcb18d1701','b53fdbc2-3bc2-403f-a3e8-fb6af868086e','','${role_manage-realm}','manage-realm','master','b53fdbc2-3bc2-403f-a3e8-fb6af868086e',NULL,'\0'),('66d4f42e-5809-4207-b551-003566202d25','c5889f5f-afec-4db9-b7ab-e340d97e6c53','','${role_view-realm}','view-realm','UCOSPORTS','c5889f5f-afec-4db9-b7ab-e340d97e6c53',NULL,'\0'),('6b932d8f-5d81-4593-9714-66d478e9173a','efcba2f7-f725-4f7c-acc7-2766f7163b10','','${role_manage-authorization}','manage-authorization','master','efcba2f7-f725-4f7c-acc7-2766f7163b10',NULL,'\0'),('75af9709-b58b-434e-904f-52e47264e790','b53fdbc2-3bc2-403f-a3e8-fb6af868086e','','${role_create-client}','create-client','master','b53fdbc2-3bc2-403f-a3e8-fb6af868086e',NULL,'\0'),('79a7fcff-3993-4397-bff0-0edbc08c8239','c5889f5f-afec-4db9-b7ab-e340d97e6c53','','${role_view-clients}','view-clients','UCOSPORTS','c5889f5f-afec-4db9-b7ab-e340d97e6c53',NULL,'\0'),('7eb82ac0-4908-44a5-8e2c-4ed93afec2e8','d8df134d-909b-4407-9546-057fa65d7441','','${role_view-profile}','view-profile','UCOSPORTS','d8df134d-909b-4407-9546-057fa65d7441',NULL,'\0'),('87847922-a461-454e-ad78-86c2b1b51e50','master','\0','${role_create-realm}','create-realm','master',NULL,'master','\0'),('8e8e78db-8e51-4819-b960-a54578a4e82e','c5889f5f-afec-4db9-b7ab-e340d97e6c53','','${role_manage-users}','manage-users','UCOSPORTS','c5889f5f-afec-4db9-b7ab-e340d97e6c53',NULL,'\0'),('8f4c2e1f-ddc5-4b52-999e-3a104824d244','c5889f5f-afec-4db9-b7ab-e340d97e6c53','','${role_view-authorization}','view-authorization','UCOSPORTS','c5889f5f-afec-4db9-b7ab-e340d97e6c53',NULL,'\0'),('98f3c463-6ad2-4e3f-954e-19ab27dc99dc','b53fdbc2-3bc2-403f-a3e8-fb6af868086e','','${role_impersonation}','impersonation','master','b53fdbc2-3bc2-403f-a3e8-fb6af868086e',NULL,'\0'),('99d3d2c5-b61a-4af6-9e1b-11c2bf19fd47','b53fdbc2-3bc2-403f-a3e8-fb6af868086e','','${role_manage-clients}','manage-clients','master','b53fdbc2-3bc2-403f-a3e8-fb6af868086e',NULL,'\0'),('a0c270ab-d30e-4748-8c5e-4a13d582eb21','b53fdbc2-3bc2-403f-a3e8-fb6af868086e','','${role_manage-users}','manage-users','master','b53fdbc2-3bc2-403f-a3e8-fb6af868086e',NULL,'\0'),('a5d278ab-4723-4637-b980-8dcd03fff1c5','1b585834-2f2e-47dd-9484-b552e1e701e4','','${role_read-token}','read-token','master','1b585834-2f2e-47dd-9484-b552e1e701e4',NULL,'\0'),('a7cfa7fb-97f5-45ea-af34-3c26299543af','efcba2f7-f725-4f7c-acc7-2766f7163b10','','${role_manage-clients}','manage-clients','master','efcba2f7-f725-4f7c-acc7-2766f7163b10',NULL,'\0'),('b168b493-8a6d-40d3-952c-d93f69a3040b','c5889f5f-afec-4db9-b7ab-e340d97e6c53','','${role_view-events}','view-events','UCOSPORTS','c5889f5f-afec-4db9-b7ab-e340d97e6c53',NULL,'\0'),('b4d37a8b-674a-4301-9862-ce8c656caee5','d8df134d-909b-4407-9546-057fa65d7441','','${role_manage-account}','manage-account','UCOSPORTS','d8df134d-909b-4407-9546-057fa65d7441',NULL,'\0'),('b6a20ad9-3153-4934-b459-c9c15e539db3','master','\0','${role_offline-access}','offline_access','master',NULL,'master',''),('b7e7f647-2400-49bf-a5d1-c383620a8101','efcba2f7-f725-4f7c-acc7-2766f7163b10','','${role_impersonation}','impersonation','master','efcba2f7-f725-4f7c-acc7-2766f7163b10',NULL,'\0'),('b86b5df3-38a7-41ba-afa3-9333756ba41d','efcba2f7-f725-4f7c-acc7-2766f7163b10','','${role_view-users}','view-users','master','efcba2f7-f725-4f7c-acc7-2766f7163b10',NULL,'\0'),('ba159b32-bde0-44f7-a22d-fe3bcf0ac43c','b53fdbc2-3bc2-403f-a3e8-fb6af868086e','','${role_view-users}','view-users','master','b53fdbc2-3bc2-403f-a3e8-fb6af868086e',NULL,'\0'),('bb96eb54-dec3-4b8e-82f8-60ff35a8cbdd','efcba2f7-f725-4f7c-acc7-2766f7163b10','','${role_manage-events}','manage-events','master','efcba2f7-f725-4f7c-acc7-2766f7163b10',NULL,'\0'),('bc5aa8eb-3b51-4a60-a281-ad656019b45a','efcba2f7-f725-4f7c-acc7-2766f7163b10','','${role_manage-realm}','manage-realm','master','efcba2f7-f725-4f7c-acc7-2766f7163b10',NULL,'\0'),('be454b31-2a53-40b5-88af-100c86ebe669','c5889f5f-afec-4db9-b7ab-e340d97e6c53','','${role_manage-authorization}','manage-authorization','UCOSPORTS','c5889f5f-afec-4db9-b7ab-e340d97e6c53',NULL,'\0'),('c1e61dfe-97a0-4dde-808f-7dbe41f5ea54','efcba2f7-f725-4f7c-acc7-2766f7163b10','','${role_manage-users}','manage-users','master','efcba2f7-f725-4f7c-acc7-2766f7163b10',NULL,'\0'),('cc113fe6-52b6-4bf6-af26-dbaf4123ab6a','c5889f5f-afec-4db9-b7ab-e340d97e6c53','','${role_view-identity-providers}','view-identity-providers','UCOSPORTS','c5889f5f-afec-4db9-b7ab-e340d97e6c53',NULL,'\0'),('d043f73d-e3ee-47ec-80af-63ee1c059933','b53fdbc2-3bc2-403f-a3e8-fb6af868086e','','${role_view-clients}','view-clients','master','b53fdbc2-3bc2-403f-a3e8-fb6af868086e',NULL,'\0'),('d11e26fe-f45e-4dc8-9f8f-5ce3bf096e18','b53fdbc2-3bc2-403f-a3e8-fb6af868086e','','${role_view-realm}','view-realm','master','b53fdbc2-3bc2-403f-a3e8-fb6af868086e',NULL,'\0'),('d1532b66-e866-4834-9f8f-55d8af5008f7','c5889f5f-afec-4db9-b7ab-e340d97e6c53','','${role_create-client}','create-client','UCOSPORTS','c5889f5f-afec-4db9-b7ab-e340d97e6c53',NULL,'\0'),('d8ce733a-8bc2-4fba-8446-9037ec5f8bc5','efcba2f7-f725-4f7c-acc7-2766f7163b10','','${role_view-events}','view-events','master','efcba2f7-f725-4f7c-acc7-2766f7163b10',NULL,'\0'),('e22256c3-0a5c-4e7a-9dbb-4ae8af8af7da','b53fdbc2-3bc2-403f-a3e8-fb6af868086e','','${role_manage-authorization}','manage-authorization','master','b53fdbc2-3bc2-403f-a3e8-fb6af868086e',NULL,'\0'),('e9ed9050-f8a2-4903-a582-5ab5ca912032','c5889f5f-afec-4db9-b7ab-e340d97e6c53','','${role_view-users}','view-users','UCOSPORTS','c5889f5f-afec-4db9-b7ab-e340d97e6c53',NULL,'\0'),('ebf4e59b-3a26-4630-aecc-769503ec0135','c5889f5f-afec-4db9-b7ab-e340d97e6c53','','${role_manage-realm}','manage-realm','UCOSPORTS','c5889f5f-afec-4db9-b7ab-e340d97e6c53',NULL,'\0'),('ece49bda-656b-4d7a-bac3-481cc9cec854','b4575469-6578-45ec-87ee-6d67ab5bf236','','${role_view-profile}','view-profile','master','b4575469-6578-45ec-87ee-6d67ab5bf236',NULL,'\0'),('f06e145d-68ac-4458-b98f-a891b6e8d269','efcba2f7-f725-4f7c-acc7-2766f7163b10','','${role_view-identity-providers}','view-identity-providers','master','efcba2f7-f725-4f7c-acc7-2766f7163b10',NULL,'\0'),('f29d87e8-edb8-46f7-8013-669b02b67627','c5889f5f-afec-4db9-b7ab-e340d97e6c53','','${role_manage-clients}','manage-clients','UCOSPORTS','c5889f5f-afec-4db9-b7ab-e340d97e6c53',NULL,'\0'),('fc05b19c-bf03-4b46-a27d-eecf7d5b0041','UCOSPORTS','\0',NULL,'admin','UCOSPORTS',NULL,'UCOSPORTS','\0'),('fed17a81-3027-4a00-bbc7-1aef177b7401','c5889f5f-afec-4db9-b7ab-e340d97e6c53','','${role_realm-admin}','realm-admin','UCOSPORTS','c5889f5f-afec-4db9-b7ab-e340d97e6c53',NULL,'\0');
/*!40000 ALTER TABLE `keycloak_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migration_model`
--

DROP TABLE IF EXISTS `migration_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migration_model` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migration_model`
--
-- ORDER BY:  `ID`

LOCK TABLES `migration_model` WRITE;
/*!40000 ALTER TABLE `migration_model` DISABLE KEYS */;
INSERT INTO `migration_model` VALUES ('SINGLETON','2.5.0');
/*!40000 ALTER TABLE `migration_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_client_session`
--

DROP TABLE IF EXISTS `offline_client_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_client_session` (
  `CLIENT_SESSION_ID` varchar(36) NOT NULL,
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `DATA` longtext,
  PRIMARY KEY (`CLIENT_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_client_session`
--
-- ORDER BY:  `CLIENT_SESSION_ID`,`OFFLINE_FLAG`

LOCK TABLES `offline_client_session` WRITE;
/*!40000 ALTER TABLE `offline_client_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_client_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offline_user_session`
--

DROP TABLE IF EXISTS `offline_user_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offline_user_session` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `LAST_SESSION_REFRESH` int(11) DEFAULT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offline_user_session`
--
-- ORDER BY:  `USER_SESSION_ID`,`OFFLINE_FLAG`

LOCK TABLES `offline_user_session` WRITE;
/*!40000 ALTER TABLE `offline_user_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `offline_user_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `policy_config`
--

DROP TABLE IF EXISTS `policy_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `policy_config` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `policy_config`
--
-- ORDER BY:  `POLICY_ID`,`NAME`

LOCK TABLES `policy_config` WRITE;
/*!40000 ALTER TABLE `policy_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `policy_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `protocol_mapper`
--

DROP TABLE IF EXISTS `protocol_mapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protocol_mapper` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_TEXT` varchar(255) DEFAULT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_TEMPLATE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PCM_REALM` (`CLIENT_ID`),
  KEY `FK_CLI_TMPLT_MAPPER` (`CLIENT_TEMPLATE_ID`),
  CONSTRAINT `FK_CLI_TMPLT_MAPPER` FOREIGN KEY (`CLIENT_TEMPLATE_ID`) REFERENCES `client_template` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `protocol_mapper`
--
-- ORDER BY:  `ID`

LOCK TABLES `protocol_mapper` WRITE;
/*!40000 ALTER TABLE `protocol_mapper` DISABLE KEYS */;
INSERT INTO `protocol_mapper` VALUES ('053a308c-953e-46e7-9228-4fd81ff9fd17','username','openid-connect','oidc-usermodel-property-mapper','','${username}','bbe84378-9c83-4064-94ed-24a30f18f6c3',NULL),('0b2cc3e5-7470-48f0-8e9c-e89066f0e463','full name','openid-connect','oidc-full-name-mapper','','${fullName}','b4575469-6578-45ec-87ee-6d67ab5bf236',NULL),('116a8902-7258-4b88-9603-2cb49419d9a4','role list','saml','saml-role-list-mapper','\0',NULL,'b53fdbc2-3bc2-403f-a3e8-fb6af868086e',NULL),('11c2e455-12e8-4db3-9c23-36aee5dd64c1','email','openid-connect','oidc-usermodel-property-mapper','','${email}','81535c9c-7c23-4199-a976-6c20fbe1e636',NULL),('1b2ef216-aeb0-4b85-b30a-6b5a522e37e7','full name','openid-connect','oidc-full-name-mapper','','${fullName}','d8df134d-909b-4407-9546-057fa65d7441',NULL),('1b735d69-1c3e-4308-aeb5-256e516e6cd7','username','openid-connect','oidc-usermodel-property-mapper','','${username}','81535c9c-7c23-4199-a976-6c20fbe1e636',NULL),('1c99b3d9-8cfb-4c1d-83a0-4c6c8bd54dc3','full name','openid-connect','oidc-full-name-mapper','','${fullName}','ac5992c6-37bc-465c-9b25-5aabca0b8433',NULL),('1f026057-a618-4d71-920f-74b69dfc9899','username','openid-connect','oidc-usermodel-property-mapper','','${username}','ac5992c6-37bc-465c-9b25-5aabca0b8433',NULL),('1f6ff2ba-4a5b-41c4-b66b-0e7d29d7289c','full name','openid-connect','oidc-full-name-mapper','','${fullName}','b53fdbc2-3bc2-403f-a3e8-fb6af868086e',NULL),('21a9a64a-c4e6-421c-a5c8-db713dddd123','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','81535c9c-7c23-4199-a976-6c20fbe1e636',NULL),('222012ad-17f4-4e8f-ab8d-0940e3edd584','role list','saml','saml-role-list-mapper','\0',NULL,'d8df134d-909b-4407-9546-057fa65d7441',NULL),('226f84bc-5e6b-4458-8429-0da5dd08c41c','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','c2a4c629-9e85-4345-9536-da8c0ba928e4',NULL),('2a618a14-06b4-40d5-a866-839e9aaa7c10','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','b4575469-6578-45ec-87ee-6d67ab5bf236',NULL),('2aa2b106-9f42-483b-af28-29e4d718253f','role list','saml','saml-role-list-mapper','\0',NULL,'bbe84378-9c83-4064-94ed-24a30f18f6c3',NULL),('30bd965d-efec-4625-ad53-bafbb6db1fe7','full name','openid-connect','oidc-full-name-mapper','','${fullName}','c5889f5f-afec-4db9-b7ab-e340d97e6c53',NULL),('3252fc15-ce48-4675-8e22-a9ae8a84cf4d','full name','openid-connect','oidc-full-name-mapper','','${fullName}','efcba2f7-f725-4f7c-acc7-2766f7163b10',NULL),('34e5623e-6497-4f32-8ce3-8551fadeadd6','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','d8df134d-909b-4407-9546-057fa65d7441',NULL),('37185af2-48dc-4251-bf03-3729d6b42b4e','role list','saml','saml-role-list-mapper','\0',NULL,'81535c9c-7c23-4199-a976-6c20fbe1e636',NULL),('378882c8-0507-487e-b28f-3c441674ce6a','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','c2a4c629-9e85-4345-9536-da8c0ba928e4',NULL),('38ed00af-d84a-4eac-8e8d-3e046d83eda9','full name','openid-connect','oidc-full-name-mapper','','${fullName}','125f1e4c-38c5-4e0f-8a53-d4290905139a',NULL),('3b6cc618-bb32-405c-9aef-ad1ebc7eb479','role list','saml','saml-role-list-mapper','\0',NULL,'b4575469-6578-45ec-87ee-6d67ab5bf236',NULL),('3c3bf3a9-f499-4e40-aa59-4086e0b458c5','username','openid-connect','oidc-usermodel-property-mapper','','${username}','b4575469-6578-45ec-87ee-6d67ab5bf236',NULL),('3d010da2-a647-4c3d-860d-cdfdc71c9f76','email','openid-connect','oidc-usermodel-property-mapper','','${email}','efcba2f7-f725-4f7c-acc7-2766f7163b10',NULL),('3e154ced-c96c-48a8-b945-7b1e11aa11c0','email','openid-connect','oidc-usermodel-property-mapper','','${email}','b53fdbc2-3bc2-403f-a3e8-fb6af868086e',NULL),('416a6364-5e01-44be-b1f3-fc15387f0d2d','email','openid-connect','oidc-usermodel-property-mapper','','${email}','c2a4c629-9e85-4345-9536-da8c0ba928e4',NULL),('41ada2c6-a06a-4a07-8d6e-ac6dc6c16ba2','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','b53fdbc2-3bc2-403f-a3e8-fb6af868086e',NULL),('44fe6b33-2771-41f6-b0bf-8fa32b337e36','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','125f1e4c-38c5-4e0f-8a53-d4290905139a',NULL),('45860337-a4fe-4e7e-9307-a666312b1515','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','efcba2f7-f725-4f7c-acc7-2766f7163b10',NULL),('4bb0a2e1-742e-48cd-b732-f2d71c776362','email','openid-connect','oidc-usermodel-property-mapper','','${email}','c5889f5f-afec-4db9-b7ab-e340d97e6c53',NULL),('4c935161-2ad0-4fd6-bbfa-2826714a5657','username','openid-connect','oidc-usermodel-property-mapper','','${username}','b53fdbc2-3bc2-403f-a3e8-fb6af868086e',NULL),('4c9523ac-6189-40cb-92fb-5c939cdf7282','role list','saml','saml-role-list-mapper','\0',NULL,'1b585834-2f2e-47dd-9484-b552e1e701e4',NULL),('523711ec-6571-41e5-9d37-0b59b7e71c78','username','openid-connect','oidc-usermodel-property-mapper','','${username}','b5dedaa1-72ef-44d2-b46c-396c47932111',NULL),('5bbd8f8c-9fcf-4855-8cd4-d500c2d24123','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','b53fdbc2-3bc2-403f-a3e8-fb6af868086e',NULL),('5dfce977-41f5-42f8-8c11-b80fbd2ef734','role list','saml','saml-role-list-mapper','\0',NULL,'b5dedaa1-72ef-44d2-b46c-396c47932111',NULL),('5f4d1b0a-88a4-4b91-a6f3-ae33d21ad487','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','125f1e4c-38c5-4e0f-8a53-d4290905139a',NULL),('5f63f7a0-1852-4c23-a9f9-e30da4db4ab5','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','1b585834-2f2e-47dd-9484-b552e1e701e4',NULL),('60dc4747-fa41-475f-84ca-2be80477709d','email','openid-connect','oidc-usermodel-property-mapper','','${email}','b4575469-6578-45ec-87ee-6d67ab5bf236',NULL),('63f5f125-06d8-48c0-82cf-060659d3403e','role list','saml','saml-role-list-mapper','\0',NULL,'ac5992c6-37bc-465c-9b25-5aabca0b8433',NULL),('64074097-6681-49f9-8c6c-3542450feced','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','b5dedaa1-72ef-44d2-b46c-396c47932111',NULL),('69cd8d6c-74df-4b05-85aa-b76a283ab461','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','d8df134d-909b-4407-9546-057fa65d7441',NULL),('6f7e598b-234e-4f28-a481-8a0138eeb457','username','openid-connect','oidc-usermodel-property-mapper','','${username}','d8df134d-909b-4407-9546-057fa65d7441',NULL),('7082bbf6-8fcc-4b5d-8e6a-66532f886572','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','b5dedaa1-72ef-44d2-b46c-396c47932111',NULL),('7b025e87-a53e-4602-b188-a345189b0d3f','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','efcba2f7-f725-4f7c-acc7-2766f7163b10',NULL),('7d4cf9a2-134a-4af1-8df3-f3fa5dc8c829','email','openid-connect','oidc-usermodel-property-mapper','','${email}','1b585834-2f2e-47dd-9484-b552e1e701e4',NULL),('7ff12292-b50a-465e-a361-cbd713a03a4c','full name','openid-connect','oidc-full-name-mapper','','${fullName}','bbe84378-9c83-4064-94ed-24a30f18f6c3',NULL),('81263e84-a84a-428e-9a1e-18a50729f123','locale','openid-connect','oidc-usermodel-attribute-mapper','\0','${locale}','125f1e4c-38c5-4e0f-8a53-d4290905139a',NULL),('82817f69-7d0f-44d4-9a97-9a1446a68126','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','c5889f5f-afec-4db9-b7ab-e340d97e6c53',NULL),('84aba79f-8f5a-4ce7-99ca-57e07a19cb07','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','bbe84378-9c83-4064-94ed-24a30f18f6c3',NULL),('85f5549f-6f74-4073-95fe-294d2aded711','username','openid-connect','oidc-usermodel-property-mapper','','${username}','c2a4c629-9e85-4345-9536-da8c0ba928e4',NULL),('88c0fbb4-436f-4d34-8d26-5551d653060d','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','ac5992c6-37bc-465c-9b25-5aabca0b8433',NULL),('8bdc9535-4292-4caf-8d20-a55341b5229e','username','openid-connect','oidc-usermodel-property-mapper','','${username}','125f1e4c-38c5-4e0f-8a53-d4290905139a',NULL),('8ce6febd-9a83-404d-a4c7-bc6f8878bafb','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','c5889f5f-afec-4db9-b7ab-e340d97e6c53',NULL),('95371e74-b8ec-440f-81d1-1dc0c94b81c1','role list','saml','saml-role-list-mapper','\0',NULL,'125f1e4c-38c5-4e0f-8a53-d4290905139a',NULL),('965bcea5-6016-4885-b3b4-202174b7e1a9','email','openid-connect','oidc-usermodel-property-mapper','','${email}','125f1e4c-38c5-4e0f-8a53-d4290905139a',NULL),('984df58c-c9ce-4a76-b480-e191ad572d73','locale','openid-connect','oidc-usermodel-attribute-mapper','\0','${locale}','81535c9c-7c23-4199-a976-6c20fbe1e636',NULL),('9be12b43-1fc4-49c7-8ff1-4330ecf32d96','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','81535c9c-7c23-4199-a976-6c20fbe1e636',NULL),('9c76829f-509f-40c5-9498-4dfe82210d58','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','1b585834-2f2e-47dd-9484-b552e1e701e4',NULL),('9c7accce-e0c4-4ff9-af9b-3b5d3979e56a','role list','saml','saml-role-list-mapper','\0',NULL,'efcba2f7-f725-4f7c-acc7-2766f7163b10',NULL),('a0fb7810-26db-4cd3-934c-a3edbc30434b','full name','openid-connect','oidc-full-name-mapper','','${fullName}','b5dedaa1-72ef-44d2-b46c-396c47932111',NULL),('a6b18291-4e07-4522-b70f-a18ecefd1d98','family name','openid-connect','oidc-usermodel-property-mapper','','${familyName}','b4575469-6578-45ec-87ee-6d67ab5bf236',NULL),('acf55340-6491-4e6d-a592-f42d76ccf6d6','role list','saml','saml-role-list-mapper','\0',NULL,'c2a4c629-9e85-4345-9536-da8c0ba928e4',NULL),('af6e1dd4-d1cf-448f-910e-7c884465bcaa','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','ac5992c6-37bc-465c-9b25-5aabca0b8433',NULL),('b32e998b-ba5a-4253-b009-b7bd80db5a83','role list','saml','saml-role-list-mapper','\0',NULL,'c5889f5f-afec-4db9-b7ab-e340d97e6c53',NULL),('b37c886d-f45f-460b-bbc7-69a2321b9c81','username','openid-connect','oidc-usermodel-property-mapper','','${username}','c5889f5f-afec-4db9-b7ab-e340d97e6c53',NULL),('bb0533ed-1eda-4fdc-877b-9a83d8533120','email','openid-connect','oidc-usermodel-property-mapper','','${email}','b5dedaa1-72ef-44d2-b46c-396c47932111',NULL),('c82f6190-19d8-4175-9e89-c055eacabd72','email','openid-connect','oidc-usermodel-property-mapper','','${email}','ac5992c6-37bc-465c-9b25-5aabca0b8433',NULL),('d2edb3b1-2241-4b9c-bce8-7d8191aff095','email','openid-connect','oidc-usermodel-property-mapper','','${email}','d8df134d-909b-4407-9546-057fa65d7441',NULL),('d518994b-00dc-4a0a-981d-3e2272ede0ef','given name','openid-connect','oidc-usermodel-property-mapper','','${givenName}','bbe84378-9c83-4064-94ed-24a30f18f6c3',NULL),('deb7e67c-2f97-423e-a25f-290e1ee4d4a3','email','openid-connect','oidc-usermodel-property-mapper','','${email}','bbe84378-9c83-4064-94ed-24a30f18f6c3',NULL),('eee1f967-a7f1-4c97-a9c3-132b81a3b293','full name','openid-connect','oidc-full-name-mapper','','${fullName}','81535c9c-7c23-4199-a976-6c20fbe1e636',NULL),('f14b17da-771a-4621-8362-9df6979726e3','username','openid-connect','oidc-usermodel-property-mapper','','${username}','efcba2f7-f725-4f7c-acc7-2766f7163b10',NULL),('f47093e5-e259-4654-8b35-8e538eb195a3','full name','openid-connect','oidc-full-name-mapper','','${fullName}','1b585834-2f2e-47dd-9484-b552e1e701e4',NULL),('f6026c60-c06c-43d9-b2ee-38c6b2584214','username','openid-connect','oidc-usermodel-property-mapper','','${username}','1b585834-2f2e-47dd-9484-b552e1e701e4',NULL),('f8885d49-0d81-4091-95d2-adf009fc6987','full name','openid-connect','oidc-full-name-mapper','','${fullName}','c2a4c629-9e85-4345-9536-da8c0ba928e4',NULL);
/*!40000 ALTER TABLE `protocol_mapper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `protocol_mapper_config`
--

DROP TABLE IF EXISTS `protocol_mapper_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protocol_mapper_config` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `protocol_mapper` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `protocol_mapper_config`
--
-- ORDER BY:  `PROTOCOL_MAPPER_ID`,`NAME`

LOCK TABLES `protocol_mapper_config` WRITE;
/*!40000 ALTER TABLE `protocol_mapper_config` DISABLE KEYS */;
INSERT INTO `protocol_mapper_config` VALUES ('053a308c-953e-46e7-9228-4fd81ff9fd17','true','access.token.claim'),('053a308c-953e-46e7-9228-4fd81ff9fd17','preferred_username','claim.name'),('053a308c-953e-46e7-9228-4fd81ff9fd17','true','id.token.claim'),('053a308c-953e-46e7-9228-4fd81ff9fd17','String','jsonType.label'),('053a308c-953e-46e7-9228-4fd81ff9fd17','username','user.attribute'),('053a308c-953e-46e7-9228-4fd81ff9fd17','true','userinfo.token.claim'),('0b2cc3e5-7470-48f0-8e9c-e89066f0e463','true','access.token.claim'),('0b2cc3e5-7470-48f0-8e9c-e89066f0e463','true','id.token.claim'),('116a8902-7258-4b88-9603-2cb49419d9a4','Role','attribute.name'),('116a8902-7258-4b88-9603-2cb49419d9a4','Basic','attribute.nameformat'),('116a8902-7258-4b88-9603-2cb49419d9a4','false','single'),('11c2e455-12e8-4db3-9c23-36aee5dd64c1','true','access.token.claim'),('11c2e455-12e8-4db3-9c23-36aee5dd64c1','email','claim.name'),('11c2e455-12e8-4db3-9c23-36aee5dd64c1','true','id.token.claim'),('11c2e455-12e8-4db3-9c23-36aee5dd64c1','String','jsonType.label'),('11c2e455-12e8-4db3-9c23-36aee5dd64c1','email','user.attribute'),('11c2e455-12e8-4db3-9c23-36aee5dd64c1','true','userinfo.token.claim'),('1b2ef216-aeb0-4b85-b30a-6b5a522e37e7','true','access.token.claim'),('1b2ef216-aeb0-4b85-b30a-6b5a522e37e7','true','id.token.claim'),('1b735d69-1c3e-4308-aeb5-256e516e6cd7','true','access.token.claim'),('1b735d69-1c3e-4308-aeb5-256e516e6cd7','preferred_username','claim.name'),('1b735d69-1c3e-4308-aeb5-256e516e6cd7','true','id.token.claim'),('1b735d69-1c3e-4308-aeb5-256e516e6cd7','String','jsonType.label'),('1b735d69-1c3e-4308-aeb5-256e516e6cd7','username','user.attribute'),('1b735d69-1c3e-4308-aeb5-256e516e6cd7','true','userinfo.token.claim'),('1c99b3d9-8cfb-4c1d-83a0-4c6c8bd54dc3','true','access.token.claim'),('1c99b3d9-8cfb-4c1d-83a0-4c6c8bd54dc3','true','id.token.claim'),('1f026057-a618-4d71-920f-74b69dfc9899','true','access.token.claim'),('1f026057-a618-4d71-920f-74b69dfc9899','preferred_username','claim.name'),('1f026057-a618-4d71-920f-74b69dfc9899','true','id.token.claim'),('1f026057-a618-4d71-920f-74b69dfc9899','String','jsonType.label'),('1f026057-a618-4d71-920f-74b69dfc9899','username','user.attribute'),('1f026057-a618-4d71-920f-74b69dfc9899','true','userinfo.token.claim'),('1f6ff2ba-4a5b-41c4-b66b-0e7d29d7289c','true','access.token.claim'),('1f6ff2ba-4a5b-41c4-b66b-0e7d29d7289c','true','id.token.claim'),('21a9a64a-c4e6-421c-a5c8-db713dddd123','true','access.token.claim'),('21a9a64a-c4e6-421c-a5c8-db713dddd123','family_name','claim.name'),('21a9a64a-c4e6-421c-a5c8-db713dddd123','true','id.token.claim'),('21a9a64a-c4e6-421c-a5c8-db713dddd123','String','jsonType.label'),('21a9a64a-c4e6-421c-a5c8-db713dddd123','lastName','user.attribute'),('21a9a64a-c4e6-421c-a5c8-db713dddd123','true','userinfo.token.claim'),('222012ad-17f4-4e8f-ab8d-0940e3edd584','Role','attribute.name'),('222012ad-17f4-4e8f-ab8d-0940e3edd584','Basic','attribute.nameformat'),('222012ad-17f4-4e8f-ab8d-0940e3edd584','false','single'),('226f84bc-5e6b-4458-8429-0da5dd08c41c','true','access.token.claim'),('226f84bc-5e6b-4458-8429-0da5dd08c41c','family_name','claim.name'),('226f84bc-5e6b-4458-8429-0da5dd08c41c','true','id.token.claim'),('226f84bc-5e6b-4458-8429-0da5dd08c41c','String','jsonType.label'),('226f84bc-5e6b-4458-8429-0da5dd08c41c','lastName','user.attribute'),('226f84bc-5e6b-4458-8429-0da5dd08c41c','true','userinfo.token.claim'),('2a618a14-06b4-40d5-a866-839e9aaa7c10','true','access.token.claim'),('2a618a14-06b4-40d5-a866-839e9aaa7c10','given_name','claim.name'),('2a618a14-06b4-40d5-a866-839e9aaa7c10','true','id.token.claim'),('2a618a14-06b4-40d5-a866-839e9aaa7c10','String','jsonType.label'),('2a618a14-06b4-40d5-a866-839e9aaa7c10','firstName','user.attribute'),('2a618a14-06b4-40d5-a866-839e9aaa7c10','true','userinfo.token.claim'),('2aa2b106-9f42-483b-af28-29e4d718253f','Role','attribute.name'),('2aa2b106-9f42-483b-af28-29e4d718253f','Basic','attribute.nameformat'),('2aa2b106-9f42-483b-af28-29e4d718253f','false','single'),('30bd965d-efec-4625-ad53-bafbb6db1fe7','true','access.token.claim'),('30bd965d-efec-4625-ad53-bafbb6db1fe7','true','id.token.claim'),('3252fc15-ce48-4675-8e22-a9ae8a84cf4d','true','access.token.claim'),('3252fc15-ce48-4675-8e22-a9ae8a84cf4d','true','id.token.claim'),('34e5623e-6497-4f32-8ce3-8551fadeadd6','true','access.token.claim'),('34e5623e-6497-4f32-8ce3-8551fadeadd6','given_name','claim.name'),('34e5623e-6497-4f32-8ce3-8551fadeadd6','true','id.token.claim'),('34e5623e-6497-4f32-8ce3-8551fadeadd6','String','jsonType.label'),('34e5623e-6497-4f32-8ce3-8551fadeadd6','firstName','user.attribute'),('34e5623e-6497-4f32-8ce3-8551fadeadd6','true','userinfo.token.claim'),('37185af2-48dc-4251-bf03-3729d6b42b4e','Role','attribute.name'),('37185af2-48dc-4251-bf03-3729d6b42b4e','Basic','attribute.nameformat'),('37185af2-48dc-4251-bf03-3729d6b42b4e','false','single'),('378882c8-0507-487e-b28f-3c441674ce6a','true','access.token.claim'),('378882c8-0507-487e-b28f-3c441674ce6a','given_name','claim.name'),('378882c8-0507-487e-b28f-3c441674ce6a','true','id.token.claim'),('378882c8-0507-487e-b28f-3c441674ce6a','String','jsonType.label'),('378882c8-0507-487e-b28f-3c441674ce6a','firstName','user.attribute'),('378882c8-0507-487e-b28f-3c441674ce6a','true','userinfo.token.claim'),('38ed00af-d84a-4eac-8e8d-3e046d83eda9','true','access.token.claim'),('38ed00af-d84a-4eac-8e8d-3e046d83eda9','true','id.token.claim'),('3b6cc618-bb32-405c-9aef-ad1ebc7eb479','Role','attribute.name'),('3b6cc618-bb32-405c-9aef-ad1ebc7eb479','Basic','attribute.nameformat'),('3b6cc618-bb32-405c-9aef-ad1ebc7eb479','false','single'),('3c3bf3a9-f499-4e40-aa59-4086e0b458c5','true','access.token.claim'),('3c3bf3a9-f499-4e40-aa59-4086e0b458c5','preferred_username','claim.name'),('3c3bf3a9-f499-4e40-aa59-4086e0b458c5','true','id.token.claim'),('3c3bf3a9-f499-4e40-aa59-4086e0b458c5','String','jsonType.label'),('3c3bf3a9-f499-4e40-aa59-4086e0b458c5','username','user.attribute'),('3c3bf3a9-f499-4e40-aa59-4086e0b458c5','true','userinfo.token.claim'),('3d010da2-a647-4c3d-860d-cdfdc71c9f76','true','access.token.claim'),('3d010da2-a647-4c3d-860d-cdfdc71c9f76','email','claim.name'),('3d010da2-a647-4c3d-860d-cdfdc71c9f76','true','id.token.claim'),('3d010da2-a647-4c3d-860d-cdfdc71c9f76','String','jsonType.label'),('3d010da2-a647-4c3d-860d-cdfdc71c9f76','email','user.attribute'),('3d010da2-a647-4c3d-860d-cdfdc71c9f76','true','userinfo.token.claim'),('3e154ced-c96c-48a8-b945-7b1e11aa11c0','true','access.token.claim'),('3e154ced-c96c-48a8-b945-7b1e11aa11c0','email','claim.name'),('3e154ced-c96c-48a8-b945-7b1e11aa11c0','true','id.token.claim'),('3e154ced-c96c-48a8-b945-7b1e11aa11c0','String','jsonType.label'),('3e154ced-c96c-48a8-b945-7b1e11aa11c0','email','user.attribute'),('3e154ced-c96c-48a8-b945-7b1e11aa11c0','true','userinfo.token.claim'),('416a6364-5e01-44be-b1f3-fc15387f0d2d','true','access.token.claim'),('416a6364-5e01-44be-b1f3-fc15387f0d2d','email','claim.name'),('416a6364-5e01-44be-b1f3-fc15387f0d2d','true','id.token.claim'),('416a6364-5e01-44be-b1f3-fc15387f0d2d','String','jsonType.label'),('416a6364-5e01-44be-b1f3-fc15387f0d2d','email','user.attribute'),('416a6364-5e01-44be-b1f3-fc15387f0d2d','true','userinfo.token.claim'),('41ada2c6-a06a-4a07-8d6e-ac6dc6c16ba2','true','access.token.claim'),('41ada2c6-a06a-4a07-8d6e-ac6dc6c16ba2','family_name','claim.name'),('41ada2c6-a06a-4a07-8d6e-ac6dc6c16ba2','true','id.token.claim'),('41ada2c6-a06a-4a07-8d6e-ac6dc6c16ba2','String','jsonType.label'),('41ada2c6-a06a-4a07-8d6e-ac6dc6c16ba2','lastName','user.attribute'),('41ada2c6-a06a-4a07-8d6e-ac6dc6c16ba2','true','userinfo.token.claim'),('44fe6b33-2771-41f6-b0bf-8fa32b337e36','true','access.token.claim'),('44fe6b33-2771-41f6-b0bf-8fa32b337e36','given_name','claim.name'),('44fe6b33-2771-41f6-b0bf-8fa32b337e36','true','id.token.claim'),('44fe6b33-2771-41f6-b0bf-8fa32b337e36','String','jsonType.label'),('44fe6b33-2771-41f6-b0bf-8fa32b337e36','firstName','user.attribute'),('44fe6b33-2771-41f6-b0bf-8fa32b337e36','true','userinfo.token.claim'),('45860337-a4fe-4e7e-9307-a666312b1515','true','access.token.claim'),('45860337-a4fe-4e7e-9307-a666312b1515','given_name','claim.name'),('45860337-a4fe-4e7e-9307-a666312b1515','true','id.token.claim'),('45860337-a4fe-4e7e-9307-a666312b1515','String','jsonType.label'),('45860337-a4fe-4e7e-9307-a666312b1515','firstName','user.attribute'),('45860337-a4fe-4e7e-9307-a666312b1515','true','userinfo.token.claim'),('4bb0a2e1-742e-48cd-b732-f2d71c776362','true','access.token.claim'),('4bb0a2e1-742e-48cd-b732-f2d71c776362','email','claim.name'),('4bb0a2e1-742e-48cd-b732-f2d71c776362','true','id.token.claim'),('4bb0a2e1-742e-48cd-b732-f2d71c776362','String','jsonType.label'),('4bb0a2e1-742e-48cd-b732-f2d71c776362','email','user.attribute'),('4bb0a2e1-742e-48cd-b732-f2d71c776362','true','userinfo.token.claim'),('4c935161-2ad0-4fd6-bbfa-2826714a5657','true','access.token.claim'),('4c935161-2ad0-4fd6-bbfa-2826714a5657','preferred_username','claim.name'),('4c935161-2ad0-4fd6-bbfa-2826714a5657','true','id.token.claim'),('4c935161-2ad0-4fd6-bbfa-2826714a5657','String','jsonType.label'),('4c935161-2ad0-4fd6-bbfa-2826714a5657','username','user.attribute'),('4c935161-2ad0-4fd6-bbfa-2826714a5657','true','userinfo.token.claim'),('4c9523ac-6189-40cb-92fb-5c939cdf7282','Role','attribute.name'),('4c9523ac-6189-40cb-92fb-5c939cdf7282','Basic','attribute.nameformat'),('4c9523ac-6189-40cb-92fb-5c939cdf7282','false','single'),('523711ec-6571-41e5-9d37-0b59b7e71c78','true','access.token.claim'),('523711ec-6571-41e5-9d37-0b59b7e71c78','preferred_username','claim.name'),('523711ec-6571-41e5-9d37-0b59b7e71c78','true','id.token.claim'),('523711ec-6571-41e5-9d37-0b59b7e71c78','String','jsonType.label'),('523711ec-6571-41e5-9d37-0b59b7e71c78','username','user.attribute'),('523711ec-6571-41e5-9d37-0b59b7e71c78','true','userinfo.token.claim'),('5bbd8f8c-9fcf-4855-8cd4-d500c2d24123','true','access.token.claim'),('5bbd8f8c-9fcf-4855-8cd4-d500c2d24123','given_name','claim.name'),('5bbd8f8c-9fcf-4855-8cd4-d500c2d24123','true','id.token.claim'),('5bbd8f8c-9fcf-4855-8cd4-d500c2d24123','String','jsonType.label'),('5bbd8f8c-9fcf-4855-8cd4-d500c2d24123','firstName','user.attribute'),('5bbd8f8c-9fcf-4855-8cd4-d500c2d24123','true','userinfo.token.claim'),('5dfce977-41f5-42f8-8c11-b80fbd2ef734','Role','attribute.name'),('5dfce977-41f5-42f8-8c11-b80fbd2ef734','Basic','attribute.nameformat'),('5dfce977-41f5-42f8-8c11-b80fbd2ef734','false','single'),('5f4d1b0a-88a4-4b91-a6f3-ae33d21ad487','true','access.token.claim'),('5f4d1b0a-88a4-4b91-a6f3-ae33d21ad487','family_name','claim.name'),('5f4d1b0a-88a4-4b91-a6f3-ae33d21ad487','true','id.token.claim'),('5f4d1b0a-88a4-4b91-a6f3-ae33d21ad487','String','jsonType.label'),('5f4d1b0a-88a4-4b91-a6f3-ae33d21ad487','lastName','user.attribute'),('5f4d1b0a-88a4-4b91-a6f3-ae33d21ad487','true','userinfo.token.claim'),('5f63f7a0-1852-4c23-a9f9-e30da4db4ab5','true','access.token.claim'),('5f63f7a0-1852-4c23-a9f9-e30da4db4ab5','family_name','claim.name'),('5f63f7a0-1852-4c23-a9f9-e30da4db4ab5','true','id.token.claim'),('5f63f7a0-1852-4c23-a9f9-e30da4db4ab5','String','jsonType.label'),('5f63f7a0-1852-4c23-a9f9-e30da4db4ab5','lastName','user.attribute'),('5f63f7a0-1852-4c23-a9f9-e30da4db4ab5','true','userinfo.token.claim'),('60dc4747-fa41-475f-84ca-2be80477709d','true','access.token.claim'),('60dc4747-fa41-475f-84ca-2be80477709d','email','claim.name'),('60dc4747-fa41-475f-84ca-2be80477709d','true','id.token.claim'),('60dc4747-fa41-475f-84ca-2be80477709d','String','jsonType.label'),('60dc4747-fa41-475f-84ca-2be80477709d','email','user.attribute'),('60dc4747-fa41-475f-84ca-2be80477709d','true','userinfo.token.claim'),('63f5f125-06d8-48c0-82cf-060659d3403e','Role','attribute.name'),('63f5f125-06d8-48c0-82cf-060659d3403e','Basic','attribute.nameformat'),('63f5f125-06d8-48c0-82cf-060659d3403e','false','single'),('64074097-6681-49f9-8c6c-3542450feced','true','access.token.claim'),('64074097-6681-49f9-8c6c-3542450feced','given_name','claim.name'),('64074097-6681-49f9-8c6c-3542450feced','true','id.token.claim'),('64074097-6681-49f9-8c6c-3542450feced','String','jsonType.label'),('64074097-6681-49f9-8c6c-3542450feced','firstName','user.attribute'),('64074097-6681-49f9-8c6c-3542450feced','true','userinfo.token.claim'),('69cd8d6c-74df-4b05-85aa-b76a283ab461','true','access.token.claim'),('69cd8d6c-74df-4b05-85aa-b76a283ab461','family_name','claim.name'),('69cd8d6c-74df-4b05-85aa-b76a283ab461','true','id.token.claim'),('69cd8d6c-74df-4b05-85aa-b76a283ab461','String','jsonType.label'),('69cd8d6c-74df-4b05-85aa-b76a283ab461','lastName','user.attribute'),('69cd8d6c-74df-4b05-85aa-b76a283ab461','true','userinfo.token.claim'),('6f7e598b-234e-4f28-a481-8a0138eeb457','true','access.token.claim'),('6f7e598b-234e-4f28-a481-8a0138eeb457','preferred_username','claim.name'),('6f7e598b-234e-4f28-a481-8a0138eeb457','true','id.token.claim'),('6f7e598b-234e-4f28-a481-8a0138eeb457','String','jsonType.label'),('6f7e598b-234e-4f28-a481-8a0138eeb457','username','user.attribute'),('6f7e598b-234e-4f28-a481-8a0138eeb457','true','userinfo.token.claim'),('7082bbf6-8fcc-4b5d-8e6a-66532f886572','true','access.token.claim'),('7082bbf6-8fcc-4b5d-8e6a-66532f886572','family_name','claim.name'),('7082bbf6-8fcc-4b5d-8e6a-66532f886572','true','id.token.claim'),('7082bbf6-8fcc-4b5d-8e6a-66532f886572','String','jsonType.label'),('7082bbf6-8fcc-4b5d-8e6a-66532f886572','lastName','user.attribute'),('7082bbf6-8fcc-4b5d-8e6a-66532f886572','true','userinfo.token.claim'),('7b025e87-a53e-4602-b188-a345189b0d3f','true','access.token.claim'),('7b025e87-a53e-4602-b188-a345189b0d3f','family_name','claim.name'),('7b025e87-a53e-4602-b188-a345189b0d3f','true','id.token.claim'),('7b025e87-a53e-4602-b188-a345189b0d3f','String','jsonType.label'),('7b025e87-a53e-4602-b188-a345189b0d3f','lastName','user.attribute'),('7b025e87-a53e-4602-b188-a345189b0d3f','true','userinfo.token.claim'),('7d4cf9a2-134a-4af1-8df3-f3fa5dc8c829','true','access.token.claim'),('7d4cf9a2-134a-4af1-8df3-f3fa5dc8c829','email','claim.name'),('7d4cf9a2-134a-4af1-8df3-f3fa5dc8c829','true','id.token.claim'),('7d4cf9a2-134a-4af1-8df3-f3fa5dc8c829','String','jsonType.label'),('7d4cf9a2-134a-4af1-8df3-f3fa5dc8c829','email','user.attribute'),('7d4cf9a2-134a-4af1-8df3-f3fa5dc8c829','true','userinfo.token.claim'),('7ff12292-b50a-465e-a361-cbd713a03a4c','true','access.token.claim'),('7ff12292-b50a-465e-a361-cbd713a03a4c','true','id.token.claim'),('81263e84-a84a-428e-9a1e-18a50729f123','true','access.token.claim'),('81263e84-a84a-428e-9a1e-18a50729f123','locale','claim.name'),('81263e84-a84a-428e-9a1e-18a50729f123','true','id.token.claim'),('81263e84-a84a-428e-9a1e-18a50729f123','String','jsonType.label'),('81263e84-a84a-428e-9a1e-18a50729f123','locale','user.attribute'),('81263e84-a84a-428e-9a1e-18a50729f123','true','userinfo.token.claim'),('82817f69-7d0f-44d4-9a97-9a1446a68126','true','access.token.claim'),('82817f69-7d0f-44d4-9a97-9a1446a68126','family_name','claim.name'),('82817f69-7d0f-44d4-9a97-9a1446a68126','true','id.token.claim'),('82817f69-7d0f-44d4-9a97-9a1446a68126','String','jsonType.label'),('82817f69-7d0f-44d4-9a97-9a1446a68126','lastName','user.attribute'),('82817f69-7d0f-44d4-9a97-9a1446a68126','true','userinfo.token.claim'),('84aba79f-8f5a-4ce7-99ca-57e07a19cb07','true','access.token.claim'),('84aba79f-8f5a-4ce7-99ca-57e07a19cb07','family_name','claim.name'),('84aba79f-8f5a-4ce7-99ca-57e07a19cb07','true','id.token.claim'),('84aba79f-8f5a-4ce7-99ca-57e07a19cb07','String','jsonType.label'),('84aba79f-8f5a-4ce7-99ca-57e07a19cb07','lastName','user.attribute'),('84aba79f-8f5a-4ce7-99ca-57e07a19cb07','true','userinfo.token.claim'),('85f5549f-6f74-4073-95fe-294d2aded711','true','access.token.claim'),('85f5549f-6f74-4073-95fe-294d2aded711','preferred_username','claim.name'),('85f5549f-6f74-4073-95fe-294d2aded711','true','id.token.claim'),('85f5549f-6f74-4073-95fe-294d2aded711','String','jsonType.label'),('85f5549f-6f74-4073-95fe-294d2aded711','username','user.attribute'),('85f5549f-6f74-4073-95fe-294d2aded711','true','userinfo.token.claim'),('88c0fbb4-436f-4d34-8d26-5551d653060d','true','access.token.claim'),('88c0fbb4-436f-4d34-8d26-5551d653060d','family_name','claim.name'),('88c0fbb4-436f-4d34-8d26-5551d653060d','true','id.token.claim'),('88c0fbb4-436f-4d34-8d26-5551d653060d','String','jsonType.label'),('88c0fbb4-436f-4d34-8d26-5551d653060d','lastName','user.attribute'),('88c0fbb4-436f-4d34-8d26-5551d653060d','true','userinfo.token.claim'),('8bdc9535-4292-4caf-8d20-a55341b5229e','true','access.token.claim'),('8bdc9535-4292-4caf-8d20-a55341b5229e','preferred_username','claim.name'),('8bdc9535-4292-4caf-8d20-a55341b5229e','true','id.token.claim'),('8bdc9535-4292-4caf-8d20-a55341b5229e','String','jsonType.label'),('8bdc9535-4292-4caf-8d20-a55341b5229e','username','user.attribute'),('8bdc9535-4292-4caf-8d20-a55341b5229e','true','userinfo.token.claim'),('8ce6febd-9a83-404d-a4c7-bc6f8878bafb','true','access.token.claim'),('8ce6febd-9a83-404d-a4c7-bc6f8878bafb','given_name','claim.name'),('8ce6febd-9a83-404d-a4c7-bc6f8878bafb','true','id.token.claim'),('8ce6febd-9a83-404d-a4c7-bc6f8878bafb','String','jsonType.label'),('8ce6febd-9a83-404d-a4c7-bc6f8878bafb','firstName','user.attribute'),('8ce6febd-9a83-404d-a4c7-bc6f8878bafb','true','userinfo.token.claim'),('95371e74-b8ec-440f-81d1-1dc0c94b81c1','Role','attribute.name'),('95371e74-b8ec-440f-81d1-1dc0c94b81c1','Basic','attribute.nameformat'),('95371e74-b8ec-440f-81d1-1dc0c94b81c1','false','single'),('965bcea5-6016-4885-b3b4-202174b7e1a9','true','access.token.claim'),('965bcea5-6016-4885-b3b4-202174b7e1a9','email','claim.name'),('965bcea5-6016-4885-b3b4-202174b7e1a9','true','id.token.claim'),('965bcea5-6016-4885-b3b4-202174b7e1a9','String','jsonType.label'),('965bcea5-6016-4885-b3b4-202174b7e1a9','email','user.attribute'),('965bcea5-6016-4885-b3b4-202174b7e1a9','true','userinfo.token.claim'),('984df58c-c9ce-4a76-b480-e191ad572d73','true','access.token.claim'),('984df58c-c9ce-4a76-b480-e191ad572d73','locale','claim.name'),('984df58c-c9ce-4a76-b480-e191ad572d73','true','id.token.claim'),('984df58c-c9ce-4a76-b480-e191ad572d73','String','jsonType.label'),('984df58c-c9ce-4a76-b480-e191ad572d73','locale','user.attribute'),('984df58c-c9ce-4a76-b480-e191ad572d73','true','userinfo.token.claim'),('9be12b43-1fc4-49c7-8ff1-4330ecf32d96','true','access.token.claim'),('9be12b43-1fc4-49c7-8ff1-4330ecf32d96','given_name','claim.name'),('9be12b43-1fc4-49c7-8ff1-4330ecf32d96','true','id.token.claim'),('9be12b43-1fc4-49c7-8ff1-4330ecf32d96','String','jsonType.label'),('9be12b43-1fc4-49c7-8ff1-4330ecf32d96','firstName','user.attribute'),('9be12b43-1fc4-49c7-8ff1-4330ecf32d96','true','userinfo.token.claim'),('9c76829f-509f-40c5-9498-4dfe82210d58','true','access.token.claim'),('9c76829f-509f-40c5-9498-4dfe82210d58','given_name','claim.name'),('9c76829f-509f-40c5-9498-4dfe82210d58','true','id.token.claim'),('9c76829f-509f-40c5-9498-4dfe82210d58','String','jsonType.label'),('9c76829f-509f-40c5-9498-4dfe82210d58','firstName','user.attribute'),('9c76829f-509f-40c5-9498-4dfe82210d58','true','userinfo.token.claim'),('9c7accce-e0c4-4ff9-af9b-3b5d3979e56a','Role','attribute.name'),('9c7accce-e0c4-4ff9-af9b-3b5d3979e56a','Basic','attribute.nameformat'),('9c7accce-e0c4-4ff9-af9b-3b5d3979e56a','false','single'),('a0fb7810-26db-4cd3-934c-a3edbc30434b','true','access.token.claim'),('a0fb7810-26db-4cd3-934c-a3edbc30434b','true','id.token.claim'),('a6b18291-4e07-4522-b70f-a18ecefd1d98','true','access.token.claim'),('a6b18291-4e07-4522-b70f-a18ecefd1d98','family_name','claim.name'),('a6b18291-4e07-4522-b70f-a18ecefd1d98','true','id.token.claim'),('a6b18291-4e07-4522-b70f-a18ecefd1d98','String','jsonType.label'),('a6b18291-4e07-4522-b70f-a18ecefd1d98','lastName','user.attribute'),('a6b18291-4e07-4522-b70f-a18ecefd1d98','true','userinfo.token.claim'),('acf55340-6491-4e6d-a592-f42d76ccf6d6','Role','attribute.name'),('acf55340-6491-4e6d-a592-f42d76ccf6d6','Basic','attribute.nameformat'),('acf55340-6491-4e6d-a592-f42d76ccf6d6','false','single'),('af6e1dd4-d1cf-448f-910e-7c884465bcaa','true','access.token.claim'),('af6e1dd4-d1cf-448f-910e-7c884465bcaa','given_name','claim.name'),('af6e1dd4-d1cf-448f-910e-7c884465bcaa','true','id.token.claim'),('af6e1dd4-d1cf-448f-910e-7c884465bcaa','String','jsonType.label'),('af6e1dd4-d1cf-448f-910e-7c884465bcaa','firstName','user.attribute'),('af6e1dd4-d1cf-448f-910e-7c884465bcaa','true','userinfo.token.claim'),('b32e998b-ba5a-4253-b009-b7bd80db5a83','Role','attribute.name'),('b32e998b-ba5a-4253-b009-b7bd80db5a83','Basic','attribute.nameformat'),('b32e998b-ba5a-4253-b009-b7bd80db5a83','false','single'),('b37c886d-f45f-460b-bbc7-69a2321b9c81','true','access.token.claim'),('b37c886d-f45f-460b-bbc7-69a2321b9c81','preferred_username','claim.name'),('b37c886d-f45f-460b-bbc7-69a2321b9c81','true','id.token.claim'),('b37c886d-f45f-460b-bbc7-69a2321b9c81','String','jsonType.label'),('b37c886d-f45f-460b-bbc7-69a2321b9c81','username','user.attribute'),('b37c886d-f45f-460b-bbc7-69a2321b9c81','true','userinfo.token.claim'),('bb0533ed-1eda-4fdc-877b-9a83d8533120','true','access.token.claim'),('bb0533ed-1eda-4fdc-877b-9a83d8533120','email','claim.name'),('bb0533ed-1eda-4fdc-877b-9a83d8533120','true','id.token.claim'),('bb0533ed-1eda-4fdc-877b-9a83d8533120','String','jsonType.label'),('bb0533ed-1eda-4fdc-877b-9a83d8533120','email','user.attribute'),('bb0533ed-1eda-4fdc-877b-9a83d8533120','true','userinfo.token.claim'),('c82f6190-19d8-4175-9e89-c055eacabd72','true','access.token.claim'),('c82f6190-19d8-4175-9e89-c055eacabd72','email','claim.name'),('c82f6190-19d8-4175-9e89-c055eacabd72','true','id.token.claim'),('c82f6190-19d8-4175-9e89-c055eacabd72','String','jsonType.label'),('c82f6190-19d8-4175-9e89-c055eacabd72','email','user.attribute'),('c82f6190-19d8-4175-9e89-c055eacabd72','true','userinfo.token.claim'),('d2edb3b1-2241-4b9c-bce8-7d8191aff095','true','access.token.claim'),('d2edb3b1-2241-4b9c-bce8-7d8191aff095','email','claim.name'),('d2edb3b1-2241-4b9c-bce8-7d8191aff095','true','id.token.claim'),('d2edb3b1-2241-4b9c-bce8-7d8191aff095','String','jsonType.label'),('d2edb3b1-2241-4b9c-bce8-7d8191aff095','email','user.attribute'),('d2edb3b1-2241-4b9c-bce8-7d8191aff095','true','userinfo.token.claim'),('d518994b-00dc-4a0a-981d-3e2272ede0ef','true','access.token.claim'),('d518994b-00dc-4a0a-981d-3e2272ede0ef','given_name','claim.name'),('d518994b-00dc-4a0a-981d-3e2272ede0ef','true','id.token.claim'),('d518994b-00dc-4a0a-981d-3e2272ede0ef','String','jsonType.label'),('d518994b-00dc-4a0a-981d-3e2272ede0ef','firstName','user.attribute'),('d518994b-00dc-4a0a-981d-3e2272ede0ef','true','userinfo.token.claim'),('deb7e67c-2f97-423e-a25f-290e1ee4d4a3','true','access.token.claim'),('deb7e67c-2f97-423e-a25f-290e1ee4d4a3','email','claim.name'),('deb7e67c-2f97-423e-a25f-290e1ee4d4a3','true','id.token.claim'),('deb7e67c-2f97-423e-a25f-290e1ee4d4a3','String','jsonType.label'),('deb7e67c-2f97-423e-a25f-290e1ee4d4a3','email','user.attribute'),('deb7e67c-2f97-423e-a25f-290e1ee4d4a3','true','userinfo.token.claim'),('eee1f967-a7f1-4c97-a9c3-132b81a3b293','true','access.token.claim'),('eee1f967-a7f1-4c97-a9c3-132b81a3b293','true','id.token.claim'),('f14b17da-771a-4621-8362-9df6979726e3','true','access.token.claim'),('f14b17da-771a-4621-8362-9df6979726e3','preferred_username','claim.name'),('f14b17da-771a-4621-8362-9df6979726e3','true','id.token.claim'),('f14b17da-771a-4621-8362-9df6979726e3','String','jsonType.label'),('f14b17da-771a-4621-8362-9df6979726e3','username','user.attribute'),('f14b17da-771a-4621-8362-9df6979726e3','true','userinfo.token.claim'),('f47093e5-e259-4654-8b35-8e538eb195a3','true','access.token.claim'),('f47093e5-e259-4654-8b35-8e538eb195a3','true','id.token.claim'),('f6026c60-c06c-43d9-b2ee-38c6b2584214','true','access.token.claim'),('f6026c60-c06c-43d9-b2ee-38c6b2584214','preferred_username','claim.name'),('f6026c60-c06c-43d9-b2ee-38c6b2584214','true','id.token.claim'),('f6026c60-c06c-43d9-b2ee-38c6b2584214','String','jsonType.label'),('f6026c60-c06c-43d9-b2ee-38c6b2584214','username','user.attribute'),('f6026c60-c06c-43d9-b2ee-38c6b2584214','true','userinfo.token.claim'),('f8885d49-0d81-4091-95d2-adf009fc6987','true','access.token.claim'),('f8885d49-0d81-4091-95d2-adf009fc6987','true','id.token.claim');
/*!40000 ALTER TABLE `protocol_mapper_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realm`
--

DROP TABLE IF EXISTS `realm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realm` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int(11) DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int(11) DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int(11) DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint(20) DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PASSWORD_POLICY` varchar(2550) DEFAULT NULL,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int(11) DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int(11) DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int(11) DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int(11) DEFAULT '0',
  `OTP_POLICY_WINDOW` int(11) DEFAULT '1',
  `OTP_POLICY_PERIOD` int(11) DEFAULT '30',
  `OTP_POLICY_DIGITS` int(11) DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int(11) DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int(11) DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `FK_TRAF444KK6QRKMS7N56AIWQ5Y` (`MASTER_ADMIN_CLIENT`),
  CONSTRAINT `FK_TRAF444KK6QRKMS7N56AIWQ5Y` FOREIGN KEY (`MASTER_ADMIN_CLIENT`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realm`
--
-- ORDER BY:  `ID`

LOCK TABLES `realm` WRITE;
/*!40000 ALTER TABLE `realm` DISABLE KEYS */;
INSERT INTO `realm` VALUES ('master',60,300,60,NULL,NULL,NULL,'','\0',0,NULL,'master',0,'hashIterations(20000)','\0','\0','\0','\0','EXTERNAL',1800,36000,'\0','\0','efcba2f7-f725-4f7c-acc7-2766f7163b10',1800,'\0',NULL,'\0','\0','\0','\0',0,1,30,6,'HmacSHA1','totp','a7446ebd-143e-48e5-8ff1-8cb5ce9c8e48','993bbcdc-88ea-40d3-b9bc-cc7acbf23c38','220b8152-1efb-4e3d-86ff-454c350bc95f','e1d848ae-ad01-47b1-8bfe-21248a47920a','01abba30-d642-4ac9-9c6c-dcd7e3104e39',2592000,'\0',900,'','\0'),('UCOSPORTS',60,300,300,NULL,NULL,NULL,'','\0',0,NULL,'UCOSPORTS',1494000036,'hashIterations(20000)','\0','\0','\0','\0','NONE',1800,36000,'\0','\0','b53fdbc2-3bc2-403f-a3e8-fb6af868086e',1800,'\0',NULL,'\0','\0','\0','\0',0,1,30,6,'HmacSHA1','totp','9bf7c0ef-a13e-47c5-9ed0-f49a34f5586e','5da31f34-e1fc-4add-99e6-e05f1b0194be','2a3cdc1b-8644-414a-99e3-21dd7fc7fb08','68cb4187-f49f-4da9-a2df-5b002c6aab11','24df371f-5e9f-488c-a93f-da9aeae47504',2592000,'\0',900,'','\0');
/*!40000 ALTER TABLE `realm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realm_attribute`
--

DROP TABLE IF EXISTS `realm_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realm_attribute` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `FK_8SHXD6L3E9ATQUKACXGPFFPTW` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realm_attribute`
--
-- ORDER BY:  `NAME`,`REALM_ID`

LOCK TABLES `realm_attribute` WRITE;
/*!40000 ALTER TABLE `realm_attribute` DISABLE KEYS */;
INSERT INTO `realm_attribute` VALUES ('bruteForceProtected','false','master'),('bruteForceProtected','false','UCOSPORTS'),('displayName','Keycloak','master'),('displayNameHtml','<div class=\"kc-logo-text\"><span>Keycloak</span></div>','master'),('failureFactor','30','master'),('failureFactor','30','UCOSPORTS'),('maxDeltaTimeSeconds','43200','master'),('maxDeltaTimeSeconds','43200','UCOSPORTS'),('maxFailureWaitSeconds','900','master'),('maxFailureWaitSeconds','900','UCOSPORTS'),('minimumQuickLoginWaitSeconds','60','master'),('minimumQuickLoginWaitSeconds','60','UCOSPORTS'),('quickLoginCheckMilliSeconds','1000','master'),('quickLoginCheckMilliSeconds','1000','UCOSPORTS'),('waitIncrementSeconds','60','master'),('waitIncrementSeconds','60','UCOSPORTS'),('_browser_header.contentSecurityPolicy','frame-src \'self\'','master'),('_browser_header.contentSecurityPolicy','frame-src \'self\'','UCOSPORTS'),('_browser_header.xContentTypeOptions','nosniff','master'),('_browser_header.xContentTypeOptions','nosniff','UCOSPORTS'),('_browser_header.xFrameOptions','SAMEORIGIN','master'),('_browser_header.xFrameOptions','SAMEORIGIN','UCOSPORTS');
/*!40000 ALTER TABLE `realm_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realm_default_groups`
--

DROP TABLE IF EXISTS `realm_default_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realm_default_groups` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `FK_DEF_GROUPS_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `keycloak_group` (`ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realm_default_groups`
--
-- ORDER BY:  `GROUP_ID`

LOCK TABLES `realm_default_groups` WRITE;
/*!40000 ALTER TABLE `realm_default_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `realm_default_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realm_default_roles`
--

DROP TABLE IF EXISTS `realm_default_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realm_default_roles` (
  `REALM_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  UNIQUE KEY `UK_H4WPD7W4HSOOLNI3H0SW7BTJE` (`ROLE_ID`),
  KEY `FK_EVUDB1PPW84OXFAX2DRS03ICC` (`REALM_ID`),
  CONSTRAINT `FK_EVUDB1PPW84OXFAX2DRS03ICC` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`),
  CONSTRAINT `FK_H4WPD7W4HSOOLNI3H0SW7BTJE` FOREIGN KEY (`ROLE_ID`) REFERENCES `keycloak_role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realm_default_roles`
--
-- ORDER BY:  `ROLE_ID`

LOCK TABLES `realm_default_roles` WRITE;
/*!40000 ALTER TABLE `realm_default_roles` DISABLE KEYS */;
INSERT INTO `realm_default_roles` VALUES ('UCOSPORTS','246ef868-a52f-40ba-99df-a11635896a67'),('master','27dbd605-0fa5-4be5-9fa3-f173cb8951bc'),('UCOSPORTS','4d8b33fe-99c2-4296-b708-861d6a8b4354'),('master','b6a20ad9-3153-4934-b459-c9c15e539db3');
/*!40000 ALTER TABLE `realm_default_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realm_enabled_event_types`
--

DROP TABLE IF EXISTS `realm_enabled_event_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realm_enabled_event_types` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  KEY `FK_H846O4H0W8EPX5NWEDRF5Y69J` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realm_enabled_event_types`
--

LOCK TABLES `realm_enabled_event_types` WRITE;
/*!40000 ALTER TABLE `realm_enabled_event_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `realm_enabled_event_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realm_events_listeners`
--

DROP TABLE IF EXISTS `realm_events_listeners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realm_events_listeners` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  KEY `FK_H846O4H0W8EPX5NXEV9F5Y69J` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realm_events_listeners`
--

LOCK TABLES `realm_events_listeners` WRITE;
/*!40000 ALTER TABLE `realm_events_listeners` DISABLE KEYS */;
INSERT INTO `realm_events_listeners` VALUES ('master','jboss-logging'),('UCOSPORTS','jboss-logging');
/*!40000 ALTER TABLE `realm_events_listeners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realm_required_credential`
--

DROP TABLE IF EXISTS `realm_required_credential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realm_required_credential` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realm_required_credential`
--
-- ORDER BY:  `REALM_ID`,`TYPE`

LOCK TABLES `realm_required_credential` WRITE;
/*!40000 ALTER TABLE `realm_required_credential` DISABLE KEYS */;
INSERT INTO `realm_required_credential` VALUES ('password','password','','','master'),('password','password','','','UCOSPORTS');
/*!40000 ALTER TABLE `realm_required_credential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realm_smtp_config`
--

DROP TABLE IF EXISTS `realm_smtp_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realm_smtp_config` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realm_smtp_config`
--
-- ORDER BY:  `REALM_ID`,`NAME`

LOCK TABLES `realm_smtp_config` WRITE;
/*!40000 ALTER TABLE `realm_smtp_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `realm_smtp_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realm_supported_locales`
--

DROP TABLE IF EXISTS `realm_supported_locales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realm_supported_locales` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  KEY `FK_SUPPORTED_LOCALES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realm_supported_locales`
--

LOCK TABLES `realm_supported_locales` WRITE;
/*!40000 ALTER TABLE `realm_supported_locales` DISABLE KEYS */;
/*!40000 ALTER TABLE `realm_supported_locales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redirect_uris`
--

DROP TABLE IF EXISTS `redirect_uris`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redirect_uris` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  KEY `FK_1BURS8PB4OUJ97H5WUPPAHV9F` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redirect_uris`
--

LOCK TABLES `redirect_uris` WRITE;
/*!40000 ALTER TABLE `redirect_uris` DISABLE KEYS */;
INSERT INTO `redirect_uris` VALUES ('b4575469-6578-45ec-87ee-6d67ab5bf236','/auth/realms/master/account/*'),('81535c9c-7c23-4199-a976-6c20fbe1e636','/auth/admin/master/console/*'),('d8df134d-909b-4407-9546-057fa65d7441','/auth/realms/UCOSPORTS/account/*'),('125f1e4c-38c5-4e0f-8a53-d4290905139a','/auth/admin/UCOSPORTS/console/*'),('bbe84378-9c83-4064-94ed-24a30f18f6c3','http://localhost:8081/*');
/*!40000 ALTER TABLE `redirect_uris` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `required_action_config`
--

DROP TABLE IF EXISTS `required_action_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `required_action_config` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `required_action_config`
--
-- ORDER BY:  `REQUIRED_ACTION_ID`,`NAME`

LOCK TABLES `required_action_config` WRITE;
/*!40000 ALTER TABLE `required_action_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `required_action_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `required_action_provider`
--

DROP TABLE IF EXISTS `required_action_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `required_action_provider` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_REQ_ACT_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `required_action_provider`
--
-- ORDER BY:  `ID`

LOCK TABLES `required_action_provider` WRITE;
/*!40000 ALTER TABLE `required_action_provider` DISABLE KEYS */;
INSERT INTO `required_action_provider` VALUES ('0c60e96d-cbaf-4fcb-a6ff-3f02c0d9f1c8','terms_and_conditions','Terms and Conditions','UCOSPORTS','\0','\0','terms_and_conditions'),('2b7ec12a-8aca-4000-83f6-280b01de5a86','UPDATE_PASSWORD','Update Password','master','','\0','UPDATE_PASSWORD'),('3adc5783-ebdf-4aea-8203-79333d6d6e31','UPDATE_PROFILE','Update Profile','UCOSPORTS','','\0','UPDATE_PROFILE'),('4a8601ca-cfa9-4269-8c03-1ce7f6b7ac26','CONFIGURE_TOTP','Configure OTP','UCOSPORTS','','\0','CONFIGURE_TOTP'),('62f4527a-1321-4549-a221-6917e9a6feb9','VERIFY_EMAIL','Verify Email','master','','\0','VERIFY_EMAIL'),('b55c27e9-12e8-421d-8bc0-95d655c007e4','UPDATE_PASSWORD','Update Password','UCOSPORTS','','\0','UPDATE_PASSWORD'),('bdf77d08-0296-4b2f-9928-d00e9123834f','VERIFY_EMAIL','Verify Email','UCOSPORTS','','\0','VERIFY_EMAIL'),('c03021eb-ba28-42c3-9022-49edbb1c64e0','terms_and_conditions','Terms and Conditions','master','\0','\0','terms_and_conditions'),('c8c15a00-16ea-47fb-be12-dccaf1d2211c','UPDATE_PROFILE','Update Profile','master','','\0','UPDATE_PROFILE'),('cfdf0ea3-b831-46d4-a6d1-3d93bb39a0dc','CONFIGURE_TOTP','Configure OTP','master','','\0','CONFIGURE_TOTP');
/*!40000 ALTER TABLE `required_action_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_policy`
--

DROP TABLE IF EXISTS `resource_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_policy` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `FK_FRSRPP213XCX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_policy`
--
-- ORDER BY:  `RESOURCE_ID`,`POLICY_ID`

LOCK TABLES `resource_policy` WRITE;
/*!40000 ALTER TABLE `resource_policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_scope`
--

DROP TABLE IF EXISTS `resource_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_scope` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRPS213XCX4WNKOG82SSRFY` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `resource_server_resource` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `resource_server_scope` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_scope`
--
-- ORDER BY:  `RESOURCE_ID`,`SCOPE_ID`

LOCK TABLES `resource_scope` WRITE;
/*!40000 ALTER TABLE `resource_scope` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_server`
--

DROP TABLE IF EXISTS `resource_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_server` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_AU8TT6T700S9V50BU18WS5HA6` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_server`
--
-- ORDER BY:  `ID`

LOCK TABLES `resource_server` WRITE;
/*!40000 ALTER TABLE `resource_server` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_server_policy`
--

DROP TABLE IF EXISTS `resource_server_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_server_policy` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` varchar(20) DEFAULT NULL,
  `LOGIC` varchar(20) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRPO213XCX4WNKOG82SSRFY` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `resource_server` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_server_policy`
--
-- ORDER BY:  `ID`

LOCK TABLES `resource_server_policy` WRITE;
/*!40000 ALTER TABLE `resource_server_policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_server_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_server_resource`
--

DROP TABLE IF EXISTS `resource_server_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_server_resource` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `URI` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(36) NOT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSRFY` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `resource_server` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_server_resource`
--
-- ORDER BY:  `ID`

LOCK TABLES `resource_server_resource` WRITE;
/*!40000 ALTER TABLE `resource_server_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_server_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_server_scope`
--

DROP TABLE IF EXISTS `resource_server_scope`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_server_scope` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRSO213XCX4WNKOG82SSRFY` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `resource_server` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_server_scope`
--
-- ORDER BY:  `ID`

LOCK TABLES `resource_server_scope` WRITE;
/*!40000 ALTER TABLE `resource_server_scope` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_server_scope` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scope_mapping`
--

DROP TABLE IF EXISTS `scope_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scope_mapping` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `FK_P3RH9GRKU11KQFRS4FLTT7RNQ` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`),
  CONSTRAINT `FK_P3RH9GRKU11KQFRS4FLTT7RNQ` FOREIGN KEY (`ROLE_ID`) REFERENCES `keycloak_role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scope_mapping`
--
-- ORDER BY:  `CLIENT_ID`,`ROLE_ID`

LOCK TABLES `scope_mapping` WRITE;
/*!40000 ALTER TABLE `scope_mapping` DISABLE KEYS */;
INSERT INTO `scope_mapping` VALUES ('125f1e4c-38c5-4e0f-8a53-d4290905139a','fed17a81-3027-4a00-bbc7-1aef177b7401'),('81535c9c-7c23-4199-a976-6c20fbe1e636','0b04ccd0-1a8d-4c1a-8392-0891905165ea'),('b5dedaa1-72ef-44d2-b46c-396c47932111','fed17a81-3027-4a00-bbc7-1aef177b7401'),('c2a4c629-9e85-4345-9536-da8c0ba928e4','0b04ccd0-1a8d-4c1a-8392-0891905165ea');
/*!40000 ALTER TABLE `scope_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scope_policy`
--

DROP TABLE IF EXISTS `scope_policy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scope_policy` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `FK_FRSRASP13XCX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `resource_server_policy` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `resource_server_scope` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scope_policy`
--
-- ORDER BY:  `SCOPE_ID`,`POLICY_ID`

LOCK TABLES `scope_policy` WRITE;
/*!40000 ALTER TABLE `scope_policy` DISABLE KEYS */;
/*!40000 ALTER TABLE `scope_policy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `template_scope_mapping`
--

DROP TABLE IF EXISTS `template_scope_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_scope_mapping` (
  `TEMPLATE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`TEMPLATE_ID`,`ROLE_ID`),
  KEY `FK_TEMPL_SCOPE_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_TEMPL_SCOPE_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `keycloak_role` (`ID`),
  CONSTRAINT `FK_TEMPL_SCOPE_TEMPL` FOREIGN KEY (`TEMPLATE_ID`) REFERENCES `client_template` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `template_scope_mapping`
--
-- ORDER BY:  `TEMPLATE_ID`,`ROLE_ID`

LOCK TABLES `template_scope_mapping` WRITE;
/*!40000 ALTER TABLE `template_scope_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `template_scope_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_attribute`
--

DROP TABLE IF EXISTS `user_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_attribute` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_attribute`
--
-- ORDER BY:  `ID`

LOCK TABLES `user_attribute` WRITE;
/*!40000 ALTER TABLE `user_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_consent`
--

DROP TABLE IF EXISTS `user_consent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_consent` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_consent`
--
-- ORDER BY:  `ID`

LOCK TABLES `user_consent` WRITE;
/*!40000 ALTER TABLE `user_consent` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_consent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_consent_prot_mapper`
--

DROP TABLE IF EXISTS `user_consent_prot_mapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_consent_prot_mapper` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`PROTOCOL_MAPPER_ID`),
  KEY `IDX_CONSENT_PROTMAPPER` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_PRM_GR` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `user_consent` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_consent_prot_mapper`
--
-- ORDER BY:  `USER_CONSENT_ID`,`PROTOCOL_MAPPER_ID`

LOCK TABLES `user_consent_prot_mapper` WRITE;
/*!40000 ALTER TABLE `user_consent_prot_mapper` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_consent_prot_mapper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_consent_role`
--

DROP TABLE IF EXISTS `user_consent_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_consent_role` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`ROLE_ID`),
  KEY `IDX_CONSENT_ROLE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_ROLE_GR` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `user_consent` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_consent_role`
--
-- ORDER BY:  `USER_CONSENT_ID`,`ROLE_ID`

LOCK TABLES `user_consent_role` WRITE;
/*!40000 ALTER TABLE `user_consent_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_consent_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_entity`
--

DROP TABLE IF EXISTS `user_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_entity` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_entity`
--
-- ORDER BY:  `ID`

LOCK TABLES `user_entity` WRITE;
/*!40000 ALTER TABLE `user_entity` DISABLE KEYS */;
INSERT INTO `user_entity` VALUES ('6333f35b-a719-4400-98b6-b0cf0c251733',NULL,'b82f7e31-4aee-472a-9bd5-876ff8a573d3','\0','',NULL,NULL,NULL,'master','admin',1493998664959,NULL),('9cf54475-a357-42ed-ba3f-785d10ad276a',NULL,'f36c38c1-0a04-4b36-844b-d3ec70ffab5c','\0','',NULL,NULL,NULL,'UCOSPORTS','admin',1493999971640,NULL),('dc756918-6211-4b6b-b04a-811fd4f7dace',NULL,'6dd4ef13-0b2e-4e59-b32c-46752c0770df','\0','',NULL,NULL,NULL,'UCOSPORTS','crisman999',1493999617257,NULL);
/*!40000 ALTER TABLE `user_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_federation_config`
--

DROP TABLE IF EXISTS `user_federation_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_federation_config` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `user_federation_provider` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_federation_config`
--
-- ORDER BY:  `USER_FEDERATION_PROVIDER_ID`,`NAME`

LOCK TABLES `user_federation_config` WRITE;
/*!40000 ALTER TABLE `user_federation_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_federation_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_federation_mapper`
--

DROP TABLE IF EXISTS `user_federation_mapper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_federation_mapper` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_FEDMAPPERPM_REALM` (`REALM_ID`),
  KEY `FK_FEDMAPPERPM_FEDPRV` (`FEDERATION_PROVIDER_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `user_federation_provider` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_federation_mapper`
--
-- ORDER BY:  `ID`

LOCK TABLES `user_federation_mapper` WRITE;
/*!40000 ALTER TABLE `user_federation_mapper` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_federation_mapper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_federation_mapper_config`
--

DROP TABLE IF EXISTS `user_federation_mapper_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_federation_mapper_config` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `user_federation_mapper` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_federation_mapper_config`
--
-- ORDER BY:  `USER_FEDERATION_MAPPER_ID`,`NAME`

LOCK TABLES `user_federation_mapper_config` WRITE;
/*!40000 ALTER TABLE `user_federation_mapper_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_federation_mapper_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_federation_provider`
--

DROP TABLE IF EXISTS `user_federation_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_federation_provider` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int(11) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int(11) DEFAULT NULL,
  `LAST_SYNC` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_1FJ32F6PTOLW2QY60CD8N01E8` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `realm` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_federation_provider`
--
-- ORDER BY:  `ID`

LOCK TABLES `user_federation_provider` WRITE;
/*!40000 ALTER TABLE `user_federation_provider` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_federation_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_group_membership`
--

DROP TABLE IF EXISTS `user_group_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_group_membership` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_group_membership`
--
-- ORDER BY:  `GROUP_ID`,`USER_ID`

LOCK TABLES `user_group_membership` WRITE;
/*!40000 ALTER TABLE `user_group_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_group_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_required_action`
--

DROP TABLE IF EXISTS `user_required_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_required_action` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_required_action`
--
-- ORDER BY:  `REQUIRED_ACTION`,`USER_ID`

LOCK TABLES `user_required_action` WRITE;
/*!40000 ALTER TABLE `user_required_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_required_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role_mapping`
--

DROP TABLE IF EXISTS `user_role_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role_mapping` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `user_entity` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role_mapping`
--
-- ORDER BY:  `ROLE_ID`,`USER_ID`

LOCK TABLES `user_role_mapping` WRITE;
/*!40000 ALTER TABLE `user_role_mapping` DISABLE KEYS */;
INSERT INTO `user_role_mapping` VALUES ('0b04ccd0-1a8d-4c1a-8392-0891905165ea','6333f35b-a719-4400-98b6-b0cf0c251733'),('246ef868-a52f-40ba-99df-a11635896a67','9cf54475-a357-42ed-ba3f-785d10ad276a'),('246ef868-a52f-40ba-99df-a11635896a67','dc756918-6211-4b6b-b04a-811fd4f7dace'),('2507a1e8-33fe-4b6e-afb2-d4be4e11c5a9','dc756918-6211-4b6b-b04a-811fd4f7dace'),('27dbd605-0fa5-4be5-9fa3-f173cb8951bc','6333f35b-a719-4400-98b6-b0cf0c251733'),('299bf21b-5895-4011-88c8-022e5404145a','6333f35b-a719-4400-98b6-b0cf0c251733'),('4d8b33fe-99c2-4296-b708-861d6a8b4354','9cf54475-a357-42ed-ba3f-785d10ad276a'),('4d8b33fe-99c2-4296-b708-861d6a8b4354','dc756918-6211-4b6b-b04a-811fd4f7dace'),('7eb82ac0-4908-44a5-8e2c-4ed93afec2e8','9cf54475-a357-42ed-ba3f-785d10ad276a'),('7eb82ac0-4908-44a5-8e2c-4ed93afec2e8','dc756918-6211-4b6b-b04a-811fd4f7dace'),('b4d37a8b-674a-4301-9862-ce8c656caee5','9cf54475-a357-42ed-ba3f-785d10ad276a'),('b4d37a8b-674a-4301-9862-ce8c656caee5','dc756918-6211-4b6b-b04a-811fd4f7dace'),('b6a20ad9-3153-4934-b459-c9c15e539db3','6333f35b-a719-4400-98b6-b0cf0c251733'),('ece49bda-656b-4d7a-bac3-481cc9cec854','6333f35b-a719-4400-98b6-b0cf0c251733'),('fc05b19c-bf03-4b46-a27d-eecf7d5b0041','9cf54475-a357-42ed-ba3f-785d10ad276a'),('fc05b19c-bf03-4b46-a27d-eecf7d5b0041','dc756918-6211-4b6b-b04a-811fd4f7dace');
/*!40000 ALTER TABLE `user_role_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_session`
--

DROP TABLE IF EXISTS `user_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_session` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int(11) DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int(11) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int(11) DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_session`
--
-- ORDER BY:  `ID`

LOCK TABLES `user_session` WRITE;
/*!40000 ALTER TABLE `user_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_session_note`
--

DROP TABLE IF EXISTS `user_session_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_session_note` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `user_session` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_session_note`
--
-- ORDER BY:  `USER_SESSION`,`NAME`

LOCK TABLES `user_session_note` WRITE;
/*!40000 ALTER TABLE `user_session_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_session_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `username_login_failure`
--

DROP TABLE IF EXISTS `username_login_failure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `username_login_failure` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int(11) DEFAULT NULL,
  `LAST_FAILURE` bigint(20) DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int(11) DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `username_login_failure`
--
-- ORDER BY:  `REALM_ID`,`USERNAME`

LOCK TABLES `username_login_failure` WRITE;
/*!40000 ALTER TABLE `username_login_failure` DISABLE KEYS */;
/*!40000 ALTER TABLE `username_login_failure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_origins`
--

DROP TABLE IF EXISTS `web_origins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_origins` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  KEY `FK_LOJPHO213XCX4WNKOG82SSRFY` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `client` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_origins`
--

LOCK TABLES `web_origins` WRITE;
/*!40000 ALTER TABLE `web_origins` DISABLE KEYS */;
INSERT INTO `web_origins` VALUES ('bbe84378-9c83-4064-94ed-24a30f18f6c3','*');
/*!40000 ALTER TABLE `web_origins` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-05 11:06:57

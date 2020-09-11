-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: mamute
-- ------------------------------------------------------
-- Server version	5.7.4-m14

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
-- Table structure for table `Answer`
--

DROP TABLE IF EXISTS `Answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Answer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT NULL,
  `lastUpdatedAt` datetime DEFAULT NULL,
  `invisible` tinyint(1) NOT NULL,
  `voteCount` bigint(20) NOT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  `information_id` bigint(20) NOT NULL,
  `lastTouchedBy_id` bigint(20) DEFAULT NULL,
  `question_id` bigint(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_3q5s4b88xp78n3c49dtxfs97e` (`author_id`),
  KEY `FK_dshhxt02iww0fxkl2li8l3ao2` (`information_id`),
  KEY `FK_drifk8pp2s7wsh57nvwna9m1g` (`lastTouchedBy_id`),
  KEY `FK_10g8xii7lw9kq0kcsobgmtw72` (`question_id`),
  CONSTRAINT `FK_10g8xii7lw9kq0kcsobgmtw72` FOREIGN KEY (`question_id`) REFERENCES `Question` (`id`),
  CONSTRAINT `FK_3q5s4b88xp78n3c49dtxfs97e` FOREIGN KEY (`author_id`) REFERENCES `Users` (`id`),
  CONSTRAINT `FK_drifk8pp2s7wsh57nvwna9m1g` FOREIGN KEY (`lastTouchedBy_id`) REFERENCES `Users` (`id`),
  CONSTRAINT `FK_dshhxt02iww0fxkl2li8l3ao2` FOREIGN KEY (`information_id`) REFERENCES `AnswerInformation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Answer`
--

LOCK TABLES `Answer` WRITE;
/*!40000 ALTER TABLE `Answer` DISABLE KEYS */;
INSERT INTO `Answer` VALUES (8,'2020-09-07 08:14:26','2020-09-07 08:14:26',0,0,1002,9,1002,216,0),(9,'2020-09-07 10:47:16','2020-09-07 10:47:16',0,0,1002,10,1002,208,0),(10,'2020-09-07 10:50:09','2020-09-07 10:51:40',0,0,1002,12,1002,209,0),(11,'2020-09-07 10:53:15','2020-09-07 10:53:15',0,0,1002,13,1002,207,0),(12,'2020-09-07 10:55:20','2020-09-07 10:55:20',0,0,1002,14,1002,206,0),(13,'2020-09-07 10:56:51','2020-09-07 10:58:03',0,0,1002,16,1002,210,0),(14,'2020-09-07 11:20:42','2020-09-07 11:20:42',0,0,1002,17,1002,217,0),(15,'2020-09-09 09:16:58','2020-09-09 09:16:58',0,0,1002,18,1002,218,0),(16,'2020-09-09 09:18:53','2020-09-10 01:01:45',0,0,1002,20,1002,219,0),(17,'2020-09-11 22:41:41','2020-09-11 22:42:10',0,0,1002,22,1002,220,0),(18,'2020-09-11 22:49:24','2020-09-11 22:49:24',0,0,1002,23,1002,221,0),(19,'2020-09-11 22:56:46','2020-09-11 22:57:12',0,0,1002,25,1002,222,0),(20,'2020-09-11 23:07:57','2020-09-11 23:09:28',0,0,1002,27,1002,223,0),(21,'2020-09-11 23:10:54','2020-09-11 23:10:54',0,0,1002,28,1002,224,0);
/*!40000 ALTER TABLE `Answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AnswerInformation`
--

DROP TABLE IF EXISTS `AnswerInformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AnswerInformation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` longtext NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `description` longtext NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `markedDescription` longtext,
  `moderatedAt` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `answer_id` bigint(20) DEFAULT NULL,
  `author_id` bigint(20) NOT NULL,
  `moderatedBy_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_lecgqmqj00d06wb8nwaq60rpr` (`answer_id`),
  KEY `FK_237rcoro0n05xyxjga1ip7pd8` (`author_id`),
  KEY `FK_dbuximcggdn5k2j9svvpwtxrm` (`moderatedBy_id`),
  CONSTRAINT `FK_237rcoro0n05xyxjga1ip7pd8` FOREIGN KEY (`author_id`) REFERENCES `Users` (`id`),
  CONSTRAINT `FK_dbuximcggdn5k2j9svvpwtxrm` FOREIGN KEY (`moderatedBy_id`) REFERENCES `Users` (`id`),
  CONSTRAINT `FK_lecgqmqj00d06wb8nwaq60rpr` FOREIGN KEY (`answer_id`) REFERENCES `Answer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AnswerInformation`
--

LOCK TABLES `AnswerInformation` WRITE;
/*!40000 ALTER TABLE `AnswerInformation` DISABLE KEYS */;
INSERT INTO `AnswerInformation` VALUES (9,'new answer','2020-09-07 08:14:26','```sql\r\nSELECT DISTINCT pr.principal_id, pr.name, pr.type_desc, \r\n    pr.authentication_type_desc, pe.state_desc, pe.permission_name\r\nFROM sys.database_principals AS pr\r\nJOIN sys.database_permissions AS pe\r\n    ON pe.grantee_principal_id = pr.principal_id;\r\n```','172.17.0.1','<pre class=\"prettyprint\"><code>SELECT DISTINCT pr.principal_id, pr.name, pr.type_desc, \n    pr.authentication_type_desc, pe.state_desc, pe.permission_name\nFROM sys.database_principals AS pr\nJOIN sys.database_permissions AS pe\n    ON pe.grantee_principal_id &#61; pr.principal_id;</code></pre>\n',NULL,'NO_NEED_TO_APPROVE',8,1002,NULL),(10,'new answer','2020-09-07 10:47:16','`docker exec -it <containerId/name> ls`','82.3.47.68','<p><code>docker exec -it &lt;containerId/name&gt; ls</code></p>\n',NULL,'NO_NEED_TO_APPROVE',9,1002,NULL),(11,'new answer','2020-09-07 10:50:09','> dont forget the forward slash for multi part names. bit* is not the same as bit*\\*\r\n\r\ndocker images --filter=reference=\'bit*/*:*\'\r\n\r\nassuming the following images on my system, if i were to execute the above command:\r\n\r\n```\r\nbitwarden/one:1.0\r\nbitwarden/onepointfive:1.5\r\nbitwarden/two:2.0\r\nsomething/else:latest\r\n```\r\n\r\nI would expect the results:\r\n\r\n```\r\nbitwarden/one:1.0\r\nbitwarden/onepointfive:1.5\r\nbitwarden/two:2.0\r\n```\r\n','82.3.47.68','<blockquote>\n<p>dont forget the forward slash for multi part names. bit<em> is not the same as bit</em>*</p>\n</blockquote>\n<p>docker images --filter&#61;reference&#61;&#39;bit<em>/</em>:*&#39;</p>\n<p>assuming the following images on my system, if i were to execute the above command:</p>\n<pre class=\"prettyprint\"><code>bitwarden/one:1.0\nbitwarden/onepointfive:1.5\nbitwarden/two:2.0\nsomething/else:latest</code></pre>\n<p>I would expect the results:</p>\n<pre class=\"prettyprint\"><code>bitwarden/one:1.0\nbitwarden/onepointfive:1.5\nbitwarden/two:2.0</code></pre>\n',NULL,'NO_NEED_TO_APPROVE',10,1002,NULL),(12,'information about slashes in the wildcard','2020-09-07 10:51:39','\r\ndocker images --filter=reference=\'bit*/*:*\'\r\n\r\nassuming the following images on my system, if i were to execute the above command:\r\n\r\n```\r\nbitwarden/one:1.0\r\nbitwarden/onepointfive:1.5\r\nbitwarden/two:2.0\r\nsomething/else:latest\r\n```\r\n\r\nI would expect the results:\r\n\r\n```\r\nbitwarden/one:1.0\r\nbitwarden/onepointfive:1.5\r\nbitwarden/two:2.0\r\n```\r\n\r\nexecuting the command `docker images --filter=reference=\'bit*\'` would yield zero results because of the forward slash for multi part names. bit* is not the same as bit*\\*\r\n','82.3.47.68','<p>docker images --filter&#61;reference&#61;&#39;bit<em>/</em>:*&#39;</p>\n<p>assuming the following images on my system, if i were to execute the above command:</p>\n<pre class=\"prettyprint\"><code>bitwarden/one:1.0\nbitwarden/onepointfive:1.5\nbitwarden/two:2.0\nsomething/else:latest</code></pre>\n<p>I would expect the results:</p>\n<pre class=\"prettyprint\"><code>bitwarden/one:1.0\nbitwarden/onepointfive:1.5\nbitwarden/two:2.0</code></pre>\n<p>executing the command <code>docker images --filter&#61;reference&#61;&#39;bit*&#39;</code> would yield zero results because of the forward slash for multi part names. bit<em> is not the same as bit</em>*</p>\n',NULL,'NO_NEED_TO_APPROVE',10,1002,NULL),(13,'new answer','2020-09-07 10:53:15','\r\n## copy from the container to the host\r\n\r\n```\r\ndocker cp <containerId>:/file/path/within/container /host/path/target\r\n```\r\n\r\n\r\n## copy from the host to the container\r\n\r\n```\r\ndocker cp my.file <containerId>:/home/dir1\r\n```','82.3.47.68','<h2>copy from the container to the host</h2>\n<pre class=\"prettyprint\"><code>docker cp &lt;containerId&gt;:/file/path/within/container /host/path/target</code></pre>\n<h2>copy from the host to the container</h2>\n<pre class=\"prettyprint\"><code>docker cp my.file &lt;containerId&gt;:/home/dir1</code></pre>\n',NULL,'NO_NEED_TO_APPROVE',11,1002,NULL),(14,'new answer','2020-09-07 10:55:20','there are a few ways:\r\n\r\nthis command will remove dangling containers\r\n\r\n```\r\ndocker rm $(docker images -f \"dangling=true\" -q)\r\n```\r\n\r\nthis command will remove dangling images\r\n\r\n```\r\ndocker rmi $(docker images -f \"dangling=true\" -q)\r\n```\r\n\r\nor the simpler way is\r\n\r\n```\r\ndocker system prune\r\n```\r\n\r\n\r\n','82.3.47.68','<p>there are a few ways:</p>\n<p>this command will remove dangling containers</p>\n<pre class=\"prettyprint\"><code>docker rm $(docker images -f &#34;dangling&#61;true&#34; -q)</code></pre>\n<p>this command will remove dangling images</p>\n<pre class=\"prettyprint\"><code>docker rmi $(docker images -f &#34;dangling&#61;true&#34; -q)</code></pre>\n<p>or the simpler way is</p>\n<pre class=\"prettyprint\"><code>docker system prune</code></pre>\n',NULL,'NO_NEED_TO_APPROVE',12,1002,NULL),(15,'new answer','2020-09-07 10:56:51','collects trace information from the os and base classes of your application. you can further enhance this output by adding your own trace information, but the information out of the box is generally enough to resolve issues.\r\n\r\n    install the dotnet trace tool: dotnet tool install -g dotnet-trace\r\n    run the application you want to trace\r\n    list all running trace enabled processes: dotnet trace ps\r\n    trace the process: dotnet trace collect -p <process id>\r\n    when you are finished with tracing you will have a .nettrace file which can be viewed in visual studio. alternatively, you can change this format to speedscope format and run it through www.speedscope.app: dotnet trace convert trace.nettrace --format speedscope\r\n\r\n[source](https://docs.microsoft.com/en-us/dotnet/core/diagnostics/dotnet-trace)','82.3.47.68','<p>collects trace information from the os and base classes of your application. you can further enhance this output by adding your own trace information, but the information out of the box is generally enough to resolve issues.</p>\n<p>    install the dotnet trace tool: dotnet tool install -g dotnet-trace\n    run the application you want to trace\n    list all running trace enabled processes: dotnet trace ps\n    trace the process: dotnet trace collect -p \n    when you are finished with tracing you will have a .nettrace file which can be viewed in visual studio. alternatively, you can change this format to speedscope format and run it through www.speedscope.app: dotnet trace convert trace.nettrace --format speedscope</p>\n<p><a href=\"https://docs.microsoft.com/en-us/dotnet/core/diagnostics/dotnet-trace\" target=\"_blank\" rel=\"nofollow\">source</a></p>\n',NULL,'NO_NEED_TO_APPROVE',13,1002,NULL),(16,'formatted response','2020-09-07 10:58:03','the `dotnet trace` command collects trace information from the os and base classes of your application. you can further enhance this output by adding your own trace information, but the information out of the box is generally enough to resolve issues.\r\n\r\n- install the dotnet trace tool: dotnet tool install -g dotnet-trace\r\n- run the application you want to trace\r\n- list all running trace enabled processes: dotnet trace ps\r\n- trace the process: dotnet trace collect -p <process id>\r\n- when you are finished with tracing you will have a .nettrace file which can be viewed in visual studio. alternatively, you can change this format to speedscope format and run it through www.speedscope.app: dotnet trace convert trace.nettrace --format speedscope\r\n\r\n[source](https://docs.microsoft.com/en-us/dotnet/core/diagnostics/dotnet-trace)','82.3.47.68','<p>the <code>dotnet trace</code> command collects trace information from the os and base classes of your application. you can further enhance this output by adding your own trace information, but the information out of the box is generally enough to resolve issues.</p>\n<ul><li>install the dotnet trace tool: dotnet tool install -g dotnet-trace</li><li>run the application you want to trace</li><li>list all running trace enabled processes: dotnet trace ps</li><li>trace the process: dotnet trace collect -p </li><li>when you are finished with tracing you will have a .nettrace file which can be viewed in visual studio. alternatively, you can change this format to speedscope format and run it through www.speedscope.app: dotnet trace convert trace.nettrace --format speedscope</li></ul>\n<p><a href=\"https://docs.microsoft.com/en-us/dotnet/core/diagnostics/dotnet-trace\" target=\"_blank\" rel=\"nofollow\">source</a></p>\n',NULL,'NO_NEED_TO_APPROVE',13,1002,NULL),(17,'new answer','2020-09-07 11:20:42','assuming a linux host:\r\n\r\n```\r\n# install docker\r\nsudo apt install docker.io\r\n\r\n# create the docker user group\r\nsudo groupadd docker\r\n\r\n# add the user to the docker group\r\nsudo usermod -aG docker $USER\r\n```\r\n\r\ncheck the version `docker version`\r\n\r\n[source](https://docs.docker.com/engine/install/linux-postinstall/)','82.3.47.68','<p>assuming a linux host:</p>\n<pre class=\"prettyprint\"><code># install docker\nsudo apt install docker.io\n\n# create the docker user group\nsudo groupadd docker\n\n# add the user to the docker group\nsudo usermod -aG docker $USER</code></pre>\n<p>check the version <code>docker version</code></p>\n<p><a href=\"https://docs.docker.com/engine/install/linux-postinstall/\" target=\"_blank\" rel=\"nofollow\">source</a></p>\n',NULL,'NO_NEED_TO_APPROVE',14,1002,NULL),(18,'new answer','2020-09-09 09:16:58','[source](https://docs.microsoft.com/en-us/azure/container-registry/container-registry-get-started-docker-cli#push-the-image-to-your-registry)\r\n\r\nfirst log into the registry:\r\n\r\n```\r\naz acr login --name myregistry\r\n```\r\n\r\nor\r\n\r\n```\r\ndocker login myregistry.azurecr.io\r\n```\r\n\r\nthen tag your local image to the registry:\r\n\r\n```\r\ndocker tag <image_name> myregistry.azurecr.io/<image_name>\r\n```\r\n\r\nthen push the image into the registry:\r\n\r\n```\r\ndocker push myregistry.azurecr.io/<image_name>\r\n```\r\n','82.3.47.68','<p><a href=\"https://docs.microsoft.com/en-us/azure/container-registry/container-registry-get-started-docker-cli#push-the-image-to-your-registry\" target=\"_blank\" rel=\"nofollow\">source</a></p>\n<p>first log into the registry:</p>\n<pre class=\"prettyprint\"><code>az acr login --name myregistry</code></pre>\n<p>or</p>\n<pre class=\"prettyprint\"><code>docker login myregistry.azurecr.io</code></pre>\n<p>then tag your local image to the registry:</p>\n<pre class=\"prettyprint\"><code>docker tag &lt;image_name&gt; myregistry.azurecr.io/&lt;image_name&gt;</code></pre>\n<p>then push the image into the registry:</p>\n<pre class=\"prettyprint\"><code>docker push myregistry.azurecr.io/&lt;image_name&gt;</code></pre>\n',NULL,'NO_NEED_TO_APPROVE',15,1002,NULL),(19,'new answer','2020-09-09 09:18:53','you need to use a configuration/environment variable called:\r\n\r\n```\r\nWEBSITE_PORTS\r\n```\r\n\r\nset it to be the port number you want to expose from the docker container','82.3.47.68','<p>you need to use a configuration/environment variable called:</p>\n<pre class=\"prettyprint\"><code>WEBSITE_PORTS</code></pre>\n<p>set it to be the port number you want to expose from the docker container</p>\n',NULL,'NO_NEED_TO_APPROVE',16,1002,NULL),(20,'spelling mistake','2020-09-10 01:01:45','you need to use a configuration/environment variable called:\r\n\r\n```\r\nWEBSITES_PORT\r\n```\r\n\r\nset it to be the port number you want to expose from the docker container\r\n\r\n[source](https://docs.microsoft.com/en-us/azure/app-service/faq-app-service-linux#custom-containers)','82.3.47.68','<p>you need to use a configuration/environment variable called:</p>\n<pre class=\"prettyprint\"><code>WEBSITES_PORT</code></pre>\n<p>set it to be the port number you want to expose from the docker container</p>\n<p><a href=\"https://docs.microsoft.com/en-us/azure/app-service/faq-app-service-linux#custom-containers\" target=\"_blank\" rel=\"nofollow\">source</a></p>\n',NULL,'NO_NEED_TO_APPROVE',16,1002,NULL),(21,'new answer','2020-09-11 22:41:41','this assumes you are using ms sql server.  it basically just needs a specific collation.  a case sentitive (CS) and accent sensitive (AS) collation\r\n\r\nyou could create a database like:\r\n\r\n```\r\nCREATE DATABASE sonar COLLATE SQL_Latin1_General_CP1_CS_AS;\r\n``\r\n\r\nor alter an existing one:\r\n\r\n```\r\n\r\nALTER DATABASE sonar COLLATE SQL_Latin1_General_CP1_CS_AS;\r\n```\r\n\r\nyou can check the collation you have set by running:\r\n\r\n```\r\nSELECT name, database_id, create_date, compatibility_level, collation_name  from sys.databases;\r\n```\r\n\r\nyou can list all collations with: \r\n\r\n```\r\nSELECT * FROM ::fn_helpcollations()\r\n```\r\n\r\ni also found that my database creation completed with a `closed` database which i had to remedy with:\r\n\r\n```\r\nALTER DATABASE sonar set auto_close OFF\r\n```\r\n\r\nyou can also check the version of ms sql server that is running with:\r\n\r\n```\r\nSELECT SERVERPROPERTY(\'productversion\'), SERVERPROPERTY(\'productlevel\'), SERVERPROPERTY(\'edition\')\r\n```\r\n\r\n','82.3.47.68','<p>this assumes you are using ms sql server.  it basically just needs a specific collation.  a case sentitive (CS) and accent sensitive (AS) collation</p>\n<p>you could create a database like:</p>\n<pre class=\"prettyprint\"><code>CREATE DATABASE sonar COLLATE SQL_Latin1_General_CP1_CS_AS;\n&#96;&#96;\n\nor alter an existing one:</code></pre>\n<p>ALTER DATABASE sonar COLLATE SQL_Latin1_General_CP1_CS_AS;</p>\n<pre class=\"prettyprint\"><code>\nyou can check the collation you have set by running:</code></pre>\n<p>SELECT name, database_id, create_date, compatibility_level, collation_name  from sys.databases;</p>\n<pre class=\"prettyprint\"><code>\nyou can list all collations with:</code></pre>\n<p>SELECT * FROM ::fn_helpcollations()</p>\n<pre class=\"prettyprint\"><code>\ni also found that my database creation completed with a &#96;closed&#96; database which i had to remedy with:</code></pre>\n<p>ALTER DATABASE sonar set auto_close OFF</p>\n<pre class=\"prettyprint\"><code>\nyou can also check the version of ms sql server that is running with:</code></pre>\n<p>SELECT SERVERPROPERTY(&#39;productversion&#39;), SERVERPROPERTY(&#39;productlevel&#39;), SERVERPROPERTY(&#39;edition&#39;)\n&#96;&#96;&#96;</p>\n',NULL,'NO_NEED_TO_APPROVE',17,1002,NULL),(22,'bad formatting','2020-09-11 22:42:10','this assumes you are using ms sql server.  it basically just needs a specific collation.  a case sentitive (CS) and accent sensitive (AS) collation\r\n\r\nyou could create a database like:\r\n\r\n```\r\nCREATE DATABASE sonar COLLATE SQL_Latin1_General_CP1_CS_AS;\r\n```\r\n\r\nor alter an existing one:\r\n\r\n```\r\n\r\nALTER DATABASE sonar COLLATE SQL_Latin1_General_CP1_CS_AS;\r\n```\r\n\r\nyou can check the collation you have set by running:\r\n\r\n```\r\nSELECT name, database_id, create_date, compatibility_level, collation_name  from sys.databases;\r\n```\r\n\r\nyou can list all collations with: \r\n\r\n```\r\nSELECT * FROM ::fn_helpcollations()\r\n```\r\n\r\ni also found that my database creation completed with a `closed` database which i had to remedy with:\r\n\r\n```\r\nALTER DATABASE sonar set auto_close OFF\r\n```\r\n\r\nyou can also check the version of ms sql server that is running with:\r\n\r\n```\r\nSELECT SERVERPROPERTY(\'productversion\'), SERVERPROPERTY(\'productlevel\'), SERVERPROPERTY(\'edition\')\r\n```\r\n\r\n','82.3.47.68','<p>this assumes you are using ms sql server.  it basically just needs a specific collation.  a case sentitive (CS) and accent sensitive (AS) collation</p>\n<p>you could create a database like:</p>\n<pre class=\"prettyprint\"><code>CREATE DATABASE sonar COLLATE SQL_Latin1_General_CP1_CS_AS;</code></pre>\n<p>or alter an existing one:</p>\n<pre class=\"prettyprint\"><code>\nALTER DATABASE sonar COLLATE SQL_Latin1_General_CP1_CS_AS;</code></pre>\n<p>you can check the collation you have set by running:</p>\n<pre class=\"prettyprint\"><code>SELECT name, database_id, create_date, compatibility_level, collation_name  from sys.databases;</code></pre>\n<p>you can list all collations with: </p>\n<pre class=\"prettyprint\"><code>SELECT * FROM ::fn_helpcollations()</code></pre>\n<p>i also found that my database creation completed with a <code>closed</code> database which i had to remedy with:</p>\n<pre class=\"prettyprint\"><code>ALTER DATABASE sonar set auto_close OFF</code></pre>\n<p>you can also check the version of ms sql server that is running with:</p>\n<pre class=\"prettyprint\"><code>SELECT SERVERPROPERTY(&#39;productversion&#39;), SERVERPROPERTY(&#39;productlevel&#39;), SERVERPROPERTY(&#39;edition&#39;)</code></pre>\n',NULL,'NO_NEED_TO_APPROVE',17,1002,NULL),(23,'new answer','2020-09-11 22:49:24','\r\nbig scary error has a relatively small timid answer.  speech marks.\r\n\r\nBad:\r\n\r\n```\r\n- SONARQUBE_JDBC_URL=\"jdbc:sqlserver://10.1.2.3/sonar\"\r\n```\r\n\r\nGood:\r\n\r\n```\r\n- SONARQUBE_JDBC_URL=jdbc:sqlserver://10.1.2.3/sonar\r\n```','82.3.47.68','<p>big scary error has a relatively small timid answer.  speech marks.</p>\n<p>Bad:</p>\n<pre class=\"prettyprint\"><code>- SONARQUBE_JDBC_URL&#61;&#34;jdbc:sqlserver://10.1.2.3/sonar&#34;</code></pre>\n<p>Good:</p>\n<pre class=\"prettyprint\"><code>- SONARQUBE_JDBC_URL&#61;jdbc:sqlserver://10.1.2.3/sonar</code></pre>\n',NULL,'NO_NEED_TO_APPROVE',18,1002,NULL),(24,'new answer','2020-09-11 22:56:46','this is related to the elasticsearch requirements as documents [here](https://hub.docker.com/_/sonarqube/?tab=description).\r\n\r\nyou can check the current settings on the linux host by running:\r\n\r\n```\r\nsysctl vm.max_map_count\r\nsysctl fs.file-max\r\nulimit -n\r\nulimit -u\r\n```\r\n\r\nyou can set them with teh four commands:\r\n\r\n```\r\nsysctl -w vm.max_map_count=524288\r\nsysctl -w fs.file-max=131072\r\nulimit -n 131072\r\nulimit -u 8192\r\n```','82.3.47.68','<p>this is related to the elasticsearch requirements as documents <a href=\"https://hub.docker.com/_/sonarqube/?tab&#61;description\" target=\"_blank\" rel=\"nofollow\">here</a>.</p>\n<p>you can check the current settings on the linux host by running:</p>\n<pre class=\"prettyprint\"><code>sysctl vm.max_map_count\nsysctl fs.file-max\nulimit -n\nulimit -u</code></pre>\n<p>you can set them with teh four commands:</p>\n<pre class=\"prettyprint\"><code>sysctl -w vm.max_map_count&#61;524288\nsysctl -w fs.file-max&#61;131072\nulimit -n 131072\nulimit -u 8192</code></pre>\n',NULL,'NO_NEED_TO_APPROVE',19,1002,NULL),(25,'spelling mistake','2020-09-11 22:57:12','this is related to the elasticsearch requirements as documents [here](https://hub.docker.com/_/sonarqube/?tab=description).\r\n\r\nyou can check the current settings on the linux host by running:\r\n\r\n```\r\nsysctl vm.max_map_count\r\nsysctl fs.file-max\r\nulimit -n\r\nulimit -u\r\n```\r\n\r\nyou can align them with the four commands:\r\n\r\n```\r\nsysctl -w vm.max_map_count=524288\r\nsysctl -w fs.file-max=131072\r\nulimit -n 131072\r\nulimit -u 8192\r\n```','82.3.47.68','<p>this is related to the elasticsearch requirements as documents <a href=\"https://hub.docker.com/_/sonarqube/?tab&#61;description\" target=\"_blank\" rel=\"nofollow\">here</a>.</p>\n<p>you can check the current settings on the linux host by running:</p>\n<pre class=\"prettyprint\"><code>sysctl vm.max_map_count\nsysctl fs.file-max\nulimit -n\nulimit -u</code></pre>\n<p>you can align them with the four commands:</p>\n<pre class=\"prettyprint\"><code>sysctl -w vm.max_map_count&#61;524288\nsysctl -w fs.file-max&#61;131072\nulimit -n 131072\nulimit -u 8192</code></pre>\n',NULL,'NO_NEED_TO_APPROVE',19,1002,NULL),(26,'new answer','2020-09-11 23:07:57','i would need further information but two reasons spring to mind:\r\n\r\n1. you are scanning projects without having a `ProjectGuid` elemnt in the project `ProjectGroup` tag of the project.\r\n\r\nWhen you build a project, Sonarqube needs a bit of help.  This comes by adding a `ProjectGuid` with a unique guid value to the `ProjectGroup` so that SonarQube can track the projects.\r\n\r\nSonarqube can analyse the results of a `solution` build with no extra help as it will use the project guids used by the `solution` file.\r\n\r\neg:\r\n\r\n```xml\r\n<PropertyGroup>\r\n   <TargetFramework>netcoreapp3.1</TargetFramework>\r\n   <ProjectGuid>xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx</ProjectGuid>\r\n </PropertyGroup>\r\n```\r\n\r\n2. if you are running Sonarqube Community, remember that it can **only** scan the `master` branch','82.3.47.68','<p>i would need further information but two reasons spring to mind:</p>\n<ol><li>you are scanning projects without having a <code>ProjectGuid</code> elemnt in the project <code>ProjectGroup</code> tag of the project.</li></ol>\n<p>When you build a project, Sonarqube needs a bit of help.  This comes by adding a <code>ProjectGuid</code> with a unique guid value to the <code>ProjectGroup</code> so that SonarQube can track the projects.</p>\n<p>Sonarqube can analyse the results of a <code>solution</code> build with no extra help as it will use the project guids used by the <code>solution</code> file.</p>\n<p>eg:</p>\n<pre class=\"prettyprint\"><code>&lt;PropertyGroup&gt;\n   &lt;TargetFramework&gt;netcoreapp3.1&lt;/TargetFramework&gt;\n   &lt;ProjectGuid&gt;xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx&lt;/ProjectGuid&gt;\n &lt;/PropertyGroup&gt;</code></pre>\n<ol><li>if you are running Sonarqube Community, remember that it can <strong>only</strong> scan the <code>master</code> branch</li></ol>\n',NULL,'NO_NEED_TO_APPROVE',20,1002,NULL),(27,'bad formatting','2020-09-11 23:09:28','i would need further information but two reasons spring to mind:\r\n\r\n# Are you scanning projects without having a `ProjectGuid` elemnt in the project `ProjectGroup` tag of the project?\r\n\r\nWhen you build a project, Sonarqube needs a bit of help.  This comes by adding a `ProjectGuid` with a unique guid value to the `ProjectGroup` so that SonarQube can track the projects.\r\n\r\nSonarqube can analyse the results of a `solution` build with no extra help as it will use the project guids used by the `solution` file.\r\n\r\neg:\r\n\r\n```xml\r\n<PropertyGroup>\r\n   <TargetFramework>netcoreapp3.1</TargetFramework>\r\n   <ProjectGuid>xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx</ProjectGuid>\r\n </PropertyGroup>\r\n```\r\n\r\n# Are you running Sonarqube Community, remember that it can **only** scan the `master` branch?','82.3.47.68','<p>i would need further information but two reasons spring to mind:</p>\n<h1>Are you scanning projects without having a <code>ProjectGuid</code> elemnt in the project <code>ProjectGroup</code> tag of the project?</h1>\n<p>When you build a project, Sonarqube needs a bit of help.  This comes by adding a <code>ProjectGuid</code> with a unique guid value to the <code>ProjectGroup</code> so that SonarQube can track the projects.</p>\n<p>Sonarqube can analyse the results of a <code>solution</code> build with no extra help as it will use the project guids used by the <code>solution</code> file.</p>\n<p>eg:</p>\n<pre class=\"prettyprint\"><code>&lt;PropertyGroup&gt;\n   &lt;TargetFramework&gt;netcoreapp3.1&lt;/TargetFramework&gt;\n   &lt;ProjectGuid&gt;xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx&lt;/ProjectGuid&gt;\n &lt;/PropertyGroup&gt;</code></pre>\n<h1>Are you running Sonarqube Community, remember that it can <strong>only</strong> scan the <code>master</code> branch?</h1>\n',NULL,'NO_NEED_TO_APPROVE',20,1002,NULL),(28,'new answer','2020-09-11 23:10:54','use the `vvv` switch:\r\n\r\n```\r\nssh -vvv someone@somewhere\r\n```','82.3.47.68','<p>use the <code>vvv</code> switch:</p>\n<pre class=\"prettyprint\"><code>ssh -vvv someone&#64;somewhere</code></pre>\n',NULL,'NO_NEED_TO_APPROVE',21,1002,NULL);
/*!40000 ALTER TABLE `AnswerInformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Answer_Attachment`
--

DROP TABLE IF EXISTS `Answer_Attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Answer_Attachment` (
  `Answer_id` bigint(20) NOT NULL,
  `attachments_id` bigint(20) NOT NULL,
  PRIMARY KEY (`Answer_id`,`attachments_id`),
  UNIQUE KEY `UK_m8lisjgd2lw0uy50bxngkvi5o` (`attachments_id`),
  KEY `FK_m8lisjgd2lw0uy50bxngkvi5o` (`attachments_id`),
  KEY `FK_2r3h5i8jc5w2kqqhnhhlvenht` (`Answer_id`),
  CONSTRAINT `FK_2r3h5i8jc5w2kqqhnhhlvenht` FOREIGN KEY (`Answer_id`) REFERENCES `Answer` (`id`),
  CONSTRAINT `FK_m8lisjgd2lw0uy50bxngkvi5o` FOREIGN KEY (`attachments_id`) REFERENCES `Attachment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Answer_Attachment`
--

LOCK TABLES `Answer_Attachment` WRITE;
/*!40000 ALTER TABLE `Answer_Attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Answer_Attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Answer_Comments`
--

DROP TABLE IF EXISTS `Answer_Comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Answer_Comments` (
  `Answer_id` bigint(20) NOT NULL,
  `comments_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_731ugn0r28nit0o73yytcw5oh` (`comments_id`),
  KEY `FK_731ugn0r28nit0o73yytcw5oh` (`comments_id`),
  KEY `FK_5c40gkw8p92hpuy5nnothdhw5` (`Answer_id`),
  CONSTRAINT `FK_5c40gkw8p92hpuy5nnothdhw5` FOREIGN KEY (`Answer_id`) REFERENCES `Answer` (`id`),
  CONSTRAINT `FK_731ugn0r28nit0o73yytcw5oh` FOREIGN KEY (`comments_id`) REFERENCES `Comment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Answer_Comments`
--

LOCK TABLES `Answer_Comments` WRITE;
/*!40000 ALTER TABLE `Answer_Comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `Answer_Comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Answer_Flags`
--

DROP TABLE IF EXISTS `Answer_Flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Answer_Flags` (
  `Answer_id` bigint(20) NOT NULL,
  `flags_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_9y4wu81bq6tdthk881o8twros` (`flags_id`),
  KEY `FK_9y4wu81bq6tdthk881o8twros` (`flags_id`),
  KEY `FK_6lq2gt46y9974igmh0jxo666` (`Answer_id`),
  CONSTRAINT `FK_6lq2gt46y9974igmh0jxo666` FOREIGN KEY (`Answer_id`) REFERENCES `Answer` (`id`),
  CONSTRAINT `FK_9y4wu81bq6tdthk881o8twros` FOREIGN KEY (`flags_id`) REFERENCES `Flag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Answer_Flags`
--

LOCK TABLES `Answer_Flags` WRITE;
/*!40000 ALTER TABLE `Answer_Flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `Answer_Flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Answer_Votes`
--

DROP TABLE IF EXISTS `Answer_Votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Answer_Votes` (
  `Answer_id` bigint(20) NOT NULL,
  `votes_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_5ya5d072g3h38tvb9brj7bs8o` (`votes_id`),
  KEY `FK_5ya5d072g3h38tvb9brj7bs8o` (`votes_id`),
  KEY `FK_qpawvfihxtc49opw1q5le336l` (`Answer_id`),
  CONSTRAINT `FK_5ya5d072g3h38tvb9brj7bs8o` FOREIGN KEY (`votes_id`) REFERENCES `Vote` (`id`),
  CONSTRAINT `FK_qpawvfihxtc49opw1q5le336l` FOREIGN KEY (`Answer_id`) REFERENCES `Answer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Answer_Votes`
--

LOCK TABLES `Answer_Votes` WRITE;
/*!40000 ALTER TABLE `Answer_Votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Answer_Votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Attachment`
--

DROP TABLE IF EXISTS `Attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Attachment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `mime` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_enrbut32jkvqv2ttop49nkcb4` (`owner_id`),
  CONSTRAINT `FK_enrbut32jkvqv2ttop49nkcb4` FOREIGN KEY (`owner_id`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Attachment`
--

LOCK TABLES `Attachment` WRITE;
/*!40000 ALTER TABLE `Attachment` DISABLE KEYS */;
INSERT INTO `Attachment` VALUES (1,'2020-09-07 11:15:28','82.3.47.68','image/png','kam_crop-square-privacy.png',1002);
/*!40000 ALTER TABLE `Attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BlockedIp`
--

DROP TABLE IF EXISTS `BlockedIp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BlockedIp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_jx0qq5i8p02d6geh0cp4yl2lh` (`author_id`),
  CONSTRAINT `FK_jx0qq5i8p02d6geh0cp4yl2lh` FOREIGN KEY (`author_id`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BlockedIp`
--

LOCK TABLES `BlockedIp` WRITE;
/*!40000 ALTER TABLE `BlockedIp` DISABLE KEYS */;
/*!40000 ALTER TABLE `BlockedIp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comment`
--

DROP TABLE IF EXISTS `Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` longtext NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `htmlComment` longtext NOT NULL,
  `lastUpdatedAt` datetime DEFAULT NULL,
  `invisible` tinyint(1) NOT NULL,
  `voteCount` bigint(20) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_j94pith5sd971k29j6ysxuk7` (`author_id`),
  CONSTRAINT `FK_j94pith5sd971k29j6ysxuk7` FOREIGN KEY (`author_id`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comment`
--

LOCK TABLES `Comment` WRITE;
/*!40000 ALTER TABLE `Comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comment_Flags`
--

DROP TABLE IF EXISTS `Comment_Flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comment_Flags` (
  `Comment_id` bigint(20) NOT NULL,
  `flags_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_gkehc29f3h04bua96bjurv4vd` (`flags_id`),
  KEY `FK_gkehc29f3h04bua96bjurv4vd` (`flags_id`),
  KEY `FK_g45y0rm9o8k7uyoih84rrccra` (`Comment_id`),
  CONSTRAINT `FK_g45y0rm9o8k7uyoih84rrccra` FOREIGN KEY (`Comment_id`) REFERENCES `Comment` (`id`),
  CONSTRAINT `FK_gkehc29f3h04bua96bjurv4vd` FOREIGN KEY (`flags_id`) REFERENCES `Flag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comment_Flags`
--

LOCK TABLES `Comment_Flags` WRITE;
/*!40000 ALTER TABLE `Comment_Flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comment_Flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Comment_Votes`
--

DROP TABLE IF EXISTS `Comment_Votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comment_Votes` (
  `Comment_id` bigint(20) NOT NULL,
  `votes_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_dtgxtqffciorpdsjdshnkbpw6` (`votes_id`),
  KEY `FK_dtgxtqffciorpdsjdshnkbpw6` (`votes_id`),
  KEY `FK_obxdv4j0ph2swt8r81dx8h0yw` (`Comment_id`),
  CONSTRAINT `FK_dtgxtqffciorpdsjdshnkbpw6` FOREIGN KEY (`votes_id`) REFERENCES `Vote` (`id`),
  CONSTRAINT `FK_obxdv4j0ph2swt8r81dx8h0yw` FOREIGN KEY (`Comment_id`) REFERENCES `Comment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comment_Votes`
--

LOCK TABLES `Comment_Votes` WRITE;
/*!40000 ALTER TABLE `Comment_Votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Comment_Votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Flag`
--

DROP TABLE IF EXISTS `Flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Flag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `reason` longtext,
  `type` varchar(255) DEFAULT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_lumgu8dnorkynxw1l039ovm8q` (`author_id`),
  CONSTRAINT `FK_lumgu8dnorkynxw1l039ovm8q` FOREIGN KEY (`author_id`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Flag`
--

LOCK TABLES `Flag` WRITE;
/*!40000 ALTER TABLE `Flag` DISABLE KEYS */;
/*!40000 ALTER TABLE `Flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LoginMethod`
--

DROP TABLE IF EXISTS `LoginMethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LoginMethod` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `serviceEmail` varchar(100) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_l0vhdtw8ymw1rrxq9usrqjh4x` (`user_id`),
  CONSTRAINT `FK_l0vhdtw8ymw1rrxq9usrqjh4x` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LoginMethod`
--

LOCK TABLES `LoginMethod` WRITE;
/*!40000 ALTER TABLE `LoginMethod` DISABLE KEYS */;
INSERT INTO `LoginMethod` VALUES (17,'moderator@mamuteqa.org','1c3087ecb46050c53f5818d958ae18984d80ede6017e1530898c01f02bf0efc7','BRUTAL',1001),(18,'kam@laganlabs.it','e4edcf9f7fbde69c92a06d197de7ec23f6a3c7efe3ba493c4e77e0d9ffcae830','BRUTAL',1002);
/*!40000 ALTER TABLE `LoginMethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `News`
--

DROP TABLE IF EXISTS `News`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `News` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `approved` tinyint(1) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `lastUpdatedAt` datetime DEFAULT NULL,
  `invisible` tinyint(1) NOT NULL,
  `views` bigint(20) NOT NULL,
  `voteCount` bigint(20) NOT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  `information_id` bigint(20) NOT NULL,
  `lastTouchedBy_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_e3k3kapw96m39ma7uus1r6f7m` (`author_id`),
  KEY `FK_5qrrq79ar6t4p4vf4djvqf63i` (`information_id`),
  KEY `FK_glms254gw9a4kv5qh3ptijiqd` (`lastTouchedBy_id`),
  CONSTRAINT `FK_5qrrq79ar6t4p4vf4djvqf63i` FOREIGN KEY (`information_id`) REFERENCES `NewsInformation` (`id`),
  CONSTRAINT `FK_e3k3kapw96m39ma7uus1r6f7m` FOREIGN KEY (`author_id`) REFERENCES `Users` (`id`),
  CONSTRAINT `FK_glms254gw9a4kv5qh3ptijiqd` FOREIGN KEY (`lastTouchedBy_id`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `News`
--

LOCK TABLES `News` WRITE;
/*!40000 ALTER TABLE `News` DISABLE KEYS */;
/*!40000 ALTER TABLE `News` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NewsInformation`
--

DROP TABLE IF EXISTS `NewsInformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NewsInformation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` longtext NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `description` longtext NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `markedDescription` longtext,
  `moderatedAt` datetime DEFAULT NULL,
  `sluggedTitle` longtext NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `title` longtext NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `moderatedBy_id` bigint(20) DEFAULT NULL,
  `news_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_n3hxv49li2jcopaj6dio6b8b6` (`author_id`),
  KEY `FK_fppkwwg6svwefnnni9ygaefg2` (`moderatedBy_id`),
  KEY `FK_b942i5pshr99wwqdk03d98ofg` (`news_id`),
  CONSTRAINT `FK_b942i5pshr99wwqdk03d98ofg` FOREIGN KEY (`news_id`) REFERENCES `News` (`id`),
  CONSTRAINT `FK_fppkwwg6svwefnnni9ygaefg2` FOREIGN KEY (`moderatedBy_id`) REFERENCES `Users` (`id`),
  CONSTRAINT `FK_n3hxv49li2jcopaj6dio6b8b6` FOREIGN KEY (`author_id`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NewsInformation`
--

LOCK TABLES `NewsInformation` WRITE;
/*!40000 ALTER TABLE `NewsInformation` DISABLE KEYS */;
/*!40000 ALTER TABLE `NewsInformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `News_Comments`
--

DROP TABLE IF EXISTS `News_Comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `News_Comments` (
  `News_id` bigint(20) NOT NULL,
  `comments_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_5rrh2dvs1cy19pliwyvb8w8u7` (`comments_id`),
  KEY `FK_5rrh2dvs1cy19pliwyvb8w8u7` (`comments_id`),
  KEY `FK_dcofc609g7loixe8pcm3myemd` (`News_id`),
  CONSTRAINT `FK_5rrh2dvs1cy19pliwyvb8w8u7` FOREIGN KEY (`comments_id`) REFERENCES `Comment` (`id`),
  CONSTRAINT `FK_dcofc609g7loixe8pcm3myemd` FOREIGN KEY (`News_id`) REFERENCES `News` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `News_Comments`
--

LOCK TABLES `News_Comments` WRITE;
/*!40000 ALTER TABLE `News_Comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `News_Comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `News_Flags`
--

DROP TABLE IF EXISTS `News_Flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `News_Flags` (
  `News_id` bigint(20) NOT NULL,
  `flags_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_s0ugdfyknbgui197dcioqqovi` (`flags_id`),
  KEY `FK_s0ugdfyknbgui197dcioqqovi` (`flags_id`),
  KEY `FK_fr0qqkoqj2rai6g9epq0iw4wu` (`News_id`),
  CONSTRAINT `FK_fr0qqkoqj2rai6g9epq0iw4wu` FOREIGN KEY (`News_id`) REFERENCES `News` (`id`),
  CONSTRAINT `FK_s0ugdfyknbgui197dcioqqovi` FOREIGN KEY (`flags_id`) REFERENCES `Flag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `News_Flags`
--

LOCK TABLES `News_Flags` WRITE;
/*!40000 ALTER TABLE `News_Flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `News_Flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `News_Votes`
--

DROP TABLE IF EXISTS `News_Votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `News_Votes` (
  `News_id` bigint(20) NOT NULL,
  `votes_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_mecjpg8cg90p1ry4sg4rckb09` (`votes_id`),
  KEY `FK_mecjpg8cg90p1ry4sg4rckb09` (`votes_id`),
  KEY `FK_rqhl3hox4wntf7oc9y4af5cgv` (`News_id`),
  CONSTRAINT `FK_mecjpg8cg90p1ry4sg4rckb09` FOREIGN KEY (`votes_id`) REFERENCES `Vote` (`id`),
  CONSTRAINT `FK_rqhl3hox4wntf7oc9y4af5cgv` FOREIGN KEY (`News_id`) REFERENCES `News` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `News_Votes`
--

LOCK TABLES `News_Votes` WRITE;
/*!40000 ALTER TABLE `News_Votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `News_Votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `News_Watchers`
--

DROP TABLE IF EXISTS `News_Watchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `News_Watchers` (
  `News_id` bigint(20) NOT NULL,
  `watchers_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_m5koj8lugxy5pp42xk656vqln` (`watchers_id`),
  KEY `FK_m5koj8lugxy5pp42xk656vqln` (`watchers_id`),
  KEY `FK_bywcu6iha3jaici2oiljml8ho` (`News_id`),
  CONSTRAINT `FK_bywcu6iha3jaici2oiljml8ho` FOREIGN KEY (`News_id`) REFERENCES `News` (`id`),
  CONSTRAINT `FK_m5koj8lugxy5pp42xk656vqln` FOREIGN KEY (`watchers_id`) REFERENCES `Watcher` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `News_Watchers`
--

LOCK TABLES `News_Watchers` WRITE;
/*!40000 ALTER TABLE `News_Watchers` DISABLE KEYS */;
/*!40000 ALTER TABLE `News_Watchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NewsletterSentLog`
--

DROP TABLE IF EXISTS `NewsletterSentLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NewsletterSentLog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdAt` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NewsletterSentLog`
--

LOCK TABLES `NewsletterSentLog` WRITE;
/*!40000 ALTER TABLE `NewsletterSentLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `NewsletterSentLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Question`
--

DROP TABLE IF EXISTS `Question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `answerCount` bigint(20) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `lastUpdatedAt` datetime DEFAULT NULL,
  `invisible` tinyint(1) NOT NULL,
  `views` bigint(20) NOT NULL,
  `voteCount` bigint(20) NOT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  `information_id` bigint(20) NOT NULL,
  `lastTouchedBy_id` bigint(20) DEFAULT NULL,
  `solution_id` bigint(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_a3dib35x299yvhfk7pau0kw5w` (`author_id`),
  KEY `FK_i2xt9jcwfauudnswun94neqyg` (`information_id`),
  KEY `FK_9d3cyy648wfruj9t7556wqgjr` (`lastTouchedBy_id`),
  KEY `FK_liw3djybv5je7ra806bsipg68` (`solution_id`),
  CONSTRAINT `FK_9d3cyy648wfruj9t7556wqgjr` FOREIGN KEY (`lastTouchedBy_id`) REFERENCES `Users` (`id`),
  CONSTRAINT `FK_a3dib35x299yvhfk7pau0kw5w` FOREIGN KEY (`author_id`) REFERENCES `Users` (`id`),
  CONSTRAINT `FK_i2xt9jcwfauudnswun94neqyg` FOREIGN KEY (`information_id`) REFERENCES `QuestionInformation` (`id`),
  CONSTRAINT `FK_liw3djybv5je7ra806bsipg68` FOREIGN KEY (`solution_id`) REFERENCES `Answer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Question`
--

LOCK TABLES `Question` WRITE;
/*!40000 ALTER TABLE `Question` DISABLE KEYS */;
INSERT INTO `Question` VALUES (206,1,'2020-09-07 07:59:23','2020-09-07 10:55:20',0,2,0,1002,207,1002,12,0),(207,1,'2020-09-07 08:00:41','2020-09-07 10:53:15',0,3,0,1002,208,1002,11,0),(208,1,'2020-09-07 08:02:01','2020-09-07 10:47:16',0,2,0,1002,209,1002,9,0),(209,1,'2020-09-07 08:02:51','2020-09-07 10:50:09',0,2,0,1002,210,1002,10,0),(210,1,'2020-09-07 08:05:18','2020-09-07 10:56:51',0,2,0,1002,211,1002,13,0),(211,0,'2020-09-07 08:06:22','2020-09-07 08:06:22',0,1,0,1002,212,1002,NULL,0),(212,0,'2020-09-07 08:07:52','2020-09-07 08:07:52',0,1,0,1002,213,1002,NULL,0),(213,0,'2020-09-07 08:09:17','2020-09-07 08:09:17',0,1,0,1002,214,1002,NULL,0),(214,0,'2020-09-07 08:10:54','2020-09-07 08:10:54',0,1,0,1002,215,1002,NULL,0),(215,0,'2020-09-07 08:12:04','2020-09-07 08:12:04',0,2,0,1002,216,1002,NULL,0),(216,1,'2020-09-07 08:12:46','2020-09-07 08:14:26',0,1,0,1002,218,1002,8,0),(217,1,'2020-09-07 11:20:08','2020-09-07 11:20:42',0,2,0,1002,219,1002,14,0),(218,1,'2020-09-09 09:13:56','2020-09-09 09:16:58',0,1,0,1002,220,1002,15,0),(219,1,'2020-09-09 09:18:00','2020-09-09 09:18:53',0,1,0,1002,221,1002,16,0),(220,1,'2020-09-11 22:36:23','2020-09-11 22:41:41',0,1,0,1002,222,1002,NULL,0),(221,1,'2020-09-11 22:47:33','2020-09-11 22:49:24',0,1,0,1002,223,1002,18,0),(222,1,'2020-09-11 22:54:42','2020-09-11 22:56:46',0,1,0,1002,224,1002,NULL,0),(223,1,'2020-09-11 23:01:14','2020-09-11 23:07:57',0,1,0,1002,225,1002,20,0),(224,1,'2020-09-11 23:10:32','2020-09-11 23:10:54',0,1,0,1002,226,1002,21,0);
/*!40000 ALTER TABLE `Question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QuestionInformation`
--

DROP TABLE IF EXISTS `QuestionInformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QuestionInformation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` longtext NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `description` longtext NOT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `markedDescription` longtext,
  `moderatedAt` datetime DEFAULT NULL,
  `sluggedTitle` longtext NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `title` longtext NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `moderatedBy_id` bigint(20) DEFAULT NULL,
  `question_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_9nfk2kchvyn69e7gdh798gf` (`author_id`),
  KEY `FK_t1oox0xh74vlikcvhxd5k2kq1` (`moderatedBy_id`),
  KEY `FK_pl1drgbxhfd4hbmd3smwa3svl` (`question_id`),
  CONSTRAINT `FK_9nfk2kchvyn69e7gdh798gf` FOREIGN KEY (`author_id`) REFERENCES `Users` (`id`),
  CONSTRAINT `FK_pl1drgbxhfd4hbmd3smwa3svl` FOREIGN KEY (`question_id`) REFERENCES `Question` (`id`),
  CONSTRAINT `FK_t1oox0xh74vlikcvhxd5k2kq1` FOREIGN KEY (`moderatedBy_id`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QuestionInformation`
--

LOCK TABLES `QuestionInformation` WRITE;
/*!40000 ALTER TABLE `QuestionInformation` DISABLE KEYS */;
INSERT INTO `QuestionInformation` VALUES (207,'new question','2020-09-07 07:59:23','how can i delete dangling docker images and/or containers?','172.17.0.1','<p>how can i delete dangling docker images and/or containers?</p>\n',NULL,'how-do-i-delete-dangling-docker-images--containers','NO_NEED_TO_APPROVE','how do i delete dangling docker images / containers?',1002,NULL,206),(208,'new question','2020-09-07 08:00:41','how do i copy a file from a docker host to a docker container or vice versa?','172.17.0.1','<p>how do i copy a file from a docker host to a docker container or vice versa?</p>\n',NULL,'how-do-i-copy-a-file-from-a-host-to-a-docker-container-or-vice-versa','NO_NEED_TO_APPROVE','how do i copy a file from a host to a docker container or vice versa?',1002,NULL,207),(209,'new question','2020-09-07 08:02:01','i have a running docker container and wish to execute an `ls` command to see the state of the disk.  how do i accomplish this?','172.17.0.1','<p>i have a running docker container and wish to execute an <code>ls</code> command to see the state of the disk.  how do i accomplish this?</p>\n',NULL,'how-do-i-execute-a-command-in-a-docker-container','NO_NEED_TO_APPROVE','how do i execute a command in a docker container?',1002,NULL,208),(210,'new question','2020-09-07 08:02:51','how can i find images/containers using the `filter` query?','172.17.0.1','<p>how can i find images/containers using the <code>filter</code> query?</p>\n',NULL,'how-to-find-images-with-a-wildcard','NO_NEED_TO_APPROVE','how to find images with a wildcard?',1002,NULL,209),(211,'new question','2020-09-07 08:05:18','I want to collect any trace and/or debug information about my application.  what is the simplest way of achieving this?','172.17.0.1','<p>I want to collect any trace and/or debug information about my application.  what is the simplest way of achieving this?</p>\n',NULL,'is-there-a-simple-way-to-collect-tracedebug-information-about-my-application','NO_NEED_TO_APPROVE','is there a simple way to collect trace/debug information about my application?',1002,NULL,210),(212,'new question','2020-09-07 08:06:22','how can i add logging to my application using the logging configuration section of the `appsettings.json`?','172.17.0.1','<p>how can i add logging to my application using the logging configuration section of the <code>appsettings.json</code>?</p>\n',NULL,'how-do-i-add-logging-to-my-application','NO_NEED_TO_APPROVE','how do i add logging to my application?',1002,NULL,211),(213,'new question','2020-09-07 08:07:52','when using a nuget feed in an automated build, i am having access issues due to credentials for the feed.  what am i doing wrong?','172.17.0.1','<p>when using a nuget feed in an automated build, i am having access issues due to credentials for the feed.  what am i doing wrong?</p>\n',NULL,'im-getting-a-401-when-trying-to-access-a-nuget-feed--what-am-i-doing-wrong','NO_NEED_TO_APPROVE','im getting a 401 when trying to access a nuget feed.  what am i doing wrong?',1002,NULL,212),(214,'new question','2020-09-07 08:09:17','i cant ge the AZDO sonarqube plugin to work in the pipeline.  i am using the `community` edition of sonarqube','172.17.0.1','<p>i cant ge the AZDO sonarqube plugin to work in the pipeline.  i am using the <code>community</code> edition of sonarqube</p>\n',NULL,'how-do-i-use-sonarqube-in-the-azdo-workflow','NO_NEED_TO_APPROVE','how do i use sonarqube in the AZDO workflow?',1002,NULL,213),(215,'new question','2020-09-07 08:10:54','i have an on-prem sql database backup file and want to restore this to an Azure SQL database.  How do i do this?','172.17.0.1','<p>i have an on-prem sql database backup file and want to restore this to an Azure SQL database.  How do i do this?</p>\n',NULL,'how-do-i-restore-a-backup-to-an-azure-sql-database','NO_NEED_TO_APPROVE','how do i restore a backup to an Azure SQL database?',1002,NULL,214),(216,'new question','2020-09-07 08:12:04','can someone explain what DACPAC is and what a data tier application is?','172.17.0.1','<p>can someone explain what DACPAC is and what a data tier application is?</p>\n',NULL,'what-is-dacpac-','NO_NEED_TO_APPROVE','what is DACPAC? ',1002,NULL,215),(217,'new question','2020-09-07 08:12:46','how can list all the users of a database?','172.17.0.1','<p>how can list all the users of a database?</p>\n',NULL,'how-can-i-et-a-list-of-users-in-a-database','NO_NEED_TO_APPROVE','how can i et a list of users in a database?',1002,NULL,216),(218,'title spelling mistake','2020-09-07 08:13:18','how can list all the users of a database?','172.17.0.1','<p>how can list all the users of a database?</p>\n',NULL,'how-can-i-get-a-list-of-users-in-a-database','NO_NEED_TO_APPROVE','how can i get a list of users in a database?',1002,NULL,216),(219,'new question','2020-09-07 11:20:08','how do i install docker on a linux platform','82.3.47.68','<p>how do i install docker on a linux platform</p>\n',NULL,'how-do-i-install-docker','NO_NEED_TO_APPROVE','how do i install docker',1002,NULL,217),(220,'new question','2020-09-09 09:13:56','i have an azure registry and want to push a local docker image into the registry','82.3.47.68','<p>i have an azure registry and want to push a local docker image into the registry</p>\n',NULL,'how-do-i-push-a-docker-image-into-a-registry','NO_NEED_TO_APPROVE','how do i push a docker image into a registry?',1002,NULL,218),(221,'new question','2020-09-09 09:18:00','i have a docker image hosted on an appservice but do not know how to map the internal docker port to port 80 on the appservice','82.3.47.68','<p>i have a docker image hosted on an appservice but do not know how to map the internal docker port to port 80 on the appservice</p>\n',NULL,'how-do-i-manage-the-docker-port-on-an-azure-appservice','NO_NEED_TO_APPROVE','how do i manage the docker port on an azure appservice?',1002,NULL,219),(222,'new question','2020-09-11 22:36:23','i know there is something special about it but dont know what','82.3.47.68','<p>i know there is something special about it but dont know what</p>\n',NULL,'how-do-i-set-up-a-sonaraqube-database','NO_NEED_TO_APPROVE','how do i set up a sonaraqube database?',1002,NULL,220),(223,'new question','2020-09-11 22:47:33','2020.09.10 17:18:54 ERROR web[][o.s.s.p.PlatformImpl] Web server startup failed: Unable to determine database dialect to use within sonar with dialect null jdbc url \"jdbc:sqlserver://kaml-test.database.windows.net:1433;database=sonar;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;\"\r\n2020.09.10 17:18:54 WARN  web[][o.a.c.l.WebappClassLoaderBase] The web application [ROOT] appears to have started a thread named [elasticsearch[_client_][[timer]]] but has failed to stop it. This is very likely to create a memory leak. Stack trace of thread:\\n java.base@11.0.6/java.lang.Thread.sleep(Native Method)\\n app//org.elasticsearch.threadpool.ThreadPool$CachedTimeThread.run(ThreadPool.java:574)\r\n2020.09.10 17:18:54 WARN  web[][o.a.c.l.WebappClassLoaderBase] The web application [ROOT] appears to have started a thread named [elasticsearch[_client_][scheduler][T#1]] but has failed to stop it. This is very likely to create a memory leak. Stack trace of thread:\\n java.base@11.0.6/jdk.internal.misc.Unsafe.park(Native Method)\\n java.base@11.0.6/java.util.concurrent.locks.LockSupport.parkNanos(Unknown Source)\\n java.base@11.0.6/java.util.concurrent.locks.AbstractQueuedSynchronizer$ConditionObject.awaitNanos(Unknown Source)\\n java.base@11.0.6/java.util.concurrent.ScheduledThreadPoolExecutor$DelayedWorkQueue.take(Unknown Source)\\n java.base@11.0.6/java.util.concurrent.ScheduledThreadPoolExecutor$DelayedWorkQueue.take(Unknown Source)\\n java.base@11.0.6/java.util.concurrent.ThreadPoolExecutor.getTask(Unknown Source)\\n java.base@11.0.6/java.util.concurrent.ThreadPoolExecutor.runWorker(Unknown Source)\\n java.base@11.0.6/java.util.concurrent.ThreadPoolExecutor$Worker.run(Unknown Source)\\n java.base@11.0.6/java.lang.Thread.run(Unknown Source)\r\n\r\nque?','82.3.47.68','<p>2020.09.10 17:18:54 ERROR web[][o.s.s.p.PlatformImpl] Web server startup failed: Unable to determine database dialect to use within sonar with dialect null jdbc url &#34;jdbc:sqlserver://kaml-test.database.windows.net:1433;database&#61;sonar;encrypt&#61;true;trustServerCertificate&#61;false;hostNameInCertificate&#61;*.database.windows.net;loginTimeout&#61;30;&#34;\n2020.09.10 17:18:54 WARN  web[][o.a.c.l.WebappClassLoaderBase] The web application [ROOT] appears to have started a thread named [elasticsearch[<em>client</em>][[timer]]] but has failed to stop it. This is very likely to create a memory leak. Stack trace of thread:\\n java.base&#64;11.0.6/java.lang.Thread.sleep(Native Method)\\n app//org.elasticsearch.threadpool.ThreadPool$CachedTimeThread.run(ThreadPool.java:574)\n2020.09.10 17:18:54 WARN  web[][o.a.c.l.WebappClassLoaderBase] The web application [ROOT] appears to have started a thread named [elasticsearch[<em>client</em>][scheduler][T#1]] but has failed to stop it. This is very likely to create a memory leak. Stack trace of thread:\\n java.base&#64;11.0.6/jdk.internal.misc.Unsafe.park(Native Method)\\n java.base&#64;11.0.6/java.util.concurrent.locks.LockSupport.parkNanos(Unknown Source)\\n java.base&#64;11.0.6/java.util.concurrent.locks.AbstractQueuedSynchronizer$ConditionObject.awaitNanos(Unknown Source)\\n java.base&#64;11.0.6/java.util.concurrent.ScheduledThreadPoolExecutor$DelayedWorkQueue.take(Unknown Source)\\n java.base&#64;11.0.6/java.util.concurrent.ScheduledThreadPoolExecutor$DelayedWorkQueue.take(Unknown Source)\\n java.base&#64;11.0.6/java.util.concurrent.ThreadPoolExecutor.getTask(Unknown Source)\\n java.base&#64;11.0.6/java.util.concurrent.ThreadPoolExecutor.runWorker(Unknown Source)\\n java.base&#64;11.0.6/java.util.concurrent.ThreadPoolExecutor$Worker.run(Unknown Source)\\n java.base&#64;11.0.6/java.lang.Thread.run(Unknown Source)</p>\n<p>que?</p>\n',NULL,'web-server-startup-failed-unable-to-determine-database-dialect-to-use-within-sonar-with-dialect-null-jdbc-url','NO_NEED_TO_APPROVE','Web server startup failed: Unable to determine database dialect to use within sonar with dialect null jdbc url',1002,NULL,221),(224,'new question','2020-09-11 22:54:42','```\r\n2017.04.21 06:39:37 WARN  web[][o.a.c.l.WebappClassLoaderBase] The web application [ROOT] appears to have started a thread named [elasticsearch[Pip the Troll][transport_client_worker][T#1]{New I/O worker #1}] but has failed to stop it. This is very likely to create a memory leak. Stack trace of thread:\r\n sun.nio.ch.EPollArrayWrapper.epollWait(Native Method)\r\n sun.nio.ch.EPollArrayWrapper.poll(EPollArrayWrapper.java:269)\r\n sun.nio.ch.EPollSelectorImpl.doSelect(EPollSelectorImpl.java:93)\r\n sun.nio.ch.SelectorImpl.lockAndDoSelect(SelectorImpl.java:86)\r\n sun.nio.ch.SelectorImpl.select(SelectorImpl.java:97)\r\n org.jboss.netty.channel.socket.nio.SelectorUtil.select(SelectorUtil.java:68)\r\n org.jboss.netty.channel.socket.nio.AbstractNioSelector.select(AbstractNioSelector.java:434)\r\n org.jboss.netty.channel.socket.nio.AbstractNioSelector.run(AbstractNioSelector.java:212)\r\n org.jboss.netty.channel.socket.nio.AbstractNioWorker.run(AbstractNioWorker.java:89)\r\n org.jboss.netty.channel.socket.nio.NioWorker.run(NioWorker.java:178)\r\n org.jboss.netty.util.ThreadRenamingRunnable.run(ThreadRenamingRunnable.java:108)\r\n org.jboss.netty.util.internal.DeadLockProofWorker$1.run(DeadLockProofWorker.java:42)\r\n java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\r\n java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)\r\n java.lang.Thread.run(Thread.java:745)\r\n```','82.3.47.68','<pre class=\"prettyprint\"><code>2017.04.21 06:39:37 WARN  web[][o.a.c.l.WebappClassLoaderBase] The web application [ROOT] appears to have started a thread named [elasticsearch[Pip the Troll][transport_client_worker][T#1]{New I/O worker #1}] but has failed to stop it. This is very likely to create a memory leak. Stack trace of thread:\n sun.nio.ch.EPollArrayWrapper.epollWait(Native Method)\n sun.nio.ch.EPollArrayWrapper.poll(EPollArrayWrapper.java:269)\n sun.nio.ch.EPollSelectorImpl.doSelect(EPollSelectorImpl.java:93)\n sun.nio.ch.SelectorImpl.lockAndDoSelect(SelectorImpl.java:86)\n sun.nio.ch.SelectorImpl.select(SelectorImpl.java:97)\n org.jboss.netty.channel.socket.nio.SelectorUtil.select(SelectorUtil.java:68)\n org.jboss.netty.channel.socket.nio.AbstractNioSelector.select(AbstractNioSelector.java:434)\n org.jboss.netty.channel.socket.nio.AbstractNioSelector.run(AbstractNioSelector.java:212)\n org.jboss.netty.channel.socket.nio.AbstractNioWorker.run(AbstractNioWorker.java:89)\n org.jboss.netty.channel.socket.nio.NioWorker.run(NioWorker.java:178)\n org.jboss.netty.util.ThreadRenamingRunnable.run(ThreadRenamingRunnable.java:108)\n org.jboss.netty.util.internal.DeadLockProofWorker$1.run(DeadLockProofWorker.java:42)\n java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1142)\n java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:617)\n java.lang.Thread.run(Thread.java:745)</code></pre>\n',NULL,'the-web-application-root-appears-to-have-started-a-thread','NO_NEED_TO_APPROVE','The web application [ROOT] appears to have started a thread',1002,NULL,222),(225,'new question','2020-09-11 23:01:14','i am running sonarscan on my projects but nothing is being picked up.  why?  i dont have amy errors.  i just find the results empty.','82.3.47.68','<p>i am running sonarscan on my projects but nothing is being picked up.  why?  i dont have amy errors.  i just find the results empty.</p>\n',NULL,'why-isnt-my-sonarscan-scanning-my-projects','NO_NEED_TO_APPROVE','why isnt my sonarscan scanning my projects?',1002,NULL,223),(226,'new question','2020-09-11 23:10:32','i am having some issues with my ssh connection but dont know how to get a verbose /detailed view of the connection','82.3.47.68','<p>i am having some issues with my ssh connection but dont know how to get a verbose /detailed view of the connection</p>\n',NULL,'how-can-i-debug-an-ssh-connection','NO_NEED_TO_APPROVE','how can i debug an ssh connection',1002,NULL,224);
/*!40000 ALTER TABLE `QuestionInformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QuestionInformation_Tag`
--

DROP TABLE IF EXISTS `QuestionInformation_Tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `QuestionInformation_Tag` (
  `QuestionInformation_id` bigint(20) NOT NULL,
  `tags_id` bigint(20) NOT NULL,
  `tag_order` int(11) NOT NULL,
  PRIMARY KEY (`QuestionInformation_id`,`tag_order`),
  KEY `FK_nv1tmcost5jqejnlb6u0wrypo` (`tags_id`),
  KEY `FK_7u4x47xa5gdhmt650curhu3kx` (`QuestionInformation_id`),
  CONSTRAINT `FK_7u4x47xa5gdhmt650curhu3kx` FOREIGN KEY (`QuestionInformation_id`) REFERENCES `QuestionInformation` (`id`),
  CONSTRAINT `FK_nv1tmcost5jqejnlb6u0wrypo` FOREIGN KEY (`tags_id`) REFERENCES `Tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QuestionInformation_Tag`
--

LOCK TABLES `QuestionInformation_Tag` WRITE;
/*!40000 ALTER TABLE `QuestionInformation_Tag` DISABLE KEYS */;
INSERT INTO `QuestionInformation_Tag` VALUES (207,15,0),(208,15,0),(209,15,0),(210,15,0),(219,15,0),(220,15,0),(221,15,0),(211,16,0),(212,16,0),(213,17,0),(214,18,0),(222,18,0),(223,18,0),(224,18,0),(225,18,0),(215,19,0),(216,19,0),(217,19,0),(218,19,0),(226,20,0);
/*!40000 ALTER TABLE `QuestionInformation_Tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Question_Attachment`
--

DROP TABLE IF EXISTS `Question_Attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Question_Attachment` (
  `Question_id` bigint(20) NOT NULL,
  `attachments_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_7y9vgsl3nbmms94toj87g69lu` (`attachments_id`),
  KEY `FK_7y9vgsl3nbmms94toj87g69lu` (`attachments_id`),
  KEY `FK_ib0aqkj0a4a4l9ku9oai3lw9w` (`Question_id`),
  CONSTRAINT `FK_7y9vgsl3nbmms94toj87g69lu` FOREIGN KEY (`attachments_id`) REFERENCES `Attachment` (`id`),
  CONSTRAINT `FK_ib0aqkj0a4a4l9ku9oai3lw9w` FOREIGN KEY (`Question_id`) REFERENCES `Question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Question_Attachment`
--

LOCK TABLES `Question_Attachment` WRITE;
/*!40000 ALTER TABLE `Question_Attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Question_Attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Question_Comments`
--

DROP TABLE IF EXISTS `Question_Comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Question_Comments` (
  `Question_id` bigint(20) NOT NULL,
  `comments_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_6jsfvsef241a3ldcck6pid4vi` (`comments_id`),
  KEY `FK_6jsfvsef241a3ldcck6pid4vi` (`comments_id`),
  KEY `FK_fm57yvrnidsyeuvls0he5c9pk` (`Question_id`),
  CONSTRAINT `FK_6jsfvsef241a3ldcck6pid4vi` FOREIGN KEY (`comments_id`) REFERENCES `Comment` (`id`),
  CONSTRAINT `FK_fm57yvrnidsyeuvls0he5c9pk` FOREIGN KEY (`Question_id`) REFERENCES `Question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Question_Comments`
--

LOCK TABLES `Question_Comments` WRITE;
/*!40000 ALTER TABLE `Question_Comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `Question_Comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Question_Flags`
--

DROP TABLE IF EXISTS `Question_Flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Question_Flags` (
  `Question_id` bigint(20) NOT NULL,
  `flags_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_a8brcb8bpevccipiyplquqqjv` (`flags_id`),
  KEY `FK_a8brcb8bpevccipiyplquqqjv` (`flags_id`),
  KEY `FK_ftntexa7hxbaqo2i2yg4i0yr3` (`Question_id`),
  CONSTRAINT `FK_a8brcb8bpevccipiyplquqqjv` FOREIGN KEY (`flags_id`) REFERENCES `Flag` (`id`),
  CONSTRAINT `FK_ftntexa7hxbaqo2i2yg4i0yr3` FOREIGN KEY (`Question_id`) REFERENCES `Question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Question_Flags`
--

LOCK TABLES `Question_Flags` WRITE;
/*!40000 ALTER TABLE `Question_Flags` DISABLE KEYS */;
/*!40000 ALTER TABLE `Question_Flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Question_Interactions`
--

DROP TABLE IF EXISTS `Question_Interactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Question_Interactions` (
  `Question_id` bigint(20) NOT NULL,
  `userInteractions_id` bigint(20) NOT NULL,
  PRIMARY KEY (`Question_id`,`userInteractions_id`),
  KEY `FK_nydo4x8ey7gnhhwg1gqmikwo6` (`userInteractions_id`),
  KEY `FK_plnjd89r1mncrtf1vfj65pspt` (`Question_id`),
  CONSTRAINT `FK_nydo4x8ey7gnhhwg1gqmikwo6` FOREIGN KEY (`userInteractions_id`) REFERENCES `Users` (`id`),
  CONSTRAINT `FK_plnjd89r1mncrtf1vfj65pspt` FOREIGN KEY (`Question_id`) REFERENCES `Question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Question_Interactions`
--

LOCK TABLES `Question_Interactions` WRITE;
/*!40000 ALTER TABLE `Question_Interactions` DISABLE KEYS */;
INSERT INTO `Question_Interactions` VALUES (206,1002),(207,1002),(208,1002),(209,1002),(210,1002),(211,1002),(212,1002),(213,1002),(214,1002),(215,1002),(216,1002),(217,1002),(218,1002),(219,1002),(220,1002),(221,1002),(222,1002),(223,1002),(224,1002);
/*!40000 ALTER TABLE `Question_Interactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Question_Votes`
--

DROP TABLE IF EXISTS `Question_Votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Question_Votes` (
  `Question_id` bigint(20) NOT NULL,
  `votes_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_p5sgssf0gw0br66mvu9cctlmq` (`votes_id`),
  KEY `FK_p5sgssf0gw0br66mvu9cctlmq` (`votes_id`),
  KEY `FK_24u6uwfjr8s8pfk7oyfw8u4o4` (`Question_id`),
  CONSTRAINT `FK_24u6uwfjr8s8pfk7oyfw8u4o4` FOREIGN KEY (`Question_id`) REFERENCES `Question` (`id`),
  CONSTRAINT `FK_p5sgssf0gw0br66mvu9cctlmq` FOREIGN KEY (`votes_id`) REFERENCES `Vote` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Question_Votes`
--

LOCK TABLES `Question_Votes` WRITE;
/*!40000 ALTER TABLE `Question_Votes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Question_Votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Question_Watchers`
--

DROP TABLE IF EXISTS `Question_Watchers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Question_Watchers` (
  `Question_id` bigint(20) NOT NULL,
  `watchers_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_5twinfe7e6g09gaowkeah0498` (`watchers_id`),
  KEY `FK_5twinfe7e6g09gaowkeah0498` (`watchers_id`),
  KEY `FK_pu72rhjonka0flev96adthdp0` (`Question_id`),
  CONSTRAINT `FK_5twinfe7e6g09gaowkeah0498` FOREIGN KEY (`watchers_id`) REFERENCES `Watcher` (`id`),
  CONSTRAINT `FK_pu72rhjonka0flev96adthdp0` FOREIGN KEY (`Question_id`) REFERENCES `Question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Question_Watchers`
--

LOCK TABLES `Question_Watchers` WRITE;
/*!40000 ALTER TABLE `Question_Watchers` DISABLE KEYS */;
INSERT INTO `Question_Watchers` VALUES (208,1),(218,2),(219,3),(220,4),(221,5),(222,6),(223,7),(224,8);
/*!40000 ALTER TABLE `Question_Watchers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReputationEvent`
--

DROP TABLE IF EXISTS `ReputationEvent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReputationEvent` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `context_type` varchar(255) DEFAULT NULL,
  `context_id` bigint(20) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `karmaReward` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_gbu6jo147pal18b3q3blpr0of` (`user_id`),
  CONSTRAINT `FK_gbu6jo147pal18b3q3blpr0of` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReputationEvent`
--

LOCK TABLES `ReputationEvent` WRITE;
/*!40000 ALTER TABLE `ReputationEvent` DISABLE KEYS */;
INSERT INTO `ReputationEvent` VALUES (6,'QUESTION',206,'2020-09-07 07:59:23',2,'CREATED_QUESTION',1002,0),(7,'QUESTION',207,'2020-09-07 08:00:41',2,'CREATED_QUESTION',1002,0),(8,'QUESTION',208,'2020-09-07 08:02:01',2,'CREATED_QUESTION',1002,0),(9,'QUESTION',209,'2020-09-07 08:02:51',2,'CREATED_QUESTION',1002,0),(10,'QUESTION',210,'2020-09-07 08:05:18',2,'CREATED_QUESTION',1002,0),(11,'QUESTION',211,'2020-09-07 08:06:22',2,'CREATED_QUESTION',1002,0),(12,'QUESTION',212,'2020-09-07 08:07:52',2,'CREATED_QUESTION',1002,0),(13,'QUESTION',213,'2020-09-07 08:09:17',2,'CREATED_QUESTION',1002,0),(14,'QUESTION',214,'2020-09-07 08:10:54',2,'CREATED_QUESTION',1002,0),(15,'QUESTION',215,'2020-09-07 08:12:04',2,'CREATED_QUESTION',1002,0),(16,'QUESTION',216,'2020-09-07 08:12:46',2,'CREATED_QUESTION',1002,0),(17,'QUESTION',216,'2020-09-07 08:14:26',2,'CREATED_ANSWER',1002,0),(18,'QUESTION',208,'2020-09-07 10:47:16',2,'CREATED_ANSWER',1002,0),(19,'QUESTION',209,'2020-09-07 10:50:09',2,'CREATED_ANSWER',1002,0),(20,'QUESTION',207,'2020-09-07 10:53:15',2,'CREATED_ANSWER',1002,0),(21,'QUESTION',206,'2020-09-07 10:55:20',2,'CREATED_ANSWER',1002,0),(22,'QUESTION',210,'2020-09-07 10:56:51',2,'CREATED_ANSWER',1002,0),(23,'QUESTION',217,'2020-09-07 11:20:08',2,'CREATED_QUESTION',1002,0),(24,'QUESTION',217,'2020-09-07 11:20:42',2,'CREATED_ANSWER',1002,0),(25,'QUESTION',218,'2020-09-09 09:13:56',2,'CREATED_QUESTION',1002,0),(26,'QUESTION',218,'2020-09-09 09:16:58',2,'CREATED_ANSWER',1002,0),(27,'QUESTION',219,'2020-09-09 09:18:00',2,'CREATED_QUESTION',1002,0),(28,'QUESTION',219,'2020-09-09 09:18:53',2,'CREATED_ANSWER',1002,0),(29,'QUESTION',220,'2020-09-11 22:36:23',2,'CREATED_QUESTION',1002,0),(30,'QUESTION',220,'2020-09-11 22:41:41',2,'CREATED_ANSWER',1002,0),(31,'QUESTION',221,'2020-09-11 22:47:33',2,'CREATED_QUESTION',1002,0),(32,'QUESTION',221,'2020-09-11 22:49:24',2,'CREATED_ANSWER',1002,0),(33,'QUESTION',222,'2020-09-11 22:54:42',2,'CREATED_QUESTION',1002,0),(34,'QUESTION',222,'2020-09-11 22:56:46',2,'CREATED_ANSWER',1002,0),(35,'QUESTION',223,'2020-09-11 23:01:14',2,'CREATED_QUESTION',1002,0),(36,'QUESTION',223,'2020-09-11 23:07:57',2,'CREATED_ANSWER',1002,0),(37,'QUESTION',224,'2020-09-11 23:10:32',2,'CREATED_QUESTION',1002,0),(38,'QUESTION',224,'2020-09-11 23:10:54',2,'CREATED_ANSWER',1002,0);
/*!40000 ALTER TABLE `ReputationEvent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tag`
--

DROP TABLE IF EXISTS `Tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `usageCount` bigint(20) DEFAULT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_24642shpebunaq3ggshotv9hk` (`name`),
  KEY `FK_9a9b8a968n0ejs6yikpgo563r` (`author_id`),
  CONSTRAINT `FK_9a9b8a968n0ejs6yikpgo563r` FOREIGN KEY (`author_id`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tag`
--

LOCK TABLES `Tag` WRITE;
/*!40000 ALTER TABLE `Tag` DISABLE KEYS */;
INSERT INTO `Tag` VALUES (15,'2020-09-07 07:59:23','','docker',7,1002),(16,'2020-09-07 08:05:18','','dotnet',2,1002),(17,'2020-09-07 08:07:52','','nuget',1,1002),(18,'2020-09-07 08:09:17','','sonarqube',5,1002),(19,'2020-09-07 08:10:54','','sql',3,1002),(20,'2020-09-11 23:10:32','','ssh',1,1002);
/*!40000 ALTER TABLE `Tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TagPage`
--

DROP TABLE IF EXISTS `TagPage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TagPage` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `about` longtext NOT NULL,
  `markedAbout` longtext NOT NULL,
  `tag_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_jcmikqbikgwump3qo3fnqbext` (`tag_id`),
  CONSTRAINT `FK_jcmikqbikgwump3qo3fnqbext` FOREIGN KEY (`tag_id`) REFERENCES `Tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TagPage`
--

LOCK TABLES `TagPage` WRITE;
/*!40000 ALTER TABLE `TagPage` DISABLE KEYS */;
/*!40000 ALTER TABLE `TagPage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserSession`
--

DROP TABLE IF EXISTS `UserSession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserSession` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT NULL,
  `sessionKey` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_jhpxm4m9w5ujlygolg3nj08m9` (`sessionKey`),
  KEY `session_key` (`sessionKey`),
  KEY `FK_g1vcu7yf9bjb3kj31y3ghw0jg` (`user_id`),
  CONSTRAINT `FK_g1vcu7yf9bjb3kj31y3ghw0jg` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserSession`
--

LOCK TABLES `UserSession` WRITE;
/*!40000 ALTER TABLE `UserSession` DISABLE KEYS */;
INSERT INTO `UserSession` VALUES (4,'2020-09-07 07:57:46','cfafb2b794d69222647ee9653764cddc39a1085d0ca746ee6b19227e47545e2a',1002),(5,'2020-09-07 10:46:04','29e71a5424cf0412a5a02966bb49704fae356b64d1862d0a28c7b4f70628a44a',1002);
/*!40000 ALTER TABLE `UserSession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `about` varchar(500) DEFAULT NULL,
  `birthDate` datetime DEFAULT NULL,
  `confirmedEmail` tinyint(1) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `forgotPasswordToken` varchar(255) DEFAULT NULL,
  `isBanned` tinyint(1) NOT NULL,
  `isSubscribed` tinyint(1) NOT NULL,
  `karma` bigint(20) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `markedAbout` varchar(600) DEFAULT NULL,
  `moderator` tinyint(1) NOT NULL,
  `name` varchar(100) NOT NULL,
  `nameLastTouchedAt` datetime DEFAULT NULL,
  `photoUri` varchar(255) DEFAULT NULL,
  `sluggedName` longtext NOT NULL,
  `website` varchar(200) DEFAULT NULL,
  `lastUpvote` datetime DEFAULT NULL,
  `avatarImage_id` bigint(20) DEFAULT NULL,
  `receiveAllUpdates` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_gvmhe2prumyg00npgdawfu7la` (`avatarImage_id`),
  CONSTRAINT `FK_gvmhe2prumyg00npgdawfu7la` FOREIGN KEY (`avatarImage_id`) REFERENCES `Attachment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1001,NULL,NULL,0,'2020-09-07 07:56:56','moderator@mamuteqa.org','',0,1,0,NULL,NULL,1,'moderator','2020-09-07 07:56:56',NULL,'moderator',NULL,'2020-09-07 07:56:56',NULL,0,0),(1002,'',NULL,0,'2020-09-07 07:57:46','kam@laganlabs.it','',0,1,66,'','',0,'Kam Lagan','2020-09-07 07:57:46',NULL,'kam-lagan','','2020-09-07 07:57:46',1,0,0);
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vote`
--

DROP TABLE IF EXISTS `Vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Vote` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdAt` datetime DEFAULT NULL,
  `lastUpdatedAt` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6nch3y92lphrbsh0o5c7o0jov` (`author_id`),
  CONSTRAINT `FK_6nch3y92lphrbsh0o5c7o0jov` FOREIGN KEY (`author_id`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vote`
--

LOCK TABLES `Vote` WRITE;
/*!40000 ALTER TABLE `Vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `Vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Watcher`
--

DROP TABLE IF EXISTS `Watcher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Watcher` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `watcher_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_hobtys3mefri57vry8w6o8xyq` (`watcher_id`),
  CONSTRAINT `FK_hobtys3mefri57vry8w6o8xyq` FOREIGN KEY (`watcher_id`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Watcher`
--

LOCK TABLES `Watcher` WRITE;
/*!40000 ALTER TABLE `Watcher` DISABLE KEYS */;
INSERT INTO `Watcher` VALUES (1,1,'2020-09-07 10:47:16',1002),(2,1,'2020-09-09 09:13:56',1002),(3,1,'2020-09-09 09:18:00',1002),(4,1,'2020-09-11 22:36:23',1002),(5,1,'2020-09-11 22:47:33',1002),(6,1,'2020-09-11 22:54:42',1002),(7,1,'2020-09-11 23:01:14',1002),(8,1,'2020-09-11 23:10:32',1002);
/*!40000 ALTER TABLE `Watcher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brutalmigration`
--

DROP TABLE IF EXISTS `brutalmigration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `brutalmigration` (
  `number` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brutalmigration`
--

LOCK TABLES `brutalmigration` WRITE;
/*!40000 ALTER TABLE `brutalmigration` DISABLE KEYS */;
INSERT INTO `brutalmigration` VALUES (0),(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16);
/*!40000 ALTER TABLE `brutalmigration` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-11 23:22:51

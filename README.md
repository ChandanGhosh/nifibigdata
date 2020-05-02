![Docker Build & Publish](https://github.com/ChandanGhosh/nifibigdata/workflows/Docker%20Build%20&%20Publish/badge.svg)


1) Open CMD command line 

2) See what do you run in containers 
 docker container ls 


3) Connect to NiFi bash

`docker exec -it --user root [containerId]  /bin/bash`

 (you have to replace [containerId] with your container from NiFi) 

4) Create folder structure 

`/usr/lib/jvm/jre/lib/jdbc/`
 
 `cd /usr/lib/jvm && mkdir jre && cd jre && mkdir lib && cd lib && mkdir jdbc && cd jdbc`  


5) Download MS SQL server driver (remove spaces after https://  below )

`wget https://download.microsoft.com/download/3/F/7/3F74A9B9-C5F0-43EA-A721-07DA590FD186/sqljdbc_6.2.2.0_enu.tar.gz`


6) Unpack driver 

`tar xvzf sqljdbc_6.2.2.0_enu.tar.gz`
 

7) See file location for mssql-jdbc-6.2.2.jre8.jar

`ls`

8) Remember path

`/usr/lib/jvm/jre/lib/jdbc/sqljdbc_6.2/enu/mssql-jdbc-6.2.2.jre8.jar`

9) Restart container

 `docker container ls -a`
 
 `docker container stop [containerId]`
 
 `docker container start [containerId]`

 you have to wait around 3 minutes, it takes some time to start that container
 
10) Open Nifi

`http://localhost:7882/nifi/`


11) Configure new Controlled service: 

`DBCPConnectionPool`  (right click on Canvas and choose Configure)

12) Set up your DB name 

13) Configure properties
Database Connection URL - [your database connection]

 
MSSQL         --  `jdbc:sqlserver://mssql:1433;databaseName=BikeStores`


Postgresql    --  `jdbc:postgresql://postgresql:5432/BikeStores`
    

 Database Driver Class Name
 
 (MSSQL)      -- `com.microsoft.sqlserver.jdbc.SQLServerDriver`
 
 (POSTGRESQL) -- `org.postgresql.Driver`
                           
 Database User(MSSQL) - sa / HarryPotter@123
            (POSTGRESQL) - postgres / password

 Password - HarryPotter@123
 Password - password
 
 Database Driver Location(s) 
 
`file:///usr/lib/jvm/jre/lib/jdbc/sqljdbc_6.2/enu/mssql-jdbc-6.2.2.jre8.jar`
 
`file:///lib/jdbc/mssql-jdbc-8.2.0.jre8.jar`

`file:///lib/jdbc/postgresql-42.2.10.jar`

14) Enable configuration and make sure that this is enabled 
 Do not start next step until it says that this is enabled


15) Add new processor ExecuteSQL 


16) Configure processor with - your SQL server & SQL query 

17) Set up scheduling to 600 seconds (if you wouldn't do it that query would be contantly running)

18) Disable success & failure 

19) Run it 

20) Observe results - right click on the processor / View data provenance

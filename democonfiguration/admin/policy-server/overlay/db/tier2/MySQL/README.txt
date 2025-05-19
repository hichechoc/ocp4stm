Use MySQL 8.x as a SiteMinder Store with SiteMinder in Containers Release 12.8.08 CR01
-------------------------------------------------------------------------------------------------------------------------
Use the provided SiteMinder schema files to test using MySQL 8.x as a SiteMinder store, where its native drivers are used for the ODBC connectivity, in your Release 12.8.08 CR01
containers testing environment. 

Follow these steps: 

1) Configure Config Retriever in your Containers environment, if it is not already configured. For information about the configuration, see
   https://techdocs.broadcom.com/us/en/symantec-security-software/identity-security/siteminder/12-8/siteminder-on-docker-containers/import-custom-configuration.html.

2) Download the SM_Containers_MySQL8.x_NativeDriverSupport.zip file onto the primary machine, unzip the file, and convert all the files into the UNIX format.

3) Copy the converted UNIX format schema files in the overlay/db/tier2/MySQL location of Config Retriever. 
   Example: For AWS S3, the path is s3://siteminder-beta/beta-may/admin/policy-server/overlay/db/tier2/MySQL.

4) Copy the converted UNIX format of the nativelib-invoke.sh file in the init.d/pre-config location of the Administrative Server and Policy Server components, using Config Retriever.
   Example: For AWS S3, the path is as follows: 
   Administrative Server: s3://siteminder-beta/inail-testing1/admin/policy-server/init.d/pre-config/nativelib-invoke.sh
   Policy Server: s3://siteminder-beta/inail-testing1/policyserver/policy-server/init.d/pre-config/nativelib-invoke.sh

5) Configure SSL using only the following steps: 
   5a) Do not configure the SSL section in the value.yaml file of server components.

   5b) Copy the ca.pem, client-key.pem, and client-cert.pem certificates in the overlay/config/odbcssl location of the Administrative Server and Policy Server components,
       using Config Retriever.
       Example: For AWS S3, the path is as follows: 
       s3://siteminder-beta/inail-testing1/admin/policy-server/overlay/config/odbcssl/
       s3://siteminder-beta/inail-testing1/policyserver/policy-server/overlay/config/odbcssl/                 

   5c) Copy the ssl_info.ini file to the overlay location of the Administrative Server and Policy Server components, using Config Retriever.
       Example: For AWS S3, the path is as follows: 
       s3://siteminder-beta/inail-testing1/admin/policy-server/overlay/ssl_info.ini
       s3://siteminder-beta/inail-testing1/policyserver/policy-server/overlay/ssl_info.ini

   5d) Copy the ssl_config.sh file to init.d/deployed location of the Administrative Server and Policy Server components, using Config Retriever.
       Example: For AWS S3, the path is as follows: 
       s3://siteminder-beta/inail-testing1/admin/policy-server/init.d/deployed/ssl_config.sh
       s3://siteminder-beta/inail-testing1/policyserver/policy-server/init.d/deployed/ssl_config.sh	

6) Update the Config Retriever location and its relevant parameters in the values.yaml file of server components. For information about the parameters, see
   https://techdocs.broadcom.com/us/en/symantec-security-software/identity-security/siteminder/12-8/siteminder-on-docker-containers/deployment-process-of-siteminder-as-container/configure-configuration-parameters/server-components-parameters.html.

7) Deploy server components. For information about the deployment process, see
   https://techdocs.broadcom.com/us/en/symantec-security-software/identity-security/siteminder/12-8/siteminder-on-docker-containers/deployment-process-of-siteminder-as-container/deploy-siteminder-server-components.html.

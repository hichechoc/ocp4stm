
DROP TABLE IF EXISTS smobjlog4;

CREATE TABLE smobjlog4
(
    sm_timestamp            TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    sm_categoryid           INT         NOT NULL DEFAULT 0,
    sm_eventid              INT         NOT NULL DEFAULT 0,
    sm_hostname             VARCHAR(255),
    sm_sessionid            VARCHAR(255),
    sm_username             VARCHAR(512),
    sm_objname              VARCHAR(512),
    sm_objoid               VARCHAR(64),
    sm_fielddesc            VARCHAR(1024),
    sm_domainoid            VARCHAR(64),
    sm_status               VARCHAR(1024)
);

CREATE INDEX sm1smobjlog4 ON smobjlog4
(
    sm_timestamp
);

CREATE INDEX sm2smobjlog4 ON smobjlog4
(
    sm_categoryid
);

CREATE INDEX sm3smobjlog4 ON smobjlog4
(
    sm_username
);

DROP TABLE IF EXISTS smaccesslog4;

CREATE TABLE smaccesslog4
(
    sm_timestamp            TIMESTAMP       NOT NULL DEFAULT CURRENT_TIMESTAMP,
    sm_categoryid           INT         NOT NULL DEFAULT 0,
    sm_eventid              INT         NOT NULL DEFAULT 0,
    sm_hostname             VARCHAR(255),
    sm_sessionid            VARCHAR(255),
    sm_username             VARCHAR(512),
    sm_agentname            VARCHAR(255),
    sm_realmname            VARCHAR(255),
    sm_realmoid             VARCHAR(64),
    sm_clientip             VARCHAR(255),
    sm_domainoid            VARCHAR(64),
    sm_authdirname          VARCHAR(255),
    sm_authdirserver        VARCHAR(512),
    sm_authdirnamespace     VARCHAR(255),
    sm_resource             VARCHAR(3200),
    sm_action               VARCHAR(255),
    sm_status               VARCHAR(1024),
    sm_reason               INT         NOT NULL DEFAULT 0,
    sm_transactionid        VARCHAR(255),
    sm_domainname           VARCHAR(255),
    sm_impersonatorname     VARCHAR(512),
    sm_impersonatordirname  VARCHAR(255),
    sm_assertion_id         VARCHAR(255) NULL,
    sm_assertion_issuerid   VARCHAR(255) NULL,
    sm_assertion_destinationurl VARCHAR(4096) NULL,
    sm_assertion_statuscode     VARCHAR(255) NULL,
    sm_assertion_NotOnBefore    TIMESTAMP NULL, 
    sm_assertion_notonorafter   TIMESTAMP NULL, 
    sm_assertion_sess_starttime TIMESTAMP NULL, 
    sm_assertion_sess_notonorafter  TIMESTAMP NULL, 
    sm_assertion_authcontext    VARCHAR(255) NULL,
    sm_assertion_versionid      VARCHAR(255) NULL,
    sm_assertion_claims     VARCHAR(255) NULL,
    sm_application_name     VARCHAR(255) NULL,
    sm_tenant_name          VARCHAR(255) NULL,
    sm_authentication_method    VARCHAR(255) NULL,   
    sm_devicehash               VARCHAR(255) NULL,   
    sm_deviceid                 VARCHAR(255) NULL,   
    sm_userrefid                VARCHAR(255) NULL,
    sm_transaction_response_time  DECIMAL(10,6)	
);

CREATE INDEX sm1smaccesslog4 ON smaccesslog4
(
    sm_timestamp
);

CREATE INDEX sm2smaccesslog4 ON smaccesslog4
(
    sm_domainname
);

CREATE INDEX sm3smaccesslog4 ON smaccesslog4
(
    sm_categoryid
);

CREATE INDEX sm4smaccesslog4 ON smaccesslog4
(
    sm_eventid
);

CREATE INDEX sm5smaccesslog4 ON smaccesslog4
(
    sm_agentname
);

CREATE INDEX sm6smaccesslog4 ON smaccesslog4
(
    sm_username
);

DELIMITER $$

DROP FUNCTION IF EXISTS `databaseName`.`getdate` $$
CREATE FUNCTION `databaseName`.`getdate` () RETURNS DATE
DETERMINISTIC
BEGIN
  RETURN CURRENT_DATE;
END $$

DELIMITER ;
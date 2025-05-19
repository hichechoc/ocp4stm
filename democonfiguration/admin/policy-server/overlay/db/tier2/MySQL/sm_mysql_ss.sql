
DROP TABLE IF EXISTS ss_sessionmaintenance5;

CREATE TABLE ss_sessionmaintenance5
(
    lastmclose      INT         NOT NULL DEFAULT 0,
    version         INT         NOT NULL DEFAULT 0
);

DROP TABLE IF EXISTS ss_sessionspec5;

CREATE TABLE ss_sessionspec5
(
    sessionid       VARCHAR(64)     NOT NULL,
    expirationtime  INT         NOT NULL DEFAULT 0,
    maxidletime     INT         NOT NULL DEFAULT 0,
    lasttouch       INT         NOT NULL DEFAULT 0,
    status          INT         NOT NULL DEFAULT 0,
    sessionblob     VARCHAR(4000)   NOT NULL,
    PRIMARY KEY     (sessionid)
);

CREATE INDEX sm1sessionspec ON ss_sessionspec5
(
    expirationtime
);

CREATE INDEX sm2sessionspec ON ss_sessionspec5
(
    lasttouch
);

CREATE INDEX sm3sessionspec ON ss_sessionspec5
(
    status
);

CREATE INDEX sm4sessionspec ON ss_sessionspec5
(
    maxidletime
);

DROP TABLE IF EXISTS ss_sessionvar5;

CREATE TABLE ss_sessionvar5
(
    sessionid       VARCHAR(64)     NOT NULL,
    varname         VARCHAR(64)     NOT NULL,
    varvalue        VARCHAR(4000)   NOT NULL,
    chunkgroupid	VARCHAR(256),
    datasize        INT DEFAULT 0,
    PRIMARY KEY     (sessionid, varname),
    CONSTRAINT      fk_sessionid
        FOREIGN KEY (sessionid)
        REFERENCES  ss_sessionspec5(sessionid) ON DELETE CASCADE
);

CREATE INDEX sm1sessionvar ON ss_sessionvar5
(
    sessionid
);

DROP TABLE IF EXISTS ss_expirydata5;

CREATE TABLE ss_expirydata5 (
    type            INT         NOT NULL DEFAULT 0,
    id              VARCHAR(256)    NOT NULL,
    searchdata      VARCHAR(512),
    expirationtime  INT         NOT NULL DEFAULT 0,
    maxidletime     INT         NOT NULL DEFAULT 0,
    lasttouch       INT         NOT NULL DEFAULT 0,
    data            VARCHAR(4000),
    chunkgroupid	VARCHAR(256),
    datasize        INT DEFAULT 0,
    PRIMARY KEY (type, id)
);

CREATE INDEX XIE1ss_expirydata5 ON ss_expirydata5 
(
       expirationtime
);

CREATE INDEX XIE2ss_expirydata5 ON ss_expirydata5 
(
       type, searchdata
);

DROP TABLE IF EXISTS ss_chunkeddata6;

CREATE TABLE ss_chunkeddata6 (
    chunkgroupid    VARCHAR(256)    NOT NULL,
    sequence        INT         NOT NULL DEFAULT 0,
    data            VARCHAR(4000),
    PRIMARY KEY (chunkgroupid, sequence)
);

CREATE INDEX XIE1ss_chunkedd6 ON ss_chunkeddata6 
(
       chunkgroupid
);

INSERT INTO ss_sessionmaintenance5 VALUES (0, 3);

DELIMITER $$

DROP FUNCTION IF EXISTS `databaseName`.`getdate` $$
CREATE FUNCTION `databaseName`.`getdate` () RETURNS DATE
DETERMINISTIC
BEGIN
  RETURN CURRENT_DATE;
END $$

DELIMITER ;

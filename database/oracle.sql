  DROP TABLE AU_GROUP_RELATION;
  DROP TABLE AU_ORGINFO;
  DROP TABLE AU_ROLEINFO;
  DROP TABLE AU_USERINFO;
  DROP TABLE FOXBPM_AGENT;
  DROP TABLE FOXBPM_AGENT_DETAILS;
  DROP TABLE FOXBPM_DEF_BYTEARRAY;
  DROP TABLE FOXBPM_DEF_DEPLOYMENT;
  DROP TABLE FOXBPM_DEF_PROCESSDEFINITION;
  DROP TABLE FOXBPM_MAIL;
  DROP TABLE FOXBPM_RUN_OPERATING;
  DROP TABLE FOXBPM_RUN_PROCESSINSTANCE;
  DROP TABLE FOXBPM_RUN_RUNNINGTRACK;
  DROP TABLE FOXBPM_RUN_TASK;
  DROP TABLE FOXBPM_RUN_TASKIDENTITYLINK;
  DROP TABLE FOXBPM_RUN_TOKEN;
  DROP TABLE FOXBPM_RUN_VARIABLE;
  DROP TABLE QRTZ_BLOB_TRIGGERS;
  DROP TABLE QRTZ_CALENDARS;
  DROP TABLE QRTZ_CRON_TRIGGERS;
  DROP TABLE QRTZ_FIRED_TRIGGERS; 
  DROP TABLE QRTZ_LOCKS;
  DROP TABLE QRTZ_PAUSED_TRIGGER_GRPS;
  DROP TABLE QRTZ_SCHEDULER_STATE;
  DROP TABLE QRTZ_SIMPLE_TRIGGERS;
  DROP TABLE QRTZ_SIMPROP_TRIGGERS;
  DROP TABLE QRTZ_TRIGGERS;
  DROP TABLE QRTZ_JOB_DETAILS;
  DROP TABLE TB_EXPENSE;
  CREATE TABLE "AU_GROUP_RELATION" 
   (	
      "GUID" VARCHAR2(64 BYTE) NOT NULL, 
      "USERID" VARCHAR2(512 BYTE) DEFAULT NULL, 
      "GROUPID" VARCHAR2(512 BYTE) DEFAULT NULL, 
      "GROUPTYPE" VARCHAR2(512 BYTE) DEFAULT NULL,
      PRIMARY KEY("GUID")
   );
  CREATE TABLE "AU_ORGINFO" 
   (	
      "ORGID" VARCHAR2(64 BYTE) NOT NULL, 
      "SUPORGID" VARCHAR2(512 BYTE) DEFAULT NULL, 
      "ORGNAME" VARCHAR2(512 BYTE) DEFAULT NULL,
      PRIMARY KEY ("ORGID")
   );
  CREATE TABLE "AU_ROLEINFO" 
   (	
      "ROLEID" VARCHAR2(64 BYTE) NOT NULL, 
      "ROLENAME" VARCHAR2(512 BYTE) DEFAULT NULL,
      PRIMARY KEY ("ROLEID")
   );
  CREATE TABLE "AU_USERINFO" 
   (	
      "USERID" VARCHAR2(64 BYTE) NOT NULL, 
      "USERNAME" VARCHAR2(512 BYTE) DEFAULT NULL, 
      "PASSWORD" VARCHAR2(512 BYTE) DEFAULT NULL, 
      "EMAIL" VARCHAR2(250 BYTE) DEFAULT NULL, 
      "TEL" VARCHAR2(255 BYTE) DEFAULT NULL, 
      "IMAGE" VARCHAR2(64 BYTE) DEFAULT NULL,
      PRIMARY KEY ("USERID") 
   );
   CREATE TABLE "FOXBPM_AGENT" 
   (	
      "ID" VARCHAR2(255 BYTE) NOT NULL, 
      "AGENT_USER" VARCHAR2(255 BYTE) DEFAULT NULL, 
      "STARTTIME" TIMESTAMP (6) DEFAULT NULL, 
      "ENDTIME" TIMESTAMP (6) DEFAULT NULL, 
      "STATUS" VARCHAR2(255 BYTE) DEFAULT NULL,
      PRIMARY KEY ("ID")
   );
   CREATE TABLE "FOXBPM_AGENT_DETAILS" 
   (	
      "ID" VARCHAR2(255 BYTE) NOT NULL, 
      "AGENT_ID" VARCHAR2(255 BYTE) DEFAULT NULL, 
      "PROCESSDEFINITION_KEY" VARCHAR2(255 BYTE), 
      "AGENT_TOUSER" VARCHAR2(255 BYTE) DEFAULT NULL,
      PRIMARY KEY ("ID")
   );
  CREATE TABLE "FOXBPM_DEF_BYTEARRAY" 
   (	
      "ID" VARCHAR2(64 BYTE) NOT NULL, 
      "REV" NUMBER(12,0) DEFAULT NULL, 
      "NAME" VARCHAR2(512 BYTE) DEFAULT NULL, 
      "BYTES" BLOB, 
      "DEPLOYMENT_ID" VARCHAR2(256 BYTE) DEFAULT NULL,
      PRIMARY KEY("ID")
   );
  CREATE TABLE "FOXBPM_DEF_DEPLOYMENT" 
   (	
      "ID" VARCHAR2(64 BYTE) NOT NULL, 
      "NAME" VARCHAR2(512 BYTE) DEFAULT NULL, 
      "DEPLOY_TIME" TIMESTAMP (6) DEFAULT NULL,
      PRIMARY KEY("ID")
   );
 
  CREATE TABLE "FOXBPM_DEF_PROCESSDEFINITION" 
   (	
      "DIFINITIONS_KEY" VARCHAR2(512 BYTE) DEFAULT NULL, 
      "DIFINITIONS_ID" VARCHAR2(512 BYTE) DEFAULT NULL, 
      "PROCESS_KEY" VARCHAR2(512 BYTE) DEFAULT NULL, 
      "PROCESS_ID" VARCHAR2(250 BYTE) NOT NULL, 
      "CATEGORY" VARCHAR2(255 BYTE) DEFAULT NULL, 
      "PROCESS_NAME" VARCHAR2(255 BYTE) DEFAULT NULL, 
      "VERSION" NUMBER(*,0) DEFAULT NULL, 
      "RESOURCE_NAME" VARCHAR2(4000 BYTE) DEFAULT NULL, 
      "DEPLOYMENT_ID" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "DIAGRAM_RESOURCE_NAME" VARCHAR2(512 BYTE) DEFAULT NULL, 
      "START_FORM_KEY" VARCHAR2(1024 BYTE) DEFAULT NULL, 
      "RESOURCE_ID" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "SUB_TASK_ID" VARCHAR2(128 BYTE) DEFAULT NULL, 
      "REV_" NUMBER(*,0) DEFAULT 0,
      PRIMARY KEY("PROCESS_ID")
   );
  CREATE TABLE "FOXBPM_MAIL" 
   (	
      "MAIL_ID" VARCHAR2(128 BYTE) NOT NULL, 
      "MAIL_NAME" VARCHAR2(4000 BYTE) DEFAULT NULL, 
      "MAIL_TO" VARCHAR2(4000 BYTE) DEFAULT NULL, 
      "MAIL_SUBJECT" VARCHAR2(4000 BYTE) DEFAULT NULL, 
      "MAIL_BODY" BLOB, 
      "MAIL_STATUS" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "CREATE_TIME" TIMESTAMP (6) DEFAULT NULL, 
      "SEND_TIME" TIMESTAMP (6) DEFAULT NULL, 
      "MAIL_CC" VARCHAR2(4000 BYTE) DEFAULT NULL, 
      "CREATE_USER" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "FAILURE_REASON" VARCHAR2(4000 BYTE) DEFAULT NULL,
      PRIMARY KEY ("MAIL_ID")
   );
  CREATE TABLE "FOXBPM_RUN_OPERATING" 
   (	
      "ID" VARCHAR2(64 BYTE) NOT NULL, 
      "PROCESSINSTANCE_ID" VARCHAR2(64 BYTE), 
      "PROCESSDEFINITION_ID" VARCHAR2(512 BYTE), 
      "PROCESSDEFINITION_NAME" VARCHAR2(512 BYTE), 
      "PROCESSDEFINITION_KEY" VARCHAR2(256 BYTE), 
      "TASK_ID" VARCHAR2(64 BYTE), 
      "TOKEN_ID" VARCHAR2(64 BYTE), 
      "NODE_ID" VARCHAR2(64 BYTE), 
      "NODE_NAME" VARCHAR2(256 BYTE), 
      "OPERATING_TIME" TIMESTAMP (6), 
      "COMMAND_ID" VARCHAR2(64 BYTE), 
      "COMMAND_TYPE" VARCHAR2(64 BYTE), 
      "COMMAND_MESSAGE" VARCHAR2(64 BYTE), 
      "OPERATING_COMMENT" VARCHAR2(4000 BYTE), 
      "OPERATOR" VARCHAR2(64 BYTE),
      PRIMARY KEY ("ID")
   ); 
  CREATE TABLE "FOXBPM_RUN_PROCESSINSTANCE" 
   (	
      "ID" VARCHAR2(64 BYTE) NOT NULL, 
      "PROCESSDEFINITION_ID" VARCHAR2(512 BYTE) DEFAULT NULL, 
      "PROCESSDEFINITION_KEY" VARCHAR2(512 BYTE) DEFAULT NULL, 
      "SUBJECT" VARCHAR2(4000 BYTE) DEFAULT NULL, 
      "START_TIME" TIMESTAMP (6) DEFAULT NULL, 
      "END_TIME" TIMESTAMP (6) DEFAULT NULL, 
      "DEFINITION_ID" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "ROOTTOKEN_ID" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "BIZ_KEY" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "INITIATOR" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "START_AUTHOR" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "ISSUSPENDED" VARCHAR2(20 BYTE) DEFAULT NULL, 
      "PARENT_ID" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "PARENT_TOKEN_ID" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "UPDATE_TIME" TIMESTAMP (6) DEFAULT NULL, 
      "PROCESSLOCATION" VARCHAR2(2048 BYTE) DEFAULT NULL, 
      "INSTANCE_STATUS" VARCHAR2(45 BYTE) DEFAULT NULL, 
      "ARCHIVE_TIME" TIMESTAMP (6) DEFAULT NULL, 
      "REV_" NUMBER(*,0) DEFAULT 0,
      PRIMARY KEY("ID")
   ); 
  CREATE TABLE "FOXBPM_RUN_RUNNINGTRACK" 
   (	
       "ID" VARCHAR2(64 BYTE) NOT NULL, 
      "PROCESSINSTANCE_ID" VARCHAR2(64 BYTE), 
      "PROCESSDEFINITION_ID" VARCHAR2(512 BYTE), 
      "PROCESSDEFINITION_KEY" VARCHAR2(512 BYTE), 
      "TOKEN_ID" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "PARENT_TOKEN_ID" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "EXECUTION_TIME" TIMESTAMP (6) DEFAULT NULL, 
      "TRACK_RECORD" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "OPERATOR" VARCHAR2(512 BYTE) DEFAULT NULL, 
      "NODE_ID" VARCHAR2(128 BYTE) DEFAULT NULL, 
      "NODE_NAME" VARCHAR2(512 BYTE) DEFAULT NULL, 
      "EVENT_NAME" VARCHAR2(512 BYTE) DEFAULT NULL, 
      "ARCHIVE_TIME" TIMESTAMP (6) DEFAULT NULL,
      PRIMARY KEY("ID")
   );
 
  CREATE TABLE "FOXBPM_RUN_TASK" 
   (	
      "ID" VARCHAR2(64 BYTE) NOT NULL, 
      "PROCESSINSTANCE_ID" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "PROCESSDEFINITION_ID" VARCHAR2(512 BYTE) DEFAULT NULL, 
      "VERSION" NUMBER(*,0) DEFAULT NULL, 
      "TOKEN_ID" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "NODE_ID" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "DESCRIPTION" VARCHAR2(4000 BYTE) DEFAULT NULL, 
      "SUBJECT" VARCHAR2(255 BYTE) DEFAULT NULL, 
      "PARENT_ID" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "ASSIGNEE" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "CLAIM_TIME" TIMESTAMP (6) DEFAULT NULL, 
      "NAME" VARCHAR2(255 BYTE) DEFAULT NULL, 
      "CREATE_TIME" TIMESTAMP (6) DEFAULT NULL, 
      "START_TIME" TIMESTAMP (6) DEFAULT NULL, 
      "ISBLOCKING" VARCHAR2(20 BYTE) DEFAULT NULL, 
      "END_TIME" TIMESTAMP (6) DEFAULT NULL, 
      "DUEDATE" TIMESTAMP (6) DEFAULT NULL, 
      "PRIORITY" NUMBER(6,0) DEFAULT NULL, 
      "CATEGORY" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "OWNER" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "DELEGATIONSTATE" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "BIZKEY" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "COMMAND_TYPE" VARCHAR2(256 BYTE) DEFAULT NULL, 
      "COMMAND_MESSAGE" VARCHAR2(256 BYTE) DEFAULT NULL, 
      "TASK_COMMENT" VARCHAR2(4000 BYTE) DEFAULT NULL, 
      "NODE_NAME" VARCHAR2(512 BYTE) DEFAULT NULL, 
      "PROCESSDEFINITION_KEY" VARCHAR2(512 BYTE) DEFAULT NULL, 
      "FORMURI" VARCHAR2(256 BYTE) DEFAULT NULL, 
      "TASKGROUP" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "TASKTYPE" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "PROCESSDEFINITION_NAME" VARCHAR2(512 BYTE) DEFAULT NULL, 
      "ISCANCELLED" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "ISSUSPENDED" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "ISOPEN" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "ISDRAFT" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "EXPECTED_EXECUTIONTIME" NUMBER(14,2) DEFAULT NULL, 
      "AGENT" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "ADMIN" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "FORMURIVIEW" VARCHAR2(512 BYTE) DEFAULT NULL, 
      "CALLACTIVITY_INSTANCE_ID" VARCHAR2(256 BYTE) DEFAULT NULL, 
      "COMMAND_ID" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "PENDINGTASKID" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "ARCHIVE_TIME" TIMESTAMP (6) DEFAULT NULL, 
      "COMPLETEDESCRIPTION" VARCHAR2(1024 BYTE) DEFAULT NULL, 
      "PROCESSSTART_TIME" TIMESTAMP (6) DEFAULT NULL, 
      "PROCESS_INITIATOR" VARCHAR2(255 BYTE) DEFAULT NULL, 
      "REV_" NUMBER(*,0) DEFAULT 0, 
      "NEXT_TASK_ID" VARCHAR2(64 BYTE), 
      "ADDSIGN_TYPE" VARCHAR2(64 BYTE),
      PRIMARY KEY("ID")
   );
 
  CREATE TABLE "FOXBPM_RUN_TASKIDENTITYLINK" 
   (	
      "ID" VARCHAR2(64 BYTE) NOT NULL, 
      "TYPE" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "USER_ID" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "GROUP_ID" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "GROUP_TYPE" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "TASK_ID" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "INCLUDE_EXCLUSION" VARCHAR2(64 BYTE) DEFAULT NULL,
      PRIMARY KEY("ID")
   );
 
  CREATE TABLE "FOXBPM_RUN_TOKEN" 
   (	
      "ID" VARCHAR2(64 BYTE) NOT NULL, 
      "NAME" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "PROCESSINSTANCE_ID" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "NODE_ID" VARCHAR2(128 BYTE) DEFAULT NULL, 
      "PARENT_ID" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "START_TIME" TIMESTAMP (6) DEFAULT NULL, 
      "END_TIME" TIMESTAMP (6) DEFAULT NULL, 
      "NODEENTER_TIME" TIMESTAMP (6) DEFAULT NULL, 
      "ARCHIVE_TIME" TIMESTAMP (6) DEFAULT NULL, 
      "ISSUSPENDED" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "ISLOCK" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "ISACTIVE" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "ISSUBPROCESSROOTTOKEN" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "REV_" NUMBER(*,0) DEFAULT 0, 
      "LOOP_COUNT" NUMBER(*,0),
      PRIMARY KEY("ID")
   );

  CREATE TABLE "FOXBPM_RUN_VARIABLE" 
   (	
      "ID" VARCHAR2(64 BYTE) NOT NULL, 
      "PROCESSINSTANCE_ID" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "PROCESSDEFINITION_ID" VARCHAR2(255 BYTE) DEFAULT NULL, 
      "PROCESSDEFINITION_KEY" VARCHAR2(255 BYTE) DEFAULT NULL, 
      "VARIABLE_KEY" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "VARIABLE_VALUE" BLOB, 
      "CLASSNAME" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "TASK_ID" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "TOKEN_ID" VARCHAR2(64 BYTE) DEFAULT NULL, 
      "NODE_ID" VARCHAR2(512 BYTE) DEFAULT NULL, 
      "VARIABLE_TYPE" VARCHAR2(45 BYTE) DEFAULT NULL, 
      "BIZ_DATA" VARCHAR2(2048 BYTE) DEFAULT NULL, 
      "REV_" NUMBER(*,0) DEFAULT 0,
      PRIMARY KEY("ID")
   );
  
  CREATE TABLE "QRTZ_BLOB_TRIGGERS" 
   (	
       "SCHED_NAME" VARCHAR2(120 BYTE) NOT NULL, 
      "TRIGGER_NAME" VARCHAR2(200 BYTE) NOT NULL, 
      "TRIGGER_GROUP" VARCHAR2(200 BYTE) NOT NULL, 
      "BLOB_DATA" BLOB
   );
  CREATE UNIQUE INDEX "SYS_C009109" ON "QRTZ_BLOB_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP");
  ALTER TABLE "QRTZ_BLOB_TRIGGERS" ADD PRIMARY KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP"); 
  
    
  CREATE TABLE "QRTZ_CALENDARS" 
   (	
      "SCHED_NAME" VARCHAR2(120 BYTE) NOT NULL, 
      "CALENDAR_NAME" VARCHAR2(200 BYTE) NOT NULL, 
      "CALENDAR" BLOB NOT NULL
   );
  CREATE UNIQUE INDEX "SYS_C009114" ON "QRTZ_CALENDARS" ("SCHED_NAME", "CALENDAR_NAME");
  ALTER TABLE "QRTZ_CALENDARS" ADD PRIMARY KEY ("SCHED_NAME", "CALENDAR_NAME"); 
  
  CREATE TABLE "QRTZ_CRON_TRIGGERS" 
   (	
      "SCHED_NAME" VARCHAR2(120 BYTE) NOT NULL, 
      "TRIGGER_NAME" VARCHAR2(200 BYTE) NOT NULL, 
      "TRIGGER_GROUP" VARCHAR2(200 BYTE) NOT NULL, 
      "CRON_EXPRESSION" VARCHAR2(120 BYTE) NOT NULL, 
      "TIME_ZONE_ID" VARCHAR2(80 BYTE)
   );
  CREATE UNIQUE INDEX "SYS_C009099" ON "QRTZ_CRON_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP");  
  ALTER TABLE "QRTZ_CRON_TRIGGERS" ADD PRIMARY KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP"); 
 
  CREATE TABLE "QRTZ_FIRED_TRIGGERS" 
   (	
      "SCHED_NAME" VARCHAR2(120 BYTE) NOT NULL, 
      "ENTRY_ID" VARCHAR2(95 BYTE) NOT NULL, 
      "TRIGGER_NAME" VARCHAR2(200 BYTE) NOT NULL, 
      "TRIGGER_GROUP" VARCHAR2(200 BYTE) NOT NULL, 
      "INSTANCE_NAME" VARCHAR2(200 BYTE) NOT NULL, 
      "FIRED_TIME" NUMBER(13,0) NOT NULL, 
      "PRIORITY" NUMBER(13,0) NOT NULL, 
      "STATE" VARCHAR2(16 BYTE) NOT NULL, 
      "JOB_NAME" VARCHAR2(200 BYTE), 
      "JOB_GROUP" VARCHAR2(200 BYTE), 
      "IS_NONCONCURRENT" VARCHAR2(1 BYTE), 
      "REQUESTS_RECOVERY" VARCHAR2(1 BYTE)
   );
  CREATE INDEX "IDX_QRTZ_FT_JG" ON "QRTZ_FIRED_TRIGGERS" ("SCHED_NAME", "JOB_GROUP");
  CREATE INDEX "IDX_QRTZ_FT_T_G" ON "QRTZ_FIRED_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP"); 
  CREATE INDEX "IDX_QRTZ_FT_TG" ON "QRTZ_FIRED_TRIGGERS" ("SCHED_NAME", "TRIGGER_GROUP"); 
  CREATE UNIQUE INDEX "SYS_C009126" ON "QRTZ_FIRED_TRIGGERS" ("SCHED_NAME", "ENTRY_ID"); 
  CREATE INDEX "IDX_QRTZ_FT_TRIG_INST_NAME" ON "QRTZ_FIRED_TRIGGERS" ("SCHED_NAME", "INSTANCE_NAME"); 
  CREATE INDEX "IDX_QRTZ_FT_INST_JOB_REQ_RCVRY" ON "QRTZ_FIRED_TRIGGERS" ("SCHED_NAME", "INSTANCE_NAME", "REQUESTS_RECOVERY"); 
  CREATE INDEX "IDX_QRTZ_FT_J_G" ON "QRTZ_FIRED_TRIGGERS" ("SCHED_NAME", "JOB_NAME", "JOB_GROUP");  
  ALTER TABLE "QRTZ_FIRED_TRIGGERS" ADD PRIMARY KEY ("SCHED_NAME", "ENTRY_ID"); 
  
  CREATE TABLE "QRTZ_JOB_DETAILS" 
   (	
      "SCHED_NAME" VARCHAR2(120 BYTE) NOT NULL, 
      "JOB_NAME" VARCHAR2(200 BYTE) NOT NULL, 
      "JOB_GROUP" VARCHAR2(200 BYTE) NOT NULL, 
      "DESCRIPTION" VARCHAR2(250 BYTE), 
      "JOB_CLASS_NAME" VARCHAR2(250 BYTE) NOT NULL, 
      "IS_DURABLE" VARCHAR2(1 BYTE) NOT NULL, 
      "IS_NONCONCURRENT" VARCHAR2(1 BYTE) NOT NULL, 
      "IS_UPDATE_DATA" VARCHAR2(1 BYTE) NOT NULL, 
      "REQUESTS_RECOVERY" VARCHAR2(1 BYTE) NOT NULL, 
      "JOB_DATA" BLOB
   );
  CREATE INDEX "IDX_QRTZ_J_REQ_RECOVERY" ON "QRTZ_JOB_DETAILS" ("SCHED_NAME", "REQUESTS_RECOVERY");  
  CREATE INDEX "IDX_QRTZ_J_GRP" ON "QRTZ_JOB_DETAILS" ("SCHED_NAME", "JOB_GROUP");  
  CREATE UNIQUE INDEX "SYS_C009076" ON "QRTZ_JOB_DETAILS" ("SCHED_NAME", "JOB_NAME", "JOB_GROUP");  
  ALTER TABLE "QRTZ_JOB_DETAILS" ADD PRIMARY KEY ("SCHED_NAME", "JOB_NAME", "JOB_GROUP"); 

  CREATE TABLE "QRTZ_LOCKS" 
   (	
      "SCHED_NAME" VARCHAR2(120 BYTE) NOT NULL, 
      "LOCK_NAME" VARCHAR2(40 BYTE) NOT NULL
   );
  CREATE UNIQUE INDEX "SYS_C009134" ON "QRTZ_LOCKS" ("SCHED_NAME", "LOCK_NAME");  
  ALTER TABLE "QRTZ_LOCKS" ADD PRIMARY KEY ("SCHED_NAME", "LOCK_NAME"); 

  CREATE TABLE "QRTZ_PAUSED_TRIGGER_GRPS" 
   (	
      "SCHED_NAME" VARCHAR2(120 BYTE) NOT NULL, 
      "TRIGGER_GROUP" VARCHAR2(200 BYTE) NOT NULL
   );
  CREATE UNIQUE INDEX "SYS_C009117" ON "QRTZ_PAUSED_TRIGGER_GRPS" ("SCHED_NAME", "TRIGGER_GROUP");  
  ALTER TABLE "QRTZ_PAUSED_TRIGGER_GRPS" ADD PRIMARY KEY ("SCHED_NAME", "TRIGGER_GROUP");
   
  CREATE TABLE "QRTZ_SCHEDULER_STATE" 
   (	
      "SCHED_NAME" VARCHAR2(120 BYTE) NOT NULL, 
      "INSTANCE_NAME" VARCHAR2(200 BYTE) NOT NULL, 
      "LAST_CHECKIN_TIME" NUMBER(13,0) NOT NULL, 
      "CHECKIN_INTERVAL" NUMBER(13,0) NOT NULL
   );
  CREATE UNIQUE INDEX "SYS_C009131" ON "QRTZ_SCHEDULER_STATE" ("SCHED_NAME", "INSTANCE_NAME");
  ALTER TABLE "QRTZ_SCHEDULER_STATE" ADD PRIMARY KEY ("SCHED_NAME", "INSTANCE_NAME"); 
  
  CREATE TABLE "QRTZ_SIMPLE_TRIGGERS" 
   (	
      "SCHED_NAME" VARCHAR2(120 BYTE) NOT NULL, 
      "TRIGGER_NAME" VARCHAR2(200 BYTE) NOT NULL, 
      "TRIGGER_GROUP" VARCHAR2(200 BYTE) NOT NULL, 
      "REPEAT_COUNT" NUMBER(7,0) NOT NULL, 
      "REPEAT_INTERVAL" NUMBER(12,0) NOT NULL, 
      "TIMES_TRIGGERED" NUMBER(10,0) NOT NULL
   );
  CREATE UNIQUE INDEX "SYS_C009093" ON "QRTZ_SIMPLE_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP");
  ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" ADD PRIMARY KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP"); 
  
  CREATE TABLE "QRTZ_SIMPROP_TRIGGERS" 
   (	
      "SCHED_NAME" VARCHAR2(120 BYTE) NOT NULL, 
      "TRIGGER_NAME" VARCHAR2(200 BYTE) NOT NULL, 
      "TRIGGER_GROUP" VARCHAR2(200 BYTE) NOT NULL, 
      "STR_PROP_1" VARCHAR2(512 BYTE), 
      "STR_PROP_2" VARCHAR2(512 BYTE), 
      "STR_PROP_3" VARCHAR2(512 BYTE), 
      "INT_PROP_1" NUMBER(10,0), 
      "INT_PROP_2" NUMBER(10,0), 
      "LONG_PROP_1" NUMBER(13,0), 
      "LONG_PROP_2" NUMBER(13,0), 
      "DEC_PROP_1" NUMBER(13,4), 
      "DEC_PROP_2" NUMBER(13,4), 
      "BOOL_PROP_1" VARCHAR2(1 BYTE), 
      "BOOL_PROP_2" VARCHAR2(1 BYTE)
   );
  CREATE UNIQUE INDEX "SYS_C009104" ON "QRTZ_SIMPROP_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP");  
  ALTER TABLE "QRTZ_SIMPROP_TRIGGERS" ADD PRIMARY KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP");  
  
  CREATE TABLE "QRTZ_TRIGGERS" 
   (	
      "SCHED_NAME" VARCHAR2(120 BYTE) NOT NULL, 
      "TRIGGER_NAME" VARCHAR2(200 BYTE) NOT NULL, 
      "TRIGGER_GROUP" VARCHAR2(200 BYTE) NOT NULL, 
      "JOB_NAME" VARCHAR2(200 BYTE) NOT NULL, 
      "JOB_GROUP" VARCHAR2(200 BYTE) NOT NULL, 
      "DESCRIPTION" VARCHAR2(250 BYTE), 
      "NEXT_FIRE_TIME" NUMBER(13,0), 
      "PREV_FIRE_TIME" NUMBER(13,0), 
      "PRIORITY" NUMBER(13,0), 
      "TRIGGER_STATE" VARCHAR2(16 BYTE) NOT NULL, 
      "TRIGGER_TYPE" VARCHAR2(8 BYTE) NOT NULL, 
      "START_TIME" NUMBER(13,0) NOT NULL, 
      "END_TIME" NUMBER(13,0), 
      "CALENDAR_NAME" VARCHAR2(200 BYTE), 
      "MISFIRE_INSTR" NUMBER(2,0), 
      "JOB_DATA" BLOB
   );
  CREATE INDEX "IDX_QRTZ_T_J" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "JOB_NAME", "JOB_GROUP");
  CREATE INDEX "IDX_QRTZ_T_JG" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "JOB_GROUP");  
  CREATE INDEX "IDX_QRTZ_T_C" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "CALENDAR_NAME");  
  CREATE INDEX "IDX_QRTZ_T_G" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_GROUP");  
  CREATE INDEX "IDX_QRTZ_T_STATE" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_STATE");  
  CREATE INDEX "IDX_QRTZ_T_N_STATE" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP", "TRIGGER_STATE");  
  CREATE INDEX "IDX_QRTZ_T_N_G_STATE" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_GROUP", "TRIGGER_STATE");  
  CREATE INDEX "IDX_QRTZ_T_NEXT_FIRE_TIME" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "NEXT_FIRE_TIME");  
  CREATE INDEX "IDX_QRTZ_T_NFT_ST" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_STATE", "NEXT_FIRE_TIME");  
  CREATE INDEX "IDX_QRTZ_T_NFT_MISFIRE" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "MISFIRE_INSTR", "NEXT_FIRE_TIME"); 
  CREATE INDEX "IDX_QRTZ_T_NFT_ST_MISFIRE" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "MISFIRE_INSTR", "NEXT_FIRE_TIME", "TRIGGER_STATE"); 
  CREATE INDEX "IDX_QRTZ_T_NFT_ST_MISFIRE_GRP" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "MISFIRE_INSTR", "NEXT_FIRE_TIME", "TRIGGER_GROUP", "TRIGGER_STATE");  
  CREATE UNIQUE INDEX "SYS_C009085" ON "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP");
  ALTER TABLE "QRTZ_TRIGGERS" ADD PRIMARY KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP"); 
  ALTER TABLE "QRTZ_TRIGGERS" ADD FOREIGN KEY ("SCHED_NAME", "JOB_NAME", "JOB_GROUP")
	  REFERENCES "QRTZ_JOB_DETAILS" ("SCHED_NAME", "JOB_NAME", "JOB_GROUP") ENABLE;
  ALTER TABLE "QRTZ_SIMPROP_TRIGGERS" ADD FOREIGN KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP")
	  REFERENCES "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") ENABLE;
  ALTER TABLE "QRTZ_SIMPLE_TRIGGERS" ADD FOREIGN KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP")
	  REFERENCES "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") ENABLE;
   ALTER TABLE "QRTZ_CRON_TRIGGERS" ADD FOREIGN KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP")
	  REFERENCES "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") ENABLE;
  ALTER TABLE "QRTZ_BLOB_TRIGGERS" ADD FOREIGN KEY ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP")
	  REFERENCES "QRTZ_TRIGGERS" ("SCHED_NAME", "TRIGGER_NAME", "TRIGGER_GROUP") ENABLE;
  CREATE TABLE "TB_EXPENSE" 
   (	
      "ID" VARCHAR2(64 BYTE) NOT NULL, 
      "OWNER" VARCHAR2(64 BYTE), 
      "DEPT" VARCHAR2(64 BYTE), 
      "ACCOUNT" NUMBER, 
      "INVOICETYPE" VARCHAR2(64 BYTE), 
      "REASON" VARCHAR2(252 BYTE), 
      "CREATE_TIME" VARCHAR2(64 BYTE), 
      "PROCESSINSTANCEID" VARCHAR2(64 BYTE), 
      "PROCESSINSTANCESTATUS" VARCHAR2(64 BYTE), 
      "PROCESSSTEP" VARCHAR2(256 BYTE),
      PRIMARY KEY ("ID")
   ); 
   REM INSERTING into FOXBPM.AU_ORGINFO
SET DEFINE OFF;
Insert into FOXBPM.AU_ORGINFO (ORGID,SUPORGID,ORGNAME) values ('20001','2000','金融事业部');
Insert into FOXBPM.AU_ORGINFO (ORGID,SUPORGID,ORGNAME) values ('200011','20001','产品研发部');
Insert into FOXBPM.AU_ORGINFO (ORGID,SUPORGID,ORGNAME) values ('200012','20001','市场营销部');
REM INSERTING into FOXBPM.AU_ROLEINFO
SET DEFINE OFF;
Insert into FOXBPM.AU_ROLEINFO (ROLEID,ROLENAME) values ('10001','项目主管');
Insert into FOXBPM.AU_ROLEINFO (ROLEID,ROLENAME) values ('10002','部门经理');
REM INSERTING into FOXBPM.AU_GROUP_RELATION
SET DEFINE OFF;
Insert into FOXBPM.AU_GROUP_RELATION (GUID,USERID,GROUPID,GROUPTYPE) values ('100000000000004','admin','200012','dept');
Insert into FOXBPM.AU_GROUP_RELATION (GUID,USERID,GROUPID,GROUPTYPE) values ('100000000000003','admin','200011','dept');
REM INSERTING into FOXBPM.AU_USERINFO
SET DEFINE OFF; 
Insert into FOXBPM.AU_USERINFO (USERID,USERNAME,PASSWORD,EMAIL,TEL,IMAGE) values ('admin','超级管理员','1','ft%25252563a.com','ddxx','admin.jpg');
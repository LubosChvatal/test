-- Encode
DELETE FROM CONN_SERVICES_PROP WHERE SERVICE_ID = 97001;
DELETE FROM CONN_SERVICES WHERE SERVICE_ID = 97001;
-- CopyFile
DELETE FROM CONN_SERVICES_PROP WHERE SERVICE_ID = 97002;
DELETE FROM CONN_SERVICES WHERE SERVICE_ID = 97002;
-- DeleteFile
DELETE FROM CONN_SERVICES_PROP WHERE SERVICE_ID = 97003;
DELETE FROM CONN_SERVICES WHERE SERVICE_ID = 97003;
-- MoveFile
DELETE FROM CONN_SERVICES_PROP WHERE SERVICE_ID = 97004;
DELETE FROM CONN_SERVICES WHERE SERVICE_ID = 97004;
-- StartBatch
DELETE FROM CONN_SERVICES_PROP WHERE SERVICE_ID = 97005;
DELETE FROM CONN_SERVICES WHERE SERVICE_ID = 97005;
-- DecodeUrl
DELETE FROM CONN_SERVICES_PROP WHERE SERVICE_ID = 97006;
DELETE FROM CONN_SERVICES WHERE SERVICE_ID = 97006;
-- EncodeUrl.v2
DELETE FROM CONN_SERVICES_PROP WHERE SERVICE_ID = 97007;
DELETE FROM CONN_SERVICES WHERE SERVICE_ID = 97007;
-- CopyFile.v2
DELETE FROM CONN_SERVICES_PROP WHERE SERVICE_ID = 97008;
DELETE FROM CONN_SERVICES WHERE SERVICE_ID = 97008;
-- StartCstExport.v1
DELETE FROM CONN_SERVICES_PROP WHERE SERVICE_ID = 97009;
DELETE FROM CONN_SERVICES WHERE SERVICE_ID = 97009;
-- Delete endpoint
DELETE FROM CONN_ENDPOINT_PROP WHERE ENDPOINT_ID = 'ConnBhubHttp';
DELETE FROM CONN_ENDPOINT_PROP WHERE ENDPOINT_ID = 'ConnBhubHttp2';

DELETE FROM CONN_ENDPOINT WHERE ENDPOINT_ID = 'ConnBhubHttp';
DELETE FROM CONN_ENDPOINT WHERE ENDPOINT_ID = 'ConnBhubHttp2';
--------------------------------------------------------------------------------------
-- add endpoint
INSERT INTO CONN_ENDPOINT (ENDPOINT_ID,SCHEME,HOSTNAME,PORT,PATH,DESCRIPTION) VALUES ('ConnBhubHttp', 'https', 'bhub02.cz.intapp.eu', 6800, '','Endpoint for BHUB');
INSERT INTO CONN_ENDPOINT (ENDPOINT_ID,SCHEME,HOSTNAME,PORT,PATH,DESCRIPTION) VALUES ('ConnBhubHttp2', 'https', 'bhub02.cz.intapp.eu', 6900, '','Endpoint for BHUB2');

INSERT INTO CONN_ENDPOINT_PROP (ENDPOINT_ID,NAME,VALUE,DESCRIPTION) VALUES ('ConnBhubHttp', 'HardErrorCode', '080999', 'Default error code for backend BHUB');
INSERT INTO CONN_ENDPOINT_PROP (ENDPOINT_ID,NAME,VALUE,DESCRIPTION) VALUES ('ConnBhubHttp2', 'HardErrorCode', '080999', 'Default error code for backend BHUB');

-- add services Encode
INSERT INTO CONN_SERVICES(SERVICE_ID, ENDPOINT_ID,AUTH_ID,BACKEND,MT,MV,NAMESPACE) VALUES (97001, 'ConnBhubHttp', NULL, 'BHUB','EncodeRequest', '1', 'http://www.csob.cz/bhub/Utils/encode_string/v1');
INSERT INTO CONN_SERVICES_PROP (SERVICE_ID,NAME,VALUE,DESCRIPTION) VALUES (97001,'Path','/v1/soap/utils/encode','BHUB-EncodeRequest Url suffix');
INSERT INTO CONN_SERVICES_PROP (SERVICE_ID,NAME,VALUE,DESCRIPTION) VALUES (97001,'SOAPAction','encode_string','BHUB-EncodeRequest SOAPAction');

-- add services CopyFile
INSERT INTO CONN_SERVICES(SERVICE_ID, ENDPOINT_ID,AUTH_ID,BACKEND,MT,MV,NAMESPACE) VALUES (97002, 'ConnBhubHttp2', NULL, 'BHUB','CopyFileRequest', '1', 'http://www.csob.cz/bhub/mft/copy/v1');
INSERT INTO CONN_SERVICES_PROP (SERVICE_ID,NAME,VALUE,DESCRIPTION) VALUES (97002,'Path','/v1/soap/file','BHUB-CopyFileRequest Url suffix');
INSERT INTO CONN_SERVICES_PROP (SERVICE_ID,NAME,VALUE,DESCRIPTION) VALUES (97002,'SOAPAction','copy','BHUB-CopyFileRequest SOAPAction');

-- add services DeleteFile
INSERT INTO CONN_SERVICES(SERVICE_ID, ENDPOINT_ID,AUTH_ID,BACKEND,MT,MV,NAMESPACE) VALUES (97003, 'ConnBhubHttp2', NULL, 'BHUB','DeleteFileRequest', '1', 'http://www.csob.cz/bhub/mft/delete/v1');
INSERT INTO CONN_SERVICES_PROP (SERVICE_ID,NAME,VALUE,DESCRIPTION) VALUES (97003,'Path','/v1/soap/file','BHUB-DeleteFileRequest Url suffix');
INSERT INTO CONN_SERVICES_PROP (SERVICE_ID,NAME,VALUE,DESCRIPTION) VALUES (97003,'SOAPAction','delete','BHUB-DeleteFileRequest SOAPAction');

-- add service MoveFile
INSERT INTO CONN_SERVICES (SERVICE_ID,ENDPOINT_ID,AUTH_ID,BACKEND,MT,MV,NAMESPACE) VALUES (97004, 'ConnBhubHttp2', null, 'BHUB','MoveFileRequest','1','http://www.csob.cz/bhub/mft/move/v1');
INSERT INTO CONN_SERVICES_PROP (SERVICE_ID,NAME,VALUE,DESCRIPTION) VALUES (97004,'Path','/v1/soap/file','BHUB-MoveFileRequest Url suffix');
INSERT INTO CONN_SERVICES_PROP (SERVICE_ID,NAME,VALUE,DESCRIPTION) VALUES (97004,'SOAPAction','move','BHUB-MoveFileRequest SOAPAction');

-- add service StartBatch
INSERT INTO CONN_SERVICES (SERVICE_ID,ENDPOINT_ID,AUTH_ID,BACKEND,MT,MV,NAMESPACE) VALUES (97005, 'ConnBhubHttp2', null, 'BHUB','StartBatchRequest','2','http://www.csob.cz/bhub/mft/types/v2');
INSERT INTO CONN_SERVICES_PROP (SERVICE_ID,NAME,VALUE,DESCRIPTION) VALUES (97005,'Path','/v2/soap/file','BHUB-StartBatchRequest Url suffix');
INSERT INTO CONN_SERVICES_PROP (SERVICE_ID,NAME,VALUE,DESCRIPTION) VALUES (97005,'SOAPAction','startBatch','BHUB-StartBatchRequest SOAPAction');
INSERT INTO CONN_SERVICES_PROP (SERVICE_ID,NAME,VALUE,DESCRIPTION) VALUES (97005,'MetaHeaderVersion','2','BHUB-StartBatchRequest');

-- add service DecodeUrl
INSERT INTO CONN_SERVICES (SERVICE_ID,ENDPOINT_ID,AUTH_ID,BACKEND,MT,MV,NAMESPACE) VALUES (97006, 'ConnBhubHttp', null, 'BHUB','DecodeRequest','2','http://www.csob.cz/bhub/Utils/types/v2');
INSERT INTO CONN_SERVICES_PROP (SERVICE_ID,NAME,VALUE,DESCRIPTION) VALUES (97006,'Path','/v2/soap/utils/urlServices','BHUB-DecodeUrl Url suffix');
INSERT INTO CONN_SERVICES_PROP (SERVICE_ID,NAME,VALUE,DESCRIPTION) VALUES (97006,'SOAPAction','decode','BHUB-DecodeUrl SOAPAction');
INSERT INTO CONN_SERVICES_PROP (SERVICE_ID,NAME,VALUE,DESCRIPTION) VALUES (97006,'MetaHeaderVersion','2','BHUB-DecodeUrl');

-- add service EncodeUrl.v2
INSERT INTO CONN_SERVICES (SERVICE_ID,ENDPOINT_ID,AUTH_ID,BACKEND,MT,MV,NAMESPACE) VALUES (97007, 'ConnBhubHttp', null, 'BHUB','EncodeRequest','2','http://www.csob.cz/bhub/Utils/types/v2');
INSERT INTO CONN_SERVICES_PROP (SERVICE_ID,NAME,VALUE,DESCRIPTION) VALUES (97007,'Path','/v2/soap/utils/urlServices','BHUB-EncodeUrl.v2 Url suffix');
INSERT INTO CONN_SERVICES_PROP (SERVICE_ID,NAME,VALUE,DESCRIPTION) VALUES (97007,'SOAPAction','encode','BHUB-EncodeUrl.v2 SOAPAction');
INSERT INTO CONN_SERVICES_PROP (SERVICE_ID,NAME,VALUE,DESCRIPTION) VALUES (97007,'MetaHeaderVersion','2','BHUB-EncodeUrl.v2');

-- add services CopyFile.v2
INSERT INTO CONN_SERVICES(SERVICE_ID, ENDPOINT_ID,AUTH_ID,BACKEND,MT,MV,NAMESPACE) VALUES (97008, 'ConnBhubHttp2', NULL, 'BHUB','CopyFileRequest', '2', 'http://www.csob.cz/bhub/mft/types/v2');
INSERT INTO CONN_SERVICES_PROP (SERVICE_ID,NAME,VALUE,DESCRIPTION) VALUES (97008,'Path','/v2/soap/file','BHUB-CopyFileRequest.v2 Url suffix');
INSERT INTO CONN_SERVICES_PROP (SERVICE_ID,NAME,VALUE,DESCRIPTION) VALUES (97008,'SOAPAction','copy','BHUB-CopyFileRequest SOAPAction');
INSERT INTO CONN_SERVICES_PROP (SERVICE_ID,NAME,VALUE,DESCRIPTION) VALUES (97008,'MetaHeaderVersion','2','BHUB-CopyFileRequest');

-- add services StartCstExport.v1
INSERT INTO CONN_SERVICES(SERVICE_ID, ENDPOINT_ID,AUTH_ID,BACKEND,MT,MV,NAMESPACE) VALUES (97009, 'ConnBhubHttp2', NULL, 'BHUB','StartCstExportRequest', '2', 'http://www.csob.cz/bhub/mft/types/v2');
INSERT INTO CONN_SERVICES_PROP (SERVICE_ID,NAME,VALUE,DESCRIPTION) VALUES (97009,'Path','/v2/soap/file','BHUB-StartCstExportRequest.v1 Url suffix');
INSERT INTO CONN_SERVICES_PROP (SERVICE_ID,NAME,VALUE,DESCRIPTION) VALUES (97009,'SOAPAction','startCstExport','BHUB-StartCstExportRequest SOAPAction');
INSERT INTO CONN_SERVICES_PROP (SERVICE_ID,NAME,VALUE,DESCRIPTION) VALUES (97009,'MetaHeaderVersion','2','BHUB-CopyFileRequest');

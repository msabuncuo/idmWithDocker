DROP INDEX openidm.idx_genericobjects_reconid;
DROP INDEX openidm.idx_json_managedobjects_roleCondition;
DROP INDEX openidm.idx_json_managedobjects_roleTemporalConstraints;
DROP INDEX openidm.idx_metaobjects_reconid;
DROP INDEX openidm.idx_json_clusterobjects_timestamp;
DROP INDEX openidm.idx_json_clusterobjects_state;
DROP INDEX openidm.idx_json_clusterobjects_event_instanceid;
DROP INDEX openidm.idx_json_managedobjects_userName;
DROP INDEX openidm.idx_json_managedobjects_givenName;
DROP INDEX openidm.idx_json_managedobjects_sn;
DROP INDEX openidm.idx_json_managedobjects_mail;
DROP INDEX openidm.idx_json_managedobjects_accountStatus;
DROP INDEX openidm.idx_json_managedobjects_userName_gin;
DROP INDEX openidm.idx_json_managedobjects_givenName_gin;
DROP INDEX openidm.idx_json_managedobjects_sn_gin;
DROP INDEX openidm.idx_json_managedobjects_mail_gin;
DROP INDEX openidm.idx_json_managedobjects_accountStatus_gin;

ALTER TABLE openidm.genericobjects ALTER COLUMN fullobject SET DATA TYPE jsonb USING fullobject::jsonb;
ALTER TABLE openidm.managedobjects ALTER COLUMN fullobject SET DATA TYPE jsonb USING fullobject::jsonb;
ALTER TABLE openidm.configobjects ALTER COLUMN fullobject SET DATA TYPE jsonb USING fullobject::jsonb;
ALTER TABLE openidm.notificationobjects ALTER COLUMN fullobject SET DATA TYPE jsonb USING fullobject::jsonb;
ALTER TABLE openidm.relationships ALTER COLUMN fullobject SET DATA TYPE jsonb USING fullobject::jsonb;
ALTER TABLE openidm.schedulerobjects ALTER COLUMN fullobject SET DATA TYPE jsonb USING fullobject::jsonb;
ALTER TABLE openidm.clusterobjects ALTER COLUMN fullobject SET DATA TYPE jsonb USING fullobject::jsonb;
ALTER TABLE openidm.clusteredrecontargetids ALTER COLUMN targetids SET DATA TYPE jsonb USING targetids::jsonb;
ALTER TABLE openidm.updateobjects ALTER COLUMN fullobject SET DATA TYPE jsonb USING fullobject::jsonb;
ALTER TABLE openidm.importobjects ALTER COLUMN fullobject SET DATA TYPE jsonb USING fullobject::jsonb;
ALTER TABLE openidm.syncqueue ALTER COLUMN oldObject SET DATA TYPE jsonb USING oldObject::jsonb;
ALTER TABLE openidm.syncqueue ALTER COLUMN newObject SET DATA TYPE jsonb USING newObject::jsonb;
ALTER TABLE openidm.syncqueue ALTER COLUMN context SET DATA TYPE jsonb USING context::jsonb;
ALTER TABLE openidm.metaobjects ALTER COLUMN fullobject SET DATA TYPE jsonb USING fullobject::jsonb;


CREATE INDEX idx_jsonb_genericobjects_reconid on openidm.genericobjects
    ( jsonb_extract_path_text(fullobject, 'reconId'), objecttypes_id);

CREATE INDEX idx_jsonb_managedobjects_roleCondition ON openidm.managedobjects
    ( jsonb_extract_path_text(fullobject, 'condition') );

CREATE INDEX idx_jsonb_managedobjects_roleTemporalConstraints ON openidm.managedobjects
    ( jsonb_extract_path_text(fullobject, 'temporalConstraints') );

CREATE INDEX idx_jsonb_metaobjects_reconid on openidm.metaobjects
    (jsonb_extract_path_text(fullobject, 'reconId'), objecttypes_id);

CREATE INDEX idx_jsonb_clusterobjects_timestamp ON openidm.clusterobjects
    ( jsonb_extract_path_text(fullobject, 'timestamp') );

CREATE INDEX idx_jsonb_clusterobjects_state ON openidm.clusterobjects
    ( jsonb_extract_path_text(fullobject, 'state') );

CREATE INDEX idx_jsonb_clusterobjects_event_instanceid ON openidm.clusterobjects
    ( jsonb_extract_path_text(fullobject, 'type'), jsonb_extract_path_text(fullobject, 'instanceId') );

CREATE UNIQUE INDEX idx_jsonb_managedobjects_userName ON openidm.managedobjects
    ( jsonb_extract_path_text(fullobject, 'userName'), objecttypes_id );

CREATE INDEX idx_jsonb_managedobjects_givenName ON openidm.managedobjects
    ( jsonb_extract_path_text(fullobject, 'givenName') );

CREATE INDEX idx_jsonb_managedobjects_sn ON openidm.managedobjects
    ( jsonb_extract_path_text(fullobject, 'sn') );

CREATE INDEX idx_jsonb_managedobjects_mail ON openidm.managedobjects
    ( jsonb_extract_path_text(fullobject, 'mail') );

CREATE INDEX idx_jsonb_managedobjects_accountStatus ON openidm.managedobjects
    ( jsonb_extract_path_text(fullobject, 'accountStatus') );

CREATE INDEX idx_jsonb_managedobjects_userName_gin ON openidm.managedobjects
USING gin (jsonb_extract_path_text(fullobject, 'userName') gin_trgm_ops);

CREATE INDEX idx_jsonb_managedobjects_givenName_gin ON openidm.managedobjects
USING gin (jsonb_extract_path_text(fullobject, 'givenName') gin_trgm_ops);

CREATE INDEX idx_jsonb_managedobjects_sn_gin ON openidm.managedobjects
USING gin (jsonb_extract_path_text(fullobject, 'sn') gin_trgm_ops);

CREATE INDEX idx_jsonb_managedobjects_mail_gin ON openidm.managedobjects
USING gin (jsonb_extract_path_text(fullobject, 'mail') gin_trgm_ops);

CREATE INDEX idx_jsonb_managedobjects_accountStatus_gin ON openidm.managedobjects
USING gin (jsonb_extract_path_text(fullobject, 'accountStatus') gin_trgm_ops);

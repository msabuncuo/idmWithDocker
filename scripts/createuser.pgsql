
create database openidm encoding 'utf8';

create role openidm with LOGIN NOSUPERUSER NOCREATEDB NOCREATEROLE inherit password 'changeit';

grant all privileges on database openidm to openidm;

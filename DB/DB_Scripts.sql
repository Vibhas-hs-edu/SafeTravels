/*
drop table Authors;
drop table Reasons;
drop table SubEntryRequirements;
drop table EntryRequirements;
drop table SubAdvisory;
drop table Advisory;
drop table Countries;
*/

create table Countries
(
    CountryID     int auto_increment,
    CountryName   varchar(50) not null,
    AlternateName varchar(50) null,
    constraint Countries_pk
        primary key (CountryID)
);

create unique index Countries_CountryName_uindex
    on Countries (CountryName);

create table Advisory
(
    AdvisoryID    int           auto_increment,
    LevelName    varchar(50)   null,
    CountryID    int           null,
    LastModifiedDate datetime default(now()) null,
    constraint Advisory_pk
        primary key (AdvisoryID),
    constraint Advisory_Countries_CountryID_fk
        foreign key (CountryID) references Countries (CountryID)
);


create table SubAdvisory
(
    SubAdvisoryID int auto_increment,
    SubAdvisoryText varchar(1000) not null,
    LastModifiedDate datetime default(now()) null,
    AdvisoryID int not null,
    constraint SubAdvisory_pk
        primary key (SubAdvisoryID),
    constraint SubAdvisory_Advisory_AdvisoryID_fk
        foreign key (AdvisoryID) references Advisory (AdvisoryID)
);

create table EntryRequirements
(
    EntryID int auto_increment,
    EntryText varchar(1000),
    CountryID int null,
    constraint EntryRequirements_pk
        primary key (EntryID),
    constraint EntryRequirements_Countries_CountryID_fk
        foreign key (CountryID) references Countries (CountryID)
);


create table SubEntryRequirements
(
    SubEntryID int auto_increment,
    SubEntryText varchar(1000),
    EntryID int null,
    constraint SubEntryRequirements_pk
        primary key (SubEntryID),
    constraint SubEntryRequirements_EntryRequirements_EntryID_fk
        foreign key (EntryID) references EntryRequirements (EntryID)
);

create table Reasons
(
    ReasonID int auto_increment,
    MainReason varchar(1000),
    SubReason varchar(1000),
    CountryID int,
    constraint Reasons_pk
        primary key (ReasonID),
    constraint Reasons_Counties_CountryID_fk
        foreign key (CountryID) references Countries (CountryID)
);

create table Authors
(
    AuthorID int auto_increment,
    AuthorName varchar(1000),
    AuthorLocation varchar(1000),
    constraint Authors_pk
        primary key (AuthorID)
);

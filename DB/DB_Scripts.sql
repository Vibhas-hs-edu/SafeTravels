/*
drop table VisitReasons;
drop table Authors;
drop table Reasons;
drop table SubEntryRequirements;
drop table EntryRequirements;
drop table SubAdvisory;
drop table Advisory;
drop table Countries;
drop database safetravels;
*/
create database safetravels;

use safetravels;

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
    LastModifiedDate datetime default(now()) null,
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

create table VisitReasons
(
    VisitReasonID   int auto_increment,
    CountryID  int           not null,
    MainReason varchar(1000) null,
    SubReason  varchar(1000) null,
    LastModifiedDate datetime default(now()) null,
    constraint Reasons_pk
        primary key (VisitReasonID),
    constraint Reasons_Countries_CountryID_fk
        foreign key (CountryID) references Countries (CountryID)
);

insert into VisitReasons (CountryID, MainReason, SubReason)
VALUES (
    (select CountryID from Countries where CountryName = "Australia"),
    "OUR BEACHES ARE DIVINE",
    "Our sandy stretches are home to world-class surfing, unique marine life, striking ocean pools and unbeatable beach culture.
So, it’s no wonder Australian beaches regularly rank among the best in the world. Surf, swim, snorkel, sun-worship – there are endless ways to enjoy Australia''s beautiful beaches and islands."
);

insert into VisitReasons (CountryID, MainReason, SubReason)
VALUES (
    (select CountryID from Countries where CountryName = "Australia"),
    "WE''VE GOT SOME REALLY BIG THINGS",
    "From the only living organism visible from outer space (the Great Barrier Reef) to the planet’s biggest rock (no, not Uluru – it’s actually Mount Augustus!), many Aussie attractions defy imagination. We’re the world’s biggest island with the world’s oldest rainforest, the world’s whitest sand and the world’s oldest civilization."
);

insert into VisitReasons (CountryID, MainReason, SubReason)
VALUES (
    (select CountryID from Countries where CountryName = "Croatia"),
    "Amazing coastline",
    "Croatia may not be the first place you think of for a sunny holiday and yet, the coast is stunningly beautiful. And the great thing is, because many of the most beautiful cities are along the coast, it warrants a road trip! After a day in the car you can go for a refreshing swim in the crystal clear water. If you’d prefer something more active, the Adriatic Sea is perfect for diving, wind or kite surfing."
);

insert into VisitReasons (CountryID, MainReason, SubReason)
VALUES (
    (select CountryID from Countries where CountryName = "Croatia"),
    "Fascinating culture & cities",
    "As soon as you arrive in Croatia, you feel the country’s rich history. You find yourself among the ancient ruins, buildings and castles. In Rijeka you can climb the 550 steps to Trsat Castle. And you can visit the best preserved Roman palace in the world in Split. Zadar & Dubrovnik are famous for their beautiful, historic city centres. The old centre of Dubrovnik is even one of the UNESCO World Heritage Sites."
);

insert into VisitReasons (CountryID, MainReason, SubReason)
VALUES (
    (select CountryID from Countries where CountryName = "Brazil"),
    "CARNIVAL fever",
    "Charismatic Brazil is famous for its hugely popular Carnival, outrageous costumes, street dancing and parties that carry on until dawn, bring the city to life. Rio has set a bench mark when it comes to Carnival."
);

insert into VisitReasons (CountryID, MainReason, SubReason)
VALUES (
    (select CountryID from Countries where CountryName = "Brazil"),
    "The weather is simply incredible",
    "With seasonal rainfall areas providing light relief from the tropical heat, the balmy, warm evenings and super sunny beach days, every day, means that you are just about guaranteed to have an outdoor adventure every day! Go hit the place and feel the tropical aura."
);

insert into VisitReasons (CountryID, MainReason, SubReason)
VALUES (
    (select CountryID from Countries where CountryName = "South Africa"),
    "Breathtaking Beaches",
    "Cape Town arguably has the best urban beaches in the world, from fashionable Camps Bay (close to the city centre) to Boulders Beach, with its comical colony of endangered African penguins which waddle about. All the way along South Africa''s Garden Route and KwaZulu-Natal''s Indian Ocean coastline, you''ll find long stretches of pristine soft sand lapped by waves that become warmer and warmer the further north you go. There are even tropical coral reefs and excellent diving and snorkelling spots to discover when visiting South Africa."
);

insert into VisitReasons (CountryID, MainReason, SubReason)
VALUES (
    (select CountryID from Countries where CountryName = "South Africa"),
    "Activities in Abundance",
    "With plenty of sunshine, mountains, sea and rivers, South Africans tend to treat their country like a massive playground. For a taste of the great outdoors, hike to the top of Table Mountain; horse ride in the Drakensberg; watch whales in Hermanus; discover South Africa''s urban culture on a guided walking tour of Johannesburg; paraglide over Cape Town''s beaches; take a walking safari in the Kruger; cycle through the Cape Winelands; explore the forest canopy in the Garden Route; enjoy a round on one of the many world-class golf courses... You''ll never have a dull moment when you visit South Africa!"
);

insert into VisitReasons (CountryID, MainReason, SubReason)
VALUES (
    (select CountryID from Countries where CountryName = "Canada"),
    "Outdoor Activities",
    "One of the best reasons to visit Canada is to take advantage of the fabulous outdoors— and there''s a lot of it. Canada is the second largest country in the world, but its population is relatively small. Consider that the United States. has about nine times the number of people that Canada does on a slightly smaller land mass. Canada has expansive uninhabited land that gives Canadians and visitors room to roam. Some of the most popular outdoor activities in Canada are camping, skiing and snowboarding, golfing, fishing, hiking, mountain biking, climbing, kayaking, and canoeing."
);

insert into VisitReasons (CountryID, MainReason, SubReason)
VALUES (
    (select CountryID from Countries where CountryName = "Canada"),
    "Natural Wonders",
    "Few countries boast the number and range of natural wonders that Canada does. With more coastline than any other country, mountain ranges, lakes, forests, arctic lands and even a small amount of desert, Canada has a diverse landscape full of surprises.
    Some of Canada’s most spectacular and popular natural attractions are the Canadian Rocky Mountain parks, Dinosaur Provincial Park, Nahanni National Park Reserve, Cabot Trail, Niagara Falls, and a multitude of scenic drives."
);

alter table Countries add MainImage varchar(1000);

update Countries set MainImage = 'https://www.planetware.com/photos-large/AUS/australia-beautiful-places-sydney-harbour.jpg'
where CountryName = 'Australia';

update Countries set MainImage = 'https://www.planetware.com/wpimages/2019/09/croatia-in-pictures-most-beautiful-places-to-visit-dubrovnik.jpg'
where CountryName = 'Croatia';

update Countries set MainImage = 'https://www.planetware.com/wpimages/2019/11/canada-in-pictures-beautiful-places-to-photograph-morraine-lake.jpg'
where CountryName = 'Canada';

update Countries set MainImage = 'https://www.planetware.com/wpimages/2019/09/south-africa-in-pictures-most-beautiful-places-to-visit-kruger-national-park.jpg'
where CountryName = 'South Africa';

update Countries set MainImage = 'https://www.planetware.com/wpimages/2020/02/brazil-in-pictures-beautiful-places-to-photograph-iguazu-falls.jpg'
where CountryName = 'Brazil';

create table CountryImages
(
    CountryImageID int auto_increment
        primary key,
    CountryID      int           not null,
    ImageUrl       varchar(1000) not null
);


insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Australia"),
 "https://images.pexels.com/photos/1766215/pexels-photo-1766215.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Australia"),
 "https://images.pexels.com/photos/3673548/pexels-photo-3673548.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Australia"),
 "https://images.pexels.com/photos/3851210/pexels-photo-3851210.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Australia"),
 "https://images.pexels.com/photos/3768485/pexels-photo-3768485.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Australia"),
 "https://images.pexels.com/photos/4172915/pexels-photo-4172915.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Australia"),
 "https://images.pexels.com/photos/3673546/pexels-photo-3673546.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Australia"),
 "https://images.pexels.com/photos/3673546/pexels-photo-3673546.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Australia"),
 "https://images.pexels.com/photos/5708251/pexels-photo-5708251.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Australia"),
 "https://images.pexels.com/photos/9728982/pexels-photo-9728982.png"
);


insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Croatia"),
 "https://images.pexels.com/photos/1480212/pexels-photo-1480212.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Croatia"),
 "https://images.pexels.com/photos/2782331/pexels-photo-2782331.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Croatia"),
 "https://images.pexels.com/photos/5610999/pexels-photo-5610999.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Croatia"),
 "https://images.pexels.com/photos/4062676/pexels-photo-4062676.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Croatia"),
 "https://images.pexels.com/photos/5611001/pexels-photo-5611001.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Croatia"),
 "https://images.pexels.com/photos/2265876/pexels-photo-2265876.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Croatia"),
 "https://images.pexels.com/photos/286758/pexels-photo-286758.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Croatia"),
 "https://images.pexels.com/photos/2473470/pexels-photo-2473470.jpeg"
);


insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Croatia"),
 "https://images.pexels.com/photos/1480212/pexels-photo-1480212.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Canada"),
 "https://images.pexels.com/photos/11331744/pexels-photo-11331744.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Canada"),
 "https://images.pexels.com/photos/7822995/pexels-photo-7822995.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Canada"),
 "https://images.pexels.com/photos/10964392/pexels-photo-10964392.jpeg"
);


insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Canada"),
 "https://images.pexels.com/photos/11398317/pexels-photo-11398317.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Canada"),
 "https://images.pexels.com/photos/11259542/pexels-photo-11259542.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Canada"),
 "https://images.pexels.com/photos/11534545/pexels-photo-11534545.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Canada"),
 "https://images.pexels.com/photos/11331741/pexels-photo-11331741.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Canada"),
 "https://images.pexels.com/photos/11424150/pexels-photo-11424150.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Canada"),
 "https://images.pexels.com/photos/1561460/pexels-photo-1561460.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "South Africa"),
 "https://images.pexels.com/photos/259447/pexels-photo-259447.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "South Africa"),
 "https://images.pexels.com/photos/2975677/pexels-photo-2975677.jpeg"
);


insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "South Africa"),
 "https://images.pexels.com/photos/2660262/pexels-photo-2660262.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "South Africa"),
 "https://images.pexels.com/photos/3177662/pexels-photo-3177662.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "South Africa"),
 "https://images.pexels.com/photos/34098/south-africa-hluhluwe-giraffes-pattern.jpg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "South Africa"),
 "https://images.pexels.com/photos/625414/pexels-photo-625414.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "South Africa"),
 "https://images.pexels.com/photos/631292/pexels-photo-631292.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "South Africa"),
 "https://images.pexels.com/photos/1428632/pexels-photo-1428632.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "South Africa"),
 "https://images.pexels.com/photos/756270/pexels-photo-756270.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Brazil"),
 "https://images.pexels.com/photos/2559999/pexels-photo-2559999.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Brazil"),
 "https://images.pexels.com/photos/4318628/pexels-photo-4318628.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Brazil"),
 "https://images.pexels.com/photos/6580703/pexels-photo-6580703.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Brazil"),
 "https://images.pexels.com/photos/10354052/pexels-photo-10354052.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Brazil"),
 "https://images.pexels.com/photos/10254833/pexels-photo-10254833.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Brazil"),
 "https://images.pexels.com/photos/10323141/pexels-photo-10323141.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Brazil"),
 "https://images.pexels.com/photos/4737033/pexels-photo-4737033.jpeg"
);


insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Brazil"),
 "https://images.pexels.com/photos/6666055/pexels-photo-6666055.jpeg"
);

insert into CountryImages (CountryID, ImageUrl)
values
(
 (select CountryID from Countries C where C.CountryName = "Brazil"),
 "https://images.pexels.com/photos/1804177/pexels-photo-1804177.jpeg"
);
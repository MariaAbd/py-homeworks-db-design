create table if not exists Genre (
	id serial primary key,
	name varchar(40) unique not null
);

create table if not exists Musician (
	id serial primary key,
	name varchar(40) unique not null
);


create table if not exists GenreMusician (
	id_musician integer references Musician(id),
	id_genre integer references Genre(id)
);

alter table GenreMusician
	add constraint PK_GenreMusician primary key (id_musician, id_genre)

create table if not exists Album (
	id serial primary key,
	name varchar(40) unique not null,
	release_year integer not null,
	id_musician integer not null
);

create table if not exists AlbumMusician (
	id_musician integer not null,
	id_album integer not null,
	constraint PK_AlbumMusician primary key (id_musician, id_album)
);

create table if not exists Treck (
	id serial primary key,
	name varchar(40) unique not null,
	id_album integer references Album(id),
	duration numeric(3, 2)
);

create table if not exists CollectionOfTrecks (
	id serial primary key,
	name varchar(40) unique not null,
	id_treck integer references Treck(id),
	release_year integer not null
);

alter table Album 
	drop column id_musician;

drop table CollectionOfTrecks;

create table if not exists Collection (
	id serial primary key,
	name varchar(40) unique not null,
	id_treck integer references Treck(id),
	release_year integer not null
);

alter table Collection 
	drop column id_treck;

alter table Collection 
	add column id_treck integer;

create table if not exists TreckCollection (
	id_treck integer references Treck(id),
	id_collection integer references Collection(id)
);




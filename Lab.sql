/*Zad1*/
CREATE TABLE t_messure
(
	id_messure int NOT NULL,
	names varchar(20) NOT NULL,
	CONSTRAINT pk_messure PRIMARY KEY (id_messure)
);

CREATE TABLE t_material
(
	id_material int NOT NULL,
	names varchar(20) NOT NULL,
	id_messure int NOT NULL,
	CONSTRAINT pk_material PRIMARY KEY (id_material),
	CONSTRAINT fk_messure FOREIGN KEY (id_messure) REFERENCES t_messure(id_messure)
);

CREATE TABLE t_inprice
(
	id_material int NOT NULL,
	price_date date NOT NULL,
	price numeric(10, 2) NOT NULL,
	CONSTRAINT fk_inprice_material FOREIGN KEY (id_material) REFERENCES t_material(id_material)
);

CREATE TABLE t_store
(
	id_store int NOT NULL,
	names varchar(10),
	CONSTRAINT pk_store PRIMARY KEY (id_store)
);

CREATE TABLE t_surplus
(
	id_material int NOT NULL,
	id_store int NOT NULL,
	volume int NOT NULL,
	CONSTRAINT fk_surplus_material FOREIGN KEY (id_material) REFERENCES t_material(id_material),
	CONSTRAINT fk_surplus_store FOREIGN KEY (id_store) REFERENCES t_store(id_store)
);

CREATE TABLE t_caterer
(
	id_caterer int NOT NULL,
	names varchar(10) NOT NULL,
	adress text NOT NULL,
	phone int NOT NULL,
	fax int NOT	NULL,
	CONSTRAINT pk_caterer PRIMARY KEY (id_caterer)
);

CREATE TABLE t_supply
(
	id_supply int NOT NULL,
	id_caterer int NOT NULL,
	id_store int NOT NULL,
	id_material int NOT NULL,
	supply_date date NOT NULL,
	volume numeric(100, 0) NOT NULL,
	CONSTRAINT fk_supply_caterer FOREIGN KEY (id_supply) REFERENCES t_caterer(id_caterer),
	CONSTRAINT fk_supply_store FOREIGN KEY (id_store) REFERENCES t_store(id_store),
	CONSTRAINT fk_supply_matrial FOREIGN KEY (id_material) REFERENCES t_material(id_material)
);

CREATE TABLE t_employer
(
	id_employer int NOT NULL,
	surname varchar(15) NOT NULL,
	names varchar(15) NOT NULL,
	father_name varchar(15) NOT NULL,
	CONSTRAINT pk_employer PRIMARY KEY (id_employer)
);

CREATE TABLE t_section
(
	id_section int NOT NULL,
	names varchar(100) NOT NULL,
	id_employer int NOT NULL,
	CONSTRAINT pk_section PRIMARY KEY id_section,
	CONSTRAINT fk_section_employer FOREIGN KEY (id_employer) REFERENCES t_employer(id_employer)
);

CREATE TABLE t_deliver
(
	id_deliver int NOT NULL,
	id_material int NOT NULL,
	id_store int NOT NULL,
	id_section int NOT NULL,
	deliver_date date NOT NULL,
	CONSTRAINT fk_deliver_material FOREIGN KEY (id_material) REFERENCES t_material(id_material),
	CONSTRAINT fk_deliver_store FOREIGN KEY (id_store) REFERENCES t_store(id_store),
	CONSTRAINT fk_deliver_section FOREIGN KEY (id_section) REFERENCES t_section(id_section)
);

/* Zad2*/
ALTER TABLE t_caterer
DROP adress,
ADD legal_adress text,
ADD fact_adress text,
ALTER e_mail varchar(50),

/*Zad3*/
ALTER TABLE t_inprice
DROP CONSTRAINT fk_inprice_material,
ADD CONSTRAINT pk_inprice_price_date PRIMARY KEY (price_date,id_material),

/*Zad4*/
CREATE TABLE t_group
(
	id_material int NOT NULL,
	id_group int NOT NULL,
	name_material varchar(10) NOT NULL,
	CONSTRAINT fk_group_matrial FOREIGN KEY (id_material) REFERENCES t_material(id_material) ON DELETE SET NULL
);

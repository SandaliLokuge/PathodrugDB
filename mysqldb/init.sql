CREATE DATABASE IF NOT EXISTS PathodrugDB;

USE PathodrugDB;

SET GLOBAL local_infile = true;

CREATE TABLE Gene(
    UniProt_ID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(200),
    Gene_Name VARCHAR(100),
    GenBank_Protein_ID VARCHAR(10),
    GenBank_Gene_ID VARCHAR(10),
    Uniprot_Title VARCHAR(100),
    PDB_ID VARCHAR(10),
    GeneCard_ID VARCHAR(10),
    GenAtlas_ID VARCHAR(10),
    HGNC_ID VARCHAR(10),
    Species VARCHAR(100)
);

CREATE TABLE Drug(
    DrugBank_ID VARCHAR(10) PRIMARY KEY,
    Accession_Numbers VARCHAR(100),
    Common_name VARCHAR(100),
    CAS VARCHAR(50),
    UNII VARCHAR(50),
    Synonyms VARCHAR(100),
    Standard_InChI_Key VARCHAR(50)
);

CREATE TABLE Drug_target(
    Drug_targetID VARCHAR(20) PRIMARY KEY,
    UniProt_ID VARCHAR(10),
    DrugBank_ID VARCHAR(10),
    FOREIGN KEY (UniProt_ID) REFERENCES Gene(UniProt_ID),
    FOREIGN KEY (DrugBank_ID) REFERENCES Drug(DrugBank_ID)
);


CREATE TABLE Virulence_Factor(
    VFID VARCHAR(10) PRIMARY KEY,
    VF_Name VARCHAR(100),
    VF_FullName VARCHAR(100),
    Bacteria VARCHAR(100),
    VFCID VARCHAR(10),
    VFcategory VARCHAR(100),
    Characteristics VARCHAR(200),
    Structure VARCHAR(200),
    Function_name VARCHAR(100),
    Mechanism VARCHAR(100)
);

CREATE TABLE Antibiotic_resistance(
    ARO_Accession VARCHAR(20) PRIMARY KEY,
    CVTERM_ID VARCHAR(10),
    ModelSequence_ID VARCHAR(10),
    Model_ID VARCHAR(10),
    Model_Name VARCHAR(100),
    ARO_Name VARCHAR(100),
    Protein_Accession VARCHAR(10),
    DNA_Accession VARCHAR(10),
    AMR_GeneFamily VARCHAR(20),
    Drug_Class VARCHAR(10),
    Resistance_Mechanism VARCHAR(250)
);

CREATE TABLE Pipeline_Data(
    PipelineID VARCHAR(10) PRIMARY KEY,
    GeneID VARCHAR(20),
    ARO VARCHAR(20),
    Name_of_the_organism VARCHAR(100),
    drug_target_gene_id VARCHAR(10),
    vfID VARCHAR(20),
    FOREIGN KEY (drug_target_gene_id) REFERENCES Gene(UniProt_ID),
    FOREIGN KEY (vfID) REFERENCES Virulence_Factor(VFID),
    FOREIGN KEY (ARO) REFERENCES Antibiotic_resistance(ARO_Accession)
);

LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/init_data/Gene.csv' 
INTO TABLE Gene 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/init_data/Drug.csv' 
INTO TABLE Drug 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/init_data/Drug_target.csv' 
INTO TABLE Drug_target 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/init_data/Virulence_Factor.csv' 
INTO TABLE Virulence_Factor 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/init_data/Antibiotic_Resistance.csv' 
INTO TABLE Antibiotic_resistance 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA LOCAL INFILE '/docker-entrypoint-initdb.d/init_data/Pipeline_Data.csv' 
INTO TABLE Pipeline_Data 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


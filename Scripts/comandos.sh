
# Descargar genes ortologos

./datasets download gene symbol ABL1 --ortholog primates --filename abla1_primates.zip
unzip abla1_primates.zip

# Entrar y alinear el archivo rna

cp ncbi_dataset/data/rna.fna ./

#alinear con muscle

./muscle3.8.31_i86linux64 -in Cancer.primates.fasta -out muscle_Cancer.primates.fasta -maxiters 1 -diags 

# trabajar la anotacion 

module load iqtree/2.2.2.6

iqtree2 -s alineado_rna.fna

#Astral

wget https://github.com/smirarab/ASTRAL/raw/master/Astral.5.7.8.zip
unzip Astral.5.7.8.zip
astral=/u/scratch/d/dechavez/Bioinformatica-PUCE/RepotenBio/DavidVV/PROYECTO/Astral/astral.5.7.8.jar

java -jar $astral -i alineado_rna.fna.treefile -o Astral.primates.treefile
iqtree2 -t Astral.primates.treefile --gcf alineado_rna.fna.treefile --prefix GCF.concord

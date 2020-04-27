### Usage
# Clinical Genomic Database https://research.nhgri.nih.gov/CGD/
# bash gene_cgd.sh $GENE
# where $GENE is a HUGO style gene name like GFI1, TP53, BRCA1, DDX17, etc
# Example: bash gene_abstracts.sh BRCA1



INPUT=$1
PDIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

echo ">>> $INPUT
"

head -n 1 $PDIR/data/CGD.txt

awk -v INPUT=$INPUT '$1 == INPUT' $PDIR/data/CGD.txt

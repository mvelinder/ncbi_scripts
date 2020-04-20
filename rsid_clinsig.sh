### Usage
# bash rsid_clinsig.sh $RSID
# where $RSID is a dbSNP rsID like rs1800751
# Example: bash rsid_clinsig.sh rs1800751

INPUT=$1

echo "
>>> $INPUT"

curl -s https://www.ncbi.nlm.nih.gov/snp/$INPUT | grep -A 6 "<a target=\"_blank\" data-section=\"Clinical Significance\"" | egrep "<td>|href" | grep -v "data-section" | sed 's/<\/a>//g' | sed 's/<td>//g' | sed 's/<\/td>//g' | sed 's/>/\n/g' | sed 's/href.*//g' | sed 's/^ *//g' | sed 's/RCV/https:\/\/www.ncbi.nlm.nih.gov\/clinvar\/RCV/g' | sed 's/^/\t/g'

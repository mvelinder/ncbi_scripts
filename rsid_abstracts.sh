### Usage
# bash rsid_abstracts.sh $RSID
# where $RSID is a dbSNP rsID like rs1800751
# Example: bash rsid_abstracts.sh rs1800751

INPUT=$1

echo ">>> $INPUT
"

curl -s https://www.ncbi.nlm.nih.gov/snp/$INPUT | grep -A 3000 "citations for $INPUT" | grep -B 3000 "</table>" | grep "href=" | awk '{split($0,a,"/"); print a[3]}' | sed 's/"//g' | while read line; do echo "https://www.ncbi.nlm.nih.gov/pubmed/$line"; curl -s https://www.ncbi.nlm.nih.gov/pubmed/$line | grep rprt_all | awk '{OFS="\n"} {split($0,a,"<h1>"); split(a[2],b,"</h1>"); split($0,c,"<p>"); split(c[2],d,"</p>"); print "Title: " b[1], "Abstract: " d[1] "\n"}'; done

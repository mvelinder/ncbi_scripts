### Usage
# bash pmid_abstract.sh $PMID
# where $PMID is the PubMed ID, for example 25741868 for the ACMG guidelines paper at https://www.ncbi.nlm.nih.gov/pubmed/25741868
# Example: bash pmid_abstract.sh 25741868



PMID=$1
curl -s https://www.ncbi.nlm.nih.gov/pubmed/$PMID | grep rprt_all | awk '{OFS="\n"} {split($0,a,"<h1>"); split(a[2],b,"</h1>"); split($0,c,"<p>"); split(c[2],d,"</p>"); print "Title: " b[1], "Abstract: " d[1] "\n"}'

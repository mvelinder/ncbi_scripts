#! /bin/bash

PMID=$1

curl -s https://pubmed.ncbi.nlm.nih.gov/$PMID/ | grep -A 7 "heading-title" | tail -n+6 | tail -n 1 | sed 's/  //g'
curl -s https://pubmed.ncbi.nlm.nih.gov/$PMID/ | grep -A 10 "abstract-content" | tail -n 1 | sed 's/      //g'
echo " "
#curl -s https://pubmed.ncbi.nlm.nih.gov/$PMID/ | grep rprt_all | awk '{OFS="\n"} {split($0,a,"<h1>"); split(a[2],b,"</h1>"); split($0,c,"<p>"); split(c[2],d,"</p>"); print "Title: " b[1], "Abstract: " d[1] "\n"}'

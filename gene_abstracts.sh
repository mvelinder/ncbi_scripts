### Usage
# bash gene_abstracts.sh $GENE
# where $GENE is a HUGO style gene name like GFI1, TP53, BRCA1, DDX17, etc
# Example: bash gene_abstracts.sh BRCA1



INPUT=$1
PDIR="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

awk -v INPUT=$INPUT '$3 == INPUT' <(zcat $PDIR/data/Homo_sapiens.gene_info) \
	| cut -f 2 \
	| while read line; do awk -v LINE=$line '$1 == "9606" && $2 == LINE' <(zcat $PDIR/data/gene2pubmed); done \
	| cut -f 3 \
	| while read line; do curl -s https://www.ncbi.nlm.nih.gov/pubmed/$line | grep rprt_all | awk '{OFS="\n"} {split($0,a,"<h1>"); split(a[2],b,"</h1>"); split($0,c,"<p>"); split(c[2],d,"</p>"); print "Title: " b[1], "Abstract: " d[1] "\n"}'; done

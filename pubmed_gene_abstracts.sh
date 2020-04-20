INPUT=$1

awk -v INPUT=$INPUT '$3 == INPUT' <(zcat data/Homo_sapiens.gene_info) \
	| cut -f 2 \
	| while read line; do awk -v LINE=$line '$1 == "9606" && $2 == LINE' <(zcat data/gene2pubmed); done \
	| cut -f 3 \
	| while read line; do curl -s https://www.ncbi.nlm.nih.gov/pubmed/$line | grep rprt_all | awk '{OFS="\n"} {split($0,a,"<h1>"); split(a[2],b,"</h1>"); split($0,c,"<p>"); split(c[2],d,"</p>"); print "Title: " b[1], "Abstract: " d[1] "\n"}'; done

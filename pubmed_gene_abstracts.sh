INPUT=$1

#echo "$INPUT https://www.ncbi.nlm.nih.gov/pubmed?LinkName=gene_pubmed&from_uid="$(awk -v INPUT=$INPUT '$3 == INPUT' /scratch/ucgd/lustre-work/marth/u0691312/reference/Homo_sapiens.gene_info | cut -f 2)

awk -v INPUT=$INPUT '$3 == INPUT' /scratch/ucgd/lustre-work/marth/u0691312/reference/Homo_sapiens.gene_info \
	| cut -f 2 \
	| while read line; do awk -v LINE=$line '$1 == "9606" && $2 == LINE' /scratch/ucgd/lustre-work/marth/u0691312/reference/gene2pubmed; done \
	| cut -f 3 \
	| while read line; do echo "https://pubmed.ncbi.nlm.nih.gov/$line"; bash /uufs/chpc.utah.edu/common/HIPAA/u0691312/scripts/pubmed_id_abstract.sh $line; done

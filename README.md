# pubmed_scripts
simple scripts for querying pubmed and clinvar via various inputs

## Usage
`head` each script for clarification on usage

#### Example:
```
$ head gene_abstracts.sh
### Usage
# bash gene_abstracts.sh $GENE
# where $GENE is a HUGO style gene name like GFI1, TP53, BRCA1, DDX17, etc
# Example: bash gene_abstracts.sh BRCA1
```

## Considerations
scripts are parsing web pages, could break if source page code changes

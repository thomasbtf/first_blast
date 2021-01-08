### make swissprotDB with diamond programm
# Makedb options 
# --in <file>
# Path to the input protein reference database file in FASTA format (may be gzip compressed). If this parameter is omitted, the input will be read from stdin.

# --db/-d <file>
# Path to the output DIAMOND database file.

# --taxonmap <file>
# Path to mapping file that maps NCBI protein accession numbers to taxon ids (gzip compressed). This parameter is optional and needs to be supplied in order to provide taxonomy features. The file can be downloaded from NCBI: ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/accession2taxid/prot.accession2taxid.gz.
# A custom file following the same format may be supplied here. Note that the first line of this file is assumed to contain headings and will be ignored.

# --taxonnodes <file>
# Path to the nodes.dmp file from the NCBI taxonomy. This parameter is optional and needs to be supplied in order to provide taxonomy features. The file is contained within this archive downloadable at NCBI: ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/taxdmp.zip.

# --taxonnames <file>
# Path to the names.dmp file from the NCBI taxonomy. This parameter is optional and needs to be supplied in order to provide taxonomy features. The file is contained within this archive downloadable at NCBI: ftp://ftp.ncbi.nlm.nih.gov/pub/taxonomy/taxdmp.zip.
./diamond makedb --in swissprot -d swissprotDB

### Blast with blastx
# Align translated DNA query sequences against a protein reference database.

# --db/-d <file>
# Path to the DIAMOND database file.

# --query/-q <file>
# Path to the query input file in FASTA or FASTQ format (may be gzip compressed). If this parameter is omitted, the input will be read from stdin.

# --very-sensitive
# Enable the very-sensitive mode designed for best sensitivity including the twilight zone range of <40% identity.

# --outfmt/-f #
# Format of the output file. The following values are accepted:
# 0
# BLAST pairwise format.
# 5
# BLAST XML format.
# 6
# BLAST tabular format (default). This format can be customized, the 6 may be followed by a space-separated list of the following keywords, each specifying a field of the output.

# ./diamond blastx -q U00096.2.fasta -d swissprotDB -o output_very_sensitive.csv -f 5 --very-sensitive
./diamond blastx -q U00096.2.fasta -d swissprotDB.dmnd -o output_sens.tsv --very-sensitive

sed 's/\t/,/g' output_sens.tsv > output_sens.csv
# head out.csv
import pandas as pd

path = "results/output.csv"
diamond_headers = [
    'Query accession',
    'Target accession',
    'Sequence identity',
    'Length',
    'Mismatches',
    'Gap openings',
    'Query start',
    'Query end',
    'Target start',
    'Target end',
    'E-value',
    'Bit score'
]
results_df = pd.read_csv(path, names = diamond_headers)

print(results_df.sort_values(by=['Sequence identity', 'Bit score'], ascending = False))

# https://www.ebi.ac.uk/training/online/sites/ebi.ac.uk.training.online/files/UniProt_programmatically_py3.pdf
# Blasting using Docker, Snakemake and Diamond

Steps to run:

1. Build snakemake container: docker build --pull --rm -f "5_MyContainer\Dockerfile" -t sm_on_ubu:latest "5_MyContainer"
2. Create snakemake workflow (preferably in a dedicated git repository) of the following structure
"""bash
├── .gitignore
├── README.md
├── LICENSE.md
├── workflow
│   ├── rules
|   │   ├── module1.smk
|   │   └── module2.smk
│   ├── envs
|   │   ├── tool1.yaml
|   │   └── tool2.yaml
│   ├── scripts
|   │   ├── script1.py
|   │   └── script2.R
│   ├── notebooks
|   │   ├── notebook1.py.ipynb
|   │   └── notebook2.r.ipynb
│   ├── report
|   │   ├── plot1.rst
|   │   └── plot2.rst
|   └── Snakefile
├── config
│   ├── config.yaml
│   └── some-sheet.tsv
├── results
└── resources
"""
3. Run snakemake project in the container: docker run -it -v <path/to/snakemake/project>:/tmp/data sm_on_ubu:latest,\
    e.g. docker run -it -v d:\docker_volume\snakemake_ecoli_genome_swissprot:/tmp/data sm_on_ubu:latest

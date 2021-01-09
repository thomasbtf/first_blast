# Blasting using Docker, Snakemake and Diamond

Steps to run:

Build snakemake container: 
> docker build --pull --rm -f "5_MyContainer\Dockerfile" -t sm_on_ubu:latest "5_MyContainer"
Create snakemake workflow (preferably in a dedicated git repository) of the following structure

    ├── .gitignore
    ├── README.md
    ├── LICENSE.md
    ├── workflow
    │   ├── rules
    │   │   ├── module1.smk
    │   │   └── module2.smk
    │   ├── envs
    │   │   ├── tool1.yaml
    │   │   └── tool2.yaml
    │   ├── scripts
    │   │   ├── script1.py
    │   │   └── script2.R
    │   ├── notebooks
    │   │   ├── notebook1.py.ipynb
    │   │   └── notebook1.r.ipynb
    │   ├── report
    │   │   ├── plot1.rst
    │   │   └── plot2.rst
    │   └── Snakefile
    ├── config
    │   ├── rules
    │   └── some-sheet.tsv
    ├── results
    └── resources

Run snakemake project in the container: 
> docker run -it -v <path/to/snakemake/project>:/tmp/data sm_on_ubu:latest,\
e.g. > docker run -it -v d:\docker_volume\snakemake_ecoli_genome_swissprot:/tmp/data sm_on_ubu:latest
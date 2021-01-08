# Blasting using Docker, Snakemake and Diamond

Steps to run:

1. Build container: docker build --pull --rm -f "5_MyContainer\Dockerfile" -t sm_on_ubu:latest "5_MyContainer"
2. Create snakemake project with following structure
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
3. Run snakemake project: docker run -it -v <path/to/snakemake/project>:/tmp/data sm_on_ubu:latest,
    e.g. docker run -it -v /mnt/d/dockerdatavolumes/snakemake_ecoli_genome:/tmp/data sm_on_ubu:latest

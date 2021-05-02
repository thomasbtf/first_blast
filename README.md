# Using DIAMOND with Snakemake in Docker

This repo contains an experimental implementation of [DIAMOND](https://github.com/bbuchfink/diamond) combined with [Snakemake](https://snakemake.readthedocs.io/) in a [Docker](https://www.docker.com/) container.

DIAMOND is a  high-throughput program for aligning DNA reads or protein sequences against a protein reference database such as NR, at up to 20,000 times the speed of BLAST, with high sensitivity.

The Snakemake workflow management system is a tool to create reproducible and scalable data analyses. Workflows are described via a human readable, Python based language. They can be seamlessly scaled to server, cluster, grid and cloud environments, without the need to modify the workflow definition.

Docker is a set of platform as a service products that use OS-level virtualization to deliver software in packages called containers. Containers are isolated from one another and bundle their own software, libraries and configuration files; they can communicate with each other through well-defined channels.

Steps to run:

### Get the image

Build snakemake image by using the dockerfile in this GitHub repository:
> docker build --pull --rm -f "5_MyContainer\Dockerfile" -t thomasbtf/diamond_snakemake:latest "5_MyContainer"

Or download the image via docker hub:
> docker pull thomasbtf/diamond_snakemake

### Build DIAMOND search in a Snakemake workflow

Create a Snakemake workflow (preferably in a dedicated git repository) of the following structure:

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

The Snakefile can include DIAMOND commands in the shell section of a rule, e.g.:
> diamond makedb --in {input} -d {output}

> diamond blastx -q {input.genome} -d {input.diamond_db} -o {output}

### Run the workflow in the container

Run the snakemake project in the container via a mounted volume:

> docker run -it -v <path/to/snakemake/project>:/tmp/data thomasbtf/diamond_snakemake

e.g.

> docker run -it -v d:\docker_volume\snakemake_ecoli_genome_swissprot:/tmp/data thomasbtf/diamond_snakemake

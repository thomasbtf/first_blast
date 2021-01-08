# Blasting using Docker, Snakemake and Diamond

Steps to run:

1. Build container: docker build --pull --rm -f "4_BringItTogether\Dockerfile" -t snakemake_in_docker:latest "4_BringItTogether"
2. Run snakemake project: docker run -it -v <path/to/snakemake/project>:/tmp/repo/data </docker image>,
    e.g. docker run -it -v /mnt/d/dockerdatavolumes/snakemake_ecoli_genome:/tmp/repo/data snakemake_in_docker:latest

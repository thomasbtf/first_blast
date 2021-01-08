# Use offical snakemake image from docker hub
FROM snakemake/snakemake

# Chang dir to mounted volumme and execute snakemake there
CMD echo 'Changing to data dir' \
    && cd data/ \
    && echo 'pwd' $(pwd) \
    && echo 'ls' $(ls) \
    && echo 'Starting snakemake' \
    && snakemake --cores all    

# To Run and mounting drive
# docker run -it -v <path/to/snakemake/project>:/tmp/repo/data <docker image>
# e.g.
# docker run -it -v /mnt/d/dockerdatavolumes/snakemake_ecoli_genome:/tmp/repo/data snakemake_in_docker:latest
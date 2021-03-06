FROM ubuntu:20.04

# update ubuntu and update packages
RUN apt-get update && apt-get install -y \
    wget \
    curl

# Install Diamond 0.9.31
# Hinweise: Install -m 755 instatt of mv
# /root bei Singualrity nicht möcglich
# /usr/bin/ gehört dem System
RUN cd /root/ \
    && mkdir /usr/diamond \
    && cd /usr/diamond \
    && wget https://github.com/bbuchfink/diamond/releases/download/v0.9.31/diamond-linux64.tar.gz \
    && tar xzvf diamond-linux64.tar.gz \
    && mv diamond /usr/bin/ \ 
    && cd /root/ \
    && rm -rf /usr/diamond

# Install latest Miniconda
ENV PATH /opt/conda/bin:$PATH
RUN cd /root/ \
    && mkdir /usr/miniconda \
    && cd /usr/miniconda \
    && wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda \
    && cd /root/ \
    && rm -rf /usr/miniconda

# Install latest Snakemake
RUN conda create -c conda-forge -n snakemake bioconda::snakemake bioconda::snakemake-minimal --only-dep -y \
    && conda clean --all -y
ENV PATH /opt/conda/envs/snakemake/bin:${PATH}

# Make dir for volume mount
RUN cd /root/ \
    && mkdir /tmp/data

# Get python packages
RUN pip install --upgrade pip && pip install \
    pandas 

# Change dir to mounted volumme and execute snakemake there
CMD echo 'Changing to data dir' \
    && cd /tmp/data \
    && echo 'pwd:' $(pwd) \
    && echo 'ls:' $(ls) \
    && echo \
    && echo 'Snakemake dryrun' \
    && snakemake -np \
    && echo \
    && echo 'Creating Viz' \
    && snakemake --dag | dot -Tpdf > results/pipeline_viz.pdf \
    && echo \
    && echo 'Staring Snakemake' \
    && snakemake --cores all    

# To run and mounting drive
# docker run -it -v <path/to/snakemake/project>:/tmp/repo/data thomasbtf/diamond_snakemake:latest

# plassembler-contained

Docker/Singularity image to run [Plassembler](). 

If you have used this work for a publication, please acknowledge SIH, e.g. "The authors acknowledge the technical assistance provided by the Sydney Informatics Hub, a Core Research Facility of the University of Sydney."

# Quickstart for Artemis/NCI Gadi
Put this repo on Artemis/NCI Gadi e.g.

```
git clone https://github.com/Sydney-Informatics-Hub/plassembler-contained.git
```
Then `cd plassembler-contained` and modify the `run_gadi.pbs` script and launch with `qsub run_gadi.pbs`.

Otherwise here are the full instructions for getting there....

# How to recreate 

## Build with docker 
Check out this repo then build the Dockerfile. If working on Artemis/Gadi please see instructions below for building and running with Singularity:
```
cd plassembler-contained
sudo docker build . -t sydneyinformaticshub/plassembler:v1.6.2
```

## Run with docker 
To run this, mounting your current host directory in the container directory, at /project, and execute a run on the test images (that live in the container) run:
```
sudo docker run -it -v `pwd`:/path/to/your/data sydneyinformaticshub/plassembler:v1.6.2 plassembler
```

## Push to Dockerhub
```
sudo docker push sydneyinformaticshub/plassembler:v1.6.2
```

See the repo at [https://hub.docker.com/r/sydneyinformaticshub/spaceranger](https://hub.docker.com/r/sydneyinformaticshub/spaceranger)

## Build with singularity 
```
export SINGULARITY_CACHEDIR=`pwd`
export SINGULARITY_TMPDIR=`pwd`

singularity build plassembler.img docker://sydneyinformaticshub/plassembler:v1.6.2
```

## Run with singularity
To run the singularity image (noting singularity mounts the current folder by default): 
```
singularity run --bind /path/to/your/data plassembler.img plassembler \
  long -d $plasmid_db \
    -l $fq \
    -o $output_assemblies  \
    -t 16 \
    --flye_assembly $flye_assembly \
    --flye_info $flye_assembly_info
```

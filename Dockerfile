FROM ubuntu:16.04

# R and RStudio
FROM rocker/verse:devel

RUN apt-get update
RUN apt-get install libprotobuf-dev -y

# install dependencies - includes X11
RUN apt-get update && apt-get install -y\
    autoconf \
    automake \
    libtool \
    libxml2 \
    libhdf5-dev \
    libx11-6 \
    libxss1 \
    libxt6 \
    libxext6 \
    libsm6 \
    libice6 \
    xdg-utils

# install packages
RUN R -e "install.packages('BiocManager')" 
RUN R -e "BiocManager::install(version = 'devel')" 
RUN R -e "BiocManager::install('flowCore')" 
RUN R -e "BiocManager::install('flowWorkspace')" 
RUN R -e "BiocManager::install('openCyto')" 
RUN R -e "devtools::install_github('DillonHammill/CytoExploreRData')" 
RUN R -e "devtools::install_github('DillonHammill/CytoExploreR')"
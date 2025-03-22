ARG SRCVERSION=18
ARG SRCTAG=2024-12-18
ARG SRCHUBID=dataeditors
ARG RVERSION=4.4.2
ARG RTYPE=verse

# define the source for Stata
FROM ${SRCHUBID}/stata${SRCVERSION}:${SRCTAG} AS stata

# use the source for R

FROM rocker/${RTYPE}:${RVERSION}
COPY --from=stata /usr/local/stata/ /usr/local/stata/

FROM rocker/verse:4.4.2

RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y \
         locales \
         libcurl4-openssl-dev \
         libssl-dev \
        imagemagick \
        libmagick++-dev \
        gsfonts \
        pandoc \
        libicu-dev \
        libtcl8.6 \
        libtk8.6 \
        libxml2-dev \
        libudunits2-dev\
        libgdal-dev\
        gdal-bin\
        libgeos-dev\
        libproj-dev \
        bzip2 \
        unzip \
        python3.12-full \
        python3-pip \
        python3.12-venv \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

# Get quarto
# RUN wget https://github.com/quarto-dev/quarto-cli/releases/download/v1.6.40/quarto-1.6.40-linux-amd64.deb && \
#     dpkg -i quarto-1.6.40-linux-amd64.deb && \
#     rm quarto-1.6.40-linux-amd64.deb

WORKDIR /home/rstudio
# Copy an existing renv profile into the image
COPY .Rprofile .Rprofile
COPY renv.lock renv.lock
COPY renv/ renv/
COPY build/_initrenv.R _initrenv.R
RUN chown -R rstudio:rstudio renv* .Rprofile _initrenv.R
# Let R install the packages
USER rstudio
RUN echo "export PATH=/usr/local/stata:${PATH}" >> /home/rstudio/.bashrc
RUN Rscript _initrenv.R 
# Now remove the .Rprofile again
RUN rm -f /home/rstudio/.Rprofile && \
    rm -rf /home/rstudio/renv.lock /home/rstudio/_initrenv.R

USER root

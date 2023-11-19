FROM jupyter/r-notebook:r-4.3.1

WORKDIR /opt/

COPY requirements_cf.txt  /opt/
RUN mamba install -c conda-forge --yes --file requirements_cf.txt 
RUN mamba clean --all -f -y && \
   fix-permissions "${CONDA_DIR}" && \
   fix-permissions "/home/${NB_USER}"

USER root
RUN apt-get update && apt-get install -y qpdf
USER ${NB_UID}

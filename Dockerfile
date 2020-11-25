FROM python:3.7-slim
# install the notebook package
RUN pip install --no-cache --upgrade pip && \
    pip install --no-cache notebook

# create user with a home directory
ARG NB_USER
ARG NB_UID
ENV USER ${NB_USER}
ENV HOME /home/${NB_USER}

RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid NB_UID \
    -system /
    ${NB_USER}
    
RUN usermod -a -G sudo ${NB_USER}
RUN 
WORKDIR ${HOME}
USER ${NB_USER}

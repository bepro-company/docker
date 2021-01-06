FROM ghcr.io/bepro-company/docker/python_with_ffmpeg:3.7
#FROM ghcr.io/bepro-company/docker/python_with_ffmpeg:3.7-libcairo

RUN pip install virtualenvwrapper
ENV VENV_DIR ~/.virtualenvs
RUN /bin/bash -c "mkdir -p $VENV_DIR"
COPY requirements/test.txt .

ENV VIRTUALENVWRAPPER_PYTHON /usr/local/bin/python3
ENV WORKON_HOME $VENV_DIR
RUN /bin/bash -c "source /usr/local/bin/virtualenvwrapper.sh && lsvirtualenv -b | grep -q bepro-python || mkvirtualenv -p python3.7 bepro-python"
RUN /bin/bash -c "[[ -f /usr/local/bin/python3 ]] || ln -s /usr/local/bin/python3 /usr/local/bin/python3"
RUN $VENV_DIR/bepro-python/bin/pip install --no-cache-dir --exists-action w -r $REQUIREMENTS

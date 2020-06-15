FROM danteev/texlive:202006150204173dfee6

ADD ./src/ /tmp/src
RUN mkdir -p $(kpsewhich -var-value TEXMFLOCAL)/tex/latex/udhbwvst \
    && mv /tmp/src/udhbwvst* $(kpsewhich -var-value TEXMFLOCAL)/tex/latex/udhbwvst/ \
    && texhash $(kpsewhich -var-value TEXMFLOCAL) \
    && rm -rf /tmp/src

WORKDIR /work
FROM danteev/texlive:latest

ADD ./src/ /tmp/src
RUN mkdir -p $(kpsewhich -var-value TEXMFHOME)/tex/latex/udhbwvst \
    && mv /tmp/src/udhbwvst* $(kpsewhich -var-value TEXMFHOME)/tex/latex/udhbwvst/ \
    && texhash $(kpsewhich -var-value TEXMFHOME) \
    && rm -rf /tmp/src

RUN mkdir /work
WORKDIR /work
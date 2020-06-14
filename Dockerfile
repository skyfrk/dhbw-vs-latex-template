FROM danteev/texlive:latest

ADD ./src/ /tmp/src
RUN mkdir -p $(kpsewhich -var-value TEXMFLOCAL)/tex/latex/udhbwvst \
    && mv /tmp/src/udhbwvst* $(kpsewhich -var-value TEXMFLOCAL)/tex/latex/udhbwvst/ \
    && texhash $(kpsewhich -var-value TEXMFLOCAL) \
    && rm -rf /tmp/src

# Install git-latexdiff v1.6.0 https://gitlab.com/git-latexdiff/git-latexdiff
RUN git clone --branch 1.6.0 https://gitlab.com/git-latexdiff/git-latexdiff.git /tmp/git-latexdiff \
    && make -C /tmp/git-latexdiff install-bin \
    && rm -rf /tmp/git-latexdiff

RUN mkdir /work
WORKDIR /work
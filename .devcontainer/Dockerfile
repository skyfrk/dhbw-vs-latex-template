FROM debian:stable-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
		biber \
		latexmk \
		make \
		texlive-full \
		git \
	&& rm -rf /var/lib/apt/lists/*
FROM listx/texlive:2019

# Install required packages
RUN pacman -Syw \
    && pacman -Sy --noconfirm \
		git \
        curl \
        java-runtime \
        graphviz

# Install PlantUML
RUN mkdir -p /app \
    && curl -L https://sourceforge.net/projects/plantuml/files/plantuml.jar/download -o /app/plantuml.jar

# Install udhbwvst class
ADD ./src/ /tmp/src
RUN mkdir -p $(kpsewhich -var-value TEXMFHOME)/tex/latex/udhbwvst \
    && mv /tmp/src/udhbwvst* $(kpsewhich -var-value TEXMFHOME)/tex/latex/udhbwvst/ \
    && texhash $(kpsewhich -var-value TEXMFHOME) \
    && rm -rf /tmp/src

# Set environment variables required by 'plantuml' CTAN package
ENV PLANTUML_JAR=/app/plantuml.jar
ENV GRAPHVIZ_DOT=/usr/sbin/dot

# Set workdir
RUN mkdir /work
WORKDIR /work
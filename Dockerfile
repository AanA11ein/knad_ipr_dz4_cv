FROM debian:10.3

ENV DEBIAN_FRONTEND=noninteractive

RUN printf "deb http://archive.debian.org/debian buster main contrib non-free\n" > /etc/apt/sources.list && \
    apt-get -o Acquire::Check-Valid-Until=false update && \
    apt-get install -y \
        texlive-base \
        texlive-latex-base \
        texlive-latex-recommended \
        texlive-latex-extra \
        texlive-fonts-recommended \
        texlive-fonts-extra \
        texlive-pictures \
        texlive-lang-cyrillic \
        texlive-science \
        cm-super \
        dvipng && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

CMD bash -c "\
pdflatex -interaction=nonstopmode -output-directory=/workspace/output /workspace/cv/main.tex && \
pdflatex -interaction=nonstopmode -output-directory=/workspace/output /workspace/cv/main.tex"
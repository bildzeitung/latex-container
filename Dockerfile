FROM alpine:latest
LABEL maintainer="Bildzeitung <bildzeitung@gmail.com>" \
      description="TeX-Live for LaTeX Workshop in VS Code"

COPY texlive.profile .

RUN apk add --no-cache curl perl
RUN curl -LO https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz \
	&& tar xvf install* \
	&& install-*/install-tl --profile=texlive.profile \
	&& rm -rf install-tl*

ENV PATH /usr/local/texlive/2021/bin/x86_64-linuxmusl:$PATH

RUN tlmgr update --self --all


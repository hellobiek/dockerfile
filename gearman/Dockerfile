FROM artefactual/gearmand:1.1.18-alpine

USER root

RUN apk update                      &&\
    apk upgrade                     &&\
    apk add bash
 
COPY ./wait-for-it.sh /wait-for-it.sh

USER gearman

FROM airbyte/integration-base-java:dev

WORKDIR /airbyte

ENV APPLICATION source-mongodb-v2

COPY build/distributions/${APPLICATION}*.tar ${APPLICATION}.tar

RUN tar xf ${APPLICATION}.tar --strip-components=1

LABEL io.airbyte.version=0.1.3
LABEL io.airbyte.name=airbyte/source-mongodb-v2

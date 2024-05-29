FROM orioledb/orioledb:latest-pg16 as base

COPY --chown=postgres:postgres postgresql /etc/postgresql

ENV PG_CONF=/etc/postgresql/postgresql.conf
COPY entrypoint-s3.sh /
ENTRYPOINT ["/entrypoint-s3.sh"]

CMD ["postgres", "-D", "/etc/postgresql"]
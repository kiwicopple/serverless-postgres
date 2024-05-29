#!/usr/bin/env bash
set -eou pipefail

echo "Configuring OrioleDB..."

: "${ORIOLEDB_S3_HOST:?}"
: "${ORIOLEDB_S3_REGION:?}"
: "${ORIOLEDB_S3_ACCESSKEY:?}"
: "${ORIOLEDB_S3_SECRETKEY:?}"

sed -i \
  -e "s|^\(orioledb.s3_host\) = .*|\1 = '$ORIOLEDB_S3_HOST'|" \
  -e "s|^\(orioledb.s3_region\) = .*|\1 = '$ORIOLEDB_S3_REGION'|" \
  -e "s|^\(orioledb.s3_accesskey\) = .*|\1 = '$ORIOLEDB_S3_ACCESSKEY'|" \
  -e "s|^\(orioledb.s3_secretkey\) = .*|\1 = '$ORIOLEDB_S3_SECRETKEY'|" \
  "$PG_CONF"

# initdb "$PGDATA" --no-locale
exec docker-entrypoint.sh "$@"
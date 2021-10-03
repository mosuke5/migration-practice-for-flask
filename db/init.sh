#!/bin/bash
set -xe
set -o pipefail

CURRENT_DIR=$(cd $(dirname $0);pwd)
export MYSQL_HOST=${DB_HOST:-127.0.0.1}
export MYSQL_PORT=${DB_PORT:-3306}
export MYSQL_USER=${DB_USER:-isucon}
export MYSQL_DBNAME=${DB_DBNAME:-isuumo}
export MYSQL_PWD=${DB_PASS:-isucon}
export LANG="C.UTF-8"
cd $CURRENT_DIR

cat 0_Schema.sql 1_DummyEstateData.sql 2_DummyChairData.sql | mysql --defaults-file=/dev/null -h $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER $MYSQL_DBNAME

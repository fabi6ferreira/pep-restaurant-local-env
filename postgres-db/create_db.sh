#!/bin/bash
set -e

POSTGRES="psql --username ${POSTGRES_USER}"
echo "Creating user ${PEP_DB_USERNAME} with password"

$POSTGRES <<EOSQL
CREATE USER ${PEP_DB_USERNAME} ENCRYPTED PASSWORD '${PEP_DB_PASSWORD}';
EOSQL
echo "Creating database: ${PEP_KEYCLOAK_DB}"

$POSTGRES <<EOSQL
CREATE DATABASE ${PEP_KEYCLOAK_DB} OWNER ${PEP_DB_USERNAME};
EOSQL
echo "Creating database: ${PEP_SONAR_DB}"

$POSTGRES <<EOSQL
CREATE DATABASE ${PEP_SONAR_DB} OWNER ${PEP_DB_USERNAME};
EOSQL
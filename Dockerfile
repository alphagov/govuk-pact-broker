FROM pactfoundation/pact-broker:2.143.0-pactbroker2.121.0

# Pick up the eMudhra/emSign distrust in ca-certificates
RUN apk upgrade --no-cache ca-certificates

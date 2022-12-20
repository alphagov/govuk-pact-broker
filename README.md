# GOV.UK Pact Broker

This repo is a thin wrapper around the [Pact Broker Gem][pact-broker-gem] that
allows Pact Broker to be run on unicorn server on the
[GOV.UK PAAS][government-paas].

It is used by projects such as [Publishing API][publishing-api],
[GDS API Adapters][gds-api-adapters] and [Content Store][content-store] for
contract testing.

## Getting started

### Install dependencies

```
$ bundle install
```

### Create a PostgreSQL database

```
$ psql postgres
> create database pact_broker;
> CREATE USER pact_broker WITH PASSWORD 'pact_broker';
> GRANT ALL PRIVILEGES ON DATABASE pact_broker to pact_broker;
```

### Set up environment variables

```
$ export AUTH_USERNAME=username
$ export AUTH_PASSWORD=password
$ export DATABASE_URL=postgresql://pact_broker@localhost/pact_broker
```

### Run the app

```
$ bundle exec unicorn
```

## Further documentation

- [Infrastructure](docs/infrastructure.md)
- [Deployment](docs/deployment.md)
- [Versioning](docs/versioning.md)

[pact-broker-gem]: https://github.com/bethesque/pact_broker
[government-paas]: https://docs.cloud.service.gov.uk/
[publishing-api]: https://github.com/alphagov/publishing-api
[gds-api-adapters]: https://github.com/alphagov/gds-api-adapters
[content-store]: https://github.com/alphagov/content-store

## Licence

[MIT License](LICENCE)

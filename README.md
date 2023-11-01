# GOV.UK Pact Broker

This repo is a thin wrapper around the [Pact Broker Gem][pact-broker-gem] that
allows Pact Broker to be run on unicorn server on the
[GOV.UK PAAS][government-paas].

As PaaS is being decommissioned later this year, we are currently migrating
Pact Broker to Heroku, and so this repo also contains a `Dockerfile` and
associated `heroku.yml` file to allow it to run there. After the migration is
complete, the leftover pieces of the old wrapper (`config.ru`, `Gemfile`,
`Procfile`, etc.) will be removed from this repo.

Pact Broker is used by projects such as [Publishing API][publishing-api],
[GDS API Adapters][gds-api-adapters] and [Content Store][content-store] for
contract testing.

## Getting started (legacy version)

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

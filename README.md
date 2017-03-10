# GOV.UK Pact Broker

This repo is a thin wrapper around the [Pact Broker Gem][pact-broker-gem] that
allows Pact Broker to be run on unicorn server on the
[Government PAAS][government-paas].

It is used by projects such as [Publishing API][publishing-api],
[GDS API Adapters][gds-api-adapters] and [Content Store][content-store] for
contract testing.

## Run this locally

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

## Deploy a change to the PAAS

You'll need a cloud foundry account for [Government PAAS][government-paas] and
be in the `govuk_development` organisation with access to the `sandbox` space.

From there you should be able to see this app (`pact-broker`) by running:

```
$ cf apps
```

Then when you have made your changes you can push a new deployment with:

```
$ cf push pact-broker
```

## Run this on the [Government PAAS][government-paas]

### Space for the app

You may be given a space by your organisation manager, or need to create one
for the application.

At the time of writing this app runs on the `govuk_development` organisation
in the `sandbox` space

### Push the app to the PAAS

As we've not set everything up we don't want to start the app now.

```
$ cf push pact-broker --no-start
```

we can pass a `-n HOSTNAME` argument here to specify the hostname, otherwise
it will use the default one of `pact-broker` (as specified in
[manifest.yml](manifest.yml))

### Create a database

There's a number of different database plans available, but the "Free" one
should be sufficient:

```
$ cf create-service postgres Free pact-broker-db
```

This will take a few minutes. Once completed it can be bound to the application:

```
$ cf bind-service pact-broker pact-broker-db
```

### Set up environment variables for credentials

This application requires basic auth credentials of `AUTH_USERNAME` and
`AUTH_PASSWORD`.

```
$ cf set-env pact-broker AUTH_USERNAME username
$ cf set-env pact-broker AUTH_PASSWORD password
```

### Start the app

```
$ cf start pact-broker
```

And then you'll probably want it to run on 2 instances:

```
$ cf scale pact-broker -i 2
```

[pact-broker-gem]: https://github.com/bethesque/pact_broker
[government-paas]: https://docs.cloud.service.gov.uk/
[publishing-api]: https://github.com/alphagov/publishing-api
[gds-api-adapters]: https://github.com/alphagov/gds-api-adapters
[content-store]: https://github.com/alphagov/content-store

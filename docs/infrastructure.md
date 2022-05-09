# Infrastructure

This guidance is about how to setup the app from scratch on [GOV.UK PAAS][government-paas].

## Space for the app

You may be given a space by your organisation manager, or need to create one
for the application.

At the time of writing this app runs on the `govuk_development` organisation
in the `sandbox` space

## Push the app to the PAAS

As we've not set everything up we don't want to start the app now.

```
$ cf push pact-broker --no-start
```

we can pass a `-n HOSTNAME` argument here to specify the hostname, otherwise
it will use the default one of `pact-broker` (as specified in
[manifest.yml](manifest.yml))

## Create a database

There's a number of different database plans available, but the "Free" one
should be sufficient:

```
$ cf create-service postgres Free pact-broker-db
```

This will take a few minutes. Once completed it can be bound to the application:

```
$ cf bind-service pact-broker pact-broker-db
```

## Set up environment variables for credentials

This application requires basic auth credentials of `AUTH_USERNAME` and
`AUTH_PASSWORD`.

```
$ cf set-env pact-broker AUTH_USERNAME username
$ cf set-env pact-broker AUTH_PASSWORD password
```

## Start the app

```
$ cf start pact-broker
```

And then you'll probably want it to run on 2 instances:

```
$ cf scale pact-broker -i 2
```

[government-paas]: https://docs.cloud.service.gov.uk/

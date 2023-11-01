# Deployment

## Legacy instance (on PaaS)

You'll need a cloud foundry account for [GOV.UK PAAS][government-paas] and
be in the `govuk_development` organisation with access to the `sandbox` space.

From there you should be able to see this app (`pact-broker`) by running:

```
$ cf apps
```

Then when you have made your changes you can push a new deployment with:

```
$ cf push pact-broker
```

[government-paas]: https://docs.cloud.service.gov.uk/

## New instance (on Heroku)

This instance is automatically deployed whenever a new commit is pushed.
Logs can be found in [the Heroku dashboard for this project](https://dashboard.heroku.com/apps/govuk-pact-broker).

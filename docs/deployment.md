# Deployment

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

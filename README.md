# GOV.UK Pact Broker

This repo contains a minimal configuration to allow the
[pactfoundation/pact-broker](https://hub.docker.com/r/pactfoundation/pact-broker)
Docker image to run on Heroku.

This repo is automatically deployed to Heroku whenever a new commit is
pushed to the `main` branch. Logs can be found in
[the Heroku dashboard for this project](https://dashboard.heroku.com/apps/govuk-pact-broker).

Pact Broker is used by projects such as
[Publishing API](https://github.com/alphagov/publishing-api),
[GDS API Adapters](https://github.com/alphagov/gds-api-adapters) and
[Content Store](https://github.com/alphagov/content-store) for contract testing.

## Licence

[MIT License](LICENCE)

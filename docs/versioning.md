# Versioning

Out of the box, the Pact Broker allows uploading of pact files with semver
style versions (eg 2.0.1). For our usage, we wanted to be able to upload pact
files from various branches in addition the released versions so that our
branch builds of consumers can verify their pactfiles with the producers.

Pact Broker allows us to [implement our own versioning
scheme](https://github.com/bethesque/pact_broker/wiki/Configuration#version-parser)
by providing a custom version parser.  We've [used
this](https://github.com/alphagov/govuk-pact-broker/blob/master/config.ru#L23-L50)
to extend the versioning scheme to allow branch builds to be uploaded as well.
In addition to numeric versions, our scheme allows for "master", and
"branch-foo" versions to be uploaded. These will always be ordered after any
numeric versions, so the 'latest' pactfile from the pact brokers POV will
always be the highest numeric version.

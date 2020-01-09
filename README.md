Bug replicating app
=====

The setup:
----
`bundle install`

The test:
----

Running `bin/foreman start karafka` or `bundle exec foreman start karafka`

What should happen:
---

The Karafka server should display the initial config, then (in absence of an
actual `Karafka::App.boot!` instruction) stop with a 0 exit-code.

```
karafka.1 | started with pid 70789
karafka.1 | Karafka version: 1.3.1
karafka.1 | Ruby version: 2.6.5
karafka.1 | Ruby-kafka version: 0.7.10
karafka.1 | Application client id:
karafka.1 | Backend: inline
karafka.1 | Batch fetching: true
karafka.1 | Batch consuming: false
karafka.1 | Boot file: /Users/aquaj/Code/external/broken-zeitwerk-minimal-ex/karafka.rb
karafka.1 | Environment: development
karafka.1 | Kafka seed brokers: ["kafka://127.0.0.1:9092"]
karafka.1 | exited with code 0
```

What happens: (the issue)
----
```
karafka.1 | bundler: failed to load command: karafka (/Users/aquaj/.rbenv/versions/2.6.5/bin/karafka)
karafka.1 | LoadError: cannot load such file -- /Users/aquaj/Code/external/broken-zeitwerk-minimal-ex/app/channels/application_cable
```

### What we know about the issue

#### It does not happen without Zeitwerk
Switching to a `config.autoloader = :classic` in `config/application.rb` is enough to fix the issue.

#### It happens when Karakfa `require`s `config/environment.rb`
Removing the require in `./karafka.rb` is enough for it to work.

#### It appears to be related to Bundler's Rubygems reset
Both Rubygems, Zeitwerk and Bundler override `Kernel`'s `require` method.
Rubygem's override is reset by Bundler during its setup. Normally this is no issue and works great but in our case, for reasons yet unknown, Bundler's reset comes after Zeitwerk's instead of its usual after, returning `Kernel#require` to its pre-Zeitwerk implementation, and breaking Zeitwerk behaviour.

#### It doesn't happen if you don't use Foreman
`bundle exec karafka server` works great.

#### It doesn't happen if you use binstubs instead
If the Procfile states `karafka: bin/karafka server` instead of `karafka: bundle exec server`, the issue seems to disappear.

The open issues related to this app:
----
- https://github.com/fxn/zeitwerk/issues/104
- https://github.com/bundler/bundler/issues/7553


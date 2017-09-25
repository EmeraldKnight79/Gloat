# GLOAT

A tool used to keep track of the loot that you and your party earn while ganking in Albion Online

## API usage

I leverage the "public" API for Albion that powers their kill tracker UI.

I do store your character's API ID but, from what I can see, it is not possible to use this value to harm another user in any way. The API is strictly read-only.

## Getting Started

```
git clone git@github.com:KMontag42/gloat.git
bundle install
rails db:create db:migrate
rails s
```

## Tests

```
rails test
```

## Contributing

Fork this repo and make a PR, I am pretty active on github.

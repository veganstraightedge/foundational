# README

## TODO

- [ ] Improve Categories <> Categorizations in /admin
- [ ] Improve Tags <> Taggings in /admin

- [ ] Extract secret_key_base into an ENV var (using app.json?)

- [ ] Add render_markdown for alerts and setting descriptions

- [ ] Can Rails app write to ENV vars
  - [ ] AND persist those values across deploys
  - [ ] If so, /settings can update ENV vars
  - [ ] If not, write docs for how to set via browser and CLI

- [ ] Compare Metabase deploy flow (for When & Where Heroku deploys, not Foundational)
- [ ] Explore GET form as custom Deploy button builder
  - [ ] In GitHub README Markdown

- [ ] Sendgrid/etc settings
  - [ ] Support N email senders
  - [ ] Add Settings for SENDGRID_PASSWORD, SENDGRID_USERNAME, SMTP_PASSWORD, SMTP_USERNAME, kind of vars
  - [ ] Hookup mailers
  - [ ] Add Sendgrid addon for emails

- [ ] Blank slate experience:
  - [ ] First user on /signup
  - [ ] Redirect all requests until first user
  - [ ] Alert banners until all Settings are configured
  - [ ] Instruct user to update ENV vars for some Settings, update the Setting from ENV on each settings#index request until they don't require update
  - [ ] Prevent public access until required Settings are configured

- [ ] Themes (CSS blobs) (all site or subset of pages, load order?) (export function (One big CSS file?))

- [ ] Setup Action Text

- [ ] Setup Active Job for emails and uploads (sidekiq)
  - [ ] Redis gem
  - [ ] Redis addon
  - [ ] Add Bucketeer addon for uploads


## Usage

1. Fork
2. Add domain models, relationships, UI
3. Add tags/categories to domain models
4. Add domain models to /admin
5. Deploy
6. Set ENV vars
7. Config /settings
8. Setup DNS

## Deploy to Heroku

Click this button to easily deploy to Heroku. (You must have a Heroku account.)

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)


## Contributing

See [CONTRIBUTING.md](https://github.com/veganstraightedge/foundational/blob/main/CONTRIBUTING.md).

If you find bugs, have feature requests or questions, please
[file an issue](https://github.com/veganstraightedge/foundational/issues).


## Code of Conduct

Everyone interacting in all of Foundational codebases, issue trackers, chat rooms, and mailing lists is expected to follow the
[Foundational development code of conduct](https://github.com/veganstraightedge/foundational/blob/main/CODE_OF_CONDUCT.md).


## License

**PUBLIC DOMAIN**

Your heart is as free as the air you breathe. \
The ground you stand on is liberated territory.

In legal text, **Foundational** is dedicated to the public domain
using Creative Commons — CC0 1.0 Universal.

[https://creativecommons.org/publicdomain/zero/1.0](https://creativecommons.org/publicdomain/zero/1.0 "Creative Commons — CC0 1.0 Universal")

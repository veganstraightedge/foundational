Rails.logger.info '==> Seeding…'

# Settings
Rails.logger.info '==> Creating required Settings with default content…'

# Localization
Setting.create! name:            'Default Locale',
                group:           'Localization',
                description:     'What locale (language + optional dialect / region) will your website
                                  be used in primarily? For example: `en` for English (no dialect),
                                  `pt-br` for Brazilian Portuguese, `it` for Italian, etc.'.squish,
                content:         ENV.fetch('FOUNDATIONAL_LOCALE') { 'en' },
                default_content: 'en',
                form_control:    'text_field'

# Brand
Setting.create! name:            'Website Name',
                group:           'Branding',
                description:     'What text will display in the header nav bar?
                                  It will link to the homepage.'.squish,
                content:         ENV.fetch('FOUNDATIONAL_WEBSITE_NAME') { 'TODO' },
                default_content: 'TODO',
                update_required: true,
                form_control:    'text_field'

Setting.create! name:            'Website Header Image',
                group:           'Branding',
                description:     'What image will display in the header nav bar next
                                  to the Website Name? A square image is recommended.'.squish,
                content:         ENV.fetch('FOUNDATIONAL_WEBSITE_IMAGE', nil),
                default_content: nil,
                form_control:    'image_field'

Rails.logger.info '==> Seeding… complete.'

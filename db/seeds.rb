# Workaround for Devise > 5 error:
#   Could not find a valid mapping for #<User
#   https://github.com/heartcombo/devise/issues/5705
Rails.application.reload_routes_unless_loaded

Rails.logger.info '==> Seeding…'

if Rails.env.development?
  Rails.logger.info '==> Creating default admin user…'
  admin_user = User.create! username:              'admin',
                            email:                 'admin@example.com',
                            password:              'admin@example.com',
                            password_confirmation: 'admin@example.com'

  # Confirm admin user email
  admin_user.update confirmed_at: Time.current, remember_created_at: Time.current

  # Add the admin role to the admin user
  admin_user.add_role :admin

  Rails.logger.info '==> Creating default moderator user…'
  moderator_user = User.create! username:              'moderator',
                                email:                 'moderator@example.com',
                                password:              'moderator@example.com',
                                password_confirmation: 'moderator@example.com'

  # Confirm moderator user email
  moderator_user.update confirmed_at: Time.current, remember_created_at: Time.current

  # Add the moderator role to the moderator user
  moderator_user.add_role :moderator

  Rails.logger.info '==> Creating default contributor user…'
  contributor_user = User.create! username:              'contributor',
                                  email:                 'contributor@example.com',
                                  password:              'contributor@example.com',
                                  password_confirmation: 'contributor@example.com'

  # Confirm contributor user email
  contributor_user.update confirmed_at: Time.current, remember_created_at: Time.current

  # The contributor role doesn't exist, only implied by the absence of a role
end

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

# Devise
Setting.create! name:            'Host',
                group:           'Authentication',
                description:     'What domain will you use for your website? For example: `example.com`.',
                content:         ENV.fetch('FOUNDATIONAL_HOST') { 'example.com' },
                default_content: 'example.com',
                update_required: true,
                form_control:    'text_field'

Setting.create! name:            'FROM Email Address',
                group:           'Authentication',
                description:     'What address will your site send emails _FROM_,
                                  such as the password reset email?'.squish,
                content:         ENV.fetch('FOUNDATIONAL_FROM_EMAIL') { 'from@example.com' },
                default_content: 'from@example.com',
                update_required: true,
                form_control:    'email_field'

Setting.create! name:            'Minimum Password Length',
                group:           'Authentication',
                description:     'How long does a user’s password have to be?',
                content:         ENV.fetch('FOUNDATIONAL_PASSWORD_MINIMUM', 12),
                default_content: 12,
                form_control:    'number_field'

Setting.create! name:            'Invite Only',
                group:           'Authentication',
                description:     'Is this site invite only? Invite only will disable public signups at `/signup`.
                                  An admin user will have to send invitations to add new users.',
                content:         ENV.fetch('FOUNDATIONAL_INVITE_ONLY') { 'false' },
                default_content: 'false',
                form_control:    'radio_button'

Setting.create! name:            'Usernames',
                group:           'Profiles',
                description:     'Do you want users to have usernames?
                                  If not, they’ll only need to enter an email address when signing up.',
                content:         ENV.fetch('FOUNDATIONAL_USERNAMES') { 'true' },
                default_content: 'true',
                form_control:    'radio_button'

Setting.create! name:            'Profile Pages',
                group:           'Profiles',
                description:     'Do you want users to have profile pages with all of their contributions on them?
                                  They would be at a URL like `/@username`.',
                content:         ENV.fetch('FOUNDATIONAL_PROFILE_PAGES') { 'false' },
                default_content: 'false',
                form_control:    'radio_button'

Setting.create! name:            'Public Profile Pages',
                group:           'Profiles',
                description:     'Do you want users’ profile pages to be visible to people who are not signed in?
                                  If not, they’ll still be visible to other signed in users.
                                  This setting doesn’t apply if the **Profile Pages** setting is set to `false`.',
                content:         ENV.fetch('FOUNDATIONAL_PUBLIC_PROFILE_PAGES') { 'false' },
                default_content: 'false',
                form_control:    'radio_button'

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

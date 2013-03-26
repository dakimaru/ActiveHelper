source 'https://rubygems.org'

gem 'rails', '3.2.3'
gem 'bootstrap-sass', '2.0.0'
gem 'bcrypt-ruby', '3.0.1'
gem 'faker', '1.0.1'
gem 'will_paginate', '3.0.3'
gem 'bootstrap-will_paginate', '0.0.6'

group :development do
  gem 'sqlite3', '1.3.5'
  gem 'rspec-rails', '2.9.0'
  gem 'guard-rspec', '0.5.5'
  gem 'annotate'
end

group :assets do
  gem 'sass-rails',   '3.2.4'
  gem 'coffee-rails', '3.2.2'
  gem 'uglifier', '1.2.3'
  gem 'twitter-bootstrap-rails'
end

gem 'jquery-rails', '2.0.0'
gem 'active_attr'
gem 'paperclip'

group :test do
gem 'rspec-rails', '2.9.0'
gem 'capybara', '1.1.2'
gem 'guard-spork', '0.3.2'
gem 'spork', '0.9.0'
gem 'ruby_gntp'
gem 'factory_girl_rails', '1.4.0'
gem 'rb-fsevent'

# the last one is a problematic one. Either use one or the other website solution.
# https://github.com/thibaudgg/rb-fsevent/issues/20
# https://github.com/imathis/octopress/issues/575

# the one is suggesting to use  gem "rb-fsevent", "~> 0.9.1"
# the other suggests using the following code in terminal:
# sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/ruby: no such file to load -- ubygems (LoadError)
# which may or may not work

end

group :production do
  gem 'pg', '0.12.2'
end
# frozen_string_literal: true

require_relative 'lib/omniauth/app_center/version'

Gem::Specification.new do |spec|
  spec.name = 'omniauth-appcenter'
  spec.version = Omniauth::AppCenter::VERSION
  spec.authors = ['Jonathan PHILIPPE']
  spec.email = ['jphilippe@fluence.eu']

  spec.summary = %(A Fluence OAuth2 strategy for OmniAuth 1.x)
  spec.description = %(A Fluence OAuth2 strategy for OmniAuth 1.x. This allows you to login to Google with your ruby app.)
  spec.homepage = 'https://github.com/fluence-eu/omniauth-appcenter'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.1.0'

  spec.metadata['allowed_push_host'] = 'https://rubygems.pkg.github.com/fluence-eu'
  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/fluence-eu/omniauth-appcenter'
  spec.metadata['changelog_uri'] = 'https://github.com/fluence-eu/omniauth-appcenter/blob/main/CHANGELOG.md'
  spec.metadata['github_repo'] = 'https://github.com/fluence-eu/omniauth-appcenter'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ Gemfile .gitignore .github/ .rubocop.yml])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'omniauth-oauth2', '>= 1.2', '< 3'
end

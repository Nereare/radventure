# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = 'radventure'
  spec.version = '0.1.0.alpha'
  spec.authors = ['Igor Padoim']
  spec.email = ['igorpadoim@gmail.com']
  spec.license = 'WTFPL'

  spec.summary = 'A framework to develop text-base RPG games.'
  spec.description = 'A framework to develop text-base RPG games.'
  spec.required_ruby_version = '>= 3.3.0'

  spec.homepage = 'https://nereare.github.io/radventure/'
  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['bug_tracker_uri'] = 'https://github.com/Nereare/radventure/issues'
  spec.metadata['source_code_uri'] = 'https://github.com/Nereare/radventure'
  spec.metadata['changelog_uri'] = 'https://github.com/Nereare/radventure/blob/master/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[lib/ test/ spec/ features/ .git Gemfile])
    end
  end
  spec.require_paths = ['lib']

  # All-time dependencies
  spec.add_dependency 'rainbow', '~> 3.1'
  spec.add_dependency 'require_all', '~> 3.0'

  # Development dependencies
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rubocop', '~> 1.21'
  spec.add_development_dependency 'yard', '~> 0.9'
end

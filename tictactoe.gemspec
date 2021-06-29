# frozen_string_literal: true

require_relative 'lib/tic_tac_toe/version'

Gem::Specification.new do |spec|
  spec.name          = 'tictactoe'
  spec.version       = TicTacToe::VERSION
  spec.authors       = ['David Gasana Manzi']
  spec.email         = ['gmdavid59@gmail.com']

  spec.summary       = 'TicTacToe game using CLI.'
  spec.description   = "This gem is used to play the TicTacToe game with different languages and different game modes\n\t1.Human Vs Human\h\tHuman Vs Random Computer\n\tHuman Vs Intelligent Computer\nIt allows its users to pick who goes first to play the game."
  spec.homepage      = 'https://github.com/GASANAMDavid/TicTacToe'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 2.6.3'

  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = 'https://github.com/GASANAMDavid/TicTacToe'
  spec.metadata['source_code_uri'] = 'https://github.com/GASANAMDavid/TicTacToe'
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  spec.add_dependency 'bundler', '~> 2.2.16'
  spec.add_dependency 'dotenv', '~> 2.1', '>= 2.1.1'
  spec.add_dependency 'i18n', '~> 1.8', '>= 1.8.10'
  spec.add_dependency 'rake', '~>13.0', '>=13.0.3'
  spec.add_dependency 'rspec', '~> 3.4'
  spec.add_dependency 'rubocop', '~>1.17', '>= 1.17.0'

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end

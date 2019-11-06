lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "conecta_address_br/version"

Gem::Specification.new do |spec|
  spec.name          = "conecta_address_br"
  spec.version       = ConectaAddressBr::VERSION
  spec.authors       = ["Daniel Lessa, Eduardo Martins"]
  spec.email         = ["tecnologia@conectaai.com"]

  spec.summary       = %q{Estados e Cidades do Brasil.}
  spec.description   = %q{Responsável por relacionar localmente os estados e as cidades brasileiras.}
  spec.homepage      = "https://github.com/conectaai/address-br"
  spec.license       = "MIT"

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  # spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "https://github.com/conectaai/address-br"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
end

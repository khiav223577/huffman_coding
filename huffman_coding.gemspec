# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'huffman_coding/version'

Gem::Specification.new do |spec|
  spec.name          = 'huffman_coding'
  spec.version       = HuffmanCoding::VERSION # huffman_coding
  spec.authors       = ['khiav reoy']
  spec.email         = ['khiav223577@gmail.com']

  spec.summary       = 'A ruby gem that implements Huffman Coding.'
  spec.description   = 'A ruby gem that implements Huffman Coding.'
  spec.homepage      = 'https://github.com/khiav223577/huffman_coding'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  # if spec.respond_to?(:metadata)
  #  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #  raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject{|f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}){|f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.metadata      = {
    'homepage_uri'      => 'https://github.com/khiav223577/huffman_coding',
    'changelog_uri'     => 'https://github.com/khiav223577/huffman_coding/blob/master/CHANGELOG.md',
    'source_code_uri'   => 'https://github.com/khiav223577/huffman_coding',
    'documentation_uri' => 'https://www.rubydoc.info/gems/huffman_coding',
    'bug_tracker_uri'   => 'https://github.com/khiav223577/huffman_coding/issues',
  }

  spec.add_development_dependency 'bundler', '>= 1.17', '< 3.x'
  spec.add_development_dependency 'rake', '>= 10.5.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'backports', '~> 3.17.1'
end

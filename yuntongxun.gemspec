# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yuntongxun/version'

Gem::Specification.new do |s|
  s.name          = 'yuntongxun-api'
  s.version       = YunTongXun::VERSION
  s.date          = '2016-06-23'
  s.summary       = "Ruby SDK for 容联云通讯 development"
  s.description   = "Ruby SDK for 容联云通讯 development"
  s.authors       = ["fwshun8023"]
  s.email         = ['fwshun8023@gmai.com']
  s.homepage      = 'https://github.com/fwshun8023/yuntongxun-api'
  s.license       = 'MIT'

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_development_dependency "bundler", "~> 1.3"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency 'rspec', "~> 3.4"
end
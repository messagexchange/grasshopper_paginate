# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grasshopper_paginate/version'

Gem::Specification.new do |gem|
  gem.name          = "grasshopper_paginate"
  gem.version       = Grasshopper::Paginate::VERSION
  gem.authors       = ["JIEXIN HUANG"]
  gem.email         = ["hjx500@gmail.com"]
  gem.description   = %q{change based on foundation-will_paginate gem, use foundation style pagination and also provides a goto page input area when gap is clicked}
  gem.summary       = %q{enhanced foundation pagination with will_paginate}
  gem.homepage      = 'https://github.com/jiexinhuang/grasshopper_paginate'
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'rails', '>= 4.2.0', '< 5.0.0'
  gem.add_dependency 'foundation-rails',  '~> 5.5', '>= 5.5.0'
  gem.add_dependency 'jquery-rails', '~> 3.1'
  gem.add_dependency 'sass-rails', '~> 5.0'
  gem.add_dependency 'will_paginate', '~> 3.0'
end

require 'will_paginate/array'

class Array
  def smart_paginate(options={})
    per_page = WillPaginate.per_page
    per_page = options[:per_page].to_i if options[:per_page]
    options[:per_page] = (per_page*1.5).to_i if self.count <= per_page*1.5
    paginate options
  end
end

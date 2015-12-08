require 'will_paginate/per_page'
require 'active_record'

module Grasshopper
  module Paginate
    module ActiveRecord
      module Pagination
        def smart_paginate(options={})
          per_page = self.per_page
          per_page = options[:per_page].to_i if options[:per_page]
          options[:per_page] = (per_page*1.5).to_i if self.count <= per_page*1.5
          paginate options
        end
      end
      ::ActiveRecord::Base.extend Pagination
      ::ActiveRecord::Relation.send :include, Pagination
      ::ActiveRecord::Associations::CollectionProxy.send :include, Pagination
    end
  end
end

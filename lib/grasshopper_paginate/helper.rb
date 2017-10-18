module Grasshopper
  module Paginate
    # HACK will_paginate early exit and render nothing if total_pages of the collection object
    # is not greater than 1. Extend this module on collection to get around the check for the first time
    # and then get back to use the super total_pages from collection object
    module CollectionMethods
      def total_pages
        return super if total_entries.zero? || @_grasshopper_total_pages
        @_grasshopper_total_pages = super
        2
      end
    end

    module Helper
      def grasshopper_paginate(pages, options = {})
        pages.extend Grasshopper::Paginate::CollectionMethods
        will_paginate pages, options.merge(default_options)
      end

      private

      def default_options
        {
          inner_window: 1,
          outer_window: 0,
          renderer: Grasshopper::Paginate::Renderer,
          previous_label: '&lsaquo;'.html_safe,
          next_label: '&rsaquo;'.html_safe,
          last_label: '&raquo;'.html_safe,
          first_label: '&laquo;'.html_safe,
          enable_per_page_input: true
        }
      end
    end
  end
end

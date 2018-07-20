class Api::ApplicationController < ApplicationController
def build_meta(collection)
  {
    count: collection.count,
    total_count: collection.total_count,
    current_page: collection.current_page,
    total_pages: collection.total_pages,
    per_page: collection.limit_value
  }
end

    respond_to :json
end
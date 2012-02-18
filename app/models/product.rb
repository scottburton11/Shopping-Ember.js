# class Product < ActiveRecord::Base
#   belongs_to :designer

#   delegate :name, :to => :designer, :prefix => true

#   def designer_name=(name)
#     self.designer = Designer.find_or_create_by_name(name)
#   end

#   def price
#     price_cents/100
#   end

# end

# class Product < ActiveResource::Base
#   self.site = "http://localhost:9292"

#   def self.paginate(params = {})
#     per_page = (params[:per_page] || 20).to_i
#     page = (params[:page] || 1).to_i
#     find(:all, :params => {:per_page => per_page, :page => page})
#   end
# end


class Product
  include HTTParty
  base_uri "localhost:9292"
  format :json
  
  def self.paginate(params = {})
    per_page = (params.delete(:per_page) || 20).to_i
    page = (params.delete(:page) || 1).to_i
    get "/products", :query => {:per_page => per_page, :page => page}.merge(params)
  end
end
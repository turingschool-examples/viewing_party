class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.search(search_params)
    where('lower(user_name) LIKE :search', search: "%#{search_params}%")
  end
end

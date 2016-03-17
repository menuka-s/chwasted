class Bar < ActiveRecord::Base
  has_many :specials
  validates :name, :address, :presence => true, :uniqueness => true

end

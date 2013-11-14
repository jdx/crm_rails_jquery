class Customer < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :phone, presence: true
end

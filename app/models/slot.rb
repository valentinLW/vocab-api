class Slot < ApplicationRecord
  belongs_to :box
  has_one :user, :through => :box
end

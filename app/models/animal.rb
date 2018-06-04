class Animal < ApplicationRecord
  validates :animal, presence: true
  validates :photo, presence: true
end

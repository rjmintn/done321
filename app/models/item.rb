class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :list

  validates :name, presence: true
  validates :priority, presence: true
  validates :list, presence: true
end

class Client < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, presence: true
  has_many :children, class_name: 'Client', foreign_key: "parent_id"
  belongs_to :parent_client, class_name: 'Client', optional: true
  has_many :accounts
end

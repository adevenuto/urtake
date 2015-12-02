class Place < ActiveRecord::Base
  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks

  belongs_to :user
  validates :name, :presence => true
  validates :address, :presence => true
  validates :description, :presence => true
end

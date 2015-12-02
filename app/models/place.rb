class Place < ActiveRecord::Base
  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks

  belongs_to :user
  validates :name, :presence => true,  length: { minimum: 3 }
  validates :address, :presence => true
  validates :description, :presence => true
end

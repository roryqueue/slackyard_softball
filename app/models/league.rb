class League < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :commissioner_id

  has_many :teams
  belongs_to :commissioner, class_name: "User"

end

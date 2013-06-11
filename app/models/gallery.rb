class Gallery < ActiveRecord::Base
  has_many :pictures
  attr_accessible :name, :desc, :presimage, :activate
end

class News < ActiveRecord::Base
  has_attached_file :image, :styles => { :medium => "385x334>", :thumb => "158x117>" }
end

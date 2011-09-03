class News < ActiveRecord::Base
  #has_attached_file :image, :styles => { :medium => "385x334>", :thumb => "158x117>" }
  has_attached_file :image, :styles => { :medium => "334x385>", :thumb => "117x158" }
end

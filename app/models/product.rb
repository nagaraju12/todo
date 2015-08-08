class Product < ActiveRecord::Base


has_attached_file :photo, :styles => { :small => "200x200>" },
                  :url  => "/assets/products/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

end

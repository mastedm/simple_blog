class Setting < ActiveRecord::Base
  mount_uploader :image, ImageUploader
end

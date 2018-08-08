class Movie < ApplicationRecord
    has_one :detail
    # mount_uploader :video, VideoUploader
    # mount_uploader :image, ImageUploader
end

class Movie < ApplicationRecord
    has_one :detail
    mount_uploader :video, VideoUploader
    mount_uploaders :images, ImageUploader
end

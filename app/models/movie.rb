class Movie < ApplicationRecord
    has_one :detail
    mount_uploader :video, VideoUploader
    mount_uploaders :images, ImageUploader
    
    def self.search(thingy)
        array = thingy.split
        unless array.length > 1
            where("title LIKE ? or description LIKE ? ","%#{thingy}%","%#{thingy}%")
        else
            where("title LIKE ? or description LIKE ? or title LIKE ? or description LIKE ?","%#{thingy[0]}%","%#{thingy[1]}%","%#{thingy[1]}%","%#{thingy[0]}%")
        end
    end
end

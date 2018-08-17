class Movie < ApplicationRecord
    has_one :detail
    has_many :histories,dependent: :destroy
    validates :title,:description,:video,:images,presence:true
    mount_uploader :video, VideoUploader
    mount_uploaders :images, ImageUploader
    
    
    
    
    def self.search(thingy)
        array = thingy.split
        unless array.length > 1
            where("title ILIKE :title or description ILIKE :description or array_to_string(starring,'||') ILIKE :starring",starring:"%#{thingy}%",title:"%#{thingy}%",description:"%#{thingy}%")
        else
            where("title ILIKE :title1 or description ILIKE :description1 or array_to_string(starring,'||') ILIKE :starring1 or title ILIKE :title2 or description ILIKE :description2 or array_to_string(starring,'||') ILIKE :starring2",title1:"%#{thingy[0]}%",description1:"%#{thingy[1]}%",starring1:"%#{thingy[0]}%",
            title2:"%#{thingy[1]}%",description2:"%#{thingy[0]}%",starring2:"%#{thingy[1]}%")
        end
    end
end

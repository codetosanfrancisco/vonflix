class User < ApplicationRecord
    validates :firstname,:lastname,:password,:email, presence: true
    validates :firstname,:lastname,length: { in: 5..20 }
    validates :password,length: { in: 5..20 }
    validates :email,format: { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/,message:"Please fill in a valid email address." },uniqueness: { case_sensitive: false }
    has_secure_password
    enum role: [ :user,:admin ]
    has_one :playlist
    has_many :histories
    has_many :movies,through: :histories
    def full_name
        [firstname,lastname].join(' ')
    end
end

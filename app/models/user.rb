class User < ApplicationRecord
    
    validates :firstname,:lastname,:password,:email, presence: true
    validates :password,length: { in: 5..20 },if: Proc.new { |u| u.password.present?}
    validates :email,format: { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/,message:"Please fill in a valid email address." },
    uniqueness: { case_sensitive: false },if: Proc.new { |u| u.email.present?}
    has_secure_password
    enum role: [ :user,:admin ]
    has_one :playlist
    has_many :histories
    has_many :movies,through: :histories
    has_many :invitations
    has_many :rooms,through: :invitations
    has_many :messages
    def full_name
        [firstname,lastname].join(' ')
    end
end

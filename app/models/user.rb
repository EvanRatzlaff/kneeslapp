class User < ActiveRecord::Base
    # include ActiveModel::Validations
    has_many :materials
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, on: :create

    def slug
        username.downcase.gsub(" ","-")
    end

    def self.find_by_slug(slug)
        User.all.find {|user| user.slug == slug }
    end

end

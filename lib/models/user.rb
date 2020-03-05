class User < ActiveRecord::Base
    has_many :user_trails
    has_many :trails, through: :user_trails
    validates :name, uniqueness: {case_sensitive: false}
end
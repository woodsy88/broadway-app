class User < ApplicationRecord

  has_many :plays

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end

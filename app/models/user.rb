class User < ApplicationRecord

  has_many :plays
  has_many :reviews

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end

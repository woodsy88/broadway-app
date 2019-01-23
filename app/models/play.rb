class Play < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_attached_file :play_img, styles: { medium: "300x200>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :play_img, content_type: /\Aimage\/.*\z/           
end

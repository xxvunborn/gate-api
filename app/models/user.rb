# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  name            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_secure_password

  has_one :session
  has_many :gates

  after_create :generate_token

  # Validation
  validates :email, presence: true, allow_blank: false
  validates :password_digest, presence: true, allow_blank: false
  validates :name, presence: true, allow_blank: false

  def generate_token
    Session.create(user_id: self.id)
  end
end

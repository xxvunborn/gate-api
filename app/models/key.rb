# == Schema Information
#
# Table name: keys
#
#  id         :integer          not null, primary key
#  gate_id    :integer
#  user_id    :integer
#  name       :string           not null
#  token      :string           not null
#  expired_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Key < ApplicationRecord
  has_secure_token

  def self.generate_unique_secure_token
      SecureRandom.base58(15)
    end

  belongs_to :gate
  belongs_to :user
end

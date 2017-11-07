# == Schema Information
#
# Table name: keys
#
#  id         :integer          not null, primary key
#  gate_id    :integer
#  user_id    :integer
#  name       :string
#  token      :string
#  expired_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Key < ApplicationRecord
  has_secure_token

  belongs_to :gate
  belongs_to :user
end

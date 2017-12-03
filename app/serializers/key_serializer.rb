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

class KeySerializer < ActiveModel::Serializer
  attributes :id, :gate_id, :user_id, :name, :token, :expired_at
end

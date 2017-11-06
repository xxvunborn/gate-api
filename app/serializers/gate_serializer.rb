# == Schema Information
#
# Table name: gates
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  location   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GateSerializer < ActiveModel::Serializer
  attributes :id
end

# == Schema Information
#
# Table name: gates
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  user_id    :integer
#  location   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GateSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name, :location
end

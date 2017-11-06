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

class Gate < ApplicationRecord
  has_many :keys
  belongs_to :user
end

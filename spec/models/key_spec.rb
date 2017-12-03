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

require 'rails_helper'

RSpec.describe Key, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

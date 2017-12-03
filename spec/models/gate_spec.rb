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

require 'rails_helper'

RSpec.describe Gate, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

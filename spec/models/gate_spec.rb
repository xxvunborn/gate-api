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

require 'rails_helper'

RSpec.describe Gate, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

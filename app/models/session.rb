# == Schema Information
#
# Table name: sessions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  token      :string
#  expired_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Session < ApplicationRecord
  has_secure_token
  belongs_to :user

  def self.valid_login?(email, password)
    user = User.find_by(email: email)
    return user if user && user.authenticate(password)
  end

  def allow_token_to_be_used_only_once
    regenerate_token
    touch(:created_at)
  end

  def logout
    invalidate_token
    destroy
  end

  def self.with_unexpired_token(token, period)
    where(token: token).where('created_at >= ?', period).first
  end

  private

  def invalidate_token
    update_columns(token: nil)
    touch(:created_at)
  end
end

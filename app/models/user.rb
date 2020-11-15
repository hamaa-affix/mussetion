# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  name            :string(255)      not null
#  password_digest :string(255)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_name  (name) UNIQUE
#
class User < ApplicationRecord
  #user modelに認証の機能を持たせる
  has_secure_password
  validates :name,
      pressnce: true,
      uniquness: true,
      length: {maximum: 16},
      format: {
        with: /\A[a-z0-9]+\z/,
        message: 'は小文字英数字で入力してください'
      }
  validates :password,
      length: {minimum: 8}

end
class User < ApplicationRecord

  has_secure_password
  validates :email, {uniqueness: true, presence: true}
  validates :name, {presence: true}
  validates :sex, {presence: true}
  validates :tag, {uniqueness: true, presence: true}

  #ユーザー名による絞り込み
  scope :get_by_tag, ->(tag) {
    where("tag = ?", "#{tag}")
  }
end


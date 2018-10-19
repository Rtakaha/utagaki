class User < ApplicationRecord

  has_secure_password
  validates :email, {uniqueness: true, presence: true}
  validates :name, {presence: true}
  validates :sex, {presence: true}
  validates :userid, {uniqueness: true, presence: true}

  #ユーザー名による絞り込み
  scope :get_by_userid, ->(userid) {
    where("userid = ?", "#{userid}")
  }
end


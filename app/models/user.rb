class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, {uniqueness: true}
  validates :userid, {uniqueness: true}

  #ユーザー名による絞り込み
  scope :get_by_userid, ->(userid) {
    where("userid = ?", "#{userid}")
  }
end


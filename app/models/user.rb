class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
          uid:      auth.uid,
          provider: auth.provider,
          email:    User.dummy_email(auth),
          password: Devise.friendly_token[0, 20]
      )
    end

    user
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

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


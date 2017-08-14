class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  has_many :drafts
  has_many :user_auths

  has_one :fb_auth, ->{ fb }, class_name: 'UserAuth'

  def fb_token
    fb_auth && fb_auth.token
  end
end

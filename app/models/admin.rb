class Admin < ActiveRecord::Base
  devise :database_authenticatable, :rememberable, :trackable

  validates :username, presence: true
end

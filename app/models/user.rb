class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable, :confirmable

  self.per_page = 25

  def is_admin?
    admin? ? 'Yes' : 'No'
  end
end

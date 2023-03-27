class User < ApplicationRecord
  has_many :employees
  has_many :publications
  has_many :activities
  has_many :alumnis
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :categories, foreign_key: 'user_id', dependent: :destroy
  has_many :payments, foreign_key: 'user_id', dependent: :destroy

  validates :name, presence: true
  validates :name, length: { maximum: 100 }
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :records, dependent: :destroy

  def binary_array
		binary_string.split('').map { |byte| byte.to_i }.map { |byte| (byte - 4) }
  end 

end

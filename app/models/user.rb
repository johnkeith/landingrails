class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :init_as_admin

  private

  def init_as_admin
    if User.count == 1
      User.first.update role: "admin"
    end
  end
end

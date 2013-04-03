class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :accounts, :dependent => :destroy
  has_many :rules, :through => :accounts, :dependent => :destroy
  has_many :transactions, :through => :accounts, :dependent => :destroy
end

class Account < ActiveRecord::Base
  belongs_to :user
  has_many :transactions, :dependent => :destroy
  has_many :rules, :dependent => :destroy
end

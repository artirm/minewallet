class Account < ActiveRecord::Base
  belongs_to :user
  has_many :transactions
  has_many :rules
end
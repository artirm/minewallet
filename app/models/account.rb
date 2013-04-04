class Account < ActiveRecord::Base
  belongs_to :user
  has_many :transactions, :dependent => :destroy
  has_many :rules, :dependent => :destroy

  validates :title, :length => { :minimum => 3, :maximum=>15 }, :uniqueness => true
  validates :currency, :length => { :minimum => 2, :maximum=>4 }
  validates_numericality_of :balance, :greater_than => 0
end

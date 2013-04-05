class Rule < Storage
  belongs_to :account

  validates :title, :length => { :minimum => 3, :maximum=>35 }, :uniqueness => true
  validates :account_id, :presence => true
  validates_inclusion_of :kind, :in => [0,1]
  validates :tags, :length => { :minimum => 2, :maximum=>25 }, :unless => "tags.blank?"
  validates_numericality_of :amount, :greater_than => 0
  validates :description, :length => {  :maximum=>256 }
end

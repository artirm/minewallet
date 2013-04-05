class Transaction < Storage
  belongs_to :account

  validates :account_id, :presence => true
  validates_inclusion_of :kind, :in => [0,1]
  validates :tags, :length => { :minimum => 2, :maximum=>25 }, :unless => "tags.blank?"
  validates_numericality_of :amount, :greater_than => 0
  validates :description, :length => {  :maximum=>256 }

  def update_allowed
    (Time.now - created_at).round < 30
  end
end

class Transaction < Storage
  belongs_to :account

  def update_allowed
    (Time.now - created_at).round < 30
  end
end

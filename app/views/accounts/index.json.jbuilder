json.array!(@accounts) do |account|
  json.extract! account, :user_id, :title, :currency, :balance
  json.url account_url(account, format: :json)
end
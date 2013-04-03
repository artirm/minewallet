module AccountsHelper
  def new_account_link
    link_to(new_account_path,  :class=>"btn btn-large btn-success") do
        content_tag(:i, "", :class => "") + t("accounts.new.title")
    end
  end

  def delete_account_link(account)
    link_to(account, method: :delete, data: { confirm: 'Are you sure?', :class=>"confirm" }, :class=>"btn btn-mini btn-danger delete") do
        content_tag(:i, "", :class => "icon-trash icon-white") + t("accounts.destroy")
    end
  end

  def edit_account_link(account)
      link_to(edit_account_path(account), :class=>"btn btn-mini btn-success") do
        content_tag(:i, "", :class => "icon-edit icon-white") + t("account.edit")
      end
  end
end

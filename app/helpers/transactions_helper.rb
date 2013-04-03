module TransactionsHelper

  def kind_title(transaction)
    if transaction.kind.to_i == 1
      content_tag(:span, t("transactions.income"), :class =>"label success")
    else
      content_tag(:span, t("transactions.expense"), :class=>"label important")
    end
  end

  def new_transaction_link(transaction)
    link_to(new_transaction_path(transaction),  :class=>"btn btn-mini btn-danger") do
        content_tag(:i, "", :class => "icon-plus icon-white") + t("transactions.new.title")
    end
  end

  def delete_transaction_link(transaction)
    link_to(transaction_path(transaction), method: :delete, data: { confirm: 'Are you sure?', :class=>"confirm" }, :class=>"btn btn-mini btn-danger delete pull-right") do
        content_tag(:i, "", :class => "icon-trash icon-white") + t("transactions.destroy")
    end
  end

  def edit_transaction_link(transaction)
    if transaction.update_allowed
      link_to(edit_transaction_path(transaction), :class=>"btn btn-mini btn-success") do
        content_tag(:i, "", :class => "icon-edit icon-white") + t("transactions.edit.title")
      end
    end
  end

  def options(transaction=nil, account=nil)
    if transaction.account_id
      options_from_collection_for_select(current_user.accounts.all, :id, :title, :selected=>transaction.account_id)
    else
      options_from_collection_for_select(current_user.accounts.all, :id, :title, :selected => params[:account_id])
    end
  end

  def menu_transaction_link
    content = []
    content <<   "<li class=\"dropdown\" id=\"menu1\">
                <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#menu1\">"
                + t('.transactions') +
                  "<b class=\"caret\"></b></a>
                  <ul class=\"dropdown-menu\">
                    <li>"
                + link_to(t('.transactions_path'), transactions_path) +
                  "</a></li>
                    <li>"
                +link_to( t('.new_transaction_path'), new_transaction_path) +
                  "</a></li>"

  end
end

module ApplicationHelper
  def menu
     content = []
     content <<   "<li class=\"dropdown\" id=\"menu1\">
                <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#menu1\">"
                  "<b class=\"caret\"></b></a>
                  <ul class=\"dropdown-menu\">
                    <li>"
                + link_to("OK", transactions_url) +
                  "</a></li>
                    <li>"
                +link_to( t('.new_transaction_path'), new_transaction_path) +
                  "</a></li>
                    <li class=\"divider\"></li>
                    <li>"
                + link_to( t('.rules_path'), rules_path) +
                  "</a></li>
                    <li>"
                +link_to( t('.new_rule_path'), new_rule_path)+ "</a></li>
                  </ul>
                </li>"

  end
end

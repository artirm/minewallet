module ApplicationHelper
<<<<<<< HEAD
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

=======
  def error_messages!
    #return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t('errors.messages.not_saved', count: resource.errors.count, resource: resource.class.model_name.human.downcase)

    html = <<-HTML
            <div class="alert alert-error alert-block">
              <button type="button" class="close" data-dismiss="alert">x</button>
              <h4>#{sentence}</h4>
              #{messages}
            </div>
            HTML

    html.html_safe
>>>>>>> deployonheroku
  end
end

module RulesHelper
  def kind_title(rule)
    if rule.kind.to_i == 1
      content_tag(:span, t("transactions.income"), :class =>"label success")
    else
      content_tag(:span, t("transactions.expense"), :class=>"label important")
    end
  end
end

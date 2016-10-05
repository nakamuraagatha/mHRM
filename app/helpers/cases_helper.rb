module CasesHelper
  def show_relation_path(relation)
    if relation.relation.is_a?(Survey::Survey)
       link_to(relation.relation, surveys_path(relation.relation) )
    else
      link_to(relation.relation, relation.relation )
    end
  end
end

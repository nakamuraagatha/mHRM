class CaseRelation < ApplicationRecord
  belongs_to :case

  validates_presence_of :relation_id

  def relation
    case relation_type
      when 'Survey' then Survey::Survey.find(relation_id)
      when 'Task' then Task.find(relation_id)
      when 'Case' then Case.find(relation_id )
      else
    end
  rescue ActiveRecord::RecordNotFound
    nil
  end
end

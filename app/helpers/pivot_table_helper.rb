module PivotTableHelper
  def render_pivot_information(table)
    case table
      when 'affiliation' then render_affiliation
      when 'clearance' then render_clearance
      when 'certification' then render_certification
      when 'contact' then render_contact
      when 'education' then render_education
      when 'language' then render_language
      when 'document' then render_document
      when 'position' then render_position
      when 'task' then render_task
      when 'checklist' then render_checklist
      else
        render_user
    end

  end

  def render_user
   CoreDemographic.includes(:user, :gender_type, :religion_type, :ethnicity_type, :citizenship_type).
       references(:user, :gender_type, :religion_type, :ethnicity_type, :citizenship_type).map do |object|
     {
         user: object.user,
         first_name: object.first_name,
         last_name: object.last_name,
         ethnicity: object.ethnicity_type,
         citizenship: object.citizenship_type,
         gender: object.gender_type,
         religion: object.religion_type,


     }
   end
  end

  def render_position
    Position.includes(:user, :department).
        references(:user, :department).map do |position|
      {
          user: position.user,
          department: position.department,
          salary: position.salary,
          pay_rate: position.pay_rate_type,
          location: position.location_type,
          employment_type: position.employment_type

      }
    end
  end

  def render_checklist

  end

  def render_document
    Document.includes(:user, :document_type).
        references(:user, :document_type).map do |document|
      {
          user: document.user,
          document_type: document.document_type,
          title: document.title

      }
    end
  end

  def render_language
    Language.includes(:user, :language_type, :proficiency_type).
        references(:user, :language_type, :proficiency_type).map do |lang|
      {
          user: lang.user,
          language_type: lang.language_type,
          proficiency: lang.proficiency_type

      }
    end
  end

  def render_affiliation
    Affiliation.includes(:user, :affiliation_type).
        references(:user, :affiliation_type).map do |affiliation|
      {
          user: affiliation.user,
          name: affiliation.name,
          affiliation_type: affiliation.affiliation_type

      }
    end
  end

  def render_clearance
    Clearance.includes(:user, :clearence_type).
        references(:user, :clearence_type).map do |clearance|
      {
          user: clearance.user,
          date_received: clearance.date_received,
          date_expired: clearance.date_expired,
          clearance_type: clearance.clearence_type

      }
    end
  end

  def render_certification
    Certification.includes(:user, :certification_type).
        references(:user, :certification_type).map do |object|
      {
          user: object.user,
          date_received: object.date_received,
          date_expired: object.date_expired,
          certification_type: object.certification_type
      }
    end
  end

  def render_contact

  end

  def render_education
    Education.includes(:user, :education_type).
        references(:user, :education_type).all.map do |object|
      {
          user: object.user.to_s,
          date_recieved: object.date_recieved.to_s,
          date_expired: object.date_expired.to_s,
          education_type: object.education_type
      }
    end
  end



  def render_task
    Task.includes(:assigned_to, :for_individual).references(:assigned_to, :for_individual).all.map do |task|
      {
          user: task.assigned_to,
          task_type: task.task_type,
          priority_type: task.priority_type,
          for_individual: task.for_individual,
          date_start: task.date_start,
          date_due: task.date_due,
          date_completed: task.date_completed
      }
    end
  end
end

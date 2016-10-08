class AttemptsController < ApplicationController

  helper 'surveys'

  before_filter :load_active_survey, only: [:new, :create, :index]
  before_filter :normalize_attempts_data, :only => :create

  def index
    if params[:case_id]
      @attempts = @survey.attempts.where(participant_type: 'Case', participant_id: params[:case_id])
    else
      @attempts = @survey.attempts.where(participant_type: 'User', participant_id: User.current)
    end

  end

  def new
    if params[:c] == 'cases'
      c = Case.find(params[:case_id])
      @participant = c # you have to decide what to do here
    else
      @participant = User.current # you have to decide what to do here
    end


    unless @survey.nil?
      @attempt = @survey.attempts.new
      @attempt.answers.build
    end
  end

  def create
    @attempt = @survey.attempts.new(attempt_params)
    if params[:case_id]
      @attempt.participant =  Case.find(params[:case_id])
    else
      @attempt.participant =  User.current
    end


    if @attempt.valid? && @attempt.save
      redirect_to view_context.new_attempt(survey_id: @survey.id), alert: I18n.t("attempts_controller.#{action_name}")
    else
      render :action => :new
    end
  end

  def show

  end

  private

  def load_active_survey
    @survey =  Survey::Survey.find(params[:survey_id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  def normalize_attempts_data
    normalize_data!(params[:survey_attempt][:answers_attributes])
  end

  def normalize_data!(hash)
    multiple_answers = []
    last_key = hash.keys.last.to_i

    hash.keys.each do |k|
      if hash[k]['option_id'].is_a?(Array)
        if hash[k]['option_id'].size == 1
          hash[k]['option_id'] = hash[k]['option_id'][0]
          next
        else
          multiple_answers <<  k if hash[k]['option_id'].size > 1
        end
      end
    end

    multiple_answers.each do |k|
      hash[k]['option_id'][1..-1].each do |o|
        last_key += 1
        hash[last_key.to_s] = hash[k].merge('option_id' => o)
      end
      hash[k]['option_id'] = hash[k]['option_id'].first
    end
  end

  def attempt_params
    rails4? or rails5? ? params_whitelist : params[:survey_attempt]
  end

  def params_whitelist
    params.require(:survey_attempt).permit(Survey::Attempt::AccessibleAttributes)
  end
end

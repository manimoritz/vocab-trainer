class FormsController < ApplicationController
  def create_bulk
    verb = Verb.find(params[:verb_id])

    params[:forms].each_value do |form_attrs|
      Form.create_or_update!(form_attrs.permit(:text, :person, :number, :tense, :voice, :mood).merge(verb_id: verb.id))
    end
    redirect_to new_verb_path, status: :success
  rescue StandardError => e
    redirect_to new_verb_path, locals: { success: true }, status: :unprocessable_entity
  end
end

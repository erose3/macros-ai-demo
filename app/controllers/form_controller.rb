class FormController < ApplicationController
  def blank
    render ({ :template => "form_templates/blank"})
  end

end

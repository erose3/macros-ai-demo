class FormController < ApplicationController
  def blank
    render ({ :template => "form_templates/blank"})
  end

  def result
    @image = params.fetch("image_param")
    @description = params.fetch("description_param")

    render ({ :template => "form_templates/result"})
  end

end

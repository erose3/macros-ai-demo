class FormController < ApplicationController
  def blank
    render ({ :template => "form_templates/blank"})
  end

  def result
    @image = params.fetch("image_param", nil)
    @description = params.fetch("description_param")

    render ({ :template => "form_templates/result"})
  end

end

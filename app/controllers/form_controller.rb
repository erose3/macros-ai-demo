class FormController < ApplicationController
  def blank
    render ({ :template => "form_templates/blank"})
  end

  def result
    @image = params.fetch("image_param", nil)
    @description = params.fetch("description_param")

    c = OpenAI::Chat.new
    c.system("You are a nutritionist")
    c.schema = '{
      "name": "nutrition_info",
      "schema": {
        "type": "object",
        "properties": {
          "calories": {
            "type": "number",
            "description": "The total number of calories in the food item."
          },
          "protein": {
            "type": "number",
            "description": "The amount of protein in grams."
          },
          "sugar": {
            "type": "number",
            "description": "The amount of sugar in grams."
          },
          "fat": {
            "type": "number",
            "description": "The amount of fat in grams."
          }
        },
        "required": [
          "calories",
          "protein",
          "sugar",
          "fat"
        ],
        "additionalProperties": false
      },
      "strict": true
    }'
    c.user(@description)
    @structured_output= c.assistant!
    c.assistant!

    @calories = @structured_output.fetch("calories")
    @protein = @structured_output.fetch("protein")
    @sugar = @structured_output.fetch("sugar")
    @fat = @structured_output.fetch("fat")

    render ({ :template => "form_templates/result"})
  end

end

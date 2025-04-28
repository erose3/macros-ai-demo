Rails.application.routes.draw do


  # Solutions below. Don't peek until you try it yourself and get stuck!

  get("/blank_form", { :controller => "form", :action => "blank"})

  post("/blank_form/result", { :controller => "form", :action => "result"})

  get("/solutions/blank_form", { :controller => "solutions", :action => "display_form" })
  
  post("/solutions/process_form", { :controller => "solutions", :action => "process_inputs" })
  
end

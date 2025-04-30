class DirectorsController < ApplicationController

def index
  render({ :template => "director_templates/list"})
end

def junior
  @the_youngest_director = Director.maximum( :dob )
  @name_instance = Director.where({ :dob => @the_youngest_director})
  @dob_format = @the_youngest_director.strftime("%B %e, %Y")
  @youngest_name = @name_instance.at(0)
  render({ :template => "director_templates/youngest"})
end

def senior
  @the_eldest_director = Director.minimum( :dob )
  @name_instance = Director.where({ :dob => @the_eldest_director})
  @dob_format = @the_eldest_director.strftime("%B %e, %Y")
  @eldest_name = @name_instance.at(0)
  render({ :template => "director_templates/eldest"})
end

def show
  the_id = params.fetch("the_id")

  matching_records = Director.where({ :id => the_id})

 @the_director = matching_records.at(0)

  render({ :template => "director_templates/details"})
end
end

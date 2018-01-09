class Recipe < ApplicationRecord
  belongs_to :user
  # this is a place where we will be making instance methods
  # this is where ALL the methods for the recipe class go
  def as_json
    {
      id: id,
      title: title,
      chef: chef,
      ingredients: ingredients_list,
      directions: directions_list,
      updated_at: day_month_date,
      prep_time: prep_time_hrs_min,
      image: image
    }
  end

  def directions_list
    directions.split(", ")
  end

  def ingredients_list
    ingredients.split(", ")
  end

  def day_month_date
    updated_at.strftime("%A, %b %d")
  end

  def prep_time_hrs_min
    hours = prep_time / 60
    minutes = prep_time % 60
    result = ""
    if hours > 0
      result += "#{hours} hours "
    end
    if minutes > 0
      result += "#{minutes} minutes"
    end
    result
  end
end

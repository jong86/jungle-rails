module ApplicationHelper
  def display_stars(rating)
    output = ''
    orig_rating = rating
    for i in 1..rating.floor do
      output += '<i class="fa fa-star" aria-hidden="true"></i>'
    end
    decimal = rating - rating.floor
    if decimal >= 0.5 then
      output += '<i class="fa fa-star-half-o" aria-hidden="true"></i>'
    end
    for i in 1..(5 - rating.round) do
      output += '<i class="fa fa-star-o" aria-hidden="true"></i>'
    end
    output.html_safe
  end
end

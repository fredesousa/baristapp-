module ApplicationHelper
  def star_rating(rating)
    full_star = '<i class="fa-solid fa-star" style="color: #ffdd57;"></i>'
    empty_star = '<i class="fa-solid fa-star" style="color: #d3d3d3;"></i>'
    
    (full_star * rating + empty_star * (5 - rating)).html_safe
  end
end

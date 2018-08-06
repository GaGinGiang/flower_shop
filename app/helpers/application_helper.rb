module ApplicationHelper
  def full_title page_title = ""
    base_title = t :base_title
    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def total_cart products
    total = 0
    products.each do |product,quantity|
      total += product.price*quantity
    end
    total
  end
end

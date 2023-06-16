module InvoicesHelper
  def calculate_total(cart)
    total = 0
    cart.each do |item|
      book = Book.find(item["book_id"])
      discounted_price = book.display_price[:discount]
      total += discounted_price * item["quantity"]
    end
    total
  end
end
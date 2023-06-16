class InvoicesController < ApplicationController
  def add_to_cart
    book_id = params[:book_id]
    cart = get_cart_from_cookie || []
    existing_item = cart.find { |item| item["book_id"] == book_id }

    if existing_item
      existing_item["quantity"] += 1
    else
      cart << { "book_id" => book_id, "quantity" => 1 }
    end

    set_cart_cookie(cart)
    redirect_to request.referrer
  end

  def cart
    @cart = get_cart_from_cookie || []
  end

  def remove_item
    book_id = params[:book_id]
    @cart = get_cart_from_cookie || []
    @cart.delete_if { |item| item["book_id"] == book_id }
    set_cart_cookie(@cart)

    respond_to do |format|
      format.json { render json: { success: true } }
      format.html { redirect_to request.referrer }
      format.any { head :unsupported_media_type }
    end
  end

  def add_quantity
    book_id = params[:book_id]
    @cart = get_cart_from_cookie || []
    item = @cart.find { |item| item["book_id"] == book_id }

    if item
      item["quantity"] += 1
      set_cart_cookie(@cart)
    end

    redirect_to cart_path
  end

  def reduce_quantity
    book_id = params[:book_id]
    @cart = get_cart_from_cookie || []
    item = @cart.find { |item| item["book_id"] == book_id }

    if item && item["quantity"] > 1
      item["quantity"] -= 1
      set_cart_cookie(@cart)
    elsif item
      @cart.delete(item)
      set_cart_cookie(@cart)
    end

    redirect_to cart_path
  end

  private

  def get_cart_from_cookie
    JSON.parse(cookies[:cart]) if cookies[:cart]
  end

  def set_cart_cookie(cart)
    cookies[:cart] = JSON.generate(cart)
  end
end

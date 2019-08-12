def consolidate_cart(cart)
  consolidated_cart = {}
  cart.each do |memo|
    k,v = memo.first
    if consolidated_cart[k]
        consolidated_cart[k][:count] += 1
    else
      consolidated_cart[k] = {
        :price => v[:price],
        :clearance => v[:clearance],
        :count => 1
      }
    end
  end
  consolidated_cart
end

def apply_coupons(cart, coupons)
  coupons.each do |memo| 
   if cart.keys.any? memo[:item]
     if cart[memo[:item]][:count] >= memo[:num]
       new_item = "#{memo[:item]} W/COUPON"
       if cart[new_item]
          cart[new_item][:count] += memo[:num]
        else
            cart[new_item] = {
            count: memo[:num],
            price: memo[:cost]/memo[:num],
            clearance: cart[memo[:item]][:clearance]
       }
        end
        cart[memo[:item]][:count]-=memo[:num]
      end
    end
  end
  cart
end

def apply_clearance(cart)
  cart.keys.each do |memo|
    if cart[memo][:clearance]
      cart[memo][:price] = 0.8*cart[memo][:price]
      cart[memo][:price].round(2)
    end
  end
end

def checkout(cart, coupons)
  # code here
end

def find_item_by_name_in_collection(name, collection)

row_index = 0
while row_index < collection.length

if collection[row_index][:item] == name
result = collection[row_index]
end

row_index += 1  
end
result
end


def consolidate_cart(cart)

row_index = 0
new_array = []

while row_index < cart.length do

new_array << cart[row_index]
cart[row_index][:count] = 1  #<== adds count, sets count to 1


if new_array[row_index][:item] == "AVOCADO" ### finds unique item & adds 1 to count
  new_array[row_index][:count] += 1

else if new_array[row_index][:item] == "CHEESE" ### finds unique item & 
   new_array[row_index][:count] += 1
  
  

else if new_array[row_index][:item] == "BEER" ### finds unique item & adds 1 to count
  new_array[row_index][:count] += 1
      end
    end
  end


row_index += 1  
end
new_array
end


def apply_coupons(cart, coupons)
row_index = 0  
new_array = [] 


### Got - cheese x2, avocado w/ coupon x2, avocado x0 
### start w/ - cheese x4, avocado x3
### expect - cheese x1, cheese w/ coupon x3, avocado x1, avocado w/ coupon x2 
### lost - cheese x2, avocado x1
### iterates 7 times


while row_index < cart.length

food_hash = cart[row_index] 

if food_hash[:item] == "AVOCADO" && food_hash[:count] >= 2

coupon_hash = {:item => "#{food_hash[:item]} W/COUPON", :price => 2.50, :clearance => true, :count => 2}
food_hash[:count] -= 2                    
new_array << coupon_hash                            



else if food_hash[:item] == "BEER" && food_hash[:count] >= 2

coupon_hash = {:item => "#{food_hash[:item]} W/COUPON", :price => 10.00, :clearance => false, :count => 2}
food_hash[:count] -= 2                    
new_array << coupon_hash                            
new_array << food_hash  


else if food_hash[:item] == "CHEESE" && food_hash[:count] >= 3
coupon_hash = {:item => "#{food_hash[:item]} W/COUPON", :price => 5.00, :clearance => false, :count => 3}
food_hash = consolidate_cart(food_hash)
food_hash[:count] -= 3                    
new_array << coupon_hash                            


else if food_hash
new_array << food_hash
      end
    end
  end
end

  row_index += 1
end
pp new_array
end


def apply_clearance(cart)
 
row_index = 0

while row_index < cart.length do

if cart[row_index][:clearance] == true

discount = cart[row_index][:price] * 0.20
cart[row_index][:price] -= discount.round(2)

end
result = cart
  row_index += 1
end
result
end



def checkout(cart, coupons)

c_cart = consolidate_cart(cart)
coupon_cart = apply_coupons(c_cart, coupons)
clearance_cart = apply_clearance(coupon_cart)
row_index = 0
cart


row_index = 0
while row_index < cart.length do
grand_total = 0
grand_total += clearance_cart[row_index][:price] * clearance_cart[row_index][:count]


  row_index +=1
end

if grand_total > 100
  grand_total = grand_total.round(2) * 0.90
end

grand_total
end


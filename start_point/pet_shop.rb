def pet_shop_name(shop)
  return shop[:name]
end

def total_cash(shop)
  return shop[:admin][:total_cash]
end

def add_or_remove_cash(shop, amount)
  shop[:admin][:total_cash] += amount
end

def pets_sold(shop)
  return shop[:admin][:pets_sold]
end

def increase_pets_sold(shop, increase)
  shop[:admin][:pets_sold] += increase
end

def stock_count(shop)
  return shop[:pets].length
end

def pets_by_breed(shop, breedname)
  pets_found = []
  for pet in shop[:pets]
    if pet[:breed] == breedname
      pets_found.push(pet)
    end
  end
  return pets_found
end

def find_pet_by_name(shop, petname)
  for pet in shop[:pets]
    if pet[:name] == petname
      return pet
    end
  end
  #404: Pet not found!
  return nil
end

def remove_pet_by_name(shop, petname)
  for pet in shop[:pets]
    if pet[:name] == petname
      shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(shop, newpet)
  shop[:pets].push(newpet)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  customer[:cash]-=amount
end

def customer_pet_count(customer)
  return customer[:pets].length
end

def add_pet_to_customer(customer, pet)
  customer[:pets].push(pet)
end

def customer_can_afford_pet(customer, pet)
  return customer_cash(customer) >= pet[:price]
end

def sell_pet_to_customer(shop, pet, customer)
  if pet != nil
    if customer_can_afford_pet(customer, pet)
      # Step 1: Take customer money
      remove_customer_cash(customer, pet[:price])

      # Step 2: Add to shop money
      add_or_remove_cash(shop, pet[:price])

      # Step 3: Add pet to customer array
      add_pet_to_customer(customer, pet)

      # Step 4: Remove pet from shop array
      remove_pet_by_name(shop, pet[:name])

      # Step 5: Increment pets sold
      increase_pets_sold(shop, 1)
    end
  end

end

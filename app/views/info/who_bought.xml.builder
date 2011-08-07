xml.order_list(:for_product => @product.title) do 
  for o in @orders
    xml.order do
      xml.name(o.name)
      xml.email(0.email)
    end
  end
end


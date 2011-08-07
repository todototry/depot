class InfoController < ApplicationController
  def who_bought
    
    @product = Product.find(params[:id])
    
    @orders = Order.find(:all, LineItem.find_by_product_id(@product.id).order_id)

    respond_to do |format|
      format.html
      format.xml {render :layout => false,:xml => @product.to_xml(:include => :orders)}
      format.atom {render :layout => false}  
      format.json {
        render :layout =>false, :json =>  @product.to_json(:include => :orders)
      }  
    end

  end

  protected
  def authorize

  end


end

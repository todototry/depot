class AddTestData < ActiveRecord::Migration
  def self.up
    Product.delete_all
    Product.create(
      :title => 'this is google',
      :description =>'<ul>
        <li>Create a Rails application</li>
        <li>Generate models, controllers, database migrations, and unit tests</li>
       <li>Start a development server</li>
       <li>Mess with objects through an interactive shell</li>
       <li>Profile and benchmark your new creation</li>
       </ul>',
     :image_url => 'http://www.google.com.hk/images/nav_logo83.png',
     :price =>23.50
    )

  end

  def self.down
  Product.delete_all
  end
end

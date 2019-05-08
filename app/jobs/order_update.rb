require Rails.root.join('app', 'helpers','resque_helper.rb')

class OrderUpdate
  extend ResqueHelper
  puts "MADE IT in resque"
  @queue = :order_update

  def self.perform(params)
    ActiveRecord::Base.clear_active_connections!
    puts "inside perform"
    recharge_token = params[:recharge_token]
    @recharge_change_header = {
      'X-Recharge-Access-Token' => recharge_token,
      'Accept' => 'application/json',
      'Content-Type' => 'application/json'
    }
    my_order_id = params[:order_id]
    new_line_items = format_params(params)
    item_array = []
    formatted_line_item = {
      "properties" => new_line_items['properties'],
      "quantity" => new_line_items['quantity'].to_i,
      "sku" => new_line_items['sku'],
      "title" => new_line_items['title'],
      "variant_title" => new_line_items['variant_title'],
      "product_id" => new_line_items['shopify_product_id'].to_i,
      "variant_id" => new_line_items['shopify_variant_id'].to_i,
      "subscription_id" => new_line_items['subscription_id'].to_i,
    }

    item_array.push(formatted_line_item)
    my_hash = { "line_items" => item_array }
    body = my_hash.to_json
    my_details = { "properties" => item_array }

    # When updating line_items, you need to provide all the data that was in
    # line_items before, otherwise only new parameters will remain! (from Recharge docs)
    recharge_response = HTTParty.put("https://api.rechargeapps.com/orders/#{my_order_id}", :headers => @recharge_change_header, :body => body, :timeout => 80)
  end
end

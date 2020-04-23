# Default admin
admin = User.create!(
  email: 'devnull+admin@csp.com',
  password: 'password',
  password_confirmation: 'password',
  admin: true,
  first_name: 'jhon',
  last_name: 'doe',
  confirmed_at: Time.now
)

# Customer samples
10.times.each do |i|
  Customer.create(
    email: "customer#{i+1}@csp.com",
    shopify_customer_id: '99999',
    first_name: "Customer #{i+1}",
    last_name: 'CSP',
    has_card_error_in_dunning: false,
    number_subscriptions: 1,
    number_active_subscriptions: 1,
    first_charge_processed_at: Time.now - i.days,
    status: 'QUEUED'
  )
end

# User samples
10.times.each do |i|
  User.create(
    email: "user#{i+1}@csp.com",
    admin: false,
    first_name: "USER #{i+1}",
    last_name: 'CSP',
    password: 12345678,
    password_confirmation: 12345678,
    confirmed_at: Time.now
  )
end

# Address sample
Address.create(
  customer_id: 12,
  address1: 'address1',
  address2: 'address2',
  city: 'city',
  province: 'province',
  country: 'country',
  first_name: 'first_name',
  last_name: 'last_name',
  zip: 'zip',
  company: 'company',
  phone: 'phone',
  cart_note: 'cart_note',
  note_attributes: {},
  shipping_lines_override: {},
  discount_id: 123453
)

# Order sample
Order.create(
  customer_id: 12,
  address_id: 1,
  charge_id: 298233483,
  transaction_id: '823429120',
  shopify_order_id: '147826344',
  shopify_order_number: '102381923',
  scheduled_at: DateTime.now,
  processed_at: DateTime.now + 1.day,
  status: 'QUEUED',
  order_type: 'order_type',
  first_name: 'first_name',
  last_name: 'last_name',
  email: 'email',
  payment_processor: 'payment_processor',
  is_prepaid: 1,
  line_items: [
    {
      "title" => "3 Months - 3 Items",
      "images" => { "small" => "https://cdn.shopify.com/s/files/1/1565/8379/products/ellie-box_small.jpg" },
      "quantity" => 5,
      "subscription_id" => 1,
      "properties" => [
        { "key" => "leggings", "value" => "S" },
        { "key" => "sports-bra", "value" => "M" },
        { "key" => "tops", "value" => "S" },
        { "key" => "product_collection", "value" => "Blue Skies - 3 Items" }
      ]
    }
  ],
  shipping_address: {},
  total_price: 10,
  billing_address: {}
)

# Subscription sample
Subscription.create(
  address_id: 1,
  customer_id: 12,
  next_charge_scheduled_at: DateTime.now + 1.month,
  product_title: 'Blue Skies - 3 Items',
  variant_title: 'Blue Skies - 3 Items',
  price: 10,
  quantity: 100,
  status: 'QUEUED',
  shopify_variant_id: 2209786292001,
  shopify_product_id: 2209786298426,
  recharge_product_id: 2209786292002,
  sku: '12343458783',
  sku_override: '123434587831',
  order_interval_unit: 'order_interval_unit',
  order_interval_frequency: 3,
  charge_interval_frequency: 3,
  order_day_of_month: 30,
  order_day_of_week: 2,
  properties: {},
  expire_after_specific_number_of_charges: 4,
  cancellation_reason: '',
  cancellation_reason_comments: '',
  max_retries_reached: 3,
  has_queued_charges: 1
)

# OrderLineItem sample
OrderLineItem.create(
  order_id: 1,
  subscription_id: 1,
  grams: 2,
  price: 10,
  quantity: 100,
  shopify_product_id: 2209786298426,
  shopify_variant_id: 2209786292001,
  properties: { 'leggings': 'S', 'sports-bra': 'M', 'tops': 'S', 'sports-jacket': 'S' },
  product_title: 'Blue Skies - 3 Items',
  vendor: 'vendor',
  sku: '12343458783',
  variant_title: 'Blue Skies - 3 Items'
)

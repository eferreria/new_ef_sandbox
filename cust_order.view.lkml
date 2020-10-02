include: "//dev_thecompany/orders.view"

# explore: orders {}

explore: lc_orders {
  hidden: yes
}

view: lc_orders {
  extends: [orders]

  dimension: id {
    label: "Order ID"
  }


}

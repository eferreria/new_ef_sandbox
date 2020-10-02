view: test_cohort {
  derived_table: {
    sql:
    select distinct user_id from order_items
    left join users on users.id = order_items.user_id
    left join inventory_items on order_items.inventory_item_id = inventory_items.id
    left join products on products.id = inventory_items.product_id
    where {% condition cohort_city %} users.city {% endcondition %}
    and {% condition cohort_brand %} products.brand {% endcondition %}
    ;;
  }

  dimension: user_id {
    type: number
    hidden: yes
  }

  filter: cohort_city {
    type: string
    suggest_dimension: users.city
  }

  filter: cohort_brand {
    type: string
    suggest_dimension: products.brand
  }

  dimension: selected_cohort_brand {
    type: string
    sql: case when {% condition cohort_brand %} products.brand {% endcondition %}
    then ${products.brand} else 'All Other Brands' end
    ;;
  }

  dimension: selected_cohort_city {
    type: string
    sql: case when {% condition cohort_city %} users.city {% endcondition %}
      then ${users.city} else 'All Other Cities' end;;
  }

 }

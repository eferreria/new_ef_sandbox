view: order_items_with_users_dt {
  derived_table: {
    sql:
    SELECT
    order_items.user_id  AS order_items_user_id,
    order_items.status  AS order_items_status,
    u.first_name,
    u.last_name,
    u.email,
    COUNT(DISTINCT order_items.order_id ) AS order_items_total_orders,
    COALESCE(SUM(order_items.sale_price ), 0) AS order_items_total_sales
FROM `looker-private-demo.ecomm.order_items`
     AS order_items
JOIN ${users_test.SQL_TABLE_NAME} u on order_items.user_id = u.id

GROUP BY
    1,
    2,
    3,4,5
ORDER BY
    3 DESC
    ;;
  }
  dimension: order_items_user_id {}
  dimension: order_items_status {}
  dimension: first_name {}
  dimension: last_name {}
  dimension: email {}

  parameter: state_param {
    suggest_explore: users
    suggest_dimension: users.state
  }
}

# https://104.197.121.2:9999/sql/j2pmqzvnymgjdn
# https://104.197.121.2:9999/sql/pwp3gwrqhxmjc6

view: users_test {
  derived_table: {
    sql:
    select * from ${users.SQL_TABLE_NAME} u
    join ${city_state.SQL_TABLE_NAME} cs ON u.state = cs.state
    ;;
  }
}



view: order_items_with_users_base_id {
  derived_table: {
    sql: select distinct order_items_user_id, order_items_status,
          first_name,
          last_name,
          email from  ${order_items_with_users_dt.SQL_TABLE_NAME};;
  }

  dimension: order_items_user_id {
    primary_key: yes
  }
  dimension: order_items_status {}
  dimension: first_name {}
  dimension: last_name {}
  dimension: email {}
}


explore: order_items_with_users_base_id {

  join: order_items_with_users_dt {
    type: inner
    relationship: one_to_many
    sql:  left join ${order_items_with_users_dt.SQL_TABLE_NAME} order_items_with_users_dt
          ON order_items_with_users_dt.order_items_user_id = ${order_items_with_users_base_id.order_items_user_id}
          and order_items_with_users_base_id.order_items_status = order_items_with_users_dt.order_items_status
          ;;
  }
}

view: city_state {
  derived_table: {
    sql:
    select city, state from ${users.SQL_TABLE_NAME}
    where state =  {{order_items_with_users_dt.state_param._parameter_value }}
    ;;
  }
}

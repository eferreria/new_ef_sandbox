view: inventory_items {
  sql_table_name: public.inventory_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
    skip_drill_filter: no
    drill_fields: [created_year, created_quarter, created_month, created_week, created_date]
  }

  dimension: product_brand {
    type: string
    sql: ${TABLE}.product_brand ;;
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}.product_category ;;
  }

  dimension: product_department {
    type: string
    sql: ${TABLE}.product_department ;;
  }

  dimension: product_distribution_center_id {
    type: number
    sql: ${TABLE}.product_distribution_center_id ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: product_retail_price {
    type: number
    sql: ${TABLE}.product_retail_price ;;
  }

  dimension: product_sku {
    type: string
    sql: ${TABLE}.product_sku ;;
  }

  dimension_group: sold {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.sold_at ;;
  }

# [EAF] - Added
dimension: sold_indicator {
  label: "Sold"
  type: yesno
  sql: ${TABLE}.sold_at is not null ;;
}

dimension: last_updated_at {
  type: date
  sql: coalesce( date_trunc('day', ${TABLE}.sold_at),  ${TABLE}.created_at) ;;
}

dimension_group: last_updated{
  type: time
  timeframes: [date, week, month, quarter, year]
  sql: ${last_updated_at} ;;
}

dimension: days_in_inventory {
  description: "Total number of days when item was purchased to item sold. If not sold, it uses current date"
    type: number
    sql:  extract('days' from NVL(sold_at, CURRENT_DATE) - created_at) ;;
}

# [EAF] - Added
measure: stock_count {
  type: count
  filters: {
    field: sold_indicator
    value: "No"
  }
  drill_fields: [product_brand, product_id, product_name, created_date, sold_date]
}

measure: sold_count {
  type:  count
  filters: {
    field: sold_indicator
    value: "Yes"
  }
  drill_fields: [product_brand, product_id, product_name, created_date, sold_date]
}

measure: average_days_in_inventory {
  description: "Average days spent in inventory"
  type: average
  sql:  ${days_in_inventory};;
  value_format: "#,##0.0"
}

measure: total_product_retail_price {
  type: sum
  sql: ${product_retail_price} ;;
  hidden: yes
}


measure: total_profit {
  type: sum
  description: "Product Retail Price less cost"
  filters: {
    field: sold_indicator
    value: "Yes"
  }
  sql:  ${product_retail_price} -  ${cost} ;;
  value_format: "$ #,##0.00"
}

measure: average_item_profit {
  type: average
  description: "Average of the product retail price less cost"
  filters: {
    field: sold_indicator
    value: "Yes"
  }
  sql: ${product_retail_price} -  ${cost} ;;
  value_format: "$ #,##0.00"
}

  measure: count {
    type: count
    drill_fields: [id, product_name, products.id, products.name, order_items.count]
  }
}

view: order_items {
  sql_table_name: public.order_items ;;

  drill_fields: [order_id, created_date]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      day_of_month,
      day_of_week,
      quarter,
      fiscal_quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  filter: period_filter {
    type: date
    description: "Use this filter for current period"
  }

  dimension_group: period {
#     hidden: yes
    type: time
    timeframes: [
      date, week, month, quarter, year
    ]
    sql:{% date_start period_filter %} ;;
  }

  dimension_group: period_end {
    type: time
    timeframes: [
      date, week, month, quarter, year
    ]
    sql: {% date_end period_filter %} ;;
  }

  dimension: is_mtd {
    type: string
    sql: CASE
        WHEN {% date_start period_filter %} is not null AND {% date_end period_filter %} is not null /* date ranges or in the past x days */
          THEN
            CASE
              WHEN ${created_raw} >=  {% date_start period_filter %}
                AND ${created_raw} <= {% date_end period_filter %}
                THEN '1'
            END
          END;;
  }

  dimension: is_qtd {
    type: string
    sql: CASE
        WHEN {% date_start period_filter %} is not null AND {% date_end period_filter %} is not null /* date ranges or in the past x days */
          THEN
            CASE
              WHEN ${created_quarter} >=  ${period_quarter}
                AND ${created_quarter} <= ${period_quarter}
                THEN '1'
            END
          END;;
  }

  dimension: is_before_mtd{
  type: yesno
  sql:
  (EXTRACT(DAY FROM ${TABLE}.created_at) < EXTRACT(DAY FROM current_date)
  OR
  (
  EXTRACT(DAY FROM ${TABLE}.created_at) = EXTRACT(DAY FROM current_date) AND
  EXTRACT(HOUR FROM ${TABLE}.created_at) < EXTRACT(HOUR FROM current_date)
  )
  OR
  (
  EXTRACT(DAY FROM ${TABLE}.created_at) = EXTRACT(DAY FROM current_date) AND
  EXTRACT(HOUR FROM ${TABLE}.created_at) <= EXTRACT(HOUR FROM current_date) AND
  EXTRACT(MINUTE FROM ${TABLE}.created_at) < EXTRACT(MINUTE FROM current_date)
  )
  );;
  }

  measure: orders_mtd {
    type: count_distinct
    sql: ${order_id} ;;
    filters: {
      field: is_mtd
      value: "1"
    }
  }

  measure: orders_qtd {
    type: count_distinct
    sql: ${order_id} ;;
    filters: {
      field: is_qtd
      value: "1"
    }
  }

  filter: previous_period_filter {
    type: date
    description: "Use this filter for period analysis"
  }

  # For Amazon Redshift
  # ${created_raw} is the timestamp dimension we are building our reporting period off of
  dimension: previous_period {
    type: string
    description: "The reporting period as selected by the Previous Period Filter"
    sql:
      CASE
        WHEN {% date_start previous_period_filter %} is not null AND {% date_end previous_period_filter %} is not null /* date ranges or in the past x days */
          THEN
            CASE
              WHEN ${created_raw} >=  {% date_start previous_period_filter %}
                AND ${created_raw} <= {% date_end previous_period_filter %}
                THEN 'This Period'
              WHEN ${created_raw} >= DATEADD(day,-1*DATEDIFF(day,{% date_start previous_period_filter %}, {% date_end previous_period_filter %} ) + 1, DATEADD(day,-1,{% date_start previous_period_filter %} ) )
                AND ${created_raw} <= DATEADD(day,-1,{% date_start previous_period_filter %} )
                THEN 'Previous Period'
            END
          END ;;
  }


  dimension_group: delivered {
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
    sql: ${TABLE}.delivered_at ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
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
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    hidden: yes
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  dimension_group: shipped {
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
    sql: ${TABLE}.shipped_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  filter: status_filter {
    suggest_dimension: status
    type: string
  }

  dimension: user_status_choice{
    type: string
    sql: case when {% condition status_filter %} ${status} {% endcondition %}
    then ${status}
    else 'All Other Status'
    end
    ;;
  }

  dimension: is_cancelled_or_returned {
    type: yesno
    sql:  ${status} in ('Cancelled', 'Returned');;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    label: "Total Order Items Count"
    type: count
    drill_fields: [detail*]
  }

  measure: ct_order_items_completed {
    label: "Total Order Items Count excl Cancelled and Returned"
    type: count
    filters: {
      field: is_cancelled_or_returned
      value: "No"
    }
    drill_fields: [detail*]
  }

# MCS - Total Sale Price
  measure: total_sales {
    label: "Total Sale Price"
    description: "Total sales from items sold"
    type: sum
    sql: ${sale_price} ;;
    value_format: "$ #,##0.00"
    drill_fields: [detail*]
  }

  measure: total_gross_revenue {
    description: "Total revenue from completed sales (cancelled and returned orders excluded)"
    type: sum
    sql: ${sale_price} ;;
    drill_fields: [detail*]
    value_format: "$ #,##0.00"
    filters: {
      field: is_cancelled_or_returned
      value: "No"
    }
  }

  measure:  avg_sales{
    label: "Average Sale Price"
    description: "Average sale price of items sold"
    type: average
    sql: ${sale_price} ;;
    value_format: "$ #,##0.00"
    drill_fields: [detail*]
  }

  measure: total_cost {
    description: "Total cost of items sold from inventory"
    type: sum
    sql: ${inventory_items.cost} ;;
    value_format: "$ #,##0.00"
    drill_fields: [detail*]
  }

  measure: avg_cost {
    description: "Average cost of items sold from inventory"
    type: average
    label: "Average Cost"
    sql: ${inventory_items.cost} ;;
    value_format: "$ #,##0.00"
    drill_fields: [detail*]
  }

  measure: gross_margin {
    label: "Total Gross Margin Amount"
    type: number
    description: "Total difference between the total revenue from completed sales and the cost of the goods that were sold"
    sql: ${total_gross_revenue} - ${total_cost} ;;
    value_format: "$ #,##0.00"
    drill_fields: [products.category, detail*]
  }

  measure: avg_gross_margin {
    label: "Average Gross Margin"
    type: number
    description: "Average difference between the total revenue from completed sales and the cost of the goods that were sold"
    sql: ${gross_margin}/nullif(${ct_order_items_completed},0);;
    value_format: "$ #,##0.00"
    drill_fields: [detail*]
  }

  measure: gross_margin_pct {
    label: "Gross Margin %"
    description: "Total Gross Margin Amount / Total Revenue"
    type: number
    sql: ${gross_margin}/${total_sales} ;;
    value_format_name: percent_2
    drill_fields: [detail*]
  }

  measure: items_returned {
    label: "Number of Items Returned"
    description: "Number of items that were returned bny dissatisfied customers"
    type: count
    drill_fields: [detail*]
    filters: {
      field: status
      value: "Returned"
    }
  }

  measure: item_return_rate {
    label: "Item Return Rate %"
    description: "Number of Items Returned / total number of items sold"
    type: number
    sql: ${items_returned}/${count} ;;
    value_format_name: percent_2
    drill_fields: [detail*]
  }

  measure: cust_returning_items {
    label: "Number of Customers Returning Items"
    description: "Number of users who have returned an item at some point"
    type: count_distinct
    sql: ${user_id} ;;
    drill_fields: [detail*]
    filters: {
      field: status
      value: "Returned"
    }
  }

  measure: total_customers {
    label: "Total Customers"
    description: "Number of customers with orders placed."
    type: count_distinct
    sql: ${user_id} ;;
    drill_fields: [detail*]
  }

  measure: users_with_returns_pct {
    label: "% of Users with Returns"
    description: "Number of customer returning items/total number of customers"
    type: number
    sql: 1.0*${cust_returning_items}/nullif(${total_customers},0) ;;
    value_format_name: percent_2
    drill_fields: [detail*]
  }

  measure: avg_spend_per_cust {
    label: "Average Spend per Customer"
    description: "Total Sale Price / total number of customers"
    type: number
    sql: ${total_sales}/${total_customers} ;;
    value_format: "$ #,##0.00"
    drill_fields: [detail*]
  }

  measure: total_orders {
    label: "Total Orders"
    type: count_distinct
    sql: ${order_id} ;;
    drill_fields: [detail*]
  }

  measure: min_order_date {
    type: date_time
    label: "First Order Date"
    sql: trunc(min(${created_date})) ;;
    drill_fields: [detail*]
  }

  measure: max_order_date {
    type: date_time
    label: "Last Order Date"
    sql: trunc(max(${created_date})) ;;
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.id,
      users.first_name,
      users.last_name,
      inventory_items.id,
      inventory_items.product_name
    ]
  }

  dimension: field_test {
    type: string
    sql: {{order_id.name}} ;;
  }
}

view: column_names {
  derived_table: {
    sql:
    SELECT column_name FROM information_schema.columns
WHERE table_schema = 'public'
and table_name = 'order_items' ;;
  }

  dimension: column_name {}
}

explore: column_names { hidden:yes}


view: dynamic_dimension {
  derived_table: {
    sql: select {{user_input_dynamic_dim._parameter_value}} as dim_1 from public.order_items
          where created_at between {% date_start custom_date %} and {% date_end custom_date %}
          ;;
  }

  filter: custom_date {
    type: date
  }


  parameter: user_input_dynamic_dim {
    type: unquoted
    suggest_explore: column_names
    suggest_dimension: column_names.column_name
  }

  dimension: dynamic_dim {
    sql: ${TABLE}.dim_1  ;;
  }

  measure: count {
    type: count
  }

  measure: sum {
    type: sum
    sql: ${dynamic_dim} ;;
  }

}

explore: dynamic_dimension {}

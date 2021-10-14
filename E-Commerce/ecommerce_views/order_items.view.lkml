view: order_items_base {
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
    type: date_time
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

  # filter: status_filter {
  #   suggest_dimension: status
  #   hidden: yes
  #   type: string
  # }

  # dimension: user_status_choice{
  #   type: string
  #   sql: case when {% condition status_filter %} ${status} {% endcondition %}
  #   then ${status}
  #   else 'All Other Status'
  #   end
  #   ;;
  # }

  dimension: is_cancelled_or_returned {
    type: yesno
    sql:  ${status} in ('Cancelled', 'Returned');;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
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

view: order_items {
  extends: [order_items_base]

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
    link: {
      url: "explore/tref_sandbox/order_items?fields=products.category,products.brand,order_items.total_orders&subtotals=products.category
      &sorts=order_items.total_orders+desc&column_limit=50
      &vis_config=table
      &filter_config=%7B%7D&dynamic_fields=%5B%5D&origin=share-expanded
      &toggle=vis"
    }
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

  set: exclude_inventory_item_fields {
    fields: [total_cost, gross_margin, gross_margin_pct, avg_gross_margin, avg_cost]
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

explore: dynamic_dimension {
  hidden: yes
}


explore: order_items_pagination {
  # fields: [page, number_per_page, detail*]
}

view: order_items_pagination {
  extends: [order_items_base]

  derived_table: {
    sql:
    select * from public.order_items

    LIMIT {{ number_per_page._parameter_value }}
    OFFSET {{ number_per_page._parameter_value |
        times: page._parameter_value | minus: number_per_page._parameter_value }} ;;
  }

  parameter: page {
    type: number
  }

  parameter: number_per_page {
    type: number
  }


  measure: count {
    type: count
  }

  }

view: +order_items_pagination {
  derived_table: {
    sql:
    select * from public.order_items
    where {% condition select_status %} status {% endcondition %}
    order by id
    LIMIT {{ number_per_page._parameter_value }}
    OFFSET {{ number_per_page._parameter_value | times: page._parameter_value | minus: number_per_page._parameter_value }} ;;
  }

  filter: select_status {
    suggest_dimension: status
  }
}



# view: sample_2 {
#   dimension: date_time_period_selected_label {
#     view_label: "Calendar"
#     hidden: yes
#     label: "Date Time Period Selected"
#     description: "The time period you have selected"
#     case: {
#       when: {sql:'{{date_time_periods._parameter_value}}'='today';; label: "Today"}
#       when: {sql:'{{date_time_periods._parameter_value}}'='yesterday';; label: "Yesterday"}
#       when: {sql:'{{date_time_periods._parameter_value}}'='month_to_date';; label: "Month to Date"}
#       when: {sql:'{{date_time_periods._parameter_value}}'='last_month';; label: "Last Month"}
#       when: {sql:'{{date_time_periods._parameter_value}}'='quarter_to_date';; label: "Quarter to Date"}
#       when: {sql:'{{date_time_periods._parameter_value}}'='year_to_date';; label: "Year to Date"}
#       when: {sql:'{{date_time_periods._parameter_value}}'='trailing_7_days';; label: "Trailing 7 Days"}
#       when: {sql:'{{date_time_periods._parameter_value}}'='trailing_14_days';; label: "Trailing 14 Days"}
#       when: {sql:'{{date_time_periods._parameter_value}}'='trailing_30_days';; label: "Trailing 30 Days"}
#       when: {sql:'{{date_time_periods._parameter_value}}'='trailing_60_days';; label: "Trailing 60 Days"}
#       when: {sql:'{{date_time_periods._parameter_value}}'='trailing_90_days';; label: "Trailing 90 Days"}
#       when: {sql:'{{date_time_periods._parameter_value}}'='0';; label: "Custom Time Range"}
#       else: "none"
#     }
#     sql: {% if date_time_periods._parameter_value == '0'%}
#         1=1
#         {% elsif date_time_periods._parameter_value == 'today'%}
#         timestamp_trunc(${created_raw} ,day) = timestamp_trunc(timestamp_trunc(current_timestamp, day, "America/Chicago"),day)
#         {% elsif date_time_periods._parameter_value == 'yesterday'%}
#         timestamp_trunc(${created_raw} ,day) = timestamp_trunc(timestamp_add(timestamp_trunc(current_timestamp, day, "America/Chicago"), interval -1 day),day)

#           {% elsif date_time_periods._parameter_value == 'last_month'%}
#         cast(timestamp_trunc(${created_raw} ,month) as timestamp) = cast(date_add(date_trunc(current_date, month), interval -1 month) as timestamp)


#         {% elsif date_time_periods._parameter_value == 'month_to_date' %}
#         date_trunc(${created_date} , month) = date_trunc(date_add(${date_to_check}, interval -1 day), month)
#           and ${created_day_of_month} < extract(DAY from ${date_to_check})

#         {% elsif date_time_periods._parameter_value == '15' %}
#         cast(timestamp_trunc(${created_raw} ,month) as date) = date_add(date_trunc(current_date, month), interval -1 month)

#         {% elsif date_time_periods._parameter_value == 'quarter_to_date' %}
#         date_trunc(${created_date}, quarter) = date_trunc(${date_to_check}, quarter)
#         and ${created_day_of_year} < extract(DAYOFYEAR from ${date_to_check})

#         {% elsif date_time_periods._parameter_value == 'year_to_date' %}
#         extract(YEAR from ${created_raw}) = extract(YEAR FROM ${date_to_check})
#         and ${created_day_of_year} < extract(DAYOFYEAR from ${date_to_check})

#         {% elsif date_time_periods._parameter_value == 'trailing_7_days' %}
#         ${created_date} >= date_add(cast(${date_to_check} as date), interval -7 day) and ${created_date} < date_add(date_add(cast(${date_to_check} as date), interval -7 day), interval 7 day)
#         {% elsif date_time_periods._parameter_value == 'trailing_14_days' %}
#         ${created_date} >= date_add(${date_to_check}, interval -14 day) and ${created_date} < date_add(date_add(${date_to_check}, interval -14 day), interval 14 day)
#         {% elsif date_time_periods._parameter_value == 'trailing_30_days' %}
#         ${created_date} >= date_add(${date_to_check}, interval -30 day) and ${created_date} < date_add(date_add(${date_to_check}, interval -30 day), interval 30 day)
#         {% elsif date_time_periods._parameter_value == 'trailing_60_days' %}
#         ${created_date} >= date_add(${date_to_check}, interval -60 day) and ${created_date} < date_add(date_add(${date_to_check}, interval -60 day), interval 60 day)
#         {% elsif date_time_periods._parameter_value == 'trailing_90_days' %}
#         ${created_date} >= date_add(${date_to_check}, interval -90 day) and ${created_date} < date_add(date_add(${date_to_check}, interval -90 day), interval 90 day)
#         {% else %}
#         0=1
#         {% endif %} ;;
#   }
#   dimension: selected_date_range {
#     label: "{% if selected_date_range._in_query %}{{ order_item_complete.date_time_periods._parameter_value | replace:'_',' ' | capitalize }}{%else%}Selected Date Range{%endif%}"
#     type: string
#     hidden: yes
#     sql: concat(${reporting_period_min_date},' to ',${reporting_period_max_date}) ;;
#   }
#   dimension: reporting_period_max_date {

#     convert_tz: no
# #     hidden: yes
#     hidden: yes
#     type: date
#     sql:cast(
#       {% if date_time_periods._parameter_value == 'last_month' %}
#       date_add(date_trunc(current_date, month), interval -1 DAY)
#       {% else %}
#       timestamp_trunc(current_timestamp, day)--#all ranges end with < 0:00 of current_Date
#       {% endif %}
#       as timestamp)
#       ;;
#   }
#   dimension: reporting_period_min_date {
#     convert_tz: no
# #     hidden: yes
#     hidden: yes
#     type: date
#     sql:
#     {% if date_time_periods._parameter_value == '0'%}
#     current_timestamp
#   {% elsif date_time_periods._parameter_value == 'today' %}
#       timestamp_trunc(current_timestamp, day, "America/Chicago")
#     {% elsif date_time_periods._parameter_value == 'yesterday' %}
#     timestamp_add(timestamp_trunc(current_timestamp, day, "America/Chicago"), interval -1 day)
#     {% elsif date_time_periods._parameter_value == 'last_month' %}
#     date_add(date_trunc(current_date, month), interval -1 MONTH)
#     {% elsif date_time_periods._parameter_value == 'month_to_date' %}
#     timestamp_trunc(current_timestamp, month)
#     {% elsif date_time_periods._parameter_value == 'quarter_to_date' %}
#     timestamp_trunc(current_timestamp, quarter)
#     {% elsif date_time_periods._parameter_value == 'year_to_date' %}
#     timestamp_trunc(current_timestamp, year)
#     -- Need to update this Year to date logic
#     {% elsif date_time_periods._parameter_value == '11' %}
#     date_add(date_add(timestamp_trunc(current_timestamp, month), interval 1 month), interval -1 day)
#     {% elsif date_time_periods._parameter_value == 'trailing_7_days' %}
#     timestamp_add(timestamp_trunc(current_timestamp, day, "America/Chicago"), interval -7 day)
#     {% elsif date_time_periods._parameter_value == 'trailing_14_days' %}
#     timestamp_add(timestamp_trunc(current_timestamp, day, "America/Chicago"), interval -14 day)
#     {% elsif date_time_periods._parameter_value == 'trailing_30_days' %}
#     timestamp_add(timestamp_trunc(current_timestamp, day, "America/Chicago"), interval -30 day)
#     {% elsif date_time_periods._parameter_value == 'trailing_60_days' %}
#   timestamp_add(timestamp_trunc(current_timestamp, day, "America/Chicago"), interval -60 day)
#     {% elsif date_time_periods._parameter_value == 'trailing_90_days' %}
#     timestamp_add(timestamp_trunc(current_timestamp, day, "America/Chicago"), interval -90 day)
#     {% else %}
#     current_timestamp
#     {% endif %}
#     ;;
#   }

#   sql_table_name: OrderItem_Complete
#     ;;


#   dimension: is_in_reporting_period_test {
# #     hidden: yes
# #     type: string
#     # /* {% elsif created_date._is_filtered AND date_time_periods._parameter_value == '0' %}
#     # 1=1 */
#     hidden: no
#     type: yesno #km 8/24
#     view_label: "Calendar"
#     label: "Date Time Period - Required For Date Time Period"
#     description: "Must be yes when you are using the drop down of dates"
#     sql:
#       {% if date_time_periods._parameter_value == '0'%}
#       1=1

#     {% elsif date_time_periods._parameter_value == 'today'%}
#       timestamp_trunc(${created_raw} ,day) = timestamp_trunc(timestamp_trunc(current_timestamp, day, "America/Chicago"),day)
#       and  cast(extract (hour from ${TABLE}.OrderCompletedOnStoreLocalTime) as INT64) <= extract(hour from current_time("America/Chicago"))
#       and extract(hour from  OrderCompletedOnStoreLocalTime) * 60 + extract(minute from OrderCompletedOnStoreLocalTime) <= (extract(hour from current_time("America/Chicago")) * 60 + extract(minute from current_time("America/Chicago")))

#       {% elsif date_time_periods._parameter_value == 'yesterday'%}
#       timestamp_trunc(${created_raw} ,day) = timestamp_trunc(timestamp_add(timestamp_trunc(current_timestamp, day, "America/Chicago"), interval -1 day),day)

#         {% elsif date_time_periods._parameter_value == 'last_month'%}
#       cast(timestamp_trunc(${created_raw} ,month) as timestamp) = cast(date_add(date_trunc(current_date, month), interval -1 month) as timestamp)


#       {% elsif date_time_periods._parameter_value == 'month_to_date' %}
#       date_trunc(${created_date} , month) = date_trunc(date_add(${date_to_check}, interval -1 day), month)
#       and ${created_day_of_month} < extract(DAY from ${date_to_check})

#       {% elsif date_time_periods._parameter_value == '15' %}
#       cast(timestamp_trunc(${created_raw} ,month) as date) = date_add(date_trunc(current_date, month), interval -1 month)

#       {% elsif date_time_periods._parameter_value == 'quarter_to_date' %}
#       date_trunc(${created_date}, quarter) = date_trunc(${date_to_check}, quarter)
#       and ${created_day_of_year} < extract(DAYOFYEAR from ${date_to_check})

#       {% elsif date_time_periods._parameter_value == 'year_to_date' %}
#       extract(YEAR from ${created_raw}) = extract(YEAR FROM ${date_to_check})
#       and ${created_day_of_year} < extract(DAYOFYEAR from ${date_to_check})

#       {% elsif date_time_periods._parameter_value == 'trailing_7_days' %}
#       ${created_date} >= date_add(cast(${date_to_check} as date), interval -7 day) and ${created_date} < date_add(date_add(cast(${date_to_check} as date), interval -7 day), interval 7 day)
#       {% elsif date_time_periods._parameter_value == 'trailing_14_days' %}
#       ${created_date} >= date_add(${date_to_check}, interval -14 day) and ${created_date} < date_add(date_add(${date_to_check}, interval -14 day), interval 14 day)
#       {% elsif date_time_periods._parameter_value == 'trailing_30_days' %}
#       ${created_date} >= date_add(${date_to_check}, interval -30 day) and ${created_date} < date_add(date_add(${date_to_check}, interval -30 day), interval 30 day)
#       {% elsif date_time_periods._parameter_value == 'trailing_60_days' %}
#       ${created_date} >= date_add(${date_to_check}, interval -60 day) and ${created_date} < date_add(date_add(${date_to_check}, interval -60 day), interval 60 day)
#       {% elsif date_time_periods._parameter_value == 'trailing_90_days' %}
#       ${created_date} >= date_add(${date_to_check}, interval -90 day) and ${created_date} < date_add(date_add(${date_to_check}, interval -90 day), interval 90 day)
#       {% else %}
#       0=1
#       {% endif %}

#         ;;
#   }

#   dimension: is_in_previous_period {
# #     type: string
#   view_label: "Z. Drill Fields For Dashboarding Only"
#   group_label: "Peer Group"
#   hidden: no
#   type: yesno
# #     sql:
# #     {% if include_previous_period._parameter_value == '0' %}
# #     1=1
# #     {% elsif date_time_periods._parameter_value == 'yesterday' %}
# #     ${created_date} = date_add(current_date, interval -2 day)
# #     {% elsif date_time_periods._parameter_value == 'month_to_date' %}
# #     date_trunc(${created_date}, month) = date_add(date_trunc(current_date, month), interval -1 month)
# #     {% elsif date_time_periods._parameter_value == 'quarter_to_date' %}
# #     DATE_TRUNC(${created_date}, QUARTER) = date_add(date_trunc(current_date, QUARTER), interval -1 QUARTER)
# #     {% elsif date_time_periods._parameter_value == 'year_to_date' %}
# #     extract(YEAR from ${created_raw}) = extract(YEAR FROM date_add(current_date, interval -1 year))
# #     {% elsif date_time_periods._parameter_value == 'trailing_7_days' %}
# #     ${created_date} >= date_add(current_date, interval -14 day) and ${created_date} < date_add(date_add(current_date, interval -14 day), interval 7 day)
# #     {% elsif date_time_periods._parameter_value == 'trailing_14_days' %}
# #     ${created_date} >= date_add(current_date, interval -28 day) and ${created_date} < date_add(date_add(current_date, interval -28 day), interval 14 day)
# #     {% elsif date_time_periods._parameter_value == 'trailing_30_days' %}
# #     ${created_date} >= date_add(current_date, interval -60 day) and ${created_date} < date_add(date_add(current_date, interval -60 day), interval 30 day)
# #     {% endif %}
# #     ;;
#   sql:

#     ${created_raw}>=cast(${same_date_range_finder.selected_period_start_previous_comp_date} as timestamp)
#     and
#     ${created_raw}<cast(${same_date_range_finder.selected_period_end_previous_comp_date} as timestamp)
#     ;;
#     # {% if date_time_periods._parameter_value == 'yesterday' %}
#     # {%else%}
#     #
#     # {%endif%}

#   }

#   dimension: period {
#     hidden: no
#     label: "Pivot to See Current vs Prior Period"
#     view_label:"Z. Drill Fields For Dashboarding Only"
#     description: "Used for Period over Period Analysis"
#     type: string
#     sql: case when ${is_in_reporting_period_test} =  true then 'Current Period'
#           else 'Previous Period'
#           end;;
#   }

#   parameter: reporting_period_start_date {
#     # Trial Remnant
#     hidden: yes
#     type: date
#   }
#   parameter: reporting_period_end_date {
#     type: date
#     # Trial Remnant
#     hidden: yes
#   }
#   parameter: date_time_periods{
#     view_label: "Calendar"
#     type: unquoted
#     #default_value: "yesterday"
#     allowed_value: { label: "Today" value: "today" }
#     allowed_value: { label: "Yesterday" value: "yesterday" }
#     allowed_value: { label: "Month to Date" value: "month_to_date" }
#     allowed_value: { label: "Last Month" value: "last_month" }
#     allowed_value: { label: "Quarter to Date" value: "quarter_to_date" }
#     allowed_value: { label: "Year to Date" value: "year_to_date" }
#     allowed_value: { label: "Trailing 7 Days" value: "trailing_7_days" }
#     allowed_value: { label: "Trailing 14 Days" value: "trailing_14_days" }
#     allowed_value: { label: "Trailing 30 Days" value: "trailing_30_days" }
#     allowed_value: { label: "Trailing 60 Days" value: "trailing_60_days" }
#     allowed_value: { label: "Trailing 90 Days" value: "trailing_90_days" }
#     allowed_value: { label: "Custom Date Range" value: "0" }
#   }

#   parameter: include_previous_period {
#     type: unquoted
#     view_label: "Z. Drill Fields For Dashboarding Only"
#     default_value: "0"
#     allowed_value: { label: "Yes" value: "1"}
#     allowed_value: { label: "No" value: "0"}
#   }

#   parameter: special_store_selection {
#     view_label: "Z. Drill Fields For Dashboarding Only"
#     type: string
#     hidden: no
#   }

#   parameter: comparison_group_selection {
#     view_label: "Z. Drill Fields For Dashboarding Only"
#     default_value: "0"
#     allowed_value: { label: "Store Age" value: "age_group" }
#     allowed_value: { label: "Store Market" value: "market"}
#     hidden: no
#   }

#   parameter: calendar_or_same_day {
#     view_label: "Calendar"
#     type: unquoted
#     default_value: "calendar"
#     allowed_value: { label: "Calendar Day"  value: "calendar"}
#     allowed_value: { label: "Same Day" value: "same_day"}
#     hidden: yes
#   }


# }

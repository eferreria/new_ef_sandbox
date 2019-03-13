
view: users {
 # sql_table_name: public.users ;;
derived_table: {
  sql:
  select * from public.users
  where
  {% condition city_select %} users.city {% endcondition %}
  ;;
}


  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  filter: city_select {
    type: string
    suggest_dimension: city
  }


  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: age_tier {
    type: tier
    tiers: [15, 26, 36, 46, 56, 66]
    style: integer
    sql: ${age} ;;
  }

  dimension: is_new_customer {
    type: yesno
    sql: ${days_since_signup}<=90 ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
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
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  dimension: days_since_signup {
    type: number
    sql: datediff(days, ${created_date}, current_date) ;;
  }

  dimension: days_since_signup_tier {
    type: tier
    tiers: [30,60,90,180,360,720]
    style: integer
    sql: ${days_since_signup} ;;
  }

  dimension: months_since_signup {
    type: number
    sql: datediff(months, ${created_date}, current_date) ;;
  }

  dimension: months_since_signup_tier {
    type: tier
    tiers: [3,7,13,19,25,37]
    sql: ${months_since_signup} ;;
    style: integer
  }

  dimension: phone_number {
    type: number
    sql:  9999999999 ;;
    value_format: "(000) 000-0000"
  }

  measure: count {
    label: "Total Customers"
    type: count
    drill_fields: [id, first_name, last_name, events.count, order_items.count]
  }

  measure: average_days_since_signup {
    type: average
    sql: 1.0*${days_since_signup} ;;
  }

  measure: average_months_since_signup {
    type: average
    sql: 1.0*${months_since_signup} ;;
  }

  # measure: cust_with_orders {
  #   label: "Total Customers with Orders"
  #   description: "Number of customers that had placed an order"
  #   type: count_distinct
  #   sql: ${order_items.user_id} ;;
  # }

  measure: youngest {
    label: "Youngest Customer"
    type:  min
    sql: ${age} ;;
  }

  measure: oldest {
    label: "Oldest Customer"
    type: max
    sql: ${age} ;;
  }

  parameter: code_type_picker_1 {
    description: "Select claim code type for filtering. Use in conjunction with Code Value 1"
    type: string
    default_value: "0"
    allowed_value: {
      label: "Please select a code"
      value: "0"
    }
    allowed_value: {
      label: "CPT Code"
      value: "CPT"
    }
    allowed_value: {
      label: "NDC Code"
      value: "NDC"
    }
    allowed_value: {
      label: "ICD Diagnosis 9"
      value: "ICDDx9"
    }
    allowed_value: {
      label: "ICD Diagnosis 10"
      value: "ICDDx10"
    }
    allowed_value: {
      label: "ICD Procedure"
      value: "ICDPx"
    }
    allowed_value: {
      label: "HCPCS"
      value: "HCPCS"
    }
    allowed_value: {
      label: "LOINC Code"
      value: "LOINCCODE"
    }
    allowed_value: {
      label: "MSDRG Code"
      value: "MSDRG"
    }
  }

}

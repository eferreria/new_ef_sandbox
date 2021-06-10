
# include: "..//E-Commerce/order*.view"

view: users {
 sql_table_name: public.users ;;
drill_fields: [id, created_date]
# derived_table: {
#   sql:
#   select * from public.users
#   where
#   {% condition city_select %} users.city {% endcondition %}
#   ;;
# }

  parameter: user_selected_dimension {
    type: unquoted
    allowed_value: {
      label: "City"
      value: "city"
    }
    allowed_value: {
      label: "State"
      value: "state"
    }
    allowed_value: {
      label: "Country"
      value: "country"
    }
  }

  dimension: selected_dimension {
    sql:
    {% if user_selected_dimension._parameter_value == 'city' %}
      ${city}
    {% elsif user_selected_dimension._parameter_value == 'state' %}
      ${state}
    {% else %}
      ${country}
    {% endif %}
    ;;
  }


  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # filter: city_select {
  #   hidden: yes
  #   type: string
  #   suggest_dimension: city
  # }

dimension: campaign_name {
  type: string
  html: {{ full_name._value }} ;;
  sql: ${id} ;;
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
    convert_tz: no
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

  dimension: full_name {
    sql: ${id} ;;
    html: {{last_name._value}}, {{first_name._value}} ;;
  }

  dimension: full_name_2 {
    sql:  ${last_name} || ', ' || ${first_name};;
    html: {{id._value}} ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;

    map_layer_name: gender_map_layer
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: store_location {
    type: location
    sql_latitude: ${latitude} ;;
    sql_longitude: ${longitude} ;;
    html: {{ city._value }} ;;
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
    map_layer_name: us_states
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
    link: {
      url: "/explore/tref_sandbox/custom_map?toggle=dat,vis&qid=cRsWAPVcwqGZYo1bcz83Y4"
      label: "US County Map Layer"
    }
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
#     link: {
#       label: "Example"
#       url: "/explore/eaf_sandbox/users?fields=users.id,users.name&f[users.state]={{
#         _filters['users.state'] | url_encode }}"
#     }
#     html:  <a style="font-size: 40px;" href="{{link}}" target="_self"><font color="blue">{{value}}</font></a> ;;
  }

  measure: is_count_error {
    type: yesno
    sql: ${count} < ${youngest} ;;
  }

  measure: average_days_since_signup {
    type: average
    sql: 1.0*${days_since_signup} ;;
  }

  measure: average_months_since_signup {
    type: average
    sql: 1.0*${months_since_signup} ;;
  }

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

  measure: measure_compare {
    type: yesno
    sql:
    {% if measure_picker_1._parameter_value == 'count' %} ${count}
    {% elsif measure_picker_1._parameter_value == 'young' %}  ${youngest}
    {% elsif measure_picker_1._parameter_value == 'oldest' %}  ${oldest}
    {% endif %}

    {% if measure_logic_test._parameter_value == 'greater' %} >
    {% elsif measure_logic_test._parameter_value == 'less' %} <
    {% elsif measure_logic_test._parameter_value == 'equal' %} =
    {% endif %}

    {% if measure_picker_2._parameter_value == 'count' %} ${count}
    {% elsif measure_picker_2._parameter_value == 'young' %} ${youngest}
    {% elsif measure_picker_2._parameter_value == 'oldest' %} ${oldest}
    {% endif %}
    ;;
  }




  parameter: measure_picker_1 {
    type: unquoted
    default_value: "count"
    allowed_value: { label: "Count" value: "count" }
    allowed_value: { label: "Youngest" value: "young" }
    allowed_value: { label: "Oldest" value: "oldest" }
  }

  parameter: measure_picker_2 {
    type: unquoted
    default_value: "count"
    allowed_value: { label: "Count" value: "count" }
    allowed_value: { label: "Youngest" value: "young" }
    allowed_value: { label: "Oldest" value: "oldest" }
  }

  parameter: measure_logic_test {
    type: unquoted
    default_value: "greater"
    allowed_value: { label: ">" value: "greater" }
    allowed_value: { label: "<" value: "less" }
    allowed_value: { label: "=" value: "equal" }
  }

  parameter: code_type_picker_1 {
    hidden: yes
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
  parameter: region_selector {
    type: unquoted
    allowed_value: {label: "City" value: "city" }
    allowed_value: {label: "State" value: "state" }
    allowed_value: {label: "Market Region" value: "market_region" }
    allowed_value: {label: "Super Region" value: "super_region" }
  }

  dimension: region_selector_filter {
    sql:
    {% if region_selector._parameter_value == "city" %} ${city}
    {% elsif region_selector._parameter_value == "state" %} ${state}
    {% elsif region_selector._parameter_value == "market_region" %} ${market_region}
    {% elsif region_selector._parameter_value == "super_region" %} ${super_region}
    {% endif %}
    ;;
  }

  dimension: market_region {
    type: string
    sql:
    case
          when ${city} = 'Chicago' then 'Chicago'
          when ${city} = 'Evanston' then 'North Chicago'
          when ${city} = 'Wilmette' then 'North Chicago'
          when ${city} = 'Winettka' then 'North Chicago'
          when ${city} = 'Kennilworth' then 'North Chicago'
          when ${city} = 'Morton Grove' then 'North Central Chicago'
          when ${city} = 'Park Ridge' then 'North Central Chicago'
          when ${city} = 'Skokie' then 'North Central Chicago'
          when ${city} = 'Lincolnwood' then 'North Central Chicago'
          when ${city} = 'Niles' then 'North Central Chicago'
          when ${city} = 'Oak Lawn' then 'West Chicago'
          when ${city} = 'Burbank' then 'West Chicago'
          when ${city} = 'Evergreen Park' then 'West Chicago'
          when ${city} = 'Gary' then 'Not Chicago'
          when ${city} = 'Hammond' then 'Not Chicago'
          when ${city} = 'East Chicago' then 'Not Chicago'
        end
        ;;
  }

  dimension: super_region {
    type: string
    sql:
    case
    when ${city} = 'Chicago' then 'Greater Chicago Metro'
    when ${city} = 'Evanston' then 'North Suburbs'
    when ${city} = 'Wilmette' then 'North Suburbs'
    when ${city} = 'Winettka' then 'North Suburbs'
    when ${city} = 'Kennilworth' then 'North Suburbs'
    when ${city} = 'Morton Grove' then 'North Suburbs'
    when ${city} = 'Park Ridge' then 'North Suburbs'
    when ${city} = 'Skokie' then 'Greater Chicago Metro'
    when ${city} = 'Lincolnwood' then 'Greater Chicago Metro'
    when ${city} = 'Niles' then 'Greater Chicago Metro'
    when ${city} = 'Oak Lawn' then 'Greater Chicago Metro'
    when ${city} = 'Burbank' then 'Greater Chicago Metro'
    when ${city} = 'Evergreen Park' then 'Greater Chicago Metro'
    when ${city} = 'Gary' then 'Greater Chicago Metro'
    when ${city} = 'Hammond' then 'Greater Chicago Metro'
    when ${city} = 'East Chicago' then 'Greater Chicago Metro'
    end
    ;;
  }

  measure: region_selector_color {
    type: number
    sql:
    {% if region_selector._parameter_value == "city" %}
       case
          when ${city} = 'Chicago' then 100
          when ${city} = 'Evanston' then 110
          when ${city} = 'Wilmette' then 110
          when ${city} = 'Winettka' then 110
          when ${city} = 'Kennilworth' then 110
          when ${city} = 'Morton Grove' then 120
          when ${city} = 'Park Ridge' then 120
          when ${city} = 'Skokie' then 120
          when ${city} = 'Lincolnwood' then 120
          when ${city} = 'Niles' then 120
          when ${city} = 'Oak Lawn' then 130
          when ${city} = 'Burbank' then 130
          when ${city} = 'Evergreen Park' then 130
          when ${city} = 'Gary' then 90
          when ${city} = 'Hammond' then 90
          when ${city} = 'East Chicago' then 90
        end
    {% elsif  region_selector._parameter_value == "state" %}
     case
      when ${state} = 'Illinois' then 1
      when ${state} = 'Indiana' then 2
      when ${state} = 'Michigan' then 3
    end
    {% elsif  region_selector._parameter_value == "market_region" %}
    case
       when ${city} = 'Chicago' then 1
          when ${city} = 'Evanston' then 2
          when ${city} = 'Wilmette' then 2
          when ${city} = 'Winettka' then 2
          when ${city} = 'Kennilworth' then 2
          when ${city} = 'Morton Grove' then 3
          when ${city} = 'Park Ridge' then 3
          when ${city} = 'Skokie' then 3
          when ${city} = 'Lincolnwood' then 3
          when ${city} = 'Niles' then 3
          when ${city} = 'Oak Lawn' then 4
          when ${city} = 'Burbank' then 4
          when ${city} = 'Evergreen Park' then 4
          when ${city} = 'Gary' then 5
          when ${city} = 'Hammond' then 5
          when ${city} = 'East Chicago' then 5
    end
    {% elsif  region_selector._parameter_value == "super_region" %}
    case
      when ${super_region} = 'Greater Chicago Metro' then 1
      when ${super_region} = 'North Suburbs' then 2
    end
    {% endif %}
    ;;
  }
  dimension: county {
    type: string
    sql:
     case
       when ${city} = 'Chicago' then 'Cook'
          when ${city} = 'Evanston' then 'Cook'
          when ${city} = 'Wilmette' then 'Cook'
          when ${city} = 'Winettka' then 'Cook'
          when ${city} = 'Kennilworth' then 'Cook'
          when ${city} = 'Morton Grove' then 'Cook'
          when ${city} = 'Park Ridge' then 'Cook'
          when ${city} = 'Skokie' then 'Cook'
          when ${city} = 'Lincolnwood' then 'Cook'
          when ${city} = 'Niles' then 'Cook'
          when ${city} = 'Oak Lawn' then 'Cook'
          when ${city} = 'Burbank' then 'Cook'
          when ${city} = 'Evergreen Park' then 'Cook'
          when ${city} = 'Gary' then 'Lake'
          when ${city} = 'Hammond' then 'Lake'
          when ${city} = 'East Chicago' then 'Lake'
    end
    ;;
    link: {
      url: "
      https://profservices.dev.looker.com/explore/tref_sandbox/custom_map?toggle=dat,fil,vis&qid=1ReMwMpTu4leIaqigf4Vja"
      label: "US Zip Map Layer"
    }
  }

  dimension: county_fips {
    type: number
    map_layer_name: us_counties_fips
    sql:
     case
       when ${city} = 'Chicago' then 17031
          when ${city} = 'Evanston' then 17031
          when ${city} = 'Wilmette' then 17031
          when ${city} = 'Winettka' then 17031
          when ${city} = 'Kennilworth' then 17031
          when ${city} = 'Morton Grove' then 17031
          when ${city} = 'Park Ridge' then 17031
          when ${city} = 'Skokie' then 17031
          when ${city} = 'Lincolnwood' then 17031
          when ${city} = 'Niles' then 17031
          when ${city} = 'Oak Lawn' then 17031
          when ${city} = 'Burbank' then 17031
          when ${city} = 'Evergreen Park' then 17031
          when ${city} = 'Gary' then 18089
          when ${city} = 'Hammond' then 18089
          when ${city} = 'East Chicago' then 18089
    end
    ;;
  }
  measure: covered_lives {
    type: count
  }

  set: exposed_fields {
    fields: [covered_lives]
  }
}

# view: users_extended {
#   extends: [users]
# }

# explore: extended_orders {
#   from: order_items

# #OPTION A
#   join: users {
#     from: users_extended
#     sql_on: ${extended_orders.user_id} = ${users.id} ;;
#   }

# #OPTION B
#   join: users_extended {
#     view_label: "Users"
#     sql_on: ${extended_orders.user_id} = ${users.id} ;;
#   }

# }

view: geo_user_summary {
  derived_table: {
    explore_source: users {
      column: country {}
      column: state {}
      column: city {}
      column: count {}
    }
  }
  dimension: country {}
  dimension: state {}
  dimension: city {}
  dimension: count {
    label: "Total Customers"
    type: number
  }

  measure: total_customers {
    type: sum
    sql: ${count} ;;
  }

  measure: total_customers_v2 {
    type: sum_distinct
    sql: ${count} ;;
    sql_distinct_key: ${city} ;;
  }

  measure: state_color {
    type: number
    sql:
    case
      when ${state} = 'Illinois' then 1
      when ${state} = 'Wisconsin' then 2
      when ${state} = 'Michigan' then 3
    end
    ;;
  }

  measure: region_color {
    type: number
    sql:
    case
      when ${state} = 'Illinois' then
        case
          when ${city} = 'Chicago' then 100
          when ${city} = 'Evanston' then 110
          when ${city} = 'Skokie' then 120
        end
      when ${state} = 'Wisconsin' then 2
      when ${state} = 'Michigan' then 3

    end
    ;;
  }




}


# If necessary, uncomment the line below to include explore_source.
# include: "tref_sandbox.model.lkml"

explore: utilization_example {}

view: utilization_example {
  derived_table: {
    explore_source: users {
      column: created_year { field: order_items.created_year }
      column: created_month_name { field: order_items.created_month_name }
      column: state {}
      column: country {}
      column: count {}
      derived_column: all_state_count {
        sql: sum(count) over (partition by country, created_year, created_month_name )  ;;
      }
      filters: {
        field: users.country
        value: "USA"
      }
    }
  }
  dimension: created_year {
  }
  dimension: created_month_name {
  }
  dimension: state {}
  dimension: count {
    label: "Users Total Customers"
    type: number
  }
  dimension: all_state_count {}

  measure: html_fun_with_wrap {
    type: count
    html:

<table style="border: 2px solid black; width:100%; table-layout:fixed; white-space:wrap">
<tr style="height:auto; white-space:wrap">
<td style="white-space:wrap" nowrap="wrap">
<p style="white-space:wrap">I am a long long long line of text. I want to demo word wrapping. I am a long long long line of text. I want to demo word wrapping. I am a long long long line of text. I want to demo word wrapping. I am a long long long line of text. I want to demo word wrapping. I am a long long long line of text. I want to demo word wrapping. I am a long long long line of text. I want to demo word wrapping. I am a long long long line of text. I want to demo word wrapping
</p>
    </td>
    </tr>
    </table>
    ;;
  }
}

view: hospital_locations {
  derived_table: {
    sql:
    select 100 as id, 'Evanston Hospital' as name, 42.0676294315567 as lat, -87.6834781555956 as long, 'Illinois' as state, 60201 as zip
    , '2650 Ridge Ave' as street_address, 'Evanston' as city
    UNION ALL
select 102, 'Stroger Hospital', 41.874990215672, -87.6725300469567, 'Illinois', 60612
  , '1969 W Ogden Ave', 'Chicago'
    UNION ALL
select 103, 'Franciscan Health', 41.6190602786367, -87.5233769971789, 'Indiana', 46320
 , '24 Joliet St', 'Dyer'
UNION ALL
select 105, 'Advocate Childrens Oak Lawn', 41.7281254209334, -87.731864319817, 'Illinois', 60453
, '4400 95th St', 'Oak Lawn'
;;
  }
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: hospital_location {
    type: location
    sql_latitude: ${lat} ;;
    sql_longitude: ${long} ;;
  }
  dimension: street_address {
    type: string
  }
  dimension: city {
    type: string
  }
  dimension: full_address {
    type: string
    sql:
    ${street_address} ||', ' || ${city} || ', ' || ${state} || ' ' || ${zip}
    ;;
  }

  dimension: lat {
    type: number
    sql: ${TABLE}.lat ;;
  }

  dimension: long {
    type: number
    sql: ${TABLE}.long ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: zip {
    type: zipcode
    sql: cast(${TABLE}.zip as varchar);;
  }
  set: all_hosp_loc {
    fields: [hospital_location, name, state, zip, street_address, city, full_address]
  }
}

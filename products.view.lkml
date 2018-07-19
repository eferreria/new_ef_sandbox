view: products {
  sql_table_name: public.products ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: distribution_center_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.distribution_center_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

dimension: retail_price_range {
    type: tier
    tiers: [0,10,20,30,40,50,60,70,80]
    style: relational
    sql: ${retail_price} ;;

}

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  measure: count {
    label: "Product Count"
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [department, category, id, name, inventory_items.stock_count, inventory_items.sold_count]
  }

  measure: category_count {
      type: count_distinct
      sql: ${category} ;;
  }

  measure: gross_revenue {
      type: sum
      sql: ${retail_price} ;;
  }

  measure: cogs {
      label: "Cost of Goods"
      type: sum
      sql: ${cost} ;;
  }

  measure: profit {
      type: sum
      sql: ${retail_price}-${cost};;
  }


}

view: bsandell {
  derived_table: {
    sql: SELECT * FROM public.bsandell LIMIT 10
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: pitstop_id {
    type: number
    sql: ${TABLE}.pitstop_id ;;
  }

  dimension: car_id {
    type: number
    sql: ${TABLE}.car_id ;;
  }

  dimension: racer_id {
    type: number
    sql: ${TABLE}.racer_id ;;
  }

  dimension_group: start_time {
    type: time
    sql: ${TABLE}.start_time ;;
  }

  dimension_group: end_time {
    type: time
    sql: ${TABLE}.end_time ;;
  }

  dimension: number_of_pit_crew_members {
    type: number
    sql: ${TABLE}.number_of_pit_crew_members ;;
  }

  set: detail {
    fields: [
      pitstop_id,
      car_id,
      racer_id,
      start_time_time,
      end_time_time,
      number_of_pit_crew_members
    ]
  }
}

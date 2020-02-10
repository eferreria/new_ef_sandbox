view: zip_sample {
  derived_table: {
    sql:
    select '41.972071' as FromLat, '-87.756569' as FromLong, '43.245762' as ToLat, '-73.002071' as ToLong, 1 as Visit
    union all
    select '46.972071' as FromLat, '-45.756569' as FromLong, '33.245762' as ToLat, '-53.002071' as ToLong, 1 as Visit
    ;;
  }

  dimension: FromState {
    type: location
    sql_latitude: ${TABLE}.FromLat ;;
    sql_longitude: ${TABLE}.FromLong ;;
  }
  dimension: ToState {
    type: location
    sql_latitude: ${TABLE}.ToLat ;;
    sql_longitude: ${TABLE}.ToLong ;;
  }
  measure: VisitCt {
    type: sum
    sql: ${TABLE}.Visit ;;
  }
}

explore: zip_sample {}

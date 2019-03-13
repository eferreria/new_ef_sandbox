view: test {
  derived_table: {
    sql: SELECT 1 AS col ;;
  }

dimension: col{
  type: string
  primary_key: yes
}
}

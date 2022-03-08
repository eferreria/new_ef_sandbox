include: "users.view"
view: +users {
  sql_table_name: public.users ;;

  dimension: last_name {
    label: "Patient's Last Name"
  }
}

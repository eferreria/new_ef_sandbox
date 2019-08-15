connection: "biquery_publicdata_standard_sql"


include: "*.view.lkml"                       # include all views in this project
# include: "*.dashboard"

fiscal_month_offset: -3

datagroup: om_default_datagroup {
  sql_trigger: select month(current_date) ;;
  max_cache_age: "24 hour"
}

persist_with: om_default_datagroup

explore: operational_metrics {}

connection: "biquery_publicdata_standard_sql"
# Making changes here 2/10
# Another change
# updating the qa_branch
# this update is for the prod_branch


#Adding more changes, changed fiscal offset

include: "*.view.lkml"                       # include all views in this project
# include: "*.dashboard"
include: "/E-Commerce/code_tests/string_sort_test.view"

fiscal_month_offset: -6

datagroup: om_default_datagroup {
  sql_trigger: select month(current_date) ;;
  max_cache_age: "24 hour"
}

persist_with: om_default_datagroup

explore: operational_metrics {}

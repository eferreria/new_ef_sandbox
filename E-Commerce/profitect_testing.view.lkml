# If necessary, uncomment the line below to include explore_source.
# include: "new_ef_sandbox.model.lkml"

# If necessary, uncomment the line below to include explore_source.
# include: "new_ef_sandbox.model.lkml"

view: user_state_summary {
  derived_table: {
    explore_source: users {
      column: selected_dimension {}
      column: count {}

      bind_filters: {
        to_field: users.user_selected_dimension
        from_field: users.user_selected_dimension
      }
      bind_filters: {
        to_field: users.created_date
        from_field:  users.created_date
      }

    }
  }
  dimension: selected_dimension {
    primary_key: yes
  }
  dimension: count {
    hidden: yes
    label: "Group Total Customers"
    type: number
  }
  measure: total_customers {
    type: sum
    sql:  ${count} ;;
  }

}

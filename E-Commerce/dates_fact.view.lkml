explore: dates_fact {}
view: dates_fact {
    derived_table: {
      sql: select
              1001 as acct_id,
              to_date ('03-01-2020', 'MM-DD-YYYY') as event_date,
              to_date ('06-15-2020', 'MM-DD-YYYY') as cancel_date,
              to_date ('06-01-2020', 'MM-DD-YYYY') as change_date,
              to_date ('06-10-2020', 'MM-DD-YYYY') as due_date,
              to_date ('05-01-2020', 'MM-DD-YYYY') as not_after_date,
              to_date ('05-15-2020', 'MM-DD-YYYY') as follow_up_date
               ;;
    }

    parameter: date_selector {
      type: unquoted
      allowed_value: {
        label: "Cancel Date"
        value: "cancel_date"
      }

      allowed_value: {
        label: "Change Date"
        value: "change_date"
      }

      allowed_value: {
        label: "Due Date"
        value: "due_date"
      }

      allowed_value: {
        label: "Follow Up Date"
        value: "follow_up_date"
      }
    }

    dimension: user_selected_date {
      type: date
      sql: ${TABLE}.{% parameter date_selector  %} ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: acct_id {
      type: number
      sql: ${TABLE}."acct_id" ;;
    }

    dimension: event_date {
      type: date
      sql: ${TABLE}."event_date" ;;
    }

    dimension: cancel_date {
      type: date
      sql: ${TABLE}."cancel_date" ;;
    }

    dimension: change_date {
      type: date
      sql: ${TABLE}."change_date" ;;
    }

    dimension: due_date {
      type: date
      sql: ${TABLE}."due_date" ;;
    }

    dimension: not_after_date {
      type: date
      sql: ${TABLE}."not_after_date" ;;
    }

    dimension: follow_up_date {
      type: date
      sql: ${TABLE}."follow_up_date" ;;
    }

    set: detail {
      fields: [
        acct_id,
        event_date,
        cancel_date,
        change_date,
        due_date,
        not_after_date,
        follow_up_date
      ]
    }
  }

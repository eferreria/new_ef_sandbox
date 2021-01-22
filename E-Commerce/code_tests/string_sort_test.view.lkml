view: string_sort_test {
  derived_table: {
    sql:
    select 'Apple' as field, 1 as nat_sort, 'No hidden chars' as notes
    UNION ALL
    select 'apple' as field, 2, 'No hidden chars'
    UNION ALL
    select ' Apple' as field, 3, 'Trailing space'
    UNION ALL
    select concat(chr(9) , 'apple'), 4, 'Char(9) - Tab'
    UNION ALL
    select 'Banana' as field, 5 as nat_sort, 'No hidden chars' as notes
    UNION ALL
    select 'cranberry' as field, 6, 'No hidden chars'
    UNION ALL
    select ' Dates' as field, 7, 'Trailing space'
    UNION ALL
    select concat(chr(9) , 'elderberry'), 8, 'Char(9) - Tab'
    ;;
  }

  dimension: field { order_by_field: nat_sort}
  dimension: nat_sort {}
  dimension: notes  {}
}

explore: string_sort_test {}

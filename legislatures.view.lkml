view: legislatures {
  sql_table_name: kenelly_thesis.legislatures ;;

  dimension: legislature_id {
    #primary_key: yes
    type: number
    sql: ${TABLE}.legislature_id ;;
  }

  dimension: year_end {
    type: number
    sql: ${TABLE}.year_end ;;
  }


  dimension: year_start {
    type: number
    sql: ${TABLE}.year_start ;;
  }

  measure: count {
    type: count
    drill_fields: [legislature_id]
  }

}

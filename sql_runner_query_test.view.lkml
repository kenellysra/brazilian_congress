view: sql_runner_query_test {
  derived_table: {
    sql: SELECT
        ceap.sgUF  AS ceap_congressperson_state,
        COALESCE(SUM(ceap.vlrDocumento ), 0) AS ceap_total_spent
      FROM kenelly_thesis.ceap  AS ceap

      GROUP BY 1
      ORDER BY 2 DESC
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: ceap_congressperson_state {
    type: string
    sql: ${TABLE}.ceap_congressperson_state ;;
  }

  dimension: ceap_total_spent {
    type: number
    sql: ${TABLE}.ceap_total_spent ;;
  }

  set: detail {
    fields: [ceap_congressperson_state, ceap_total_spent]
  }
}

view: political_party_timeline_1 {
  derived_table: {
    sql: SELECT
        ceap.sgPartido  AS ceap_congressperson_political_party,
        ceap.nuLegislatura AS start_year,
        MAX(ceap.nuLegislatura+4) AS end_year,
        ROUND(COALESCE(SUM(ceap.vlrDocumento ), 0),0) AS ceap_total_spent,
        COUNT(ceap.ideCadastro) as ceap_count_congressperson
      FROM kenelly_thesis.ceap  AS ceap
      GROUP BY 1,2
      ORDER BY 1,2 DESC
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: ceap_congressperson_political_party {
    type: string
    sql: ${TABLE}.ceap_congressperson_political_party ;;
  }

  dimension: start_year {
    type: number
    sql: ${TABLE}.start_year ;;
  }

  dimension: end_year {
    type: number
    sql: ${TABLE}.end_year ;;
  }

  dimension: ceap_total_spent {
    type: number
    sql: ${TABLE}.ceap_total_spent ;;
  }

  dimension: ceap_count_congressperson {
    type: number
    sql: ${TABLE}.ceap_count_congressperson ;;
  }

  set: detail {
    fields: [ceap_congressperson_political_party, start_year, end_year, ceap_total_spent, ceap_count_congressperson]
  }
}

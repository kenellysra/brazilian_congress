view: congressperson_spending_facts {
  derived_table: {
    sql: SELECT ceap.ideCadastro AS congressperson_id,
        ceap.txNomeParlamentar  AS congressperson_name,
        MAX(vlrDocumento) AS expensive_expense,
        MIN(vlrDocumento) AS cheaper_expense,
        ROUND(SUM(vlrDocumento), 2) AS  total_spent
        FROM kenelly_thesis.ceap ceap
        LEFT JOIN kenelly_thesis.congressperson  congressperson
        ON ceap.ideCadastro = (CAST(SUBSTR(congressperson._uri_, 53, 6) AS INT64))
      GROUP BY 1, 2
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: congressperson_id {
    type: number
    sql: ${TABLE}.congressperson_id ;;
  }

  dimension: congressperson_name {
    type: string
    sql: ${TABLE}.congressperson_name ;;
  }

  dimension: expensive_expense {
    type: number
    sql: ${TABLE}.expensive_expense ;;
    value_format: "\" R\"$#,##0.00"
  }

  dimension: cheaper_expense {
    type: number
    sql: ${TABLE}.cheaper_expense ;;
    value_format: "\" R\"$#,##0.00"
  }

  dimension: total_spent {
    type: number
    sql: ${TABLE}.total_spent ;;
    value_format: "\" R\"$#,##0.00"
  }

  set: detail {
    fields: [
      congressperson_id,
      congressperson_name,
      expensive_expense,
      cheaper_expense,
      total_spent
    ]
  }
}

view: sql_runner_query {
  derived_table: {
    sql: SELECT
        ceap.vlrRestituicao  AS ceap_spending_reimbursement_amount
      FROM kenelly_thesis.ceap  AS ceap

      GROUP BY 1
      ORDER BY 1
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: ceap_spending_reimbursement_amount {
    type: string
    sql: ${TABLE}.ceap_spending_reimbursement_amount ;;
  }

  set: detail {
    fields: [ceap_spending_reimbursement_amount]
  }
}

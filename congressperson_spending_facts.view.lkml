view: congressperson_spending_facts {
  derived_table: {
    sql: SELECT ceap.ideCadastro AS congressperson_id,
        ceap.txNomeParlamentar  AS congressperson_name,
        datEmissao AS spending_date,
        txtDescricao AS spending_category,
        congressperson.siglasexo AS genre,
        sgPartido AS political_party,
        sgUF AS state,
        source_year AS source_year,
        MAX(vlrDocumento) AS expensive,
        MIN(vlrDocumento) AS cheaper,
        ROUND(SUM(vlrDocumento), 2) AS  total_spent
        FROM kenelly_thesis.ceap ceap
        LEFT JOIN kenelly_thesis.congressperson  congressperson
        ON ceap.ideCadastro = (CAST(SUBSTR(congressperson._uri_, 53, 6) AS INT64))
      GROUP BY 1, 2, 3, 4, 5, 6 , 7, 8
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

  dimension_group: spending_date {
    type: time
    sql: ${TABLE}.spending_date ;;
  }

  dimension: spending_category {
    type: string
    sql: ${TABLE}.spending_category ;;
  }

  dimension: genre {
    type: string
    sql: ${TABLE}.genre ;;
  }

  dimension: political_party {
    type: string
    sql: ${TABLE}.political_party ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: source_year {
    type: number
    sql: ${TABLE}.source_year ;;
  }

  dimension: expensive {
    type: number
    sql: ${TABLE}.expensive ;;
  }

  dimension: cheaper {
    type: number
    sql: ${TABLE}.cheaper ;;
  }

  dimension: total_spent {
    type: number
    sql: ${TABLE}.total_spent ;;
  }

  set: detail {
    fields: [
      congressperson_id,
      congressperson_name,
      spending_date_time,
      spending_category,
      genre,
      political_party,
      state,
      source_year,
      expensive,
      cheaper,
      total_spent
    ]
  }
}

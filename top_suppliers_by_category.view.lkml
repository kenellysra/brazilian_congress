view: top_suppliers_by_category {
  derived_table: {
    sql_trigger_value: select 1 ;;
    sql: WITH css AS (
      select
        ceap.txNomeParlamentar AS congressperson_name,
        ceap.txtDescricao AS spending_category,
        ceap.txtFornecedor AS supplier_name,
        SUM(ceap.vlrDocumento) AS total_spent
        FROM kenelly_thesis.ceap AS ceap
        GROUP BY 1,2,3
      )

      select *
      , RANK() OVER(PARTITION BY congressperson_name, spending_category ORDER BY total_spent DESC) as rank
        FROM css
        ORDER BY 1,2,5
       ;;
  }


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: congressperson_name {
    type: string
    sql: ${TABLE}.congressperson_name ;;
  }


  dimension: spending_category {
    type: string
    sql: ${TABLE}.spending_category ;;
#     link: {
#       label: "Google"
#       url: "http://www.google.com/search?q={{ value }}"
#       icon_url: "http://google.com/favicon.ico"
#     }
    html: <a target="new" href="https://www.google.com/">Link to Google</a>;;
  }

  dimension: supplier_name {
    type: string
    sql: ${TABLE}.supplier_name ;;
  }

  dimension: total_spent_dimension {
    type: number
    hidden: yes
    sql: ${TABLE}.total_spent ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  measure: total_spent{
    type: sum
    sql:${total_spent_dimension} ;;
    value_format: "\R$#,##0.00"
  }
  set: detail {
    fields: [congressperson_name, spending_category, supplier_name, total_spent, rank]
  }
}

view: congressperson_career {
  derived_table: {
    sql: SELECT
         nome AS congressperson_name,
         idLegislaturaFinal AS legislature_end_id,
         idLegislaturaInicial AS legislature_start_id,
         legislature_id AS legislature_id,
         year_start AS year_start,
         (SELECT MAX(year_end) FROM kenelly_thesis.legislatures JOIN kenelly_thesis.congressperson c ON c.idLegislaturaFinal = legislatures.legislature_id WHERE c.nome = congressperson.nome ) AS year_end
         FROM kenelly_thesis.congressperson AS congressperson
         LEFT JOIN kenelly_thesis.legislatures AS legislatures
         ON congressperson.idLegislaturaInicial = legislatures.legislature_id
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

  dimension: legislature_end_id {
    type: number
    sql: ${TABLE}.legislature_end_id ;;
  }

  dimension: legislature_start_id {
    type: number
    sql: ${TABLE}.legislature_start_id ;;
  }

  dimension: legislature_id {
    type: number
    sql: ${TABLE}.legislature_id ;;
  }

  dimension: year_start {
    type: number
    sql: ${TABLE}.year_start ;;
  }

  dimension: year_end {
    type: number
    sql: ${TABLE}.year_end ;;
  }

  measure: congressperson_career{
    type: number
    sql: ${year_end} - ${year_start} ;;
  }

  set: detail {
    fields: [
      congressperson_name,
      legislature_end_id,
      legislature_start_id,
      legislature_id,
      year_start,
      year_end
    ]
  }
}

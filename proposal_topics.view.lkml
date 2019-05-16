view: proposal_topics {
  sql_table_name: kenelly_thesis.proposal_topics ;;

  dimension: ano {
    type: number
    sql: ${TABLE}.ano ;;
  }

  dimension: cod_tema {
    type: number
    sql: ${TABLE}.codTema ;;
  }

  dimension: numero {
    type: number
    sql: ${TABLE}.numero ;;
  }

  dimension: relevancia {
    type: number
    sql: ${TABLE}.relevancia ;;
  }

  dimension: sigla_tipo {
    type: string
    sql: ${TABLE}.siglaTipo ;;
  }

  dimension: source_year {
    type: number
    sql: ${TABLE}.source_year ;;
  }

  dimension: tema {
    type: string
    sql: ${TABLE}.tema ;;
  }

  dimension: uri_proposicao {
    type: string
    sql: ${TABLE}.uriProposicao ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

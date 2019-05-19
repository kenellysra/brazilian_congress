view: proposal_topics {
  sql_table_name: kenelly_thesis.proposal_topics ;;

  dimension: proposal_year {
    type: number
    sql: ${TABLE}.ano ;;
  }

  dimension: proposal_topic_code{
    type: number
    sql: ${TABLE}.codTema ;;
  }

  dimension: proposal_number {
    type: number
    sql: ${TABLE}.numero ;;
  }

  dimension: proposal_relevance {
    type: number
    sql: ${TABLE}.relevancia ;;
  }

  dimension: proposal_type_initials {
    type: string
    sql: ${TABLE}.siglaTipo ;;
  }

  dimension: source_year {
    type: number
    sql: ${TABLE}.source_year ;;
  }

  dimension: proposal_topic {
    type: string
    sql: ${TABLE}.tema ;;
  }

  dimension: proposal_uri {
    type: string
    sql: ${TABLE}.uriProposicao ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

view: proposal_topics {
  sql_table_name: kenelly_thesis.proposal_topics ;;

  dimension: proposal_id {
    type: number
    primary_key: yes
    sql: CAST(SUBSTR(${proposal_uri}, 55, 7) AS INT64);;
  }

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
    sql: CASE
              WHEN ${TABLE}.tema  = 'Criminal Law and Criminal Procedure Law' THEN 'Criminal Law'
              WHEN ${TABLE}.tema = 'Civil Law and Civil Procedural Law' THEN 'Civil Law'
              WHEN ${TABLE}.tema = 'Environment and Sustainable Development' THEN 'Environment and Sustainability'
              WHEN ${TABLE}.tema = 'Aviation, Transportation and Mobility' THEN 'Aviation, Transports and Mobitily'
              ELSE ${TABLE}.tema
              END;;
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

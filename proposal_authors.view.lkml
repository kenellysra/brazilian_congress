view: proposal_authors {
  sql_table_name: kenelly_thesis.proposal_authors ;;

  dimension: author_type_code {
    type: number
    sql: ${TABLE}.codTipoAutor ;;
  }

  dimension: congressperson_id {
    type: number
    sql: ${TABLE}.idDeputadoAutor ;;
  }

  dimension: proposal_id {
    type: number
    sql: ${TABLE}.idProposicao ;;
  }

  dimension: author_name {
    type: string
    sql: ${TABLE}.nomeAutor ;;
  }

  dimension: author_political_party_initials {
    type: string
    sql: ${TABLE}.siglaPartidoAutor ;;
  }

  dimension: author_state {
    type: string
    sql: ${TABLE}.siglaUFAutor ;;
  }

  dimension: source_year {
    type: number
    sql: ${TABLE}.source_year ;;
  }

  dimension: author_type {
    type: string
    sql: ${TABLE}.tipoAutor ;;
  }

  dimension: congressperson_uri {
    type: string
    sql: ${TABLE}.uriAutor ;;
  }

  dimension: author_political_party_uri {
    type: string
    sql: ${TABLE}.uriPartidoAutor ;;
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

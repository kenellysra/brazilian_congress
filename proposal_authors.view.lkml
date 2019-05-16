view: proposal_authors {
  sql_table_name: kenelly_thesis.proposal_authors ;;

  dimension: cod_tipo_autor {
    type: number
    sql: ${TABLE}.codTipoAutor ;;
  }

  dimension: id_deputado_autor {
    type: number
    sql: ${TABLE}.idDeputadoAutor ;;
  }

  dimension: id_proposicao {
    type: number
    sql: ${TABLE}.idProposicao ;;
  }

  dimension: nome_autor {
    type: string
    sql: ${TABLE}.nomeAutor ;;
  }

  dimension: sigla_partido_autor {
    type: string
    sql: ${TABLE}.siglaPartidoAutor ;;
  }

  dimension: sigla_ufautor {
    type: string
    sql: ${TABLE}.siglaUFAutor ;;
  }

  dimension: source_year {
    type: number
    sql: ${TABLE}.source_year ;;
  }

  dimension: tipo_autor {
    type: string
    sql: ${TABLE}.tipoAutor ;;
  }

  dimension: uri_autor {
    type: string
    sql: ${TABLE}.uriAutor ;;
  }

  dimension: uri_partido_autor {
    type: string
    sql: ${TABLE}.uriPartidoAutor ;;
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

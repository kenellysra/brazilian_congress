view: congressperson {
  sql_table_name: kenelly_thesis.congressperson ;;

  dimension: _uri_ {
    type: string
    sql: ${TABLE}._uri_ ;;
  }

  dimension: cpf {
    type: string
    sql: ${TABLE}.cpf ;;
  }

  dimension_group: data_falecimento {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dataFalecimento ;;
  }

  dimension_group: data_nascimento {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.dataNascimento ;;
  }

  dimension: id_legislatura_final {
    type: number
    sql: ${TABLE}.idLegislaturaFinal ;;
  }

  dimension: id_legislatura_inicial {
    type: number
    sql: ${TABLE}.idLegislaturaInicial ;;
  }

  dimension: municipio_nascimento {
    type: string
    sql: ${TABLE}.municipioNascimento ;;
  }

  dimension: nome {
    type: string
    sql: ${TABLE}.nome ;;
  }

  dimension: nome_civil {
    type: string
    sql: ${TABLE}.nomeCivil ;;
  }

  dimension: sigla_sexo {
    type: string
    sql: ${TABLE}.siglaSexo ;;
  }

  dimension: uf_nascimento {
    type: string
    sql: ${TABLE}.ufNascimento ;;
  }

  dimension: url_rede_social {
    type: string
    sql: ${TABLE}.urlRedeSocial ;;
  }

  dimension: url_website {
    type: string
    sql: ${TABLE}.urlWebsite ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

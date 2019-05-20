view: congressperson {
  sql_table_name: kenelly_thesis.congressperson ;;


  dimension: id {
    primary_key: yes
    type: number
    sql: CAST(SUBSTR(${uri}, 53, 6) AS INT64);;
  }
  dimension: uri {
    type: string
    sql: ${TABLE}._uri_ ;;
  }

  dimension: document_number {
    type: string
    sql: ${TABLE}.cpf ;;
  }

  dimension_group: death_date {
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

  dimension_group: birth_date {
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

  dimension: legislature_end_id {
    type: number
    sql: ${TABLE}.idLegislaturaFinal ;;
  }

  dimension: legislature_start_id {
    type: number
    sql: ${TABLE}.idLegislaturaInicial ;;
  }

  dimension: birth_city {
    type: string
    sql: ${TABLE}.municipioNascimento ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.nome ;;
  }

  dimension: full_name {
    type: string
    sql: ${TABLE}.nomeCivil ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.siglaSexo ;;
  }

  dimension: birth_state {
    type: string
    sql: ${TABLE}.ufNascimento ;;
  }

  dimension: social_media_url {
    type: string
    sql: ${TABLE}.urlRedeSocial ;;
  }

  dimension: website_url {
    type: string
    sql: ${TABLE}.urlWebsite ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

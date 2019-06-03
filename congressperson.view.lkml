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

  measure: count_distinct {
    type: count_distinct
    sql:  ${id};;

  }

  dimension: top_banner_congressperson {
    sql: ${TABLE}.municipioNascimento;;
    html: <img src="http://www.camara.gov.br/internet/bancoimagem/banco/img201506302027107363015.jpg" style="width:100%;height:70%;"> ;;
  }

  dimension: gender_full {
    type: string
    sql: CASE
              WHEN ${gender} = 'M' THEN 'Male'
              WHEN ${gender} = 'F' THEN 'Female'
              END;;
  }

  measure: congressperson_career {
    type: number
    sql: CASE
            WHEN ${legislature_start_id} = 56 THEN 1
            ELSE ((${legislature_end_id} - ${legislature_start_id}) +1 ) *4
            END;;
    #value_format: "0 \" Years\""
  }

  dimension: congressperson_image {
    type: string
    sql: ${id};;
    html: <img src="https://www.camara.leg.br/internet/deputado/bandep/{{value}}.jpgmaior.jpg" / style = "width:30%;height:30%"> ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

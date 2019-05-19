view: proposals {
  sql_table_name: kenelly_thesis.proposals ;;

  dimension: proposal_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: proposal_year {
    type: number
    sql: ${TABLE}.ano ;;
  }

  dimension: proposal_type_code {
    type: number
    sql: ${TABLE}.codTipo ;;
  }

  dimension_group: proposal_initial_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.dataApresentacao ;;
  }

  dimension: proposal_type_description{
    type: string
    sql: ${TABLE}.descricaoTipo ;;
  }

  dimension: proposal_summary {
    type: string
    sql: ${TABLE}.ementa ;;
  }

  dimension: proposal_detailed_description {
    type: string
    sql: ${TABLE}.ementaDetalhada ;;
  }

  dimension: proposal_keywords {
    type: string
    sql: ${TABLE}.keywords ;;
  }

  dimension: proposal_number {
    type: number
    sql: ${TABLE}.numero ;;
  }

  dimension: proposal_type_initials {
    type: string
    sql: ${TABLE}.siglaTipo ;;
  }

  dimension: source_year {
    type: number
    sql: ${TABLE}.source_year ;;
  }

  dimension_group: proposal_last_updated_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.ultimoStatus_dataHora ;;
  }

  dimension: proposal_last_updated_status{
    type: string
    sql: ${TABLE}.ultimoStatus_descricaoSituacao ;;
  }

  dimension: procedure_description_last_updated_status {
    type: string
    sql: ${TABLE}.ultimoStatus_descricaoTramitacao ;;
  }

  dimension: dispatch_last_status {
    type: string
    sql: ${TABLE}.ultimoStatus_despacho ;;
  }

  dimension: responsible_body_last_status {
    type: number
    value_format_name: id
    sql: ${TABLE}.ultimoStatus_idOrgao ;;
  }

  dimension: situation_id_last_status {
    type: number
    value_format_name: id
    sql: ${TABLE}.ultimoStatus_idSituacao ;;
  }

  dimension: procedure_type_id_last_status {
    type: number
    value_format_name: id
    sql: ${TABLE}.ultimoStatus_idTipoTramitacao ;;
  }

  dimension: regime_last_status {
    type: string
    sql: ${TABLE}.ultimoStatus_regime ;;
  }

  dimension: sequence_last_status {
    type: number
    sql: ${TABLE}.ultimoStatus_sequencia ;;
  }

  dimension: responsible_body_initials_last_status {
    type: string
    sql: ${TABLE}.ultimoStatus_siglaOrgao ;;
  }

  dimension: responsible_body_uri_last_status {
    type: string
    sql: ${TABLE}.ultimoStatus_uriOrgao ;;
  }

  dimension: referendary_uri_last_status {
    type: string
    sql: ${TABLE}.ultimoStatus_uriRelator ;;
  }

  dimension: last_status_url {
    type: string
    sql: ${TABLE}.ultimoStatus_url ;;
  }

  dimension: uri {
    type: string
    sql: ${TABLE}.uri ;;
  }

  dimension: uri_responsible_body_number {
    type: string
    sql: ${TABLE}.uriOrgaoNumerador ;;
  }

  dimension: uri_prop_preceding {
    type: string
    sql: ${TABLE}.uriPropAnterior ;;
  }

  dimension: uri_prop_posterior {
    type: string
    sql: ${TABLE}.uriPropPosterior ;;
  }

  dimension: uri_prop_principal {
    type: string
    sql: ${TABLE}.uriPropPrincipal ;;
  }

  dimension: url_inteiro_content {
    type: string
    sql: ${TABLE}.urlInteiroTeor ;;
  }

  dimension: urn_final {
    type: string
    sql: ${TABLE}.urnFinal ;;
  }

  measure: count {
    type: count
    drill_fields: [proposal_id]
  }
}

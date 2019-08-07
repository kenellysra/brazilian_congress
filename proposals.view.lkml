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
      day_of_week,
      day_of_week_index,
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

  dimension: is_approved {
    type: yesno
    sql: lower(${dispatch_last_status}) LIKE '%aprovado%';;
  }

  dimension: proposition_type {
    type: string
    sql: CASE
            WHEN lower(${proposal_type_description}) LIKE '%emenda%' THEN 'Amendment'
            WHEN lower(${proposal_type_description}) LIKE '%projeto de lei%' THEN 'Bill'
            WHEN ${proposal_type_initials} = 'REQ' THEN 'Requirement'
            WHEN lower(${proposal_type_description}) LIKE '%parecer%' THEN 'Opinion'
            ELSE 'Others'
            END
          ;;
  }

  dimension: proposition_status {
    type: string
    sql: CASE
            WHEN lower(${proposal_last_updated_status}) LIKE '%aguardando%' OR ${procedure_type_id_last_status} = 319 THEN 'On Hold'
            WHEN lower(${proposal_last_updated_status}) = '%arquivada%' OR ${procedure_type_id_last_status} = 502 THEN 'Filed'
            WHEN ${situation_id_last_status} = 1140 THEN 'Transformed in Legal Norm'
            WHEN ${situation_id_last_status} = 1230 THEN 'Transformed in New Proposition'
            WHEN ${situation_id_last_status} = 1285 THEN 'Requirement Process Completed'
            WHEN ${procedure_type_id_last_status}= 100 THEN 'Proposition Submitted'
            ELSE 'Others'
            END
            ;;

  }

  dimension: proposal_duration {
    type: number
    sql: DATE_DIFF( ${proposal_last_updated_date_date}, ${proposal_initial_date_date},YEAR) ;;
  }

  dimension: top_banner_proposals {
    sql: ${TABLE}.id;;
    html: <img src="https://www.abla.com.br/wp-content/uploads/2017/07/lei.jpg" style="width:100%;height:70%;"> ;;
  }


  measure: count {
    type: count
    drill_fields: [proposal_id, proposal_year, proposition_status, proposition_type]
  }
}

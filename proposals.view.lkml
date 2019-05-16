view: proposals {
  sql_table_name: kenelly_thesis.proposals ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: ano {
    type: number
    sql: ${TABLE}.ano ;;
  }

  dimension: cod_tipo {
    type: number
    sql: ${TABLE}.codTipo ;;
  }

  dimension_group: data_apresentacao {
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

  dimension: descricao_tipo {
    type: string
    sql: ${TABLE}.descricaoTipo ;;
  }

  dimension: ementa {
    type: string
    sql: ${TABLE}.ementa ;;
  }

  dimension: ementa_detalhada {
    type: string
    sql: ${TABLE}.ementaDetalhada ;;
  }

  dimension: keywords {
    type: string
    sql: ${TABLE}.keywords ;;
  }

  dimension: numero {
    type: number
    sql: ${TABLE}.numero ;;
  }

  dimension: sigla_tipo {
    type: string
    sql: ${TABLE}.siglaTipo ;;
  }

  dimension: source_year {
    type: number
    sql: ${TABLE}.source_year ;;
  }

  dimension_group: ultimo_status_data_hora {
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

  dimension: ultimo_status_descricao_situacao {
    type: string
    sql: ${TABLE}.ultimoStatus_descricaoSituacao ;;
  }

  dimension: ultimo_status_descricao_tramitacao {
    type: string
    sql: ${TABLE}.ultimoStatus_descricaoTramitacao ;;
  }

  dimension: ultimo_status_despacho {
    type: string
    sql: ${TABLE}.ultimoStatus_despacho ;;
  }

  dimension: ultimo_status_id_orgao {
    type: number
    value_format_name: id
    sql: ${TABLE}.ultimoStatus_idOrgao ;;
  }

  dimension: ultimo_status_id_situacao {
    type: number
    value_format_name: id
    sql: ${TABLE}.ultimoStatus_idSituacao ;;
  }

  dimension: ultimo_status_id_tipo_tramitacao {
    type: number
    value_format_name: id
    sql: ${TABLE}.ultimoStatus_idTipoTramitacao ;;
  }

  dimension: ultimo_status_regime {
    type: string
    sql: ${TABLE}.ultimoStatus_regime ;;
  }

  dimension: ultimo_status_sequencia {
    type: number
    sql: ${TABLE}.ultimoStatus_sequencia ;;
  }

  dimension: ultimo_status_sigla_orgao {
    type: string
    sql: ${TABLE}.ultimoStatus_siglaOrgao ;;
  }

  dimension: ultimo_status_uri_orgao {
    type: string
    sql: ${TABLE}.ultimoStatus_uriOrgao ;;
  }

  dimension: ultimo_status_uri_relator {
    type: string
    sql: ${TABLE}.ultimoStatus_uriRelator ;;
  }

  dimension: ultimo_status_url {
    type: string
    sql: ${TABLE}.ultimoStatus_url ;;
  }

  dimension: uri {
    type: string
    sql: ${TABLE}.uri ;;
  }

  dimension: uri_orgao_numerador {
    type: string
    sql: ${TABLE}.uriOrgaoNumerador ;;
  }

  dimension: uri_prop_anterior {
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

  dimension: url_inteiro_teor {
    type: string
    sql: ${TABLE}.urlInteiroTeor ;;
  }

  dimension: urn_final {
    type: string
    sql: ${TABLE}.urnFinal ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}

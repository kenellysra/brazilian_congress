view: ceap {
  sql_table_name: kenelly_thesis.ceap ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: congressperson_legislature_code {
    type: number
    sql: ${TABLE}.codLegislatura ;;
  }

  dimension_group: spending_date {
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
    sql: ${TABLE}.datEmissao ;;
  }

  dimension: congressperson_record_id {
    type: number
    sql: ${TABLE}.ideCadastro ;;
  }

  dimension: spending_document_id {
    type: number
    sql: ${TABLE}.ideDocumento ;;
  }

  dimension: spending_document_type {
    type: number
    sql: ${TABLE}.indTipoDocumento ;;
  }

  dimension: congressperson_card_number {
    type: number
    sql: ${TABLE}.nuCarteiraParlamentar ;;
  }

  dimension: compressperson_id {
    type: number
    sql: ${TABLE}.nuDeputadoId ;;
  }

  dimension: congressperson_legislature_number {
    type: number
    sql: ${TABLE}.nuLegislatura ;;
  }

  dimension: spending_year {
    type: number
    sql: ${TABLE}.numAno ;;
  }

  dimension: spending_detail_id {
    type: number
    sql: ${TABLE}.numEspecificacaoSubCota ;;
  }

  dimension: spending_lot_number {
    type: number
    sql: ${TABLE}.numLote ;;
  }

  dimension: spending_month {
    type: number
    sql: ${TABLE}.numMes ;;
  }

  dimension: spending_portion {
    type: number
    sql: ${TABLE}.numParcela ;;
  }

  dimension: spending_reimbursement_number {
    type: number
    sql: ${TABLE}.numRessarcimento ;;
  }

  dimension: spending_category_id {
    type: number
    sql: ${TABLE}.numSubCota ;;
  }

  dimension: songressperson_political_party{
    type: string
    sql: ${TABLE}.sgPartido ;;
  }

  dimension: congressperson_state {
    type: string
    sql: ${TABLE}.sgUF ;;
  }

  dimension: source_year {
    type: number
    sql: ${TABLE}.source_year ;;
  }

  dimension: congressperson_name {
    type: string
    sql: ${TABLE}.txNomeParlamentar ;;
  }

  dimension: supplier_id {
    type: string
    sql: ${TABLE}.txtCNPJCPF ;;
  }

  dimension: spending_category {
    type: string
    sql: ${TABLE}.txtDescricao ;;
  }

  dimension: spending_detail {
    type: string
    sql: ${TABLE}.txtDescricaoEspecificacao ;;
  }

  dimension: supplier_name {
    type: string
    sql: ${TABLE}.txtFornecedor ;;
  }

  dimension: supplier_number {
    type: string
    sql: ${TABLE}.txtNumero ;;
  }

  dimension: flight_passenger {
    type: string
    sql: ${TABLE}.txtPassageiro ;;
  }

  dimension: flight_route {
    type: string
    sql: ${TABLE}.txtTrecho ;;
  }

  dimension: spending_document_amount {
    type: number
    sql: ${TABLE}.vlrDocumento ;;
  }

  dimension: spending_gross_value {
    type: number
    sql: ${TABLE}.vlrGlosa ;;
  }

  dimension: spending_net_value {
    type: number
    sql: ${TABLE}.vlrLiquido ;;
  }

  dimension: spending_reimbursement_amount {
    type: string
    sql: ${TABLE}.vlrRestituicao ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}

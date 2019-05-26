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

  dimension: congressperson_id {
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

  dimension: congressperson_number_id {
    type: number
    sql: ${TABLE}.nuDeputadoId ;;
  }

  dimension: congressperson_legislature_year {
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

  dimension: congressperson_political_party{
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
    value_format: "\" R\"$#,##0.00"
  }

  dimension: spending_gross_value {
    type: number
    sql: ${TABLE}.vlrGlosa ;;
    value_format: "\" R\"$#,##0.00"
  }

  dimension: spending_net_value {
    type: number
    sql: ${TABLE}.vlrLiquido ;;
    value_format: "\" R\"$#,##0.00"
  }

  dimension: spending_reimbursement_amount {
    type: string
    sql: ${TABLE}.vlrRestituicao ;;
    value_format: "\" R\"$#,##0.00"
  }

  dimension: legislature_tier {
    type: tier
    style: integer
    tiers: [2007, 2011, 2015, 2019]
    sql:  ${spending_year} ;;
  }

  dimension: state {
    sql: ${congressperson_state} ;;
    map_layer_name: my_neighborhood_layer
  }

  dimension: congressperson_image {
    type: string
    sql: ${congressperson_id};;
    html: <img src="https://www.camara.leg.br/internet/deputado/bandep/pagina_do_deputado/{{value}}.jpg" /> ;;
  }


  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: count_congressperson {
    type: count_distinct
    sql:  ${congressperson_id};;
   # drill_fields: [congressperson_name, congressperson_id]
  }

  measure: total_spent {
    type: sum
    sql: ${spending_document_amount} ;;
    value_format: "\" R\"$#,##0.00"
  }
}

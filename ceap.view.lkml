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
    html: <img src="https://www.camara.leg.br/internet/deputado/bandep/{{value}}.jpgmaior.jpg" /> ;;
  }

  measure: minimum_annual_salary{
    type: number
    sql: CASE
                WHEN ${spending_year} = 2008 THEN (415.00 * 13)
                WHEN ${spending_year} = 2009 THEN (465.00 * 13)
                WHEN ${spending_year} = 2010 THEN (510.00 * 13)
                WHEN ${spending_year} = 2011 THEN (545.00 * 13)
                WHEN ${spending_year} = 2012 THEN (622.00 * 13)
                WHEN ${spending_year} = 2013 THEN (678.00 * 13)
                WHEN ${spending_year} = 2014 THEN (724.00 * 13)
                WHEN ${spending_year} = 2015 THEN (788.00 * 13)
                WHEN ${spending_year} = 2016 THEN (880.00 * 13)
                WHEN ${spending_year} = 2017 THEN (937.00 * 13)
                WHEN ${spending_year} = 2018 THEN (954.00 * 13)
                WHEN ${spending_year} = 2019 THEN (998.00 * 13)
        END;;
    value_format: "\" R\"$#,##0.00"
  }

  dimension: top_banner_brazilian_congress {
    sql: ${TABLE}.sgUF ;;
    html: <img src="https://www.congressonacional.leg.br/congresso-theme/images/_carrossel_foto1.jpg" style="width:100%;height:10%;"> ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: maximum_spending{
    type: max
    sql: ${spending_document_amount} ;;
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

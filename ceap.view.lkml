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
      day_of_week,
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

  dimension: state_full_name {
    type: string
    sql: CASE
              WHEN ${congressperson_state} = 'AC' THEN 'Acre'
              WHEN ${congressperson_state} = 'AL' THEN 'Alagoas'
              WHEN ${congressperson_state} = 'AM' THEN 'Amazonas'
              WHEN ${congressperson_state} = 'AP' THEN 'Amapá'
              WHEN ${congressperson_state} = 'BA' THEN 'Bahia'
              WHEN ${congressperson_state} = 'CE' THEN 'Ceará'
              WHEN ${congressperson_state} = 'DF' THEN 'Distrito Federal'
              WHEN ${congressperson_state} = 'ES' THEN 'Espírito Santo'
              WHEN ${congressperson_state} = 'GO' THEN 'Goiás'
              WHEN ${congressperson_state} = 'MA' THEN 'Maranhão'
              WHEN ${congressperson_state} = 'MT' THEN 'Mato Grosso'
              WHEN ${congressperson_state} = 'MG' THEN 'Minas Gerais'
              WHEN ${congressperson_state} = 'MS' THEN 'Mato Grosso do Sul'
              WHEN ${congressperson_state} = 'PA' THEN 'Pará'
              WHEN ${congressperson_state} = 'PB' THEN 'Paraíba'
              WHEN ${congressperson_state} = 'PE' THEN 'Pernambuco'
              WHEN ${congressperson_state} = 'PI' THEN 'Piauí'
              WHEN ${congressperson_state} = 'PR' THEN 'Paraná'
              WHEN ${congressperson_state} = 'RJ' THEN 'Rio de Janeiro'
              WHEN ${congressperson_state} = 'RN' THEN 'Rio Grande do Norte'
              WHEN ${congressperson_state} = 'RO' THEN 'Rondônia'
              WHEN ${congressperson_state} = 'RR' THEN 'Roraima'
              WHEN ${congressperson_state} = 'RS' THEN 'Rio Grande do Sul'
              WHEN ${congressperson_state} = 'SC' THEN 'Santa Catarina'
              WHEN ${congressperson_state} = 'SE' THEN 'Sergipe'
              WHEN ${congressperson_state} = 'SP' THEN 'São Paulo'
              WHEN ${congressperson_state} = 'TO' THEN 'Tocantins'
              ELSE NULL
              END

              ;;
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

  measure: proportional_spending_by_party{
    type: number
    sql: ${spending_document_amount}/${count_congressperson} ;;
  }

  measure: congressperson_spending {
    type: number
    sql: ${spending_document_amount} ;;
  }

  measure: total_spent {
    type: sum
    sql: ${spending_document_amount} ;;
    value_format: "\" R\"$#,##0.00"
  }

  measure: average_spending {
    type: average
    sql: ${spending_document_amount} ;;
    value_format: "\" R\"$#,##0.00"
  }

  measure: most_recent_spending{
    type:  date
    sql:  MAX(${spending_date_raw});;
    convert_tz: no
  }

  #Comparison between one congressperson and all the others
  filter: congressperson_select {
    suggest_dimension: congressperson_name
  }

  dimension: congressperson_comparitor {
    type:  string
    sql: CASE
              WHEN {% condition congressperson_select %} ${congressperson_name} {% endcondition %}
                THEN ${congressperson_name}
              ELSE 'Others Congresspeople'
          END;;

  }
}

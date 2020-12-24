view: ceap {
  label: "ceap 2"
  sql_table_name: kenelly_thesis.ceap ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    drill_fields: [congressperson_name, congressperson_id, total_spent]
  }

  measure: average_answer_time_formatted {
    group_label: "Averages"
    label: "ASA Formatted"
    description: "Average time it took for operators to answer a chat from the user joining the queue"
    type: string
#     sql: EXTRACT(TIME FROM (TIMESTAMP_ADD(TIMESTAMP("1901-01-01 00:00:00"), INTERVAL CAST(${spending_date_time} AS INT64) SECOND))) ;;
    sql: TIMESTAMP_ADD(TIMESTAMP("1901-01-01 00:00:00"), INTERVAL CAST(${spending_date_time} AS INT64) SECOND) ;;
    html: {{ value | date: %T }} ;;

  }

  dimension: congressperson_legislature_code {
    hidden: yes
    type: number
    sql: ${TABLE}.codLegislatura ;;
  }

  dimension: test_title {
    type: string
    sql: ${TABLE}.txNomeParlamentar ;;
    html: <h1>Congressperson Name: {{ rendered_value }}</h1>  ;;
  }
  dimension_group: spending_date {
    label: "Spending "
    group_label: "Spending"
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      day_of_week_index,
      hour_of_day,
      month_name,
      hour,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.datEmissao ;;
  }

  dimension_group: uel {

    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      hour_of_day,
      month_name,
      hour,
      week,
      month,
      quarter,
      year
    ]
    sql: Case
    WHEN ${spending_category} = 'Fuel' THEN ${TABLE}.datEmissao
    ELSE null
    END;;
  }

  dimension: congressperson_id {
    type: number
    sql: ${TABLE}.ideCadastro ;;
  }

  dimension: spending_test_avg {
    type: string
    sql: AVG(${spending_document_amount}) ;;
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

  measure: month_test {
    type: number
    sql: ${TABLE}.numMes ;;
  }

  dimension: spending_portion {
    view_label: "Test Nested Group"
    group_label: "Test Nested Group level 2"
    type: number
    sql: ${TABLE}.numParcela ;;
  }

  dimension: spending_reimbursement_number {
    view_label: "Test Nested Group"
    group_label: "Test Nested Group level 2"
    type: number
    sql: ${TABLE}.numRessarcimento ;;
  }

  dimension: spending_category_id {
    view_label: "Test Nested Group"
    type: number
    sql: ${TABLE}.numSubCota ;;
  }

  dimension: congressperson_political_party{
    type: string
    sql: ${TABLE}.sgPartido ;;
  }

#   dimension: congressperson_state {
#     type: string
#     sql: ${TABLE}.sgUF ;;
#     suggestions: ["AC","PE", "PI", "SP"]
#     link: {
#       label: "{{ value }} Dashboard 2"
#       url: "https://dcl.dev.looker.com/dashboards/527?State={{ value }}
#       &Category={{ ceap.spending_category | url_encode }}"
#       icon_url: "http://www.looker.com/favicon.ico"
# }
#     }


    dimension: congressperson_state {
    type: string
    sql: ${TABLE}.sgUF ;;
    suggestions: ["AC","PE", "PI", "SP"]
    link: {
      label: "{{ value }} Dashboard 2"
      url: "https://dcl.dev.looker.com/explore/brazilian_congress/ceap?qid=ALqsQRPxSbIFkekWkqy3Ce
      &origin_space=633
      &toggle=fil,
      vis"
      icon_url: "http://www.looker.com/favicon.ico"
}
    }

  dimension: source_year {
    type: number
    sql: ${TABLE}.source_year ;;
  }

  dimension: congressperson_name {
    type: string
    sql: ${TABLE}.txNomeParlamentar;;
  }

  dimension: congressperson_name_centered {
    type: string
    sql: ${TABLE}.txNomeParlamentar;;
      #html: <center>{{ rendered_value }}</center>;;
      html: <div style="text-align:right">{{ rendered_value }}</div> ;;
  }


  dimension: supplier_id {
    type: string
    sql: ${TABLE}.txtCNPJCPF ;;
  }

  dimension: spending_category {
    type: string
    sql: CASE
          WHEN ${TABLE}.txtDescricao = "Disclosure of the Parliamentary Activity" THEN "Publicity"
          ELSE ${TABLE}.txtDescricao
          END;;
    description: "description test"
    drill_fields: [supplier_name,congressperson.my_first_set*]

  }

  dimension: spending_detail {
    type: string
    sql: ${TABLE}.txtDescricaoEspecificacao ;;
    link: {
      label: "test"
      url: "http://www.google.com/search?q={{ value }}"
    }
#     link: {
#       label: "test"
#       url: "https://dcl.dev.looker.com/explore/brazilian_congress/ceap?fields=ceap.spending_category&sorts=ceap.spending_category&limit=500&query_timezone=America%2FNew_York&vis=%7B%7D&filter_config=%7B%7D&origin=share-expanded"
#     }
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
    #value_format: "\" R\"$#,##0.00"
  }

  measure: total_spending_filtered_negative {
    type: count
     filters: [spending_document_amount: "-1"]
  }

  measure: spending_measure {
    type: number
    sql:  coalesce(sum(spending_document_amount), 0) ;;

  }

  measure: spending_test {
    type: number
    sql: ${TABLE}.vlrDocumento ;;
  }

  dimension: spending_gross_value {
    type: number
    sql: ${TABLE}.vlrGlosa + 0;;
    value_format: "\" R\"$#,##0.00"
  }

  measure: spending_gross_test {
    type: number
    sql: ${TABLE}.vlrGlosa + 0 ;;
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
    tiers: [2007, 2011, 2015, 2016, 2019]
    sql:  ${spending_year} ;;
  }

  dimension: state {
    sql: ${congressperson_state} ;;
    #map_layer_name: my_neighborhood_layer
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

  dimension: chamber_deputies_image {
    sql: ${TABLE}.sgUF ;;
    html: <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/Camara_dos_Deputados_do_Brasil_2019.svg/1200px-Camara_dos_Deputados_do_Brasil_2019.svg.png" style="width:40%;height:40%;"> ;;

  }

  dimension: federal_senate_image {
    sql: ${TABLE}.sgUF ;;
    html: <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Senado_Federal_do_Brasil_2019.svg/360px-Senado_Federal_do_Brasil_2019.svg.png"style="width:40%;height:40%;"> ;;

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
    drill_fields: [congressperson_name, spending_date_time,spending_date_date,congressperson_political_party, spending_category, supplier_name]
  }

  measure: maximum_spending{
    type: max
    sql: ${spending_document_amount} ;;
    drill_fields: [congressperson_name, spending_date_date,congressperson_political_party, spending_category, supplier_name, maximum_spending]
  }

  measure: count_congressperson {
    type: count_distinct
    sql:  ${congressperson_id};;
   drill_fields: [congressperson_name, congressperson_id]
  }

  measure: proportional_spending_by_party{
    type: number
    sql: ${spending_document_amount}/${count_congressperson} ;;
    drill_fields: [congressperson_name, spending_date_date,congressperson_political_party, spending_category, supplier_name, proportional_spending_by_party]
  }

  measure: congressperson_spending {
    type: number
    sql: ${spending_document_amount} ;;
    drill_fields: [congressperson_name, spending_date_date,congressperson_political_party, spending_category, supplier_name, congressperson_spending]
  }

measure: test {
  type: number
  sql:  ${total_spent}+${total_spent_test} ;;
}

  measure: total_spent {
    type: sum
    sql: ${spending_document_amount} ;;
    value_format: "\" R\"$#,##0.00"
    drill_fields: [congressperson_name, spending_date_date,congressperson_political_party, spending_category, supplier_name, total_spent]
    #html: <div style="text-align:right">{{ rendered_value }}</div> ;;
    #value_format_name: usd
  }

  #testing multiple measures on tooltip
  measure: total_spent_test {
    type: sum
    sql: ${spending_document_amount} ;;
    value_format: "$#,##0.00"
    drill_fields: [congressperson_name, spending_date_date,congressperson_political_party, spending_category, supplier_name, total_spent]
    html: {{ rendered_value }} || {{count._rendered_value }} of count>> ;;
  }

  measure: average_spending {
    type: average
    sql: ${spending_document_amount} ;;
    value_format: "\" R\"$#,##0.00"
    drill_fields: [spending_date_date, congressperson_name, spending_category, spending_detail, supplier_name, spending_document_amount ]
  }

  measure: most_recent_spending{
    type:  date
    sql:  MAX(${spending_date_raw});;
    convert_tz: no
    drill_fields: [congressperson_name, spending_date_date,congressperson_political_party, spending_category, supplier_name, most_recent_spending]
  }

#
#   measure: count_suppliers {
#     type:  count_distinct
#     sql: ${supplier_name} ;;
#     approximate: yes
#     drill_fields: [congressperson_name, spending_date_date,congressperson_political_party, spending_category, supplier_name, count_suppliers]
#   }

#   measure: suppliers_by_congressperson {
#     type: number
#     sql: ${count_suppliers}/NULLIF(${count_congressperson},0) ;;
#     value_format_name: decimal_2
#     drill_fields: [congressperson_name, spending_date_date,congressperson_political_party, spending_category, supplier_name, suppliers_by_congressperson]
#
#   }

#   measure: suppliers_by_congressperson_test {
#     type: number
#     sql: ${count_suppliers}/5;;
#     value_format: "[>=10]0\%;[<10]0.0\%"
#     drill_fields: [congressperson_name, spending_date_date,congressperson_political_party, spending_category, supplier_name, suppliers_by_congressperson]
#
#   }

  measure: total_spending_by_congressperson {
    type: number
    sql:  SAFE_DIVIDE(${total_spent} - ${maximum_spending}, 100000) ;;
   # sql: DIV(CAST(${total_spent}/NULLIF(${count_congressperson},0) AS INT64), 1000000000 );;
    value_format_name: percent_0
    drill_fields: [congressperson_name, spending_date_date,congressperson_political_party, spending_category, supplier_name, total_spending_by_congressperson ]
  }

  #Test link/html





  #Comparison between one congressperson and all the others
  filter: congressperson_select {
    type: string
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

  measure: count_last_month {
    type: count_distinct
    sql: ${id} ;;
    filters: {
      field: spending_date_month
      value: "1 month ago"
    }
    drill_fields: [spending_date_month, count_last_month]
  }

  dimension: date_formatted {
     label: "Date_formatted"
     sql: ${spending_date_date} ;;
     html:
     {% if _user_attributes['locale'] == 'en' %}
       {{ rendered_value | date: "%m/%d/%y" }}
     {% endif %}
     {% if _user_attributes['locale'] == 'en_gb' %}
       {{ rendered_value | date:  "%d/%m/%y" }}
     {% endif %};;
   }


  #testing the group label

  dimension_group: created_at {
    label: "Order"
    datatype: datetime
    type: time
    timeframes: [year, date, week, day_of_week, week_of_year, month, time, raw, month_num, day_of_week_index]
    sql:  cast(${TABLE}.datEmissao as TIMESTAMP) ;;
  }

  dimension_group: created_at_accounting_explore {
    group_label: "Order Group"
    label: "Order original"
    datatype: datetime
    type: time
    timeframes: [date, week, month, day_of_week, raw]
    sql:  cast(${TABLE}.datEmissao as TIMESTAMP) ;;
  }


  dimension: created_at_european_format {
    group_label: "Order Group"
    label: "Order European"
    type: date
    sql:  cast(${TABLE}.datEmissao as TIMESTAMP) ;;
    html: {{ rendered_value | date: "%d %B %Y" }} ;;
  }

  dimension_group: since_first_spending {
    type: duration
    sql_start: ${created_at_raw} ;;
    sql_end:CURRENT_TIMESTAMP();;

  }

  # test dimension last month

  dimension_group: last_month {
    type: time
    sql:  DATE_SUB(CAST( ${TABLE}.datEmissao AS DATE), INTERVAL 1 MONTH ) ;;
    datatype: date
  }

  #test percent on subtota

  measure: Accept_CategoryDecisionPercent {
    label: "Total Accept % "
    type: number
    sql: ${TABLE}.vlrDocumento;;
    value_format_name: percent_0
  }


  #test parameter

  measure: testforcommissioncalculation{
    type: number
    sql:
    case
    when ${congressperson_id} = '{% parameter commission_to_count %}'
    then ${spending_document_amount}*${average_spending}
    else 1
    end;;

    }

  parameter: commission_to_count {
      type: string
    }

    measure: lat {
      type: number
      sql:  -6.90422 ;;
    }

    measure: long {
      type: number
      sql: -107.60636 ;;
    }

    measure: dist {
      type: number
      sql:  1000 ;;
    }
  dimension: name {
    link: {
      label: "Drill Look"
      url:"/looks/1584?&f[ceap.spending_date_date]={{ value }}&f[ceap.spending_date_date]={{ _filters['ceap.spending_date_date'] | url_encode }}"
    }
  }

  dimension: date_type {
    type: date
    datatype: date
    sql: ${TABLE}.datEmissao ;;
  }

measure: filtered_example {
  type:sum
  sql: ${spending_document_amount};;
  filters: {
    field: id
    value: "< 100"
  }
  }

  dimension: invited_current_month_yes {
    type: yesno
    hidden: no
    sql: ${created_at_month} = ${spending_date_month}
      ;;
  }

  dimension: data_type {
    type: string
    sql: CASE
      WHEN ${created_at_date} IS NOT NULL THEN "order date"
      WHEN ${spending_date_date} IS NOT NULL THEN "Spending"
      END;;
  }


  dimension: registration {
    type: string
    sql:   ${TABLE}.datEmissao ;;
  }

  dimension_group: registration {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      hour_of_day,
      month_name,
      hour,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.datEmissao ;;


  }

  filter: datefilter {
    type: date
  }

  dimension: datefilter_days_no {
    sql: DATE_DIFF({% date_end datefilter %},{% date_start datefilter %}) ;;
  }

  #Taxify issue replication

  dimension: days_from_code {
    type: number
    sql: ${spending_year} ;;
    value_format: "0"
  }

  parameter: timeframe_picker_for_time_after_code_use {
    allowed_value: {
      label: "Days"
      value: "Days"
    }
    allowed_value: {
      label: "Weeks"
      value: "Weeks"
    }
    allowed_value: {
      label: "Months"
      value: "Months"
    }
    allowed_value: {
      label: "Quarters"
      value: "Quarters"
    }
    allowed_value: {
      label: "Years"
      value: "Years"
    }
    description: "Filter to select for which period you want data to be aggregated. (Date,Week,Month,Quarter,Year)"
  }


  dimension: dynamic_timeframe_for_time_after_code_use {
    type: number
    sql:
      CASE
        --WHEN ${days_from_code}<1 THEN -1
        WHEN {% condition timeframe_picker_for_time_after_code_use %} 'Days' {% endcondition %} THEN 0
        WHEN {% condition timeframe_picker_for_time_after_code_use %} 'Weeks' {% endcondition %} THEN  ${days_from_code}/2
        WHEN {% condition timeframe_picker_for_time_after_code_use %} 'Months' {% endcondition %} THEN ${days_from_code}/10
        WHEN {% condition timeframe_picker_for_time_after_code_use %} 'Quarters' {% endcondition %} THEN 3
        WHEN {% condition timeframe_picker_for_time_after_code_use %} 'Years' {% endcondition %} THEN 4
       END ;;
  }

 dimension: test_unused {
  type: string
  sql:   ${TABLE}.datEmissao ;;

 }

  dimension: dummy_dimension {
    case: {
      when: {
        label: "Total Spent"
        sql: 1=1 ;;
      }
      when: {
        label: "Spending Congressperson"
        sql: 1=1 ;;
      }
      when: {
        label: "Maximum Spending"
        sql: 1=1 ;;
      }
    }
    }

}

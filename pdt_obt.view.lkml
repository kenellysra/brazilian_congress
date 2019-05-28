# 2b rows for total dataset.
# source_year, uriProposicao, siglaTipo, numero, ano, id are dups


view: pdt_obt_01 {
  # this pdt is for data for 2009 - 2013 (max partition is 2k), i.e. 5 years data is 1825 partitions
  derived_table: {
    partition_keys: ["datEmissao"]
    sql:
        WITH pt AS (SELECT * EXCEPT (siglaTipo, numero, ano) FROM kenelly_thesis.proposal_topics)
        , ceap AS (SELECT * EXCEPT (id), id AS ceap_id FROM kenelly_thesis.ceap WHERE datEmissao  >= '2009-01-01' AND datEmissao  < '2014-01-01')
        , pa AS (SELECT * EXCEPT (uriProposicao) FROM kenelly_thesis.proposal_authors)
        SELECT
          concat('01',GENERATE_UUID()) AS pk
          , * EXCEPT (source_year)
        FROM pa
        LEFT JOIN kenelly_thesis.congressperson  AS c ON pa.idDeputadoAutor = (CAST(SUBSTR(c._uri_, 53, 6) AS INT64)) AND pa.codTipoAutor = 10000
        LEFT JOIN kenelly_thesis.proposals AS p ON pa.idProposicao = p.id
        LEFT JOIN pt ON pa.idProposicao = (CAST(SUBSTR(pt.uriProposicao, 55, 7) AS INT64))
        LEFT JOIN ceap ON (CAST(SUBSTR(c._uri_, 53, 6) AS INT64)) = ceap.ideCadastro
    ;;
    sql_trigger_value: SELECT 1 ;;
  }
}

view: pdt_obt_02 {
  # this pdt is for data for 2014 - 2018
  derived_table: {
    partition_keys: ["datEmissao"]
    sql:
        WITH pt AS (SELECT * EXCEPT (siglaTipo, numero, ano) FROM kenelly_thesis.proposal_topics)
        , ceap AS (SELECT * EXCEPT (id), id AS ceap_id FROM kenelly_thesis.ceap WHERE datEmissao  >= '2014-01-01' AND datEmissao  < '2019-01-01')
        , pa AS (SELECT * EXCEPT (uriProposicao) FROM kenelly_thesis.proposal_authors)
        SELECT
          concat('02',GENERATE_UUID()) AS pk
          , * EXCEPT (source_year)
        FROM pa
        LEFT JOIN kenelly_thesis.congressperson  AS c ON pa.idDeputadoAutor = (CAST(SUBSTR(c._uri_, 53, 6) AS INT64)) AND pa.codTipoAutor = 10000
        LEFT JOIN kenelly_thesis.proposals AS p ON pa.idProposicao = p.id
        LEFT JOIN pt ON pa.idProposicao = (CAST(SUBSTR(pt.uriProposicao, 55, 7) AS INT64))
        LEFT JOIN ceap ON (CAST(SUBSTR(c._uri_, 53, 6) AS INT64)) = ceap.ideCadastro
    ;;
    sql_trigger_value: SELECT 1 ;;
  }
  dimension: id {}
}

view: all_data {
  derived_table: {
    sql:
        SELECT * FROM ${pdt_obt_01.SQL_TABLE_NAME} AS a WHERE {% condition date_filter %} a.datEmissao {% endcondition %}
        UNION ALL
        SELECT * FROM ${pdt_obt_02.SQL_TABLE_NAME} AS b WHERE {% condition date_filter %} b.datEmissao {% endcondition %}
        ;;
  }

  filter: date_filter {
    type: date
    convert_tz: no
  }

  dimension: id {}
  dimension: ceap_id {}
  dimension: txNomeParlamentar {}
  dimension: name {
    sql: ${txNomeParlamentar} ;;
  }
  dimension: spend {
    sql: ${TABLE}.vlrDocumento ;;
  }
  dimension_group: date {
    type: time
    sql: ${TABLE}.datEmissao ;;
  }
  dimension: proposal_topic {
    sql: ${TABLE}.tema ;;
  }
  measure: count {
    type: count
  }
  measure: total_spend {
    type: sum_distinct
    sql: ${spend} ;;
    sql_distinct_key: ${ceap_id} ;;
    value_format_name: decimal_2
  }
}

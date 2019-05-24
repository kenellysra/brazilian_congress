view: pdt_obt {
  # source_year, uriProposicao, siglaTipo, numero, ano, id are dups
  #   2b row
  derived_table: {
    partition_keys: ["datEmissao"]
    sql:
        WITH pt AS (SELECT * EXCEPT (siglaTipo, numero, ano) FROM kenelly_thesis.proposal_topics)
        , ceap AS (SELECT * EXCEPT (id) FROM kenelly_thesis.ceap WHERE datEmissao  >= '2009-01-01' AND datEmissao  < '2014-01-01')
        , pa AS (SELECT * EXCEPT (uriProposicao) FROM kenelly_thesis.proposal_authors)
        SELECT
          GENERATE_UUID() AS pk
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

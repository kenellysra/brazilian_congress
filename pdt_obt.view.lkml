explore: pdt_obt {}
view: pdt_obt {
  derived_table: {
    sql:
      SELECT GENERATE_UUID() AS pk
        , *
        EXCEPT( uriProposicao
            , siglaTipo
            , numero
            , ano
            , id
            , source_year)
      FROM kenelly_thesis.proposal_authors  AS proposal_authors
      LEFT JOIN kenelly_thesis.congressperson  AS congressperson ON proposal_authors.idDeputadoAutor = (CAST(SUBSTR(congressperson._uri_, 53, 6) AS INT64)) AND proposal_authors.codTipoAutor = 10000
      LEFT JOIN kenelly_thesis.proposals AS proposals ON proposal_authors.idProposicao = proposals.id
      LEFT JOIN kenelly_thesis.proposal_topics  AS proposal_topics ON proposal_authors.idProposicao = (CAST(SUBSTR(proposal_topics.uriProposicao, 55, 7) AS INT64))
      LEFT JOIN kenelly_thesis.ceap  AS ceap ON (CAST(SUBSTR(congressperson._uri_, 53, 6) AS INT64)) = ceap.ideCadastro
    ;;
#     sql_trigger_value: SELECT 1 ;;
  }
  dimension: id {}
}

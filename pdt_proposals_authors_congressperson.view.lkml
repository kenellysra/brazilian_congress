view: pdt_proposals_authors_congressperson {
  derived_table: {
    sql_trigger_value: SELECT 1  ;;
    sql: SELECT GENERATE_UUID() AS pk, * EXCEPT(source_year)
      FROM kenelly_thesis.proposal_authors  AS proposal_authors
      LEFT JOIN kenelly_thesis.congressperson  AS congressperson ON proposal_authors.idDeputadoAutor = (CAST(SUBSTR(congressperson._uri_, 53, 6) AS INT64)) AND proposal_authors.codTipoAutor = 10000
      LEFT JOIN kenelly_thesis.proposals AS proposals ON proposal_authors.idProposicao = proposals.id
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: pk {
    type: string
    sql: ${TABLE}.pk ;;
  }

  dimension: proposal_id {
    type: number
    sql: ${TABLE}.idProposicao ;;
  }

  dimension: proposal_uri {
    type: string
    sql: ${TABLE}.uriProposicao ;;
  }

  dimension: author_id {
    type: number
    sql: ${TABLE}.idDeputadoAutor ;;
  }

  dimension: author_uri {
    type: string
    sql: ${TABLE}.uriAutor ;;
  }

  dimension: author_type_code {
    type: number
    sql: ${TABLE}.codTipoAutor ;;
  }

  dimension: author_type {
    type: string
    sql: ${TABLE}.tipoAutor ;;
  }

  dimension: author_name {
    type: string
    sql: ${TABLE}.nomeAutor ;;
  }

  dimension: author_political_party_initials {
    type: string
    sql: ${TABLE}.siglaPartidoAutor ;;
  }

  dimension: author_political_party_uri{
    type: string
    sql: ${TABLE}.uriPartidoAutor ;;
  }

  dimension: author_state {
    type: string
    sql: ${TABLE}.siglaUFAutor ;;
  }

  dimension: congressperson_uri {
    type: string
    sql: ${TABLE}._uri_ ;;
  }

  dimension: congressperson_name {
    type: string
    sql: ${TABLE}.nome ;;
  }

  dimension: congressperson_legislature_start_id {
    type: number
    sql: ${TABLE}.idLegislaturaInicial ;;
  }

  dimension: congressperson_legislature_end_id {
    type: number
    sql: ${TABLE}.idLegislaturaFinal ;;
  }

  dimension: congressperson_full_name {
    type: string
    sql: ${TABLE}.nomeCivil ;;
  }

  dimension: congressperson__personal_document_id {
    type: string
    sql: ${TABLE}.cpf ;;
  }

  dimension: congressperson_genre {
    type: string
    sql: ${TABLE}.siglaSexo ;;
  }

  dimension: congressperson_social_media_url {
    type: string
    sql: ${TABLE}.urlRedeSocial ;;
  }

  dimension: congressperson_website_url {
    type: string
    sql: ${TABLE}.urlWebsite ;;
  }

  dimension: congressperson_birth_date {
    type: date
    sql: ${TABLE}.dataNascimento ;;
  }

  dimension: congressperson_death_date {
    type: date
    sql: ${TABLE}.dataFalecimento ;;
  }

  dimension: congressperson_birth_state {
    type: string
    sql: ${TABLE}.ufNascimento ;;
  }

  dimension: congressperson_birth_city {
    type: string
    sql: ${TABLE}.municipioNascimento ;;
  }

  dimension: id_proposal {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: uri_proposal {
    type: string
    sql: ${TABLE}.uri ;;
  }

  dimension: proposal_type_initials {
    type: string
    sql: ${TABLE}.siglaTipo ;;
  }

  dimension: proposal_number{
    type: number
    sql: ${TABLE}.numero ;;
  }

  dimension: proposal_year {
    type: number
    sql: ${TABLE}.ano ;;
  }

  dimension: proposal_type_code {
    type: number
    sql: ${TABLE}.codTipo ;;
  }

  dimension: proposal_type_description {
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

  dimension: keywords {
    type: string
    sql: ${TABLE}.keywords ;;
  }

  dimension_group: proposal_initial_date {
    type: time
    sql: ${TABLE}.dataApresentacao ;;
  }

  dimension: uri_responsible_body_number {
    type: string
    sql: ${TABLE}.uriOrgaoNumerador ;;
  }

  dimension: uri_prop_preceding {
    type: string
    sql: ${TABLE}.uriPropAnterior ;;
  }

  dimension: uri_prop_principal {
    type: string
    sql: ${TABLE}.uriPropPrincipal ;;
  }

  dimension: uri_prop_posterior {
    type: string
    sql: ${TABLE}.uriPropPosterior ;;
  }

  dimension: url_inteiro_content {
    type: string
    sql: ${TABLE}.urlInteiroTeor ;;
  }

  dimension: urn_final {
    type: string
    sql: ${TABLE}.urnFinal ;;
  }

  dimension_group: proposal_last_updated_date {
    type: time
    sql: ${TABLE}.ultimoStatus_dataHora ;;
  }

  dimension: sequence_last_status {
    type: number
    sql: ${TABLE}.ultimoStatus_sequencia ;;
  }

  dimension: referendary_uri_last_status {
    type: string
    sql: ${TABLE}.ultimoStatus_uriRelator ;;
  }

  dimension: responsible_body_last_status {
    type: number
    sql: ${TABLE}.ultimoStatus_idOrgao ;;
  }

  dimension: responsible_body_initials_last_status {
    type: string
    sql: ${TABLE}.ultimoStatus_siglaOrgao ;;
  }

  dimension: responsible_body_uri_last_status {
    type: string
    sql: ${TABLE}.ultimoStatus_uriOrgao ;;
  }

  dimension: regime_last_status {
    type: string
    sql: ${TABLE}.ultimoStatus_regime ;;
  }

  dimension: procedure_description_last_updated_status {
    type: string
    sql: ${TABLE}.ultimoStatus_descricaoTramitacao ;;
  }

  dimension: procedure_type_id_last_status {
    type: number
    sql: ${TABLE}.ultimoStatus_idTipoTramitacao ;;
  }

  dimension: proposal_last_updated_status {
    type: string
    sql: ${TABLE}.ultimoStatus_descricaoSituacao ;;
  }

  dimension: situation_id_last_status {
    type: number
    sql: ${TABLE}.ultimoStatus_idSituacao ;;
  }

  dimension: dispatch_last_status {
    type: string
    sql: ${TABLE}.ultimoStatus_despacho ;;
  }

  dimension: last_status_url {
    type: string
    sql: ${TABLE}.ultimoStatus_url ;;
  }

  set: detail {
    fields: [
      pk,
      proposal_id,
      proposal_uri,
      author_id,
      author_uri,
      author_type_code,
      author_type,
      author_name,
      author_political_party_initials,
      author_political_party_uri,
      author_state,
      congressperson_uri,
      congressperson_name,
      congressperson_legislature_start_id,
      congressperson_legislature_end_id,
      congressperson_full_name,
      congressperson__personal_document_id,
      congressperson_genre,
      congressperson_social_media_url,
      congressperson_website_url,
      congressperson_birth_date,
      congressperson_death_date,
      congressperson_birth_state,
      congressperson_birth_city,
      id_proposal,
      uri_proposal,
      proposal_type_initials,
      proposal_number,
      proposal_year,
      proposal_type_code,
      proposal_type_description,
      proposal_summary,
      proposal_detailed_description,
      keywords,
      proposal_initial_date_time,
      uri_responsible_body_number,
      uri_prop_preceding,
      uri_prop_principal,
      uri_prop_posterior,
      url_inteiro_content,
      urn_final,
      proposal_last_updated_date_time,
      sequence_last_status,
      referendary_uri_last_status,
      responsible_body_last_status,
      responsible_body_initials_last_status,
      responsible_body_uri_last_status,
      regime_last_status,
      procedure_description_last_updated_status,
      procedure_type_id_last_status,
      proposal_last_updated_status,
      situation_id_last_status,
      dispatch_last_status,
      last_status_url

    ]
  }
}

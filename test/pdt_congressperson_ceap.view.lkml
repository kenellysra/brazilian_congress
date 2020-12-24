view: pdt_congressperson_ceap {
  derived_table: {
    datagroup_trigger:kenelly_thesis_brazilian_congress_default_datagroup
    sql_trigger_value: SELECT 1 ;;
#     partition_keys: ["dat_emissao"]
    sql: SELECT GENERATE_UUID() AS pk, *
      FROM kenelly_thesis.congressperson  AS congressperson
      LEFT JOIN kenelly_thesis.ceap  AS spending ON spending.ideCadastro = (CAST(SUBSTR(congressperson._uri_, 53, 6) AS INT64))
      WHERE  ;;
  }

  filter: birth_date {
    type: string
  }

  dimension: pk {
    primary_key: yes
    sql: ${TABLE}.pk ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: _uri_ {
    type: string
    sql: ${TABLE}._uri_ ;;
  }

  dimension: nome {
    type: string
    sql: ${TABLE}.nome ;;
  }

  dimension: id_legislatura_inicial {
    type: number
    sql: ${TABLE}.idLegislaturaInicial ;;
  }

  dimension: id_legislatura_final {
    type: number
    sql: ${TABLE}.idLegislaturaFinal ;;
  }

  dimension: nome_civil {
    type: string
    sql: ${TABLE}.nomeCivil ;;
  }

  dimension: cpf {
    type: string
    sql: ${TABLE}.cpf ;;
  }

  dimension: sigla_sexo {
    type: string
    sql: ${TABLE}.siglaSexo ;;
  }

  dimension: url_rede_social {
    type: string
    sql: ${TABLE}.urlRedeSocial ;;
  }

  dimension: url_website {
    type: string
    sql: ${TABLE}.urlWebsite ;;
  }

  dimension: data_nascimento {
    type: date
    sql: ${TABLE}.dataNascimento ;;
  }

  dimension: data_falecimento {
    type: date
    sql: ${TABLE}.dataFalecimento ;;
  }

  dimension: uf_nascimento {
    type: string
    sql: ${TABLE}.ufNascimento ;;
  }

  dimension: municipio_nascimento {
    type: string
    sql: ${TABLE}.municipioNascimento ;;
  }

  dimension: tx_nome_parlamentar {
    type: string
    sql: ${TABLE}.txNomeParlamentar ;;
  }

  dimension: ide_cadastro {
    type: number
    sql: ${TABLE}.ideCadastro ;;
  }

  dimension: nu_carteira_parlamentar {
    type: number
    sql: ${TABLE}.nuCarteiraParlamentar ;;
  }

  dimension: nu_legislatura {
    type: number
    sql: ${TABLE}.nuLegislatura ;;
  }

  dimension: sg_uf {
    type: string
    sql: ${TABLE}.sgUF ;;
  }

  dimension: sg_partido {
    type: string
    sql: ${TABLE}.sgPartido ;;
  }

  dimension: cod_legislatura {
    type: number
    sql: ${TABLE}.codLegislatura ;;
  }

  dimension: num_sub_cota {
    type: number
    sql: ${TABLE}.numSubCota ;;
  }

  dimension: txt_descricao {
    type: string
    sql: ${TABLE}.txtDescricao ;;
  }

  dimension: num_especificacao_sub_cota {
    type: number
    sql: ${TABLE}.numEspecificacaoSubCota ;;
  }

  dimension: txt_descricao_especificacao {
    type: string
    sql: ${TABLE}.txtDescricaoEspecificacao ;;
  }

  dimension: txt_fornecedor {
    type: string
    sql: ${TABLE}.txtFornecedor ;;
  }

  dimension: txt_cnpjcpf {
    type: string
    sql: ${TABLE}.txtCNPJCPF ;;
  }

  dimension: txt_numero {
    type: string
    sql: ${TABLE}.txtNumero ;;
  }

  dimension: ind_tipo_documento {
    type: number
    sql: ${TABLE}.indTipoDocumento ;;
  }

  dimension_group: dat_emissao {
    type: time
    sql: ${TABLE}.datEmissao ;;
  }

  dimension: vlr_documento {
    type: number
    sql: ${TABLE}.vlrDocumento ;;
  }

  dimension: vlr_glosa {
    type: number
    sql: ${TABLE}.vlrGlosa ;;
  }

  dimension: vlr_liquido {
    type: number
    sql: ${TABLE}.vlrLiquido ;;
  }

  dimension: num_mes {
    type: number
    sql: ${TABLE}.numMes ;;
  }

  dimension: num_ano {
    type: number
    sql: ${TABLE}.numAno ;;
  }

  dimension: num_parcela {
    type: number
    sql: ${TABLE}.numParcela ;;
  }

  dimension: txt_passageiro {
    type: string
    sql: ${TABLE}.txtPassageiro ;;
  }

  dimension: txt_trecho {
    type: string
    sql: ${TABLE}.txtTrecho ;;
  }

  dimension: num_lote {
    type: number
    sql: ${TABLE}.numLote ;;
  }

  dimension: num_ressarcimento {
    type: number
    sql: ${TABLE}.numRessarcimento ;;
  }

  dimension: vlr_restituicao {
    type: string
    sql: ${TABLE}.vlrRestituicao ;;
  }

  dimension: nu_deputado_id {
    type: number
    sql: ${TABLE}.nuDeputadoId ;;
  }

  dimension: ide_documento {
    type: number
    sql: ${TABLE}.ideDocumento ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: source_year {
    type: number
    sql: ${TABLE}.source_year ;;
  }

  dimension: test {
    type: string
    sql: ceap.congressperson_legislature_code ;;
  }
  set: detail {
    fields: [
      _uri_,
      nome,
      id_legislatura_inicial,
      id_legislatura_final,
      nome_civil,
      cpf,
      sigla_sexo,
      url_rede_social,
      url_website,
      data_nascimento,
      data_falecimento,
      uf_nascimento,
      municipio_nascimento,
      tx_nome_parlamentar,
      ide_cadastro,
      nu_carteira_parlamentar,
      nu_legislatura,
      sg_uf,
      sg_partido,
      cod_legislatura,
      num_sub_cota,
      txt_descricao,
      num_especificacao_sub_cota,
      txt_descricao_especificacao,
      txt_fornecedor,
      txt_cnpjcpf,
      txt_numero,
      ind_tipo_documento,
      dat_emissao_time,
      vlr_documento,
      vlr_glosa,
      vlr_liquido,
      num_mes,
      num_ano,
      num_parcela,
      txt_passageiro,
      txt_trecho,
      num_lote,
      num_ressarcimento,
      vlr_restituicao,
      nu_deputado_id,
      ide_documento,
      id,
      source_year
    ]
  }
}

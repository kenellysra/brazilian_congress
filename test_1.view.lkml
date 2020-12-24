view: test_1 {
  derived_table: {
    sql: select * from `lookerdata.kenelly_thesis.ceap`
      Limit 50
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
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

  set: detail {
    fields: [
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

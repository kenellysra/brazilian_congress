view: ceap {
  sql_table_name: kenelly_thesis.ceap ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cod_legislatura {
    type: number
    sql: ${TABLE}.codLegislatura ;;
  }

  dimension_group: dat_emissao {
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

  dimension: ide_cadastro {
    type: number
    sql: ${TABLE}.ideCadastro ;;
  }

  dimension: ide_documento {
    type: number
    sql: ${TABLE}.ideDocumento ;;
  }

  dimension: ind_tipo_documento {
    type: number
    sql: ${TABLE}.indTipoDocumento ;;
  }

  dimension: nu_carteira_parlamentar {
    type: number
    sql: ${TABLE}.nuCarteiraParlamentar ;;
  }

  dimension: nu_deputado_id {
    type: number
    sql: ${TABLE}.nuDeputadoId ;;
  }

  dimension: nu_legislatura {
    type: number
    sql: ${TABLE}.nuLegislatura ;;
  }

  dimension: num_ano {
    type: number
    sql: ${TABLE}.numAno ;;
  }

  dimension: num_especificacao_sub_cota {
    type: number
    sql: ${TABLE}.numEspecificacaoSubCota ;;
  }

  dimension: num_lote {
    type: number
    sql: ${TABLE}.numLote ;;
  }

  dimension: num_mes {
    type: number
    sql: ${TABLE}.numMes ;;
  }

  dimension: num_parcela {
    type: number
    sql: ${TABLE}.numParcela ;;
  }

  dimension: num_ressarcimento {
    type: number
    sql: ${TABLE}.numRessarcimento ;;
  }

  dimension: num_sub_cota {
    type: number
    sql: ${TABLE}.numSubCota ;;
  }

  dimension: sg_partido {
    type: string
    sql: ${TABLE}.sgPartido ;;
  }

  dimension: sg_uf {
    type: string
    sql: ${TABLE}.sgUF ;;
  }

  dimension: source_year {
    type: number
    sql: ${TABLE}.source_year ;;
  }

  dimension: tx_nome_parlamentar {
    type: string
    sql: ${TABLE}.txNomeParlamentar ;;
  }

  dimension: txt_cnpjcpf {
    type: string
    sql: ${TABLE}.txtCNPJCPF ;;
  }

  dimension: txt_descricao {
    type: string
    sql: ${TABLE}.txtDescricao ;;
  }

  dimension: txt_descricao_especificacao {
    type: string
    sql: ${TABLE}.txtDescricaoEspecificacao ;;
  }

  dimension: txt_fornecedor {
    type: string
    sql: ${TABLE}.txtFornecedor ;;
  }

  dimension: txt_numero {
    type: string
    sql: ${TABLE}.txtNumero ;;
  }

  dimension: txt_passageiro {
    type: string
    sql: ${TABLE}.txtPassageiro ;;
  }

  dimension: txt_trecho {
    type: string
    sql: ${TABLE}.txtTrecho ;;
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

  dimension: vlr_restituicao {
    type: string
    sql: ${TABLE}.vlrRestituicao ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}

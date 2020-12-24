include: "ceap.view"
include : "congressperson.view"

view: extend_view {
  sql_table_name: kenelly_thesis.ceap ;;
  extends: [ceap]

  dimension: concat {
    type: string
    sql: CONCAT(${congressperson_political_party}," ", ${congressperson.name})  ;;
  }

}

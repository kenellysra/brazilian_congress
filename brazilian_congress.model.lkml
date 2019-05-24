connection: "lookerdata_standard_sql"

# include all the views
include: "*.view"

datagroup: kenelly_thesis_brazilian_congress_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: kenelly_thesis_brazilian_congress_default_datagroup

explore: ceap {
  join: congressperson {
    sql_on: ${ceap.congressperson_id} = ${congressperson.id} ;;
    relationship: many_to_one
  }
  join: proposal_authors {
    sql_on: ${ceap.congressperson_id} = ${proposal_authors.author_id}  ;;
    relationship: one_to_many
  }
  join: proposals {
    sql_on: ${proposal_authors.author_id} = ${proposals.proposal_id} ;;
    relationship: many_to_one
  }
  join: proposal_topics {
    sql_on: ${proposals.proposal_id} = ${proposal_topics.proposal_id} ;;
    relationship: many_to_one
  }
}

explore: congressperson {}

explore: proposal_authors {
  join:  pdt_congressperson_ceap {
    sql_on: ${pdt_congressperson_ceap.id} =${proposal_authors.author_id} AND ${proposal_authors.author_type_code} = 10000;;
    relationship: many_to_many
  }


#   join: congressperson {
#     sql_on: ${congressperson.id} = ${proposal_authors.author_id} AND ${proposal_authors.author_type_code} = 10000 ;;
#     relationship: many_to_one
#   }
  join: proposals {
    sql_on: ${proposal_authors.author_id} = ${proposals.proposal_id} ;;
    relationship: many_to_one

  }
  join: proposal_topics {
    sql_on: ${proposals.proposal_id} = ${proposal_topics.proposal_id} ;;
    relationship: :many_to_one

  }
#   join: ceap {
#     sql_on: ${ceap.congressperson_id} = ${congressperson.id} ;;
#
#   }
}

explore: proposal_topics {}

explore: proposals {}

explore: congressperson_spending_facts {}

explore: pdt_proposals_authors_congressperson {
  label: "Congressperson Expenses"
  join: proposal_topics {
    sql_on: ${pdt_proposals_authors_congressperson.proposal_id} = ${proposal_topics.proposal_id};;
    relationship: many_to_one
  }
  join: ceap {
    sql_on: ${pdt_proposals_authors_congressperson.congressperson_id} = ${ceap.congressperson_id};;
    relationship: many_to_many
  }



}

explore: all_data {
  always_filter: {
    filters: {
      field: date_filter
      value: "2 years"
    }
  }
}

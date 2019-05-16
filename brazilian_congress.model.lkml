connection: "lookerdata_standard_sql"

# include all the views
include: "*.view"

datagroup: kenelly_thesis_brazilian_congress_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: kenelly_thesis_brazilian_congress_default_datagroup

explore: ceap {}

explore: congressperson {}

explore: proposal_authors {}

explore: proposal_topics {}

explore: proposals {}
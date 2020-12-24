include: "ceap.view"

view: ceap_child {
  extends: [ceap]

  set: included_proxy_sold_data_fields {
    fields: [
### dimensions ###

    registration,
    registration_date,
    registration_year
  ]
  }
}

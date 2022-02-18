- dashboard: lookml_dashboard_layout_test
  title: lookml dashboard layout test
  layout: tile
  elements:
  - title: New Tile
    name: New Tile
    model: brazilian_congress
    explore: ceap
    type: table
    fields: [ceap.count, ceap.id]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    row: 0
    col: 0
    width: 8
    height: 6

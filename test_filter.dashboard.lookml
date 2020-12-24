- dashboard: download_merged
  title: download_merged
  layout: newspaper
  elements:
  - name: New Tile
    title: New Tile
    merged_queries:
    - model: brazilian_congress
      explore: ceap
      type: looker_grid
      fields: [ceap.congressperson_id, ceap.spending_month, ceap.congressperson_name,
        ceap.count, ceap.average_spending]
      sorts: [ceap.count desc]
      limit: 500
      filter_expression: " ${ceap.congressperson_id} > 1000"
      query_timezone: America/New_York
      show_view_names: false
      show_row_numbers: true
      transpose: false
      truncate_text: true
      hide_totals: false
      hide_row_totals: false
      size_to_fit: true
      table_theme: white
      limit_displayed_rows: false
      enable_conditional_formatting: false
      header_text_alignment: left
      header_font_size: 12
      rows_font_size: 12
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      hidden_fields: []
      y_axes: []
      defaults_version: 1
    - model: brazilian_congress
      explore: proposal_authors
      type: table
      fields: [proposal_authors.author_id, proposal_authors.proposal_id, proposal_authors.count]
      sorts: [proposal_authors.count desc]
      limit: 500
      query_timezone: America/New_York
      hidden_fields: []
      y_axes: []
      join_fields:
      - field_name: proposal_authors.author_id
        source_field_name: ceap.congressperson_id
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    series_cell_visualizations:
      ceap.count:
        is_active: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: looker_column
    hidden_fields: []
    y_axes: []
    series_types: {}
    sorts: [ceap.congressperson_name]
    row: 0
    col: 0
    width: 19
    height: 7

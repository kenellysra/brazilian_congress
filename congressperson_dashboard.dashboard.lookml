- dashboard: congressperson_filter
  title: Congressperson filter
  layout: newspaper
  preferred_viewer: dashboards-next
  embed_style:
    background_color: "#86fa49"
    show_title: true
    title_color: "#451c19"
    show_filters_bar: true
    tile_text_color: "#3a4245"
    text_tile_text_color: "#439cff"
  elements:
  - title: Congressperson Carreer
    name: Congressperson Carreer
    model: brazilian_congress
    explore: congressperson
    type: single_value
    fields: [congressperson.congressperson_career]
    filters: {}
    limit: 500
    query_timezone: America/New_York
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: Years as a Congressperson
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    hidden_fields: [congressperson.congressperson_career]
    y_axes: []
    listen:
      Congressperson Name: congressperson.name
    row: 17
    col: 10
    width: 11
    height: 2
  - name: Congressperson Name (copy)
    title: Congressperson Name (copy)
    model: brazilian_congress
    explore: ceap
    type: single_value
    fields: [congressperson.name]
    sorts: [congressperson.name]
    limit: 1
    query_timezone: America/New_York
    custom_color_enabled: true
    custom_color: "#002776"
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Congressperson Name: congressperson.name
    row: 11
    col: 3
    width: 7
    height: 2
  - name: ''
    type: text
    body_text: |-
      <div class="alert alert-info vis">
         <div class="card-header">
           <div class="btn-group btn-group-toggle text-center" data-toggle="buttons" >
      <a href="https://dcl.dev.looker.com/dashboards/358"  class="btn btn-secondary text-strong">Dashboard 1</a>
            <a href="https://dcl.dev.looker.com/dashboards/344"  class="btn btn-secondary text-strong">Dashboard 2</a>
             <a href="https://dcl.dev.looker.com/dashboards/346" class="btn btn-secondary">Dashboard 3</a>
            </div>
         </div>
      </div>
    row: 6
    col: 3
    width: 18
    height: 5
  - title: Congressperson
    name: Congressperson
    model: brazilian_congress
    explore: ceap
    type: single_value
    fields: [ceap.congressperson_image]
    filters:
      ceap.congressperson_image: "-NULL"
    sorts: [ceap.congressperson_image]
    limit: 500
    column_limit: 50
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Congressperson Name: congressperson.name
      test: ceap.congressperson_id
    row: 13
    col: 3
    width: 7
    height: 9
  - name: Top Banner Congressperson (copy)
    title: Top Banner Congressperson (copy)
    model: brazilian_congress
    explore: congressperson
    type: single_value
    fields: [congressperson.top_banner_congressperson]
    sorts: [congressperson.top_banner_congressperson]
    limit: 500
    query_timezone: America/New_York
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen: {}
    row: 0
    col: 3
    width: 18
    height: 6
  - title: Total Spent by Congressperson
    name: Total Spent by Congressperson
    model: brazilian_congress
    explore: ceap
    type: single_value
    fields: [congressperson.name, ceap.total_spent]
    sorts: [ceap.total_spent desc]
    limit: 500
    query_timezone: America/New_York
    custom_color_enabled: true
    custom_color: "#002776"
    show_single_value_title: true
    single_value_title: Spent since the beginning of the legislature
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Congressperson Name: congressperson.name
    row: 13
    col: 10
    width: 11
    height: 2
  - name: Congressperson Political Party (copy)
    title: Congressperson Political Party (copy)
    model: brazilian_congress
    explore: ceap
    type: single_value
    fields: [congressperson.name, ceap.congressperson_political_party]
    sorts: [congressperson.name]
    limit: 500
    query_timezone: America/New_York
    custom_color_enabled: true
    custom_color: "#002776"
    show_single_value_title: true
    single_value_title: Political Party
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    hidden_fields: [congressperson.name]
    y_axes: []
    listen:
      Congressperson Name: congressperson.name
    row: 11
    col: 16
    width: 5
    height: 2
  - name: Congressperson Timeline (copy)
    title: Congressperson Timeline (copy)
    model: brazilian_congress
    explore: congressperson_career
    type: looker_timeline
    fields: [congressperson_career.congressperson_name, congressperson_career.year_start,
      congressperson_career.year_end]
    sorts: [congressperson_career.congressperson_name]
    limit: 500
    query_timezone: America/New_York
    color_application:
      collection_id: c354e5fa-37c1-4878-897b-6e0f47375840
      custom:
        id: 38c993c4-6be8-b23e-5cc3-301fcbfd31f9
        label: Custom
        type: continuous
        stops:
        - color: "#009B3A"
          offset: 0
        - color: "#002776"
          offset: 100
      options:
        steps: 5
        reverse: false
    groupBars: true
    labelSize: 10pt
    valueFormat: ''
    showLegend: true
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Congressperson Name: congressperson_career.congressperson_name
    row: 19
    col: 10
    width: 11
    height: 3
  - name: Congressperson State (copy)
    title: Congressperson State (copy)
    model: brazilian_congress
    explore: ceap
    type: single_value
    fields: [congressperson.name, ceap.congressperson_state, ceap.state_full_name]
    filters:
      congressperson.name: EDUARDO BOLSONARO
    sorts: [congressperson.name]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: "#002776"
    show_single_value_title: true
    single_value_title: Brazilian State
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    hidden_fields: [congressperson.name, ceap.congressperson_state]
    y_axes: []
    listen:
      Congressperson Name: ceap.congressperson_name
    row: 11
    col: 13
    width: 3
    height: 2
  - name: Congressperson Gender (copy)
    title: Congressperson Gender (copy)
    model: brazilian_congress
    explore: congressperson
    type: single_value
    fields: [congressperson.name, congressperson.gender_full]
    sorts: [congressperson.name]
    limit: 500
    query_timezone: America/New_York
    custom_color_enabled: true
    custom_color: "#002776"
    show_single_value_title: true
    single_value_title: Gender
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [congressperson.name]
    y_axes: []
    listen:
      Congressperson Name: congressperson.name
    row: 11
    col: 10
    width: 3
    height: 2
  - name: Congressperson Total Propositions (copy)
    title: Congressperson Total Propositions (copy)
    model: brazilian_congress
    explore: pdt_proposals_authors_congressperson
    type: single_value
    fields: [pdt_proposals_authors_congressperson.congressperson_name, pdt_proposals_authors_congressperson.count]
    sorts: [pdt_proposals_authors_congressperson.count desc]
    limit: 500
    query_timezone: America/New_York
    custom_color_enabled: true
    custom_color: "#002776"
    show_single_value_title: true
    single_value_title: Propositions
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Congressperson Name: pdt_proposals_authors_congressperson.congressperson_name
    row: 15
    col: 10
    width: 4
    height: 2
  - name: Which Topics the Congressperson is more interested for? (copy)
    title: Which Topics the Congressperson is more interested for? (copy)
    model: brazilian_congress
    explore: proposal_authors
    type: looker_wordcloud
    fields: [proposal_topics.proposal_topic, proposal_topics.count]
    sorts: [proposal_topics.count desc]
    query_timezone: America/New_York
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Congressperson Name: congressperson.name
    row: 22
    col: 3
    width: 18
    height: 10
  - name: Congressperson Proposition Status (copy)
    title: Congressperson Proposition Status (copy)
    model: brazilian_congress
    explore: proposal_authors
    type: looker_donut_multiples
    fields: [proposals.proposition_type, proposals.proposition_status, proposals.count]
    pivots: [proposals.proposition_status]
    filters:
      proposals.proposition_type: "-Others"
    sorts: [proposals.count desc 0, proposals.proposition_type, proposals.proposition_status]
    limit: 500
    column_limit: 50
    show_value_labels: true
    font_size: 12
    charts_across: 4
    series_colors:
      Filed - proposals.count: "#FFA726"
      Proposition Submitted - proposals.count: "#42A5F5"
      Requirement Process Completed - proposals.count: "#002776"
      Transformed in Legal Norm - proposals.count: "#66BB6A"
      Transformed in New Proposition - proposals.count: "#D4E157"
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Congressperson Name: congressperson.name
    row: 32
    col: 3
    width: 18
    height: 10
  - name: Number of Propositions Transformed to Legal Norm (copy)
    title: Number of Propositions Transformed to Legal Norm (copy)
    model: brazilian_congress
    explore: proposal_authors
    type: single_value
    fields: [proposals.count]
    filters:
      proposals.proposition_type: Bill,Amendment
      proposals.proposition_status: Transformed in Legal Norm
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: Proposition Transformed in Legal Norm
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Congressperson Name: congressperson.name
    row: 15
    col: 14
    width: 7
    height: 2
  - name: Propositions over the years (copy)
    title: Propositions over the years (copy)
    model: brazilian_congress
    explore: proposal_authors
    type: looker_area
    fields: [proposals.count, proposals.proposal_initial_date_year]
    fill_fields: [proposals.proposal_initial_date_year]
    sorts: [proposals.proposal_initial_date_year desc, proposals.count desc]
    limit: 500
    column_limit: 50
    row_total: right
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Year
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    hide_legend: false
    legend_position: center
    series_types: {}
    point_style: circle
    series_labels:
      proposals.count: Number of Propositions
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    y_axes: []
    listen:
      Congressperson Name: congressperson.name
    row: 42
    col: 3
    width: 10
    height: 9
  - name: Congressperson Expenses Comparison (copy)
    title: Congressperson Expenses Comparison (copy)
    model: brazilian_congress
    explore: ceap
    type: looker_grid
    fields: [ceap.spending_category, ceap.congressperson_comparitor, ceap.average_spending]
    pivots: [ceap.congressperson_comparitor]
    filters: {}
    sorts: [ceap.spending_category, ceap.congressperson_comparitor]
    limit: 500
    dynamic_fields: [{table_calculation: congressperson, label: Congressperson, expression: "concat(\n\
          \  if(pivot_index(${ceap.average_spending},1)<pivot_index(${ceap.average_spending},2)\
          \ OR pivot_index(${ceap.average_spending},1)=pivot_index(${ceap.average_spending},2)\
          \ OR is_null(pivot_index(${ceap.average_spending},1))\n,\"✅\", \"\U0001f534\
          \") \n, \" \", concat(\"R$\", if(is_null(pivot_index(${ceap.average_spending},1)),\
          \ 0,round(pivot_index(${ceap.average_spending},1), 2))\n))\n\n", value_format: !!null '',
        value_format_name: decimal_2, _kind_hint: supermeasure, _type_hint: string},
      {table_calculation: others_congressperson, label: Others Congressperson, expression: 'concat("R$",
          round(pivot_index(${ceap.average_spending},2), 2))', value_format: !!null '',
        value_format_name: decimal_2, _kind_hint: supermeasure, _type_hint: string}]
    query_timezone: America/New_York
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: true
    conditional_formatting_include_nulls: true
    color_application:
      collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      palette_id: fb7bb53e-b77b-4ab6-8274-9d420d3d73f3
    truncate_column_names: false
    conditional_formatting: []
    series_types: {}
    series_column_widths:
      ceap.spending_category: 180
      ceap.average_spending: 177
      congressperson: 120
      others_congressperson: 179
    hidden_fields: [ceap.average_spending]
    y_axes: []
    defaults_version: 1
    listen:
      Congressperson Name: ceap.congressperson_select
    row: 61
    col: 3
    width: 8
    height: 9
  - name: Congressperson Total Spending Categories (copy)
    title: Congressperson Total Spending Categories (copy)
    model: brazilian_congress
    explore: ceap
    type: looker_area
    fields: [ceap.spending_category, ceap.total_spent, ceap.count]
    sorts: [percent_of_total_spending_quantity desc]
    column_limit: 50
    dynamic_fields: [{table_calculation: percent_of_total_spending_amount, label: Percent
          of total Spending amount, expression: "${ceap.total_spent}/sum(${ceap.total_spent})",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}, {table_calculation: percent_of_total_spending_quantity,
        label: percent of total spending quantity, expression: "${ceap.count}/sum(${ceap.count})",
        value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        _type_hint: number}, {table_calculation: calculation_3, label: Calculation
          3, expression: "if(${percent_of_total_spending_quantity}>=0.007\n  , yes\n\
          \  ,no)", value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: yesno}]
    color_application:
      collection_id: c354e5fa-37c1-4878-897b-6e0f47375840
      palette_id: 00c46936-a9f4-4447-8de2-93ceed355ad0
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types:
      percent_of_total_spending_quantity: line
      percent_of_total_spending_amount: column
    point_style: circle
    series_colors:
      percent_of_total_spending_quantity: "#009B3A"
    series_labels:
      percent_of_total_spending_amount: Spending Amount
      percent_of_total_spending_quantity: Spending Quantity
    series_point_styles: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_range: ["#42A5F5", "#EF5350", "#FFCA28", "#66BB6A", "#AB47BC", "#EC407A",
      "#7E57C2", "#5C6BC0", "#29B6F6", "#26C6DA", "#26A69A", "#9CCC65", "#D4E157",
      "#FFEE58", "#FFA726", "#FF7043", "#8D6E63", "#BDBDBD", "#78909C", "#78909C",
      "#78909C", "#78909C", "#78909C", "#78909C", "#78909C", "#42A5F5", "#42A5F5",
      "#42A5F5", "#42A5F5"]
    color_by: root
    hidden_fields: [ceap.total_spent, ceap.count, top12, calculation_3]
    hidden_points_if_no: [top12, calculation_3]
    y_axes: []
    listen:
      Congressperson Name: congressperson.name
    row: 51
    col: 3
    width: 18
    height: 10
  - name: Congressperson Spending Monitor (copy)
    title: Congressperson Spending Monitor (copy)
    model: brazilian_congress
    explore: ceap
    type: table
    fields: [ceap.spending_date_date, ceap.spending_date_day_of_week, ceap.spending_category,
      ceap.congressperson_comparitor, ceap.average_spending]
    pivots: [ceap.congressperson_comparitor]
    filters:
      ceap.spending_date_month: 3 months
      ceap.average_spending: NOT NULL
    sorts: [ceap.congressperson_comparitor 0, is_null desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: is_null, label: is_null, expression: 'NOT
          is_null(pivot_index(${ceap.average_spending},1))', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: supermeasure, _type_hint: yesno},
      {table_calculation: flag, label: Flag, expression: "\n  if(pivot_index(${ceap.average_spending},1)<pivot_index(${ceap.average_spending},2)\
          \ OR pivot_index(${ceap.average_spending},1)=pivot_index(${ceap.average_spending},2)\
          \ \n,\"✅\" , \"\U0001f534\") \n\n", value_format: !!null '', value_format_name: !!null '',
        _kind_hint: supermeasure, _type_hint: string}]
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      ceap.spending_date_date: Date
      ceap.spending_date_day_of_week: Day of Week
      ceap.spending_category: Category
      ceap.average_spending: Average Spending Amount
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_points_if_no: [is_null]
    hidden_fields: []
    y_axes: []
    listen:
      Congressperson Name: ceap.congressperson_select
    row: 61
    col: 11
    width: 10
    height: 9
  - name: Top Suppliers by Congressperson (copy)
    title: Top Suppliers by Congressperson (copy)
    model: brazilian_congress
    explore: top_suppliers_by_category
    type: table
    fields: [top_suppliers_by_category.spending_category, top_suppliers_by_category.supplier_name,
      top_suppliers_by_category.rank, top_suppliers_by_category.total_spent]
    filters:
      top_suppliers_by_category.rank: '1'
    sorts: [top_suppliers_by_category.total_spent desc]
    limit: 500
    query_timezone: America/New_York
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: true
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: hidden
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    hidden_fields: [top_suppliers_by_category.rank]
    series_types: {}
    y_axes: []
    listen:
      Congressperson Name: top_suppliers_by_category.congressperson_name
    row: 42
    col: 13
    width: 8
    height: 9
  - name: Congressperson Most Expensive Meal
    title: Congressperson Most Expensive Meal
    model: brazilian_congress
    explore: congressperson_spending_facts
    type: single_value
    fields: [congressperson_spending_facts.spending_category, congressperson_spending_facts.congressperson_name,
      congressperson_spending_facts.most_expensive, congressperson_spending_facts.expensive_expense]
    filters:
      congressperson_spending_facts.spending_category: Parliamentary Meals
    sorts: [congressperson_spending_facts.most_expensive desc]
    limit: 500
    query_timezone: America/New_York
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: Most Expensive Meal
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Congressperson Name: congressperson_spending_facts.congressperson_name
    row: 70
    col: 11
    width: 10
    height: 4
  - name: Congressperson Most Expensive Fuel
    title: Congressperson Most Expensive Fuel
    model: brazilian_congress
    explore: congressperson_spending_facts
    type: single_value
    fields: [congressperson_spending_facts.congressperson_name, congressperson_spending_facts.expensive_expense,
      congressperson_spending_facts.most_expensive, congressperson_spending_facts.spending_category]
    filters:
      congressperson_spending_facts.spending_category: Fuel
    sorts: [congressperson_spending_facts.most_expensive desc]
    limit: 500
    dynamic_fields: [{table_calculation: fuel_liters, label: Fuel ( Liters), expression: "${congressperson_spending_facts.most_expensive}/4.55",
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/New_York
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: Most expensive reimbursement for FUEL
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: Liters of Fuel
    series_types: {}
    hidden_fields: []
    y_axes: []
    listen:
      Congressperson Name: congressperson_spending_facts.congressperson_name
    row: 70
    col: 3
    width: 8
    height: 4
  filters:
  - name: Congressperson Name
    title: Congressperson Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: overflow
    model: brazilian_congress
    explore: ceap
    listens_to_filters: []
    field: congressperson.name
  - name: Congresspeople birth date
    title: Congresspeople birth date
    type: field_filter
    default_value: 2 weeks ago for 1 week
    allow_multiple_values: true
    required: false
    model: brazilian_congress
    explore: congressperson
    listens_to_filters: []
    field: congressperson.birth_date_date
  - name: congressperson city
    title: congressperson city
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: overflow
    model: brazilian_congress
    explore: congressperson
    listens_to_filters: []
    field: congressperson.city
  - name: test
    title: test
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: brazilian_congress
    explore: ceap
    listens_to_filters: []
    field: ceap.congressperson_id
  - name: test2 - This filter changes dynamically
    title: test2 - This filter changes dynamically
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: brazilian_congress
    explore: congressperson
    listens_to_filters: []
    field: congressperson.birth_state

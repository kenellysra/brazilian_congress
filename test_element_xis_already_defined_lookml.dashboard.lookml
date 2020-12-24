# - dashboard: test_element_xis_already_defined_lookml
#   title: Test Element "X"is already defined lookml
#   layout: newspaper
#   elements:
#   - name: API 12 hours ago
#     title: API 12 hours ago
#     model: brazilian_congress
#     explore: ceap
#     type: table
#     fields: [ceap.spending_date_time, ceap.count]
#     filters:
#       ceap.spending_date_hour: 12 hours ago
#     sorts: [ceap.spending_date_time desc]
#     limit: 500
#     query_timezone: America/New_York
#     row: 0
#     col: 0
#     width: 8
#     height: 6
#   - name: teste2
#     title: teste2
#     model: brazilian_congress
#     explore: congressperson
#     type: single_value
#     fields: [congressperson.count]
#     limit: 500
#     query_timezone: America/New_York
#     custom_color_enabled: true
#     custom_color: ''
#     show_single_value_title: true
#     single_value_title: Teste
#     show_comparison: false
#     comparison_type: value
#     comparison_reverse_colors: false
#     show_comparison_label: true
#     hidden_fields: []
#     y_axes: []
#     row: 0
#     col: 8
#     width: 8
#     height: 6
#   - name: ''
#     type: text
#     body_text: Test with text tile no title
#     row: 0
#     col: 16
#     width: 8
#     height: 6
#   - title: same title
#     name: same title
#     model: brazilian_congress
#     explore: ceap
#     type: looker_column
#     fields: [ceap.congressperson_state, ceap.total_spent]
#     sorts: [ceap.total_spent desc]
#     limit: 500
#     listen: {}
#     row: 6
#     col: 0
#     width: 8
#     height: 6
#   - name: ''
#     type: text
#     body_text: Text tile with no tile 2
#     row: 6
#     col: 8
#     width: 8
#     height: 6
#   - title: same title
#     name: same title
#     model: brazilian_congress
#     explore: ceap
#     type: looker_grid
#     fields: [ceap.id, ceap.count]
#     sorts: [ceap.count desc]
#     limit: 500
#     column_limit: 50
#     row: 6
#     col: 16
#     width: 8
#     height: 6

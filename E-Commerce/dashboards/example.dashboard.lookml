- dashboard: example
  title: Example
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Total Profit
    name: Total Profit
    model: tref_sandbox
    explore: order_items
    type: single_value
    fields: [inventory_items.total_profit]
    limit: 500
    query_timezone: America/Halifax
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    row:
    col:
    width:
    height:

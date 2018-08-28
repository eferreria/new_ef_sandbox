- dashboard: inventory_dashboard
  title: Inventory Dashboard
  layout: newspaper
  elements:
  - title: Stock Count by Category
    name: Stock Count by Category
    model: new_ef_sandbox
    explore: products
    type: looker_column
    fields:
    - products.category
    - inventory_items.stock_count
    sorts:
    - inventory_items.stock_count
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: circle
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    colors:
    - 'palette: Looker Classic'
    series_colors: {}
    y_axes:
    - label: Product Count
      orientation: left
      series:
      - id: products.count
        name: Products Product Count
        axisId: products.count
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    listen:
      Brand: inventory_items.product_brand
    row: 6
    col: 0
    width: 16
    height: 8
  - title: Products with Low Inventory
    name: Products with Low Inventory
    model: new_ef_sandbox
    explore: products
    type: table
    fields:
    - products.category
    - products.name
    - inventory_items.stock_count
    filters:
      inventory_items.stock_count: "<2"
    sorts:
    - inventory_items.stock_count 0
    - products.category
    - products.name
    limit: 500
    column_limit: 50
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    listen:
      Brand: inventory_items.product_brand
    row: 3
    col: 16
    width: 8
    height: 6
  - name: Text Title
    type: text
    title_text: Text Title
    subtitle_text: Text SubTitle
    body_text: This is a Text
    row: 0
    col: 0
    width: 8
    height: 3
  - title: Inventory Movement
    name: Inventory Movement
    model: new_ef_sandbox
    explore: products
    type: looker_line
    fields:
    - inventory_items.count
    - inventory_items.sold_count
    - inventory_items.last_updated_month
    fill_fields:
    - inventory_items.last_updated_month
    sorts:
    - inventory_items.last_updated_month
    limit: 500
    column_limit: 50
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    show_null_points: true
    point_style: none
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    ordering: none
    show_null_labels: false
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    hidden_fields: []
    value_format: "$ #,###; ($ #,###)"
    single_value_title: Total Profit (Loss)
    y_axes:
    - label:
      orientation: left
      series:
      - id: inventory_items.count
        name: Inventory Items Count
        axisId: inventory_items.count
      - id: inventory_items.sold_count
        name: Inventory Items Sold Count
        axisId: inventory_items.sold_count
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    colors:
    - 'palette: Looker Classic'
    series_colors: {}
    hidden_series: []
    listen:
      Brand: inventory_items.product_brand
    row: 14
    col: 0
    width: 16
    height: 7
  - title: Average Item Profit
    name: Average Item Profit
    model: new_ef_sandbox
    explore: inventory_items
    type: single_value
    fields:
    - inventory_items.average_days_in_inventory
    - inventory_items.total_profit
    - inventory_items.average_item_profit
    - inventory_items.count
    filters: {}
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields:
    - inventory_items.total_profit
    - inventory_items.count
    - inventory_items.average_days_in_inventory
    listen:
      Brand: inventory_items.product_brand
    row: 0
    col: 16
    width: 8
    height: 3
  - title: Most Profitable Age Group
    name: Most Profitable Age Group
    model: new_ef_sandbox
    explore: order_items
    type: single_value
    fields:
    - users.age_tier
    - order_items.sales
    filters:
      order_items.sales: ">0"
    sorts:
    - order_items.sales desc
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields:
    - order_items.sales
    listen:
      Brand: inventory_items.product_brand
    row: 3
    col: 8
    width: 8
    height: 3
  - title: Total Profit
    name: Total Profit
    model: new_ef_sandbox
    explore: products
    type: single_value
    fields:
    - products.gross_revenue
    - products.cogs
    sorts:
    - inventory_turnover desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: inventory_turnover
      label: Inventory Turnover
      expression: "${products.gross_revenue}/${products.cogs}"
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields:
    - products.cogs
    - products.gross_revenue
    value_format: "#.##"
    single_value_title: Inventory Turnover
    listen:
      Brand: inventory_items.product_brand
    row: 3
    col: 4
    width: 4
    height: 3
  - title: Total Products
    name: Total Products
    model: new_ef_sandbox
    explore: inventory_items
    type: single_value
    fields:
    - products.gross_revenue
    filters:
      inventory_items.sold_indicator: 'Yes'
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    single_value_title: Total Sales
    value_format: "$ #,###; ($ #,###)"
    listen:
      Brand: inventory_items.product_brand
    row: 0
    col: 8
    width: 8
    height: 3
  - title: Total Available Items
    name: Total Available Items
    model: new_ef_sandbox
    explore: inventory_items
    type: single_value
    fields:
    - inventory_items.stock_count
    filters: {}
    limit: 500
    column_limit: 50
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    single_value_title: Total Available Items
    listen:
      Brand: inventory_items.product_brand
    row: 3
    col: 0
    width: 4
    height: 3
  filters:
  - name: Brand
    title: Brand
    type: field_filter
    default_value: Calvin Klein
    allow_multiple_values: true
    required: false
    model: new_ef_sandbox
    explore: products
    listens_to_filters: []
    field: inventory_items.product_brand

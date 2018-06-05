view: fact_budget {
  sql_table_name: dbo.Fact_Budget ;;

  dimension: budget_entry_skid {
    type: number
    value_format_name: id
    sql: ${TABLE}.BudgetEntry_SKID ;;
    primary_key: yes
  }

  dimension: budget_hours {
    type: number
    sql: ${TABLE}.BudgetHours ;;
  }

  dimension: budget_rate {
    type: number
    sql: ${TABLE}.BudgetRate ;;
  }

  dimension: client_skid {
    type: number
    value_format_name: id
    sql: ${TABLE}.Client_SKID ;;
  }

  dimension_group: modified {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.ModifiedDate ;;
  }

  dimension: project_skid {
    type: number
    value_format_name: id
    sql: ${TABLE}.Project_SKID ;;
  }

  dimension: task_skid {
    type: number
    value_format_name: id
    sql: ${TABLE}.Task_SKID ;;
  }

  measure: total_budget_hours {
    type: sum
    sql: ${budget_hours} ;;
  }

  measure: actual_vs_budgeted_hours {
    label: "Actual VS Budget Hours"
    type: number
    sql: ${total_budget_hours} - ${fact_time_entry.total_hours} ;;
  }

  measure: actual_to_budgeted_ratio {
    type: number
    sql: 1.0*${fact_time_entry.total_hours}/${total_budget_hours} ;;
    value_format_name: percent_2
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

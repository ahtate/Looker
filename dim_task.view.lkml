view: dim_task {
  sql_table_name: dbo.Dim_Task ;;

  dimension: accounting_task_id {
    type: string
    sql: ${TABLE}.AccountingTaskID ;;
  }

  dimension: active {
    type: string
    sql: ${TABLE}.Active ;;
  }

  dimension: client_type_task_override {
    type: string
    sql: ${TABLE}.ClientTypeTaskOverride ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.Code ;;
  }

  dimension: display_name {
    type: string
    sql: ${TABLE}.DisplayName ;;
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

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: project_type_task_override {
    type: string
    sql: ${TABLE}.ProjectTypeTaskOverride ;;
  }

  dimension: recent {
    type: string
    sql: ${TABLE}.Recent ;;
  }

  dimension: task_billable {
    type: string
    sql: ${TABLE}.TaskBillable ;;
  }

  dimension: task_id {
    type: string
    sql: ${TABLE}.TaskID ;;
  }

  dimension: task_skid {
    type: number
    value_format_name: id
    sql: ${TABLE}.Task_SKID ;;
  }

  dimension: task_status {
    type: string
    sql: ${TABLE}.TaskStatus ;;
  }

  measure: count {
    type: count
    drill_fields: [name, display_name]
  }
}

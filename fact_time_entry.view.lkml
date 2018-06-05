view: fact_time_entry {
  sql_table_name: dbo.Fact_TimeEntry ;;

  dimension: client_id {
    type: string
    sql: ${TABLE}.ClientID ;;
  }

  dimension: client_skid {
    type: number
    value_format_name: id
    sql: ${TABLE}.Client_SKID ;;
    primary_key: yes
  }

  dimension: client_type_project_override {
    type: string
    sql: ${TABLE}.ClientTypeProjectOverride ;;
  }

  dimension: client_type_task_override {
    type: string
    sql: ${TABLE}.ClientTypeTaskOverride ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.Comment ;;
  }

  dimension: comment_skid {
    type: number
    value_format_name: id
    sql: ${TABLE}.Comment_SKID ;;
  }

  dimension: date_skid {
    type: number
    value_format_name: id
    sql: ${TABLE}.Date_SKID ;;
  }

  dimension: date_skid_old {
    type: number
    sql: ${TABLE}.Date_SKID_old ;;
  }

  dimension_group: entry {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.EntryDate ;;
  }

  dimension: group_id {
    type: string
    sql: ${TABLE}.GroupID ;;
  }

  dimension: group_skid {
    type: number
    value_format_name: id
    sql: ${TABLE}.Group_SKID ;;
  }

  dimension: hours {
    type: number
    sql: ${TABLE}.Hours ;;
  }

  dimension: leave_type_id {
    type: string
    sql: ${TABLE}.LeaveTypeID ;;
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

  dimension: person_id {
    type: string
    sql: ${TABLE}.PersonID ;;
  }

  dimension: person_skid {
    type: number
    value_format_name: id
    sql: ${TABLE}.Person_SKID ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.ProjectID ;;
  }

  dimension: project_skid {
    type: number
    value_format_name: id
    sql: ${TABLE}.Project_SKID ;;
  }

  dimension: project_type_task_override {
    type: string
    sql: ${TABLE}.ProjectTypeTaskOverride ;;
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

  dimension: time_entry_id {
    type: string
    sql: ${TABLE}.TimeEntryID ;;
  }

  dimension: time_off_skid {
    type: number
    value_format_name: id
    sql: ${TABLE}.TimeOff_SKID ;;
  }

  dimension: timesheet_id {
    type: string
    sql: ${TABLE}.TimesheetID ;;
  }

  dimension: timesheetstatus {
    type: string
    sql: ${TABLE}.Timesheetstatus ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_support_projects {
    type: count
    filters: {
      field: dim_project.is_support
      value: "yes"
    }
    drill_fields: [detail*]
  }

  measure: support_project_ratio {
    description: "Count of Support Projects/total count"
    type: number
    sql: 1.0*${count_support_projects}/nullif(${count},0) ;;
    value_format_name: percent_2
    drill_fields: [detail*]
  }

  measure: total_hours {
    type: sum
    sql: ${hours} ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: [client_skid, hours, entry_date, dim_project.project_type]
  }
}

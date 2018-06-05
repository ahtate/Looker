view: dim_project {
  sql_table_name: dbo.Dim_Project ;;

  dimension: accountingproject_id {
    type: string
    sql: ${TABLE}.AccountingprojectID ;;
  }

  dimension: client_type_project_override {
    type: string
    sql: ${TABLE}.ClientTypeProjectOverride ;;
  }

  dimension: display_order {
    type: number
    sql: ${TABLE}.DisplayOrder ;;
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

  dimension: project_count {
    type: number
    sql: ${TABLE}.ProjectCount ;;
  }

  dimension: project_id {
    type: string
    sql: ${TABLE}.ProjectID ;;
  }

  dimension: project_manager {
    type: string
    sql: ${TABLE}.ProjectManager ;;
  }

  dimension: project_skid {
    type: number
    value_format_name: id
    sql: ${TABLE}.Project_SKID ;;
    primary_key: yes
  }

  dimension: project_type {
    type: string
    sql: ${TABLE}.ProjectType ;;
  }

  dimension: is_support {
    type: yesno
    sql: ${project_type} in ('Support', 'POC') ;;
  }

  dimension: project_type_group {
    type: string
    sql: ${TABLE}.ProjectTypeGroup ;;
  }

  dimension: projectname {
    type: string
    sql: ${TABLE}.Projectname ;;
  }

  dimension: projectnumber {
    type: string
    sql: ${TABLE}.Projectnumber ;;
  }

  dimension: projectstatus {
    type: string
    sql: ${TABLE}.Projectstatus ;;
  }

  measure: count {
    type: count
    drill_fields: [projectname]
  }
}

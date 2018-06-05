view: dim_client {
  sql_table_name: dbo.Dim_Client ;;

  dimension: accounting_client_id {
    type: string
    sql: ${TABLE}.AccountingClientID ;;
  }

  dimension: active {
    type: string
    sql: ${TABLE}.Active ;;
  }

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

  dimension: client_status {
    type: string
    sql: ${TABLE}.ClientStatus ;;
  }

  dimension: client_type {
    type: string
    sql: ${TABLE}.ClientType ;;
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

  dimension: recent {
    type: string
    sql: ${TABLE}.Recent ;;
  }

  dimension: short_name {
    type: string
    sql: ${TABLE}.ShortName ;;
  }

  measure: count {
    type: count
    drill_fields: [name, display_name, short_name]
  }
}

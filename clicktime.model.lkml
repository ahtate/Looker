connection: "azure_click"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

  explore: fact_time_entry {
    join: dim_client {
      relationship: many_to_one
      sql_on: ${dim_client.client_skid} = ${fact_time_entry.client_skid} ;;
    }
    join: dim_project {
      relationship: many_to_one
      sql_on: ${dim_project.project_skid} = ${fact_time_entry.project_skid} ;;
    }
    join: fact_budget {
      type: left_outer
      relationship: many_to_one
      sql_on: ${fact_budget.client_skid} = ${dim_client.client_skid}
      AND ${fact_budget.project_skid} = ${dim_project.project_skid} ;;
    }
  }

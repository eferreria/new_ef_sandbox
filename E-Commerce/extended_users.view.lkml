# include: "users.view.lkml"

# view: extended_users {
#   extends: [users]
#   dimension: age_tier {
#     label: "Tiers of Age"
#     tiers: [15, 26, 36, 46, 56, 60, 65, 80]
#   }
# }

# explore: extended_users {}

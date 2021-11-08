project_name: "eric_sandbox"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }

remote_dependency: dev_thecompany {
  url: "git://github.com/eferreria/dev_thecompany.git"
  ref: "06b8e4471c7cbe879bd2c8f6dedf1720915a5ed3"
}

constant: db_1_url {
  value: "/dashboards-next/779"
}

constant: db_2_url {
  value: "/dashboards-next/780"
}


constant: region_selector{
  value: "Region+Selector"
}

constant: patient_region_selector{
  value: "Patient+Region+Selector"
}

constant: selected_region {
  value: "Selected+Region"
}

constant: primary_blue {
  value: "#003963"
}

constant: secondary_blue {
  value: "#008DD1"
}

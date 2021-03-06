view: operational_metrics {
  derived_table: {
    sql:
       WITH a AS ( SELECT 'Equality' as pillar, 1 as fiscal_month, 2018 as fiscal_year, 10 as month, 2017 as year, 38 as month_actual, 39 as month_goal, 38 as ytd_actual, 465 ytd_goal, 460 as improved, 470 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 2 as fiscal_month, 2018 as fiscal_year, 11 as month, 2017 as year, 41 as month_actual, 37 as month_goal, 79 as ytd_actual, 465 ytd_goal, 460 as improved, 470 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 3 as fiscal_month, 2018 as fiscal_year, 12 as month, 2017 as year, 40 as month_actual, 39 as month_goal, 119 as ytd_actual, 465 ytd_goal, 460 as improved, 470 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 4 as fiscal_month, 2018 as fiscal_year, 1 as month, 2018 as year, 32 as month_actual, 39 as month_goal, 151 as ytd_actual, 465 ytd_goal, 460 as improved, 470 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 5 as fiscal_month, 2018 as fiscal_year, 2 as month, 2018 as year, 37 as month_actual, 39 as month_goal, 188 as ytd_actual, 465 ytd_goal, 460 as improved, 470 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 6 as fiscal_month, 2018 as fiscal_year, 3 as month, 2018 as year, 22 as month_actual, 39 as month_goal, 210 as ytd_actual, 465 ytd_goal, 460 as improved, 470 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 7 as fiscal_month, 2018 as fiscal_year, 4 as month, 2018 as year, 42 as month_actual, 39 as month_goal, 252 as ytd_actual, 465 ytd_goal, 460 as improved, 470 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 8 as fiscal_month, 2018 as fiscal_year, 5 as month, 2018 as year, 33 as month_actual, 39 as month_goal, 285 as ytd_actual, 465 ytd_goal, 460 as improved, 470 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 9 as fiscal_month, 2018 as fiscal_year, 6 as month, 2018 as year, 48 as month_actual, 39 as month_goal, 333 as ytd_actual, 465 ytd_goal, 460 as improved, 470 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 10 as fiscal_month, 2018 as fiscal_year, 7 as month, 2018 as year, 43 as month_actual, 39 as month_goal, 376 as ytd_actual, 465 ytd_goal, 460 as improved, 470 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 11 as fiscal_month, 2018 as fiscal_year, 8 as month, 2018 as year, 39 as month_actual, 38 as month_goal, 415 as ytd_actual, 465 ytd_goal, 460 as improved, 470 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 12 as fiscal_month, 2018 as fiscal_year, 9 as month, 2018 as year, 35 as month_actual, 39 as month_goal, 450 as ytd_actual, 465 ytd_goal, 460 as improved, 470 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 1 as fiscal_month, 2019 as fiscal_year, 10 as month, 2018 as year, 38 as month_actual, 40 as month_goal, 38 as ytd_actual, 475 ytd_goal, 470 as improved, 480 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 2 as fiscal_month, 2019 as fiscal_year, 11 as month, 2018 as year, 41 as month_actual, 38 as month_goal, 79 as ytd_actual, 475 ytd_goal, 470 as improved, 480 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 3 as fiscal_month, 2019 as fiscal_year, 12 as month, 2018 as year, 41 as month_actual, 40 as month_goal, 120 as ytd_actual, 475 ytd_goal, 470 as improved, 480 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 4 as fiscal_month, 2019 as fiscal_year, 1 as month, 2019 as year, 43 as month_actual, 40 as month_goal, 163 as ytd_actual, 475 ytd_goal, 470 as improved, 480 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 5 as fiscal_month, 2019 as fiscal_year, 2 as month, 2019 as year, 37 as month_actual, 40 as month_goal, 200 as ytd_actual, 475 ytd_goal, 470 as improved, 480 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 6 as fiscal_month, 2019 as fiscal_year, 3 as month, 2019 as year, 39 as month_actual, 40 as month_goal, 239 as ytd_actual, 475 ytd_goal, 470 as improved, 480 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 7 as fiscal_month, 2019 as fiscal_year, 4 as month, 2019 as year, 41 as month_actual, 40 as month_goal, 280 as ytd_actual, 475 ytd_goal, 470 as improved, 480 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 8 as fiscal_month, 2019 as fiscal_year, 5 as month, 2019 as year, 38 as month_actual, 40 as month_goal, 318 as ytd_actual, 475 ytd_goal, 470 as improved, 480 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 9 as fiscal_month, 2019 as fiscal_year, 6 as month, 2019 as year, 39 as month_actual, 40 as month_goal, 357 as ytd_actual, 475 ytd_goal, 470 as improved, 480 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 10 as fiscal_month, 2019 as fiscal_year, 7 as month, 2019 as year, 39 as month_actual, 40 as month_goal, 396 as ytd_actual, 475 ytd_goal, 470 as improved, 480 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 11 as fiscal_month, 2019 as fiscal_year, 8 as month, 2019 as year, 0 as month_actual, 38 as month_goal, 0 as ytd_actual, 475 ytd_goal, 470 as improved, 480 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 12 as fiscal_month, 2019 as fiscal_year, 9 as month, 2019 as year, 0 as month_actual, 39 as month_goal, 0 as ytd_actual, 475 ytd_goal, 470 as improved, 480 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 1 as fiscal_month, 2018 as fiscal_year, 10 as month, 2017 as year, 511 as month_actual, 542 as month_goal, 511 as ytd_actual, 6500 ytd_goal, 6450 as improved, 6550 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 2 as fiscal_month, 2018 as fiscal_year, 11 as month, 2017 as year, 417 as month_actual, 542 as month_goal, 928 as ytd_actual, 6500 ytd_goal, 6450 as improved, 6550 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 3 as fiscal_month, 2018 as fiscal_year, 12 as month, 2017 as year, 623 as month_actual, 542 as month_goal, 1551 as ytd_actual, 6500 ytd_goal, 6450 as improved, 6550 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 4 as fiscal_month, 2018 as fiscal_year, 1 as month, 2018 as year, 663 as month_actual, 542 as month_goal, 2214 as ytd_actual, 6500 ytd_goal, 6450 as improved, 6550 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 5 as fiscal_month, 2018 as fiscal_year, 2 as month, 2018 as year, 301 as month_actual, 538 as month_goal, 2515 as ytd_actual, 6500 ytd_goal, 6450 as improved, 6550 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 6 as fiscal_month, 2018 as fiscal_year, 3 as month, 2018 as year, 421 as month_actual, 542 as month_goal, 2936 as ytd_actual, 6500 ytd_goal, 6450 as improved, 6550 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 7 as fiscal_month, 2018 as fiscal_year, 4 as month, 2018 as year, 375 as month_actual, 542 as month_goal, 3311 as ytd_actual, 6500 ytd_goal, 6450 as improved, 6550 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 8 as fiscal_month, 2018 as fiscal_year, 5 as month, 2018 as year, 489 as month_actual, 542 as month_goal, 3800 as ytd_actual, 6500 ytd_goal, 6450 as improved, 6550 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 9 as fiscal_month, 2018 as fiscal_year, 6 as month, 2018 as year, 684 as month_actual, 542 as month_goal, 4484 as ytd_actual, 6500 ytd_goal, 6450 as improved, 6550 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 10 as fiscal_month, 2018 as fiscal_year, 7 as month, 2018 as year, 592 as month_actual, 542 as month_goal, 5076 as ytd_actual, 6500 ytd_goal, 6450 as improved, 6550 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 11 as fiscal_month, 2018 as fiscal_year, 8 as month, 2018 as year, 634 as month_actual, 542 as month_goal, 5710 as ytd_actual, 6500 ytd_goal, 6450 as improved, 6550 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 12 as fiscal_month, 2018 as fiscal_year, 9 as month, 2018 as year, 657 as month_actual, 542 as month_goal, 6367 as ytd_actual, 6500 ytd_goal, 6450 as improved, 6550 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 1 as fiscal_month, 2019 as fiscal_year, 10 as month, 2018 as year, 398 as month_actual, 550 as month_goal, 398 as ytd_actual, 6600 ytd_goal, 6550 as improved, 6650 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 2 as fiscal_month, 2019 as fiscal_year, 11 as month, 2018 as year, 489 as month_actual, 550 as month_goal, 887 as ytd_actual, 6600 ytd_goal, 6550 as improved, 6650 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 3 as fiscal_month, 2019 as fiscal_year, 12 as month, 2018 as year, 550 as month_actual, 550 as month_goal, 1437 as ytd_actual, 6600 ytd_goal, 6550 as improved, 6650 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 4 as fiscal_month, 2019 as fiscal_year, 1 as month, 2019 as year, 601 as month_actual, 550 as month_goal, 2038 as ytd_actual, 6600 ytd_goal, 6550 as improved, 6650 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 5 as fiscal_month, 2019 as fiscal_year, 2 as month, 2019 as year, 580 as month_actual, 550 as month_goal, 2618 as ytd_actual, 6600 ytd_goal, 6550 as improved, 6650 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 6 as fiscal_month, 2019 as fiscal_year, 3 as month, 2019 as year, 601 as month_actual, 550 as month_goal, 3219 as ytd_actual, 6600 ytd_goal, 6550 as improved, 6650 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 7 as fiscal_month, 2019 as fiscal_year, 4 as month, 2019 as year, 575 as month_actual, 550 as month_goal, 3794 as ytd_actual, 6600 ytd_goal, 6550 as improved, 6650 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 8 as fiscal_month, 2019 as fiscal_year, 5 as month, 2019 as year, 588 as month_actual, 550 as month_goal, 4382 as ytd_actual, 6600 ytd_goal, 6550 as improved, 6650 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 9 as fiscal_month, 2019 as fiscal_year, 6 as month, 2019 as year, 550 as month_actual, 550 as month_goal, 4932 as ytd_actual, 6600 ytd_goal, 6550 as improved, 6650 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 10 as fiscal_month, 2019 as fiscal_year, 7 as month, 2019 as year, 530 as month_actual, 550 as month_goal, 5462 as ytd_actual, 6600 ytd_goal, 6550 as improved, 6650 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 11 as fiscal_month, 2019 as fiscal_year, 8 as month, 2019 as year, 0 as month_actual, 550 as month_goal, 0 as ytd_actual, 6600 ytd_goal, 6550 as improved, 6650 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 12 as fiscal_month, 2019 as fiscal_year, 9 as month, 2019 as year, 0 as month_actual, 550 as month_goal, 0 as ytd_actual, 6600 ytd_goal, 6550 as improved, 6650 as crushed  UNION ALL
    SELECT 'Service' as pillar, 1 as fiscal_month, 2018 as fiscal_year, 10 as month, 2017 as year, 0.11 as month_actual, 0.17 as month_goal, 0.21 as ytd_actual, 0.16 ytd_goal, 0.15 as improved, 0.17 as crushed  UNION ALL
    SELECT 'Service' as pillar, 2 as fiscal_month, 2018 as fiscal_year, 11 as month, 2017 as year, 0.12 as month_actual, 0.17 as month_goal, 0.21 as ytd_actual, 0.16 ytd_goal, 0.15 as improved, 0.17 as crushed  UNION ALL
    SELECT 'Service' as pillar, 3 as fiscal_month, 2018 as fiscal_year, 12 as month, 2017 as year, 0.11 as month_actual, 0.17 as month_goal, 0.21 as ytd_actual, 0.16 ytd_goal, 0.15 as improved, 0.17 as crushed  UNION ALL
    SELECT 'Service' as pillar, 4 as fiscal_month, 2018 as fiscal_year, 1 as month, 2018 as year, 0.15 as month_actual, 0.17 as month_goal, 0.21 as ytd_actual, 0.16 ytd_goal, 0.15 as improved, 0.17 as crushed  UNION ALL
    SELECT 'Service' as pillar, 5 as fiscal_month, 2018 as fiscal_year, 2 as month, 2018 as year, 0.16 as month_actual, 0.17 as month_goal, 0.21 as ytd_actual, 0.16 ytd_goal, 0.15 as improved, 0.17 as crushed  UNION ALL
    SELECT 'Service' as pillar, 6 as fiscal_month, 2018 as fiscal_year, 3 as month, 2018 as year, 0.16 as month_actual, 0.17 as month_goal, 0.21 as ytd_actual, 0.16 ytd_goal, 0.15 as improved, 0.17 as crushed  UNION ALL
    SELECT 'Service' as pillar, 7 as fiscal_month, 2018 as fiscal_year, 4 as month, 2018 as year, 0.17 as month_actual, 0.17 as month_goal, 0.21 as ytd_actual, 0.16 ytd_goal, 0.15 as improved, 0.17 as crushed  UNION ALL
    SELECT 'Service' as pillar, 8 as fiscal_month, 2018 as fiscal_year, 5 as month, 2018 as year, 0.2 as month_actual, 0.17 as month_goal, 0.21 as ytd_actual, 0.16 ytd_goal, 0.15 as improved, 0.17 as crushed  UNION ALL
    SELECT 'Service' as pillar, 9 as fiscal_month, 2018 as fiscal_year, 6 as month, 2018 as year, 0.21 as month_actual, 0.17 as month_goal, 0.22 as ytd_actual, 0.16 ytd_goal, 0.15 as improved, 0.17 as crushed  UNION ALL
    SELECT 'Service' as pillar, 10 as fiscal_month, 2018 as fiscal_year, 7 as month, 2018 as year, 0.16 as month_actual, 0.17 as month_goal, 0.21 as ytd_actual, 0.16 ytd_goal, 0.15 as improved, 0.17 as crushed  UNION ALL
    SELECT 'Service' as pillar, 11 as fiscal_month, 2018 as fiscal_year, 8 as month, 2018 as year, 0.14 as month_actual, 0.17 as month_goal, 0.21 as ytd_actual, 0.16 ytd_goal, 0.15 as improved, 0.17 as crushed  UNION ALL
    SELECT 'Service' as pillar, 12 as fiscal_month, 2018 as fiscal_year, 9 as month, 2018 as year, 0.22 as month_actual, 0.17 as month_goal, 0.21 as ytd_actual, 0.16 ytd_goal, 0.15 as improved, 0.17 as crushed  UNION ALL
    SELECT 'Service' as pillar, 1 as fiscal_month, 2019 as fiscal_year, 10 as month, 2018 as year, 0.16 as month_actual, 0.18 as month_goal, 0.21 as ytd_actual, 0.17 ytd_goal, 0.16 as improved, 0.18 as crushed  UNION ALL
    SELECT 'Service' as pillar, 2 as fiscal_month, 2019 as fiscal_year, 11 as month, 2018 as year, 0.16 as month_actual, 0.18 as month_goal, 0.21 as ytd_actual, 0.17 ytd_goal, 0.16 as improved, 0.18 as crushed  UNION ALL
    SELECT 'Service' as pillar, 3 as fiscal_month, 2019 as fiscal_year, 12 as month, 2018 as year, 0.16 as month_actual, 0.18 as month_goal, 0.21 as ytd_actual, 0.17 ytd_goal, 0.16 as improved, 0.18 as crushed  UNION ALL
    SELECT 'Service' as pillar, 4 as fiscal_month, 2019 as fiscal_year, 1 as month, 2019 as year, 0.16 as month_actual, 0.18 as month_goal, 0.21 as ytd_actual, 0.17 ytd_goal, 0.16 as improved, 0.18 as crushed  UNION ALL
    SELECT 'Service' as pillar, 5 as fiscal_month, 2019 as fiscal_year, 2 as month, 2019 as year, 0.16 as month_actual, 0.18 as month_goal, 0.21 as ytd_actual, 0.17 ytd_goal, 0.16 as improved, 0.18 as crushed  UNION ALL
    SELECT 'Service' as pillar, 6 as fiscal_month, 2019 as fiscal_year, 3 as month, 2019 as year, 0.16 as month_actual, 0.18 as month_goal, 0.21 as ytd_actual, 0.17 ytd_goal, 0.16 as improved, 0.18 as crushed  UNION ALL
    SELECT 'Service' as pillar, 7 as fiscal_month, 2019 as fiscal_year, 4 as month, 2019 as year, 0.16 as month_actual, 0.18 as month_goal, 0.21 as ytd_actual, 0.17 ytd_goal, 0.16 as improved, 0.18 as crushed  UNION ALL
    SELECT 'Service' as pillar, 8 as fiscal_month, 2019 as fiscal_year, 5 as month, 2019 as year, 0.22 as month_actual, 0.18 as month_goal, 0.21 as ytd_actual, 0.17 ytd_goal, 0.16 as improved, 0.18 as crushed  UNION ALL
    SELECT 'Service' as pillar, 9 as fiscal_month, 2019 as fiscal_year, 6 as month, 2019 as year, 0.23 as month_actual, 0.18 as month_goal, 0.22 as ytd_actual, 0.17 ytd_goal, 0.16 as improved, 0.18 as crushed  UNION ALL
    SELECT 'Service' as pillar, 10 as fiscal_month, 2019 as fiscal_year, 7 as month, 2019 as year, 0.3 as month_actual, 0.18 as month_goal, 0.21 as ytd_actual, 0.17 ytd_goal, 0.16 as improved, 0.18 as crushed  UNION ALL
    SELECT 'Service' as pillar, 11 as fiscal_month, 2019 as fiscal_year, 8 as month, 2019 as year, 0 as month_actual, 0.18 as month_goal, 0 as ytd_actual, 0.17 ytd_goal, 0.16 as improved, 0.18 as crushed  UNION ALL
    SELECT 'Service' as pillar, 12 as fiscal_month, 2019 as fiscal_year, 9 as month, 2019 as year, 0 as month_actual, 0.18 as month_goal, 0 as ytd_actual, 0.17 ytd_goal, 0.16 as improved, 0.18 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 1 as fiscal_month, 2018 as fiscal_year, 10 as month, 2017 as year, 0.049 as month_actual, 0.053 as month_goal, 0.049 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 2 as fiscal_month, 2018 as fiscal_year, 11 as month, 2017 as year, 0.05 as month_actual, 0.053 as month_goal, 0.05 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 3 as fiscal_month, 2018 as fiscal_year, 12 as month, 2017 as year, 0.051 as month_actual, 0.053 as month_goal, 0.051 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 4 as fiscal_month, 2018 as fiscal_year, 1 as month, 2018 as year, 0.0525 as month_actual, 0.053 as month_goal, 0.0525 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 5 as fiscal_month, 2018 as fiscal_year, 2 as month, 2018 as year, 0.08 as month_actual, 0.053 as month_goal, 0.08 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 6 as fiscal_month, 2018 as fiscal_year, 3 as month, 2018 as year, 0.07 as month_actual, 0.053 as month_goal, 0.07 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 7 as fiscal_month, 2018 as fiscal_year, 4 as month, 2018 as year, 0.06 as month_actual, 0.053 as month_goal, 0.06 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 8 as fiscal_month, 2018 as fiscal_year, 5 as month, 2018 as year, 0.044 as month_actual, 0.053 as month_goal, 0.044 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 9 as fiscal_month, 2018 as fiscal_year, 6 as month, 2018 as year, 0.045 as month_actual, 0.053 as month_goal, 0.045 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 10 as fiscal_month, 2018 as fiscal_year, 7 as month, 2018 as year, 0.055 as month_actual, 0.053 as month_goal, 0.055 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 11 as fiscal_month, 2018 as fiscal_year, 8 as month, 2018 as year, 0.053 as month_actual, 0.053 as month_goal, 0.053 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 12 as fiscal_month, 2018 as fiscal_year, 9 as month, 2018 as year, 0.061 as month_actual, 0.053 as month_goal, 0.061 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 1 as fiscal_month, 2019 as fiscal_year, 10 as month, 2018 as year, 0.051 as month_actual, 0.053 as month_goal, 0.051 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 2 as fiscal_month, 2019 as fiscal_year, 11 as month, 2018 as year, 0.051 as month_actual, 0.053 as month_goal, 0.051 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 3 as fiscal_month, 2019 as fiscal_year, 12 as month, 2018 as year, 0.051 as month_actual, 0.053 as month_goal, 0.051 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 4 as fiscal_month, 2019 as fiscal_year, 1 as month, 2019 as year, 0.051 as month_actual, 0.053 as month_goal, 0.051 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 5 as fiscal_month, 2019 as fiscal_year, 2 as month, 2019 as year, 0.051 as month_actual, 0.053 as month_goal, 0.051 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 6 as fiscal_month, 2019 as fiscal_year, 3 as month, 2019 as year, 0.051 as month_actual, 0.053 as month_goal, 0.051 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 7 as fiscal_month, 2019 as fiscal_year, 4 as month, 2019 as year, 0.051 as month_actual, 0.053 as month_goal, 0.051 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 8 as fiscal_month, 2019 as fiscal_year, 5 as month, 2019 as year, 0.055 as month_actual, 0.053 as month_goal, 0.055 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 9 as fiscal_month, 2019 as fiscal_year, 6 as month, 2019 as year, 0.06 as month_actual, 0.053 as month_goal, 0.06 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 10 as fiscal_month, 2019 as fiscal_year, 7 as month, 2019 as year, 0.07 as month_actual, 0.053 as month_goal, 0.07 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 11 as fiscal_month, 2019 as fiscal_year, 8 as month, 2019 as year, 0 as month_actual, 0.053 as month_goal, 0 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 12 as fiscal_month, 2019 as fiscal_year, 9 as month, 2019 as year, 0 as month_actual, 0.053 as month_goal, 0 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 1 as fiscal_month, 2018 as fiscal_year, 10 as month, 2017 as year, 300 as month_actual, 267 as month_goal, 300 as ytd_actual, 3200 ytd_goal, 3175 as improved, 3225 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 2 as fiscal_month, 2018 as fiscal_year, 11 as month, 2017 as year, 230 as month_actual, 267 as month_goal, 530 as ytd_actual, 3200 ytd_goal, 3175 as improved, 3225 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 3 as fiscal_month, 2018 as fiscal_year, 12 as month, 2017 as year, 245 as month_actual, 267 as month_goal, 775 as ytd_actual, 3200 ytd_goal, 3175 as improved, 3225 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 4 as fiscal_month, 2018 as fiscal_year, 1 as month, 2018 as year, 295 as month_actual, 267 as month_goal, 1070 as ytd_actual, 3200 ytd_goal, 3175 as improved, 3225 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 5 as fiscal_month, 2018 as fiscal_year, 2 as month, 2018 as year, 325 as month_actual, 263 as month_goal, 1395 as ytd_actual, 3200 ytd_goal, 3175 as improved, 3225 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 6 as fiscal_month, 2018 as fiscal_year, 3 as month, 2018 as year, 317 as month_actual, 267 as month_goal, 1712 as ytd_actual, 3200 ytd_goal, 3175 as improved, 3225 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 7 as fiscal_month, 2018 as fiscal_year, 4 as month, 2018 as year, 238 as month_actual, 267 as month_goal, 1950 as ytd_actual, 3200 ytd_goal, 3175 as improved, 3225 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 8 as fiscal_month, 2018 as fiscal_year, 5 as month, 2018 as year, 221 as month_actual, 267 as month_goal, 2171 as ytd_actual, 3200 ytd_goal, 3175 as improved, 3225 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 9 as fiscal_month, 2018 as fiscal_year, 6 as month, 2018 as year, 319 as month_actual, 267 as month_goal, 2490 as ytd_actual, 3200 ytd_goal, 3175 as improved, 3225 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 10 as fiscal_month, 2018 as fiscal_year, 7 as month, 2018 as year, 243 as month_actual, 267 as month_goal, 2662 as ytd_actual, 3200 ytd_goal, 3175 as improved, 3225 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 11 as fiscal_month, 2018 as fiscal_year, 8 as month, 2018 as year, 299 as month_actual, 267 as month_goal, 2961 as ytd_actual, 3200 ytd_goal, 3175 as improved, 3225 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 12 as fiscal_month, 2018 as fiscal_year, 9 as month, 2018 as year, 293 as month_actual, 267 as month_goal, 3254 as ytd_actual, 3200 ytd_goal, 3175 as improved, 3225 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 1 as fiscal_month, 2019 as fiscal_year, 10 as month, 2018 as year, 340 as month_actual, 271 as month_goal, 340 as ytd_actual, 3250 ytd_goal, 3225 as improved, 3275 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 2 as fiscal_month, 2019 as fiscal_year, 11 as month, 2018 as year, 267 as month_actual, 271 as month_goal, 607 as ytd_actual, 3250 ytd_goal, 3225 as improved, 3275 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 3 as fiscal_month, 2019 as fiscal_year, 12 as month, 2018 as year, 312 as month_actual, 271 as month_goal, 919 as ytd_actual, 3250 ytd_goal, 3225 as improved, 3275 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 4 as fiscal_month, 2019 as fiscal_year, 1 as month, 2019 as year, 283 as month_actual, 271 as month_goal, 1202 as ytd_actual, 3250 ytd_goal, 3225 as improved, 3275 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 5 as fiscal_month, 2019 as fiscal_year, 2 as month, 2019 as year, 302 as month_actual, 269 as month_goal, 1504 as ytd_actual, 3250 ytd_goal, 3225 as improved, 3275 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 6 as fiscal_month, 2019 as fiscal_year, 3 as month, 2019 as year, 270 as month_actual, 271 as month_goal, 1774 as ytd_actual, 3250 ytd_goal, 3225 as improved, 3275 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 7 as fiscal_month, 2019 as fiscal_year, 4 as month, 2019 as year, 221 as month_actual, 271 as month_goal, 1995 as ytd_actual, 3250 ytd_goal, 3225 as improved, 3275 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 8 as fiscal_month, 2019 as fiscal_year, 5 as month, 2019 as year, 300 as month_actual, 271 as month_goal, 2295 as ytd_actual, 3250 ytd_goal, 3225 as improved, 3275 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 9 as fiscal_month, 2019 as fiscal_year, 6 as month, 2019 as year, 312 as month_actual, 271 as month_goal, 2607 as ytd_actual, 3250 ytd_goal, 3225 as improved, 3275 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 10 as fiscal_month, 2019 as fiscal_year, 7 as month, 2019 as year, 192 as month_actual, 271 as month_goal, 2799 as ytd_actual, 3250 ytd_goal, 3225 as improved, 3275 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 11 as fiscal_month, 2019 as fiscal_year, 8 as month, 2019 as year, 0 as month_actual, 271 as month_goal, 0 as ytd_actual, 3250 ytd_goal, 3225 as improved, 3275 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 12 as fiscal_month, 2019 as fiscal_year, 9 as month, 2019 as year, 0 as month_actual, 271 as month_goal, 0 as ytd_actual, 3250 ytd_goal, 3225 as improved, 3275 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 1 as fiscal_month, 2020 as fiscal_year, 10 as month, 2019 as year, 38 as month_actual, 39 as month_goal, 38 as ytd_actual, 465 ytd_goal, 460 as improved, 470 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 2 as fiscal_month, 2020 as fiscal_year, 11 as month, 2019 as year, 41 as month_actual, 37 as month_goal, 79 as ytd_actual, 465 ytd_goal, 460 as improved, 470 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 3 as fiscal_month, 2020 as fiscal_year, 12 as month, 2019 as year, 40 as month_actual, 39 as month_goal, 119 as ytd_actual, 465 ytd_goal, 460 as improved, 470 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 4 as fiscal_month, 2020 as fiscal_year, 1 as month, 2020 as year, 32 as month_actual, 39 as month_goal, 151 as ytd_actual, 465 ytd_goal, 460 as improved, 470 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 5 as fiscal_month, 2020 as fiscal_year, 2 as month, 2020 as year, 37 as month_actual, 39 as month_goal, 188 as ytd_actual, 465 ytd_goal, 460 as improved, 470 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 6 as fiscal_month, 2020 as fiscal_year, 3 as month, 2020 as year, 22 as month_actual, 39 as month_goal, 210 as ytd_actual, 465 ytd_goal, 460 as improved, 470 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 7 as fiscal_month, 2020 as fiscal_year, 4 as month, 2020 as year, 42 as month_actual, 39 as month_goal, 252 as ytd_actual, 465 ytd_goal, 460 as improved, 470 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 8 as fiscal_month, 2020 as fiscal_year, 5 as month, 2020 as year, 33 as month_actual, 39 as month_goal, 285 as ytd_actual, 465 ytd_goal, 460 as improved, 470 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 9 as fiscal_month, 2020 as fiscal_year, 6 as month, 2020 as year, 48 as month_actual, 39 as month_goal, 333 as ytd_actual, 465 ytd_goal, 460 as improved, 470 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 10 as fiscal_month, 2020 as fiscal_year, 7 as month, 2020 as year, 43 as month_actual, 39 as month_goal, 376 as ytd_actual, 465 ytd_goal, 460 as improved, 470 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 11 as fiscal_month, 2020 as fiscal_year, 8 as month, 2020 as year, 39 as month_actual, 38 as month_goal, 415 as ytd_actual, 465 ytd_goal, 460 as improved, 470 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 12 as fiscal_month, 2020 as fiscal_year, 9 as month, 2020 as year, 35 as month_actual, 39 as month_goal, 450 as ytd_actual, 465 ytd_goal, 460 as improved, 470 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 1 as fiscal_month, 2021 as fiscal_year, 10 as month, 2020 as year, 38 as month_actual, 40 as month_goal, 38 as ytd_actual, 475 ytd_goal, 470 as improved, 480 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 2 as fiscal_month, 2021 as fiscal_year, 11 as month, 2020 as year, 41 as month_actual, 38 as month_goal, 79 as ytd_actual, 475 ytd_goal, 470 as improved, 480 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 3 as fiscal_month, 2021 as fiscal_year, 12 as month, 2020 as year, 41 as month_actual, 40 as month_goal, 120 as ytd_actual, 475 ytd_goal, 470 as improved, 480 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 4 as fiscal_month, 2021 as fiscal_year, 1 as month, 2021 as year, 43 as month_actual, 40 as month_goal, 163 as ytd_actual, 475 ytd_goal, 470 as improved, 480 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 5 as fiscal_month, 2021 as fiscal_year, 2 as month, 2021 as year, 37 as month_actual, 40 as month_goal, 200 as ytd_actual, 475 ytd_goal, 470 as improved, 480 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 6 as fiscal_month, 2021 as fiscal_year, 3 as month, 2021 as year, 39 as month_actual, 40 as month_goal, 239 as ytd_actual, 475 ytd_goal, 470 as improved, 480 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 7 as fiscal_month, 2021 as fiscal_year, 4 as month, 2021 as year, 41 as month_actual, 40 as month_goal, 280 as ytd_actual, 475 ytd_goal, 470 as improved, 480 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 8 as fiscal_month, 2021 as fiscal_year, 5 as month, 2021 as year, 38 as month_actual, 40 as month_goal, 318 as ytd_actual, 475 ytd_goal, 470 as improved, 480 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 9 as fiscal_month, 2021 as fiscal_year, 6 as month, 2021 as year, 39 as month_actual, 40 as month_goal, 357 as ytd_actual, 475 ytd_goal, 470 as improved, 480 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 10 as fiscal_month, 2021 as fiscal_year, 7 as month, 2021 as year, 39 as month_actual, 40 as month_goal, 396 as ytd_actual, 475 ytd_goal, 470 as improved, 480 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 11 as fiscal_month, 2021 as fiscal_year, 8 as month, 2021 as year, 0 as month_actual, 38 as month_goal, 0 as ytd_actual, 475 ytd_goal, 470 as improved, 480 as crushed  UNION ALL
    SELECT 'Equality' as pillar, 12 as fiscal_month, 2021 as fiscal_year, 9 as month, 2021 as year, 0 as month_actual, 39 as month_goal, 0 as ytd_actual, 475 ytd_goal, 470 as improved, 480 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 1 as fiscal_month, 2020 as fiscal_year, 10 as month, 2019 as year, 511 as month_actual, 542 as month_goal, 511 as ytd_actual, 6500 ytd_goal, 6450 as improved, 6550 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 2 as fiscal_month, 2020 as fiscal_year, 11 as month, 2019 as year, 417 as month_actual, 542 as month_goal, 928 as ytd_actual, 6500 ytd_goal, 6450 as improved, 6550 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 3 as fiscal_month, 2020 as fiscal_year, 12 as month, 2019 as year, 623 as month_actual, 542 as month_goal, 1551 as ytd_actual, 6500 ytd_goal, 6450 as improved, 6550 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 4 as fiscal_month, 2020 as fiscal_year, 1 as month, 2020 as year, 663 as month_actual, 542 as month_goal, 2214 as ytd_actual, 6500 ytd_goal, 6450 as improved, 6550 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 5 as fiscal_month, 2020 as fiscal_year, 2 as month, 2020 as year, 301 as month_actual, 538 as month_goal, 2515 as ytd_actual, 6500 ytd_goal, 6450 as improved, 6550 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 6 as fiscal_month, 2020 as fiscal_year, 3 as month, 2020 as year, 421 as month_actual, 542 as month_goal, 2936 as ytd_actual, 6500 ytd_goal, 6450 as improved, 6550 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 7 as fiscal_month, 2020 as fiscal_year, 4 as month, 2020 as year, 375 as month_actual, 542 as month_goal, 3311 as ytd_actual, 6500 ytd_goal, 6450 as improved, 6550 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 8 as fiscal_month, 2020 as fiscal_year, 5 as month, 2020 as year, 489 as month_actual, 542 as month_goal, 3800 as ytd_actual, 6500 ytd_goal, 6450 as improved, 6550 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 9 as fiscal_month, 2020 as fiscal_year, 6 as month, 2020 as year, 684 as month_actual, 542 as month_goal, 4484 as ytd_actual, 6500 ytd_goal, 6450 as improved, 6550 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 10 as fiscal_month, 2020 as fiscal_year, 7 as month, 2020 as year, 592 as month_actual, 542 as month_goal, 5076 as ytd_actual, 6500 ytd_goal, 6450 as improved, 6550 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 11 as fiscal_month, 2020 as fiscal_year, 8 as month, 2020 as year, 634 as month_actual, 542 as month_goal, 5710 as ytd_actual, 6500 ytd_goal, 6450 as improved, 6550 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 12 as fiscal_month, 2020 as fiscal_year, 9 as month, 2020 as year, 657 as month_actual, 542 as month_goal, 6367 as ytd_actual, 6500 ytd_goal, 6450 as improved, 6550 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 1 as fiscal_month, 2021 as fiscal_year, 10 as month, 2020 as year, 398 as month_actual, 550 as month_goal, 398 as ytd_actual, 6600 ytd_goal, 6550 as improved, 6650 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 2 as fiscal_month, 2021 as fiscal_year, 11 as month, 2020 as year, 489 as month_actual, 550 as month_goal, 887 as ytd_actual, 6600 ytd_goal, 6550 as improved, 6650 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 3 as fiscal_month, 2021 as fiscal_year, 12 as month, 2020 as year, 550 as month_actual, 550 as month_goal, 1437 as ytd_actual, 6600 ytd_goal, 6550 as improved, 6650 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 4 as fiscal_month, 2021 as fiscal_year, 1 as month, 2021 as year, 601 as month_actual, 550 as month_goal, 2038 as ytd_actual, 6600 ytd_goal, 6550 as improved, 6650 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 5 as fiscal_month, 2021 as fiscal_year, 2 as month, 2021 as year, 580 as month_actual, 550 as month_goal, 2618 as ytd_actual, 6600 ytd_goal, 6550 as improved, 6650 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 6 as fiscal_month, 2021 as fiscal_year, 3 as month, 2021 as year, 601 as month_actual, 550 as month_goal, 3219 as ytd_actual, 6600 ytd_goal, 6550 as improved, 6650 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 7 as fiscal_month, 2021 as fiscal_year, 4 as month, 2021 as year, 575 as month_actual, 550 as month_goal, 3794 as ytd_actual, 6600 ytd_goal, 6550 as improved, 6650 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 8 as fiscal_month, 2021 as fiscal_year, 5 as month, 2021 as year, 588 as month_actual, 550 as month_goal, 4382 as ytd_actual, 6600 ytd_goal, 6550 as improved, 6650 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 9 as fiscal_month, 2021 as fiscal_year, 6 as month, 2021 as year, 550 as month_actual, 550 as month_goal, 4932 as ytd_actual, 6600 ytd_goal, 6550 as improved, 6650 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 10 as fiscal_month, 2021 as fiscal_year, 7 as month, 2021 as year, 530 as month_actual, 550 as month_goal, 5462 as ytd_actual, 6600 ytd_goal, 6550 as improved, 6650 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 11 as fiscal_month, 2021 as fiscal_year, 8 as month, 2021 as year, 0 as month_actual, 550 as month_goal, 0 as ytd_actual, 6600 ytd_goal, 6550 as improved, 6650 as crushed  UNION ALL
    SELECT 'Lives' as pillar, 12 as fiscal_month, 2021 as fiscal_year, 9 as month, 2021 as year, 0 as month_actual, 550 as month_goal, 0 as ytd_actual, 6600 ytd_goal, 6550 as improved, 6650 as crushed  UNION ALL
    SELECT 'Service' as pillar, 1 as fiscal_month, 2020 as fiscal_year, 10 as month, 2019 as year, 0.11 as month_actual, 0.17 as month_goal, 0.21 as ytd_actual, 0.16 ytd_goal, 0.15 as improved, 0.17 as crushed  UNION ALL
    SELECT 'Service' as pillar, 2 as fiscal_month, 2020 as fiscal_year, 11 as month, 2019 as year, 0.12 as month_actual, 0.17 as month_goal, 0.21 as ytd_actual, 0.16 ytd_goal, 0.15 as improved, 0.17 as crushed  UNION ALL
    SELECT 'Service' as pillar, 3 as fiscal_month, 2020 as fiscal_year, 12 as month, 2019 as year, 0.11 as month_actual, 0.17 as month_goal, 0.21 as ytd_actual, 0.16 ytd_goal, 0.15 as improved, 0.17 as crushed  UNION ALL
    SELECT 'Service' as pillar, 4 as fiscal_month, 2020 as fiscal_year, 1 as month, 2020 as year, 0.15 as month_actual, 0.17 as month_goal, 0.21 as ytd_actual, 0.16 ytd_goal, 0.15 as improved, 0.17 as crushed  UNION ALL
    SELECT 'Service' as pillar, 5 as fiscal_month, 2020 as fiscal_year, 2 as month, 2020 as year, 0.16 as month_actual, 0.17 as month_goal, 0.21 as ytd_actual, 0.16 ytd_goal, 0.15 as improved, 0.17 as crushed  UNION ALL
    SELECT 'Service' as pillar, 6 as fiscal_month, 2020 as fiscal_year, 3 as month, 2020 as year, 0.16 as month_actual, 0.17 as month_goal, 0.21 as ytd_actual, 0.16 ytd_goal, 0.15 as improved, 0.17 as crushed  UNION ALL
    SELECT 'Service' as pillar, 7 as fiscal_month, 2020 as fiscal_year, 4 as month, 2020 as year, 0.17 as month_actual, 0.17 as month_goal, 0.21 as ytd_actual, 0.16 ytd_goal, 0.15 as improved, 0.17 as crushed  UNION ALL
    SELECT 'Service' as pillar, 8 as fiscal_month, 2020 as fiscal_year, 5 as month, 2020 as year, 0.2 as month_actual, 0.17 as month_goal, 0.21 as ytd_actual, 0.16 ytd_goal, 0.15 as improved, 0.17 as crushed  UNION ALL
    SELECT 'Service' as pillar, 9 as fiscal_month, 2020 as fiscal_year, 6 as month, 2020 as year, 0.21 as month_actual, 0.17 as month_goal, 0.22 as ytd_actual, 0.16 ytd_goal, 0.15 as improved, 0.17 as crushed  UNION ALL
    SELECT 'Service' as pillar, 10 as fiscal_month, 2020 as fiscal_year, 7 as month, 2020 as year, 0.16 as month_actual, 0.17 as month_goal, 0.21 as ytd_actual, 0.16 ytd_goal, 0.15 as improved, 0.17 as crushed  UNION ALL
    SELECT 'Service' as pillar, 11 as fiscal_month, 2020 as fiscal_year, 8 as month, 2020 as year, 0.14 as month_actual, 0.17 as month_goal, 0.21 as ytd_actual, 0.16 ytd_goal, 0.15 as improved, 0.17 as crushed  UNION ALL
    SELECT 'Service' as pillar, 12 as fiscal_month, 2020 as fiscal_year, 9 as month, 2020 as year, 0.22 as month_actual, 0.17 as month_goal, 0.21 as ytd_actual, 0.16 ytd_goal, 0.15 as improved, 0.17 as crushed  UNION ALL
    SELECT 'Service' as pillar, 1 as fiscal_month, 2021 as fiscal_year, 10 as month, 2020 as year, 0.16 as month_actual, 0.18 as month_goal, 0.21 as ytd_actual, 0.17 ytd_goal, 0.16 as improved, 0.18 as crushed  UNION ALL
    SELECT 'Service' as pillar, 2 as fiscal_month, 2021 as fiscal_year, 11 as month, 2020 as year, 0.16 as month_actual, 0.18 as month_goal, 0.21 as ytd_actual, 0.17 ytd_goal, 0.16 as improved, 0.18 as crushed  UNION ALL
    SELECT 'Service' as pillar, 3 as fiscal_month, 2021 as fiscal_year, 12 as month, 2020 as year, 0.16 as month_actual, 0.18 as month_goal, 0.21 as ytd_actual, 0.17 ytd_goal, 0.16 as improved, 0.18 as crushed  UNION ALL
    SELECT 'Service' as pillar, 4 as fiscal_month, 2021 as fiscal_year, 1 as month, 2021 as year, 0.16 as month_actual, 0.18 as month_goal, 0.21 as ytd_actual, 0.17 ytd_goal, 0.16 as improved, 0.18 as crushed  UNION ALL
    SELECT 'Service' as pillar, 5 as fiscal_month, 2021 as fiscal_year, 2 as month, 2021 as year, 0.16 as month_actual, 0.18 as month_goal, 0.21 as ytd_actual, 0.17 ytd_goal, 0.16 as improved, 0.18 as crushed  UNION ALL
    SELECT 'Service' as pillar, 6 as fiscal_month, 2021 as fiscal_year, 3 as month, 2021 as year, 0.16 as month_actual, 0.18 as month_goal, 0.21 as ytd_actual, 0.17 ytd_goal, 0.16 as improved, 0.18 as crushed  UNION ALL
    SELECT 'Service' as pillar, 7 as fiscal_month, 2021 as fiscal_year, 4 as month, 2021 as year, 0.16 as month_actual, 0.18 as month_goal, 0.21 as ytd_actual, 0.17 ytd_goal, 0.16 as improved, 0.18 as crushed  UNION ALL
    SELECT 'Service' as pillar, 8 as fiscal_month, 2021 as fiscal_year, 5 as month, 2021 as year, 0.22 as month_actual, 0.18 as month_goal, 0.21 as ytd_actual, 0.17 ytd_goal, 0.16 as improved, 0.18 as crushed  UNION ALL
    SELECT 'Service' as pillar, 9 as fiscal_month, 2021 as fiscal_year, 6 as month, 2021 as year, 0.23 as month_actual, 0.18 as month_goal, 0.22 as ytd_actual, 0.17 ytd_goal, 0.16 as improved, 0.18 as crushed  UNION ALL
    SELECT 'Service' as pillar, 10 as fiscal_month, 2021 as fiscal_year, 7 as month, 2021 as year, 0.3 as month_actual, 0.18 as month_goal, 0.21 as ytd_actual, 0.17 ytd_goal, 0.16 as improved, 0.18 as crushed  UNION ALL
    SELECT 'Service' as pillar, 11 as fiscal_month, 2021 as fiscal_year, 8 as month, 2021 as year, 0 as month_actual, 0.18 as month_goal, 0 as ytd_actual, 0.17 ytd_goal, 0.16 as improved, 0.18 as crushed  UNION ALL
    SELECT 'Service' as pillar, 12 as fiscal_month, 2021 as fiscal_year, 9 as month, 2021 as year, 0 as month_actual, 0.18 as month_goal, 0 as ytd_actual, 0.17 ytd_goal, 0.16 as improved, 0.18 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 1 as fiscal_month, 2020 as fiscal_year, 10 as month, 2019 as year, 0.049 as month_actual, 0.053 as month_goal, 0.049 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 2 as fiscal_month, 2020 as fiscal_year, 11 as month, 2019 as year, 0.05 as month_actual, 0.053 as month_goal, 0.05 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 3 as fiscal_month, 2020 as fiscal_year, 12 as month, 2019 as year, 0.051 as month_actual, 0.053 as month_goal, 0.051 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 4 as fiscal_month, 2020 as fiscal_year, 1 as month, 2020 as year, 0.0525 as month_actual, 0.053 as month_goal, 0.0525 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 5 as fiscal_month, 2020 as fiscal_year, 2 as month, 2020 as year, 0.08 as month_actual, 0.053 as month_goal, 0.08 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 6 as fiscal_month, 2020 as fiscal_year, 3 as month, 2020 as year, 0.07 as month_actual, 0.053 as month_goal, 0.07 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 7 as fiscal_month, 2020 as fiscal_year, 4 as month, 2020 as year, 0.06 as month_actual, 0.053 as month_goal, 0.06 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 8 as fiscal_month, 2020 as fiscal_year, 5 as month, 2020 as year, 0.044 as month_actual, 0.053 as month_goal, 0.044 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 9 as fiscal_month, 2020 as fiscal_year, 6 as month, 2020 as year, 0.045 as month_actual, 0.053 as month_goal, 0.045 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 10 as fiscal_month, 2020 as fiscal_year, 7 as month, 2020 as year, 0.055 as month_actual, 0.053 as month_goal, 0.055 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 11 as fiscal_month, 2020 as fiscal_year, 8 as month, 2020 as year, 0.053 as month_actual, 0.053 as month_goal, 0.053 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 12 as fiscal_month, 2020 as fiscal_year, 9 as month, 2020 as year, 0.061 as month_actual, 0.053 as month_goal, 0.061 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 1 as fiscal_month, 2021 as fiscal_year, 10 as month, 2020 as year, 0.051 as month_actual, 0.053 as month_goal, 0.051 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 2 as fiscal_month, 2021 as fiscal_year, 11 as month, 2020 as year, 0.051 as month_actual, 0.053 as month_goal, 0.051 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 3 as fiscal_month, 2021 as fiscal_year, 12 as month, 2020 as year, 0.051 as month_actual, 0.053 as month_goal, 0.051 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 4 as fiscal_month, 2021 as fiscal_year, 1 as month, 2021 as year, 0.051 as month_actual, 0.053 as month_goal, 0.051 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 5 as fiscal_month, 2021 as fiscal_year, 2 as month, 2021 as year, 0.051 as month_actual, 0.053 as month_goal, 0.051 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 6 as fiscal_month, 2021 as fiscal_year, 3 as month, 2021 as year, 0.051 as month_actual, 0.053 as month_goal, 0.051 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 7 as fiscal_month, 2021 as fiscal_year, 4 as month, 2021 as year, 0.051 as month_actual, 0.053 as month_goal, 0.051 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 8 as fiscal_month, 2021 as fiscal_year, 5 as month, 2021 as year, 0.055 as month_actual, 0.053 as month_goal, 0.055 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 9 as fiscal_month, 2021 as fiscal_year, 6 as month, 2021 as year, 0.06 as month_actual, 0.053 as month_goal, 0.06 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 10 as fiscal_month, 2021 as fiscal_year, 7 as month, 2021 as year, 0.07 as month_actual, 0.053 as month_goal, 0.07 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 11 as fiscal_month, 2021 as fiscal_year, 8 as month, 2021 as year, 0 as month_actual, 0.053 as month_goal, 0 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Stewardship' as pillar, 12 as fiscal_month, 2021 as fiscal_year, 9 as month, 2021 as year, 0 as month_actual, 0.053 as month_goal, 0 as ytd_actual, 0.053 ytd_goal, 0.053 as improved, 0.053 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 1 as fiscal_month, 2020 as fiscal_year, 10 as month, 2019 as year, 300 as month_actual, 267 as month_goal, 300 as ytd_actual, 3200 ytd_goal, 3175 as improved, 3225 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 2 as fiscal_month, 2020 as fiscal_year, 11 as month, 2019 as year, 230 as month_actual, 267 as month_goal, 530 as ytd_actual, 3200 ytd_goal, 3175 as improved, 3225 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 3 as fiscal_month, 2020 as fiscal_year, 12 as month, 2019 as year, 245 as month_actual, 267 as month_goal, 775 as ytd_actual, 3200 ytd_goal, 3175 as improved, 3225 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 4 as fiscal_month, 2020 as fiscal_year, 1 as month, 2020 as year, 295 as month_actual, 267 as month_goal, 1070 as ytd_actual, 3200 ytd_goal, 3175 as improved, 3225 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 5 as fiscal_month, 2020 as fiscal_year, 2 as month, 2020 as year, 325 as month_actual, 263 as month_goal, 1395 as ytd_actual, 3200 ytd_goal, 3175 as improved, 3225 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 6 as fiscal_month, 2020 as fiscal_year, 3 as month, 2020 as year, 317 as month_actual, 267 as month_goal, 1712 as ytd_actual, 3200 ytd_goal, 3175 as improved, 3225 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 7 as fiscal_month, 2020 as fiscal_year, 4 as month, 2020 as year, 238 as month_actual, 267 as month_goal, 1950 as ytd_actual, 3200 ytd_goal, 3175 as improved, 3225 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 8 as fiscal_month, 2020 as fiscal_year, 5 as month, 2020 as year, 221 as month_actual, 267 as month_goal, 2171 as ytd_actual, 3200 ytd_goal, 3175 as improved, 3225 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 9 as fiscal_month, 2020 as fiscal_year, 6 as month, 2020 as year, 319 as month_actual, 267 as month_goal, 2490 as ytd_actual, 3200 ytd_goal, 3175 as improved, 3225 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 10 as fiscal_month, 2020 as fiscal_year, 7 as month, 2020 as year, 243 as month_actual, 267 as month_goal, 2662 as ytd_actual, 3200 ytd_goal, 3175 as improved, 3225 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 11 as fiscal_month, 2020 as fiscal_year, 8 as month, 2020 as year, 299 as month_actual, 267 as month_goal, 2961 as ytd_actual, 3200 ytd_goal, 3175 as improved, 3225 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 12 as fiscal_month, 2020 as fiscal_year, 9 as month, 2020 as year, 293 as month_actual, 267 as month_goal, 3254 as ytd_actual, 3200 ytd_goal, 3175 as improved, 3225 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 1 as fiscal_month, 2021 as fiscal_year, 10 as month, 2020 as year, 340 as month_actual, 271 as month_goal, 340 as ytd_actual, 3250 ytd_goal, 3225 as improved, 3275 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 2 as fiscal_month, 2021 as fiscal_year, 11 as month, 2020 as year, 267 as month_actual, 271 as month_goal, 607 as ytd_actual, 3250 ytd_goal, 3225 as improved, 3275 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 3 as fiscal_month, 2021 as fiscal_year, 12 as month, 2020 as year, 312 as month_actual, 271 as month_goal, 919 as ytd_actual, 3250 ytd_goal, 3225 as improved, 3275 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 4 as fiscal_month, 2021 as fiscal_year, 1 as month, 2021 as year, 283 as month_actual, 271 as month_goal, 1202 as ytd_actual, 3250 ytd_goal, 3225 as improved, 3275 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 5 as fiscal_month, 2021 as fiscal_year, 2 as month, 2021 as year, 302 as month_actual, 269 as month_goal, 1504 as ytd_actual, 3250 ytd_goal, 3225 as improved, 3275 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 6 as fiscal_month, 2021 as fiscal_year, 3 as month, 2021 as year, 270 as month_actual, 271 as month_goal, 1774 as ytd_actual, 3250 ytd_goal, 3225 as improved, 3275 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 7 as fiscal_month, 2021 as fiscal_year, 4 as month, 2021 as year, 221 as month_actual, 271 as month_goal, 1995 as ytd_actual, 3250 ytd_goal, 3225 as improved, 3275 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 8 as fiscal_month, 2021 as fiscal_year, 5 as month, 2021 as year, 300 as month_actual, 271 as month_goal, 2295 as ytd_actual, 3250 ytd_goal, 3225 as improved, 3275 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 9 as fiscal_month, 2021 as fiscal_year, 6 as month, 2021 as year, 312 as month_actual, 271 as month_goal, 2607 as ytd_actual, 3250 ytd_goal, 3225 as improved, 3275 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 10 as fiscal_month, 2021 as fiscal_year, 7 as month, 2021 as year, 192 as month_actual, 271 as month_goal, 2799 as ytd_actual, 3250 ytd_goal, 3225 as improved, 3275 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 11 as fiscal_month, 2021 as fiscal_year, 8 as month, 2021 as year, 0 as month_actual, 271 as month_goal, 0 as ytd_actual, 3250 ytd_goal, 3225 as improved, 3275 as crushed  UNION ALL
    SELECT 'Thrive' as pillar, 12 as fiscal_month, 2021 as fiscal_year, 9 as month, 2021 as year, 0 as month_actual, 271 as month_goal, 0 as ytd_actual, 3250 ytd_goal, 3225 as improved, 3275 as crushed
    )
        select cast(date(year, month, 1) as timestamp)as event_date, * from a;;
    #     datagroup_trigger: om_default_datagroup
    }

    dimension_group: event {
      type: time
      timeframes: [raw, date, week, month, year, fiscal_month_num, fiscal_year, fiscal_quarter_of_year
        , month_name, month_num]
      sql: ${TABLE}.event_date;;
    }

    dimension: pillar {
      type: string
      sql: ${TABLE}.pillar ;;
    }

    dimension: fiscal_month {
      type: number
      sql: ${TABLE}.fiscal_month ;;
    }

    dimension: fiscal_year_2 {
      type: number
      sql: ${TABLE}.fiscal_year ;;
    }

    dimension: month {
      type: number
      sql: ${TABLE}.month ;;
    }

    dimension: year {
      type: number
      sql: ${TABLE}.year ;;
    }

    dimension: month_actual {
      type: number
      sql: ${TABLE}.month_actual ;;
    }

    dimension: month_goal {
      type: number
      sql: ${TABLE}.month_goal ;;
    }

    dimension: ytd_actual {
      type: number
      sql: ${TABLE}.ytd_actual ;;
    }

    dimension: ytd_goal {
      type: number
      sql: ${TABLE}.ytd_goal ;;
    }

    dimension: improved {
      type: number
      sql: ${TABLE}.improved ;;
    }

    dimension: crushed {
      type: number
      sql: ${TABLE}.crushed ;;
    }

# ===================================     DERIVED DIMENSIONS        ================================

    dimension: ytd_status {
      type: string
      case: {
        when: {
          label: "CRUSHING IT"
          sql: ${ytd_actual}>=${crushed}/12*${fiscal_month}  ;;
        }
        when: {
          label: "DELIVERING IT"
          sql: ${ytd_actual}>=${ytd_goal}/12*${fiscal_month} ;;
        }
        when: {
          label: "IMPROVING IT"
          sql: ${ytd_actual}>=${improved}/12*${fiscal_month} ;;
        }
        else: "MISSING IT"
      }
    }


    dimension: ytd_status_color {
      type: string
      case: {
        when: {
          label: "#5797C2"
          sql: ${ytd_actual}>=${crushed}/12*${fiscal_month}  ;;
        }
        when: {
          label: "#5E9524"
          sql: ${ytd_actual}>=${ytd_goal}/12*${fiscal_month} ;;
        }
        when: {
          label: "#EEB211"
          sql: ${ytd_actual}>=${improved}/12*${fiscal_month} ;;
        }
        else: "#D11F1F"
      }
    }

    dimension: has_met_monthly_goal {
      type: yesno
      sql: ${month_actual}>=${month_goal} ;;
    }
    dimension: has_met_yearly_goal {
      type: yesno
      sql: ${ytd_actual}>=${ytd_goal} ;;
    }
    dimension: progress_bar_color {
      type: string
      sql:  'progress-bar-success';;
    }
    dimension: status_for_the_month {
      type: string
      case: {
        when: {
          label: "green"
          sql: ${has_met_monthly_goal} = 'Yes' ;;
        }
        else: "NA"
      }
    }
    dimension: pillar_sub_header {
      case: {
        when: {
          label: "Optimal Transplant for All US Patients"
          sql: ${pillar} = 'Thrive' ;;
        }
        when: {
          label: "Prompt Time to Transplant for US Patients"
          sql: ${pillar}='Service' ;;
        }
        when: {
          label: "Stewardship"
          sql: ${pillar}='Stewardship' ;;
        }
        when: {
          label: "Lives Impacted Through Cellular Therapy"
          sql: ${pillar}='Lives' ;;
        }
        when: {
          label: "8/8 Transplants for Underserved Patients"
          sql: ${pillar}='Equality' ;;
        }
      }
    }

    dimension: percent_of_year {
      type: number
      sql: ${event_fiscal_month_num}/12 ;;
      value_format_name: percent_0
    }
    dimension: percent_of_month {
      type: number
      sql: extract(day from current_date)/31 ;;
      value_format_name: percent_0
    }
    dimension: pillar_header_caps {
      type: string
      sql: upper(${pillar}) ;;
      hidden: yes
    }



# ===================================     MEASURES        ================================

#   measure: progress_bar_value {
#     type: number
#     sql: round((1.0*${metric_month_actual}/ifnull(${metric_month_goal},1))*100,0) ;;
#   }

    measure: percent_progress_of_year {
      type: number
      sql: ${metric_year_actual}/${metric_year_goal} ;;
      value_format_name: percent_0
    }

    measure: percent_progress_of_month {
      type: number
      sql: ${metric_month_actual}/${metric_month_goal} ;;
      value_format_name: percent_0
    }

    measure: metric_month_actual {
      type: sum
      sql: ${month_actual} ;;
      value_format_name: decimal_0
    }

    measure: metric_month_actual_percent {
      type: sum
      sql: ${month_actual} ;;
      value_format_name: percent_1
    }

    measure: metric_year_actual {
      type: sum
      sql: ${ytd_actual} ;;
      value_format_name: decimal_0
    }

    measure: metric_year_actual_percent {
      type: sum
      sql: ${ytd_actual} ;;
      value_format_name: percent_1
    }

    measure: metric_month_goal {
      type: sum
      sql: ${month_goal} ;;
      value_format_name: decimal_0
    }
    measure: metric_month_goal_percent {
      type: sum
      sql: ${month_goal} ;;
      value_format_name: percent_1
    }

    measure: metric_year_goal {
      type: average
      sql: ${ytd_goal} ;;
      value_format_name: decimal_0
    }

    measure: metric_year_goal_percent {
      type: average
      sql: ${ytd_goal} ;;
      value_format_name: percent_1
    }

    measure: total_months_goals_were_met {
      type: count
      filters: {
        field: has_met_monthly_goal
        value: "Yes"
      }
    }
    measure: max_fiscal_month {
      type: max
      sql: ${fiscal_month} ;;
    }
    measure: annualized_actual {
      type: number
      sql: ${metric_year_actual}/${max_fiscal_month}*12
        ;;
      value_format_name: decimal_0
    }

    measure: reinvesting {
      type: number
      sql: 1.0-${metric_year_goal} ;;
      value_format_name: percent_1
      hidden: yes
    }

    measure: stewardship_bar_mark {
      type: number
      sql: (${metric_year_goal}*100/50)*(${metric_year_actual}*100) ;;
      value_format_name: percent_1
      hidden: yes
    }

# ===================================     CSS STYLE DIMENSIONS        ================================
    dimension: color1 {
      #Navy
      hidden: yes
      type: string
      sql: '#00355E' ;;
    }
    dimension: color2 {
      #Green
      hidden: yes
      type: string
      sql: '#5E9524' ;;
    }
    dimension: color3 {
      #LightBlue
      hidden: yes
      type: string
      sql: '#5797C2' ;;
#     sql: '#a9b81b' ;;
    }
    dimension: color4 {
      #purple
      hidden: yes
      type: string
      sql: '#95358C' ;;

    }
    dimension: secondary_lines {
      hidden: yes
      type: string
      sql: '' ;;
    }
    dimension: no_padding_margin {
      html: yes ;;
      sql: 'padding:1px 0px 1px 0px; margin:0;' ;;
    }

    measure: html_fun {
      type: count
      html:
      <div class="container" style="border:1px; box-shadow:1px 1px">
      {{value}}
      </div>

      ;;
    }

# ===================================     MEASURES - STATUS MESSAGES    ================================
    measure: yearly_status {
      hidden: yes
      type: count
      html:
          <div class="container" style="width:100%; font-size:14px">
          <h4>
            We are currently {{ percent_of_year._rendered_value }} through the year and are {{ percent_progress_of_year._rendered_value }}
            of the way toward completing our goal.
            </h4>
            </div>
            ;;
    }

    measure: old_site_status {

      link: {
        label: "Drill Down to See Customers"
        url: "/explore/eaf_sandbox/users?fields=users.id,users.name&f[users.state]={{
        _filters['users.state'] | url_encode }}"
        icon_url: "https://looker.com/favicon.ico"
      }
#   hidden: yes
    type: count
    html:
    <div class="container" style="width:auto; font-size:16px; border-bottom: .1em solid {{color1._value}}; padding: 12px 12px 12px 12px; margin:0; align:center">
    <table style="border:0px; width:100%" class="table-condensed">
      <tr style="height:10px">
         <td colspan=2 style="text-align:left; height:10px; {{no_padding_margin._value}}">
            <p style="font-size:22px; font-family:Arial Black; color:{{color1._value}}; font-weight: bold">{{pillar._rendered_value}}</p>
         </td>
      </tr>
      <tr style="height:10px">
         <td colspan=2 style="text-align:left; padding:5px 0px 0px 0px;">
            <p style="font-size:16px; color:{{color1._value}}; font-weight:bold; {{no_padding_margin._value}}">{{event_month_name._value}} {{event_year._value}}</p>
         </td>
      </tr>
      <tr>
         <td style="{{no_padding_margin._value}}">
            <p style="{{no_padding_margin._value}}; color: {{color2._value}}; font-size:16px">To Date: {{metric_month_actual._rendered_value}}
            </p>
         </td>
         <td style="text-align:right; {{no_padding_margin._value}}">
            <p style="color:{{color3._value}}; {{no_padding_margin._value}} font-size:16px"> Goal: {{metric_month_goal._rendered_value}} </p>
         </td>
      </tr>
      <tr style="{{no_padding_margin._value}}">
         <td colspan=2 style="{{no_padding_margin._value}}">
            <div class="progress" style="height:50px; vertical-align:middle; background-color:{{color3._value}}; {{no_padding_margin._value}}">
               <div class="progress-bar {{progress_bar_color._value}} progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="{{percent_progress_of_month._rendered_value}}" aria-valuemin="0" aria-valuemax="100" style="width:{{percent_progress_of_month._rendered_value}}; text-align:right">
                  <br>
                  <font style="font-size:22px">{{percent_progress_of_month._rendered_value}}</font>
               </div>
            </div>
            <div class="progress" style="height:15px; background-color:{{color4._value}}; width:{{ percent_of_month._rendered_value }}; {{no_padding_margin._value}}">
            </div>
         </td>
      </tr>
      <tr>
         <td colspan=2 style="text-align:left; {{no_padding_margin._value}}">
            <br>
            <p style="font-size:16px; color:{{color1._value}}; font-weight: bold; {{no_padding_margin._value}}">FY {{event_fiscal_year._value}} &nbsp
               <font style="color:{{ytd_status_color}}; font-weight:bold; font-family:Arial Black; font-size:13px">{{ytd_status._value}} </font>
            </p>
         </td>
      </tr>
      <tr>
         <td style="text-align:left; {{no_padding_margin._value}}">
            <p style="{{no_padding_margin._value}} margin:0; color:{{color2._value}}; font-size:16px">To Date: {{metric_year_actual._rendered_value}} </p>
         </td>
         <td style="text-align:right; {{no_padding_margin._value}}">
            <p style="color:{{color3._value}}; {{no_padding_margin._value}} font-size:16px"> Goal: {{metric_year_goal._rendered_value}}</p>
         </td>
      </tr>
      <tr>
         <td colspan=2 style="{{no_padding_margin._value}}">
            <div class="progress" style="height:50px; vertical-align:middle; background-color:{{color3._value}}; {{no_padding_margin._value}}">
               <div class="progress-bar {{progress_bar_color._value}} progress-bar-striped" role="progressbar" aria-valuenow="{{percent_progress_of_year._rendered_value}}" aria-valuemin="0" aria-valuemax="100" style="width:{{percent_progress_of_year._rendered_value}}; text-align:right">
                  <br>
                  <font style="font-size:22px">{{percent_progress_of_year._rendered_value}}</font>
               </div>
            </div>
            <div class="progress" style="height:15px; background-color:{{color4._value}}; width:{{ percent_of_year._rendered_value }}; {{no_padding_margin._value}}">
            </div>
            <p style="font-size:16px; text-align:left; color:{{color4._value}}">
               {{ percent_of_year._rendered_value }} through FY {{event_fiscal_year._value}}
            </p>
         </td>
      </tr>
   </table>
</div>;;
  }

  measure: auto_size_status {

#   hidden: yes
    type: count
    html:
    <div class="container" style="width:auto; height:auto; background-color:blue; padding: 12px 12px 12px 12px; margin:0; align:center display:flex">
    <div  class="width:90%; margin: 12px 12px 12px 12px; font-size:15vw;">
   I will autoscale
  </div>
    </div>
    ;;
  }

  measure: service_status {
#     hidden: yes
  type: count
  html:
    <div class="container" style="width:400px; font-size:16px;  padding: 12px 12px 12px 12px; margin:0">
    <table style="border:0px; width:100%" class="table-condensed">
        <tr style="height:10px">
          <td colspan=2 style="text-align:left; height:10px; {{no_padding_margin._value}}">
                <p style="font-size:22px; font-family:Arial Black; color:{{color1._value}}; font-weight: bold">{{pillar._rendered_value}}</p>
            </td>
        </tr>
        <tr style="height:10px">
            <td colspan=2 style="text-align:left; padding:5px 0px 0px 0px;">
                <p style="font-size:16px; color:{{color1._value}}; font-weight:bold; {{no_padding_margin._value}}">{{event_month_name._value}} {{event_year._value}}&nbsp
                <font style="color:{{ytd_status_color}}; font-weight:bold; font-family:Arial Black; font-size:13px">{{ytd_status._value}} </font>
                </p>
            </td>
        </tr>
    </table>
    </div>
    ;;
}

measure: pillar_status_percent {
  type: count
  hidden: yes
  html:
    <div class="container" style="width:400px; font-size:14px;">
    <table style="border:0px; width:100%" class="table-condensed">
        <tr style="height:10px">
            <th colspan=2 style="text-align:center; height:10px; padding:0px">
                <h2 style="color:{{color1._value}}; font-weight: bold"> {{pillar._rendered_value}}</h2>
            </th>
        </tr>
        <tr style="height:10px">
            <td colspan=2 style="text-align:center; height:10px; padding:2px">
                <h3 style="color:{{color1._value}}; font-weight: bold">{{event_month_name._value}}</h2></td>
        </tr>
        <tr>
            <td style="text-align:left; padding:0px">
                <strong style="color:{{color2._value}}; font-weight:bold">So far: {{metric_month_actual_percent._rendered_value}} </strong>
            </td>
            <td style="text-align:right; height:10px; padding:0px"><strong style="color:{{color1._value}}; font-weight: bold"> Goal: {{metric_month_goal_percent._rendered_value}}  </strong> </td>
        </tr>
        <tr>
            <td colspan=2 style=" padding:2px">
                <div class="progress" style="height:50px; vertical-align:middle; background-color:#0079c1;padding-bottom:0px; margin:0">
                    <div class="progress-bar {{progress_bar_color._value}} progress-bar-striped" role="progressbar" aria-valuenow="{{percent_progress_of_year._rendered_value}}" aria-valuemin="0" aria-valuemax="100" style="width:{{percent_progress_of_year._rendered_value}}">
                        <br>
                        <font size="4">{{percent_progress_of_year._rendered_value}}  Crushed!</font>
                    </div>
                </div>
                <div class="progress" style="height:15px; background-color:purple; width:{{ percent_of_year._rendered_value }}; padding:0px 0px 0px 0px; margin:0">
                    <p style="font-size:12px; text-align:center; color:white">{{ percent_of_year._rendered_value }} through the month </p>
                </div>
            </td>
        </tr>
        <tr>
            <td colspan=2 style="text-align:center;">
                <h3 style="color:{{color1._value}}; font-weight: bold">FY {{event_fiscal_year._value}}</h3>
            </td>
        </tr>
        <tr>
            <td style="text-align:left"><strong style="color:{{color2._value}}; font-weight:bold">So far: {{metric_year_actual_percent._rendered_value}} </strong></td>
            <td style="text-align:right"> <strong style="color:{{color1._value}}; font-weight: bold">FY {{event_fiscal_year._value}} Goal: {{metric_year_goal_percent._rendered_value}}</strong> </td>
        </tr>
        <tr>
            <td colspan=2>
                <div class="progress" style="height:50px; vertical-align:middle; background-color:#0079c1;padding:0px 0px 0px 0px; margin:0">
                    <div class="progress-bar {{progress_bar_color._value}} progress-bar-striped" role="progressbar" aria-valuenow="{{percent_progress_of_year._rendered_value}}" aria-valuemin="0" aria-valuemax="100" style="width:{{percent_progress_of_year._rendered_value}}">
                        <br>
                        <font size="4">{{percent_progress_of_year._rendered_value}}  Crushed!</font>
                    </div>
                </div>
                <div class="progress" style="height:15px; background-color:{{color4._value}}; width:{{ percent_of_year._rendered_value }}; padding:0px 0px 0px 0px; margin:0">
                    <p style="font-size:12px; text-align:center; color:white">{{ percent_of_year._rendered_value }} through the year </p>
                </div>
            </td>
        </tr>
    </table>
</div>
    ;;
}
measure: hr_bar {
  type: count
  html:
    <div class="container" style="width:100%">
      <hr style="background-color:{{color1._value}}; border-top: 1px;  height:2px">
    </div>
    ;;
}

measure: steward_progress {
  type: count
  html:
    <div class="container" style="width:600px; font-size:14px; padding: 12px 12px 12px 12px; margin:0">
      <table style="border:0px; width:100%; {{no_padding_margin._value}}" class="table-condensed">
        <tr style="height:10px">
          <td colspan=2 style="text-align:left; height:10px; {{no_padding_margin._value}}">
                <p style="font-size:22px; font-family:Arial Black; color:{{color1._value}}; font-weight: bold">{{pillar._rendered_value}}</p>
            </td>
        </tr>
        <tr style="height:10px">
            <td colspan=2 style="text-align:left; padding:5px 0px 0px 0px;">
                <p style="font-size:16px; color:{{color1._value}}; font-weight:bold; {{no_padding_margin._value}}">{{event_month_name._value}} {{event_year._value}}&nbsp
                <font style="color:{{ytd_status_color}}; font-weight:bold; font-family:Arial Black; font-size:13px">{{ytd_status._value}} </font>
                </p>
            </td>
        </tr>
        <tr>
            <td style="{{no_padding_margin._value}}">
                <p style="{{no_padding_margin._value}}; color: {{color2._value}}; font-size:16px">To Date: {{metric_year_actual_percent._rendered_value}}
                </p>
            </td>
            <td style="text-align:right; {{no_padding_margin._value}}">
                <p style="color:{{color3._value}}; {{no_padding_margin._value}} font-size:16px"> Goal: {{metric_year_goal_percent._rendered_value}} </p>
            </td>
        </tr>
        <tr>
          <td colspan=2 >
            <div class="progress" style="height:75px; background: linear-gradient(90deg, rgba(255,0,0,1) 0%, rgba(239,255,0,1) 25%, rgba(41,255,0,1) 50%, rgba(21,234,122,1) 75%, rgba(0,110,37,1) 100%);padding:0px 0px 0px 0px; margin:0">
              <div class="progress-bar" role="progressbar" style="width:45%; background-color:transparent; border-right: 1px solid black;"></div>
              <div class="progress-bar" role="progressbar" style="width:5%; background-color:transparent; border-right: 2px solid black;">
                <p style="color:black">4.8%</p>
              </div>
              <div class="progress-bar" role="progressbar" style="width:5%; background-color:transparent; border-right: 1px solid black;">
                <p style="color:black">{{metric_year_goal_percent._rendered_value}}</p>
              </div>
              <div class="progress-bar" role="progressbar" style="width:1%; background-color:transparent;">
                <p style="color:black"> 5.8%</p>
              </div>
            </div>
            <div class="progress" style="height:15px; background-color:transparent; width:{{ stewardship_bar_mark._rendered_value }}; padding:0px 0px 0px 0px; margin:0; border-right: 5px solid red">
              <p style="font-size:12px; text-align:right; color:black">{{metric_year_actual_percent._rendered_value}}</p>
            </div>
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <div style="font-size:14px; text-align:justified; color:{{color1._value}}; overflow-wrap:break-word; word-wrap: break-word; word-break: break-all;">
              We would like to be saving {{metric_year_goal_percent._rendered_value}} and reinvesting {{reinvesting._rendered_value}}.<br>
              Our strategic funded projects are not part of this consolidated operating net income % calculation. <br>
              This metric is updated once a month and is current for year to date activity through the end of {{event_month_name._rendered_value}}.
            </div>
          </td>
        </tr>
      </table>
    </div>
    <div class="container" style="width:100%">
    <hr style="background-color:{{color1._value}}; border-top: 1px;  height:2px">
    </div>
    ;;
}

measure: yearly_progress_bar {
  type: count
  html:
    <div class="progress">
      <div class="progress-bar {{progress_bar_color._value}} progress-bar-striped"
      role="progressbar"
      aria-valuenow="{{percent_progress_of_year._rendered_value}}" aria-valuemin="0" aria-valuemax="100" style="width:{{percent_progress_of_year._rendered_value}}">
      {{percent_progress_of_year._rendered_value}} Complete (success)
      </div>
    </div>;;
}

measure: sold_percent_gauge {
  type: number
  sql:  1.0*${metric_year_actual}/.3*100;;
  # value_format_name: percent_0
  value_format: "#.0\%"
  html:
   <div class="container" style="width:400px; font-size:16px; border-bottom: .1em solid {{color1._value}}; padding: 12px 12px 12px 12px; margin:0; align:center">
    <table style="border:0px; width:100%" class="table-condensed">
        <tr style="height:10px">
            <td colspan=2 style="text-align:left; height:10px; {{no_padding_margin._value}}">
                <p style="font-size:22px; font-family:Arial Black; color:{{color1._value}}; font-weight: bold">{{pillar._rendered_value}}</p>
            </td>
        </tr>
        <tr style="height:10px">
            <td colspan=2 style="text-align:left; padding:5px 0px 0px 0px;">
                <p style="font-size:16px; color:{{color1._value}}; font-weight:bold; {{no_padding_margin._value}}">{{event_month_name._value}} {{event_year._value}}</p>
            </td>
        </tr>
        <tr>
            <td style="{{no_padding_margin._value}}">
                <p style="{{no_padding_margin._value}}; color: {{color2._value}}; font-size:16px">To Date: {{metric_month_actual_percent._rendered_value}}
                </p>
            </td>
            <td style="text-align:right; {{no_padding_margin._value}}">
                <p style="color:{{color3._value}}; {{no_padding_margin._value}} font-size:16px"> Goal: {{metric_month_goal_percent._rendered_value}} </p>
            </td>
        </tr>
        <tr>
            <td colspan=2>
                <img src="https://chart.googleapis.com/chart?chs=400x250&cht=gom&chma=10,0,0,0&chxt=y&chxt=x,y&chxl=1:%7C0%7C8%7C15%7CGoal=18%7C30&chco=ed3833,ed3833,ed3833,ed3833,ed3833,ed3833,ed3833,f0bc43,769e3f,769e3f,769e3f,769e3f&chf=bg,s,FFFFFF00
                &chl={{metric_year_actual_percent._rendered_value}}
                &chd=t:{{value}}">
            </td>
        </tr>
    </table
  </div>
  ;;
}


measure: gauge_version_2 {
  type: number
  sql:  ${metric_year_actual_percent}*100;;
  html:
  <div class="container" style="width:100%">
  <img src="https://quickchart.io/chart?height=150&width=150&c={
    type:'radialGauge',
    data:{datasets:[{data:[{{value}}],backgroundColor:'green'}]},
    options:{animation: {
  animateRotate: true,
  animateScale: true
},
  roundedCorners: false,
  domain: [0, 30],
  centerPercentage:60,
  displayText:true,
  text:'Servicessss'
}
    }"></div>  ;;
}
measure: pillar_header {
  type: count
  html:
    <div class="container" style="width:100%">
      <hr style="background-color:{{color1._value}}; border-top: 3px;  height:5px">
      <div style="color:{{color1._value}}; text-align:center;font-size:22px; font-family:Arial Black; {{no_padding_margin._value}}">{{pillar_header_caps._rendered_value}}</div>
      <div style="color:{{color1._value}}; text-align:center; font-size:18px; {{no_padding_margin._value}}">{{pillar_sub_header._value}}</div>
    </div>
    ;;
}

measure: overview_header {
  type: count
  html:
    <div class="container" style="width:100%">
      <hr style="background-color:{{color1._value}}; border-top: 3px;  height:5px">
      <div style="color:{{color1._value}}; text-align:center;font-size:22px; font-family:Arial Black; {{no_padding_margin._value}}">OVERVIEW</div>
    </div>
    ;;
}

measure: demo_measure_2 {
  type: count
  html:
    <div style="width:400px; font-size:18px">
    <div style="background-color:{{ytd_status_color._value}}; color:white;">
      Hello Lookers!<br>
    </div>
    <div style="background-color:white; color:black">
      You are all {{ytd_status._value}}!<br>
      Measure Value: {{metric_year_actual._rendered_value}}!<br>
      Measure Goal: {{metric_year_goal._rendered_value}}

       <div class="progress" style="height:50px; vertical-align:middle; background-color:{{color3._value}}; {{no_padding_margin._value}}">
               <div class="progress-bar {{progress_bar_color._value}} progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="{{percent_progress_of_month._rendered_value}}" aria-valuemin="0" aria-valuemax="100" style="width:{{percent_progress_of_month._rendered_value}}; text-align:right">
                  <br>
                  <font style="font-size:22px">{{percent_progress_of_month._rendered_value}}</font>
               </div>
            </div>
      <div class="progress" style="height:15px; background-color:{{color4._value}}; width:{{ percent_of_month._rendered_value }}; {{no_padding_margin._value}}">
            </div>

    </div>
    </div>
    ;;
}

measure: demo_measure {
  type: count
  html:
  <div style="background-color:{{ytd_status_color._value}}; color:white">
  Hello Lookers!<br>
  </div>
  <div style="background-color:white; color:black">
      You are all {{ytd_status._value}}!<br>
      Measure Value: {{metric_year_actual._rendered_value}}!<br>
      Measure Goal: {{metric_year_goal._rendered_value}}
  </div>
  ;;

  }
measure: html_fun_2 {
  type: count
  html:
  <table>
  <tr>
          <td colspan="2">
            <div style="font-size:14px; text-align:justified; color:{{color1._value}}; overflow-wrap:break-word; word-wrap: break-word; white-space:wrap;">
              We would like to be saving {{metric_year_goal_percent._rendered_value}} and reinvesting {{reinvesting._rendered_value}}.<br>
              Our strategic funded projects are not part of this consolidated operating net income % calculation. <br>
              This metric is updated once a month and is current for year to date activity through the end of {{event_month_name._rendered_value}}.
            </div>
          </td>
        </tr>
      </table>

  ;;
}

}
# end of view

# @ = [[0, 0, '#0'], [0, 0, '#0']]

# main_screen_points = [:general_goods, :empty_space, :market, :small_town, :gulf, :grove, :oil_field, :yoga_shop, :local_craftsman, :coffee_plantation]
POINTS = {
  general_goods: [[893, 345, '#122F5B'], [923, 366, '#122F5B']],
  empty_space: [[690, 389], [710, 418]],
  market: [[1147, 650, '#122F5B'], [1175, 670, '#122F5B']],

  small_town: [[1043, 739, '#122F5B'], [1072, 760, '#122F5B']],
  gulf: [[748, 651, '#122F5B'], [778, 669, '#122F5B']],
  port: [[1793, 800, '#293658'], [1859, 809, '#283658']],
  grove: [[1063, 510, '#122F5B'], [1091, 531, '#122F5B']],
  oil_field: [[554, 598, '#2A3A5F'], [581, 614, '#192E58']],

  yoga_shop: [[1246, 282, '#132E5A'], [1272, 260, '#132E5A']],
  local_craftsman: [[1224, 509, '#263B48'], [1253, 525, '#263B48']],
  coffee_plantation: [[1260, 400, '#122F5B'], [1288, 420, '#122F5B']],

  captain_field: [[500, 350, '#53536F'], [533, 350, '#53536F']],
  captain_remove_button: [[1159, 454, ''], [1264, 469, '']],

  market_ok_button: [[926, 693, '#0080F9'], [1029, 749, '#0064C3']],
  market_close_button: [[1286, 292, '#CE002C'], [1296, 301, '#CE002C']],
  market_yoga: [[890, 570, '#AB3E66']],
  market_enough_yoga: [[870, 626, '#FBFFFF'], [873, 626, '#FBFFFF'], [876, 626, '#FBFFFF'], [878, 626, '#FBFFFF'], [880, 626, '#FBFFFF']],

  sailors: [[1548, 228, '#FBFFFF'], [1547, 234, '#FBFFFF'], [1550, 234, '#FBFFFF'], [1550, 230, '#FBFFFF']],

  # any_ship: [[360, 336, '#22C901'], [468, 365, '#1A9402'], [360, 336, '#007DF1'], [468, 365, '#006DD3']],

  # busy_ship: [[360, 336, '#22C901'], [468, 365, '#1A9402']],
  # free_ship: [[360, 336, '#007DF1'], [468, 365, '#006DD3']],
  # yoga_ship: [[368, 324, '#AB3E66']],

  any_ship: [[360, 447, '#22C901'], [468, 477, '#1A9402'], [360, 447, '#007DF1'], [448, 477, '#006DD3']],

  busy_ship: [[360, 447, '#22C901'], [468, 477, '#1A9402']],
  free_ship: [[360, 447, '#007DF1'], [468, 477, '#006DD3']],
  yoga_ship: [[368, 435, '#AB3E66']],

  store_full_form: [[792, 342, '#E90046'], [1107, 405, '#E90046']],
  store_full_ok_button: [[908, 642, 'красный'], [1049, 710, '#красный2']],

  big_ok_button: [[977, 644, '#0079F8'], [1110, 708, '#0061C8']],

  merchant_maria_active: [[996, 649, '#0F0222'], [1040, 660, '#0F0222']],
  merchant_maria_ready: [], #[[996, 649, '#0F0222'], [1040, 660, '#0F0222']],
  merchant_maria_done_button: [], #[[911,675, ''],[1040, 733, '']],
  merchant_maria_send_button: [[911, 675, ''], [1040, 733, '']],
  merchant_maria_close_button: [[1297, 319, ''], [1311, 333, '']],

  edgar_active: [[1067, 419, '#0F0222'], [1090, 483, '#0F0222']],
  edgar_ready: [[1106, 476, '#5DF80F'], [1106, 495, '#05DD1E'], [1095, 483, '#2BE918'], [1116, 483, '#34EC16']],
  edgar_done_button: [], #[[911,675, ''],[1040, 733, '']],
  edgar_send_button: [[911, 675, ''], [1040, 733, '']],
  edgar_close_button: [[1297, 319, ''], [1311, 333, '']]

}.freeze
# any_ship: [[358, 447, '#22C901'], [472, 477, '#1A9402'], [358, 447, '#007DF1'], [472, 477, '#006DD3']],
#
#     busy_ship: [[358, 447, '#22C901'], [472, 477, '#1A9402']],
#     free_ship: [[358, 447, '#007DF1'], [472, 477, '#006DD3']],
#     yoga_ship: [[368, 435, '#AB3E66']],

# any_ship: [[360, 336, '#22C901'], [468, 365, '#1A9402'], [360, 336, '#007DF1'], [468, 365, '#006DD3']],
#
#     busy_ship: [[360, 336, '#22C901'], [468, 365, '#1A9402']],
#     free_ship: [[360, 336, '#007DF1'], [468, 365, '#006DD3']],
#     yoga_ship: [[368, 324, '#AB3E66']],

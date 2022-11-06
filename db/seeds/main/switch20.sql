SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4502 (class 0 OID 295955)
-- Dependencies: 448
-- Data for Name: resource_action; Type: TABLE DATA; Schema: switch20; Owner: -
--

INSERT INTO switch20.resource_action (id, name) VALUES (1, 'Reject');
INSERT INTO switch20.resource_action (id, name) VALUES (2, 'Try next route');
INSERT INTO switch20.resource_action (id, name) VALUES (3, 'Accept');


--
-- TOC entry 4500 (class 0 OID 294958)
-- Dependencies: 252
-- Data for Name: resource_type; Type: TABLE DATA; Schema: switch20; Owner: -
--

INSERT INTO switch20.resource_type (id, name, internal_code_id, action_id) VALUES (1, 'Customer account', 1506, 1);
INSERT INTO switch20.resource_type (id, name, internal_code_id, action_id) VALUES (3, 'Customer auth', 1507, 1);
INSERT INTO switch20.resource_type (id, name, internal_code_id, action_id) VALUES (4, 'Customer gateway', 1508, 1);
INSERT INTO switch20.resource_type (id, name, internal_code_id, action_id) VALUES (2, 'Vendor account', 1509, 2);
INSERT INTO switch20.resource_type (id, name, internal_code_id, action_id) VALUES (5, 'Vendor gateway', 1510, 2);
INSERT INTO switch20.resource_type (id, name, internal_code_id, action_id) VALUES (6, 'Dialpeer', 1511, 2);
INSERT INTO switch20.resource_type (id, name, internal_code_id, action_id) VALUES (7, 'Account total capacity', 1512, 1);


--
-- TOC entry 4507 (class 0 OID 295974)
-- Dependencies: 453
-- Data for Name: switch_interface_in; Type: TABLE DATA; Schema: switch20; Owner: -
--

INSERT INTO switch20.switch_interface_in (id, name, type, rank, format, hashkey, param) VALUES (2, 'Diversion', 'varchar', 2, 'uri_user', false, NULL);
INSERT INTO switch20.switch_interface_in (id, name, type, rank, format, hashkey, param) VALUES (1, 'X-YETI-AUTH', 'varchar', 1, NULL, true, NULL);
INSERT INTO switch20.switch_interface_in (id, name, type, rank, format, hashkey, param) VALUES (3, 'X-ORIG-IP', 'varchar', 3, NULL, true, NULL);
INSERT INTO switch20.switch_interface_in (id, name, type, rank, format, hashkey, param) VALUES (4, 'X-ORIG-PORT', 'integer', 4, NULL, true, NULL);
INSERT INTO switch20.switch_interface_in (id, name, type, rank, format, hashkey, param) VALUES (5, 'X-ORIG-PROTO', 'integer', 5, NULL, true, NULL);
INSERT INTO switch20.switch_interface_in (id, name, type, rank, format, hashkey, param) VALUES (6, 'P-Asserted-Identity', 'varchar', 6, NULL, true, NULL);
INSERT INTO switch20.switch_interface_in (id, name, type, rank, format, hashkey, param) VALUES (9, 'Remote-Party-ID', 'varchar', 9, NULL, true, NULL);
INSERT INTO switch20.switch_interface_in (id, name, type, rank, format, hashkey, param) VALUES (10, 'RPID-Privacy', 'varchar', 10, NULL, true, NULL);
INSERT INTO switch20.switch_interface_in (id, name, type, rank, format, hashkey, param) VALUES (8, 'P-Preferred-Identity', 'varchar', 7, NULL, true, NULL);
INSERT INTO switch20.switch_interface_in (id, name, type, rank, format, hashkey, param) VALUES (7, 'Privacy', 'varchar', 8, NULL, true, NULL);


--
-- TOC entry 4505 (class 0 OID 295965)
-- Dependencies: 451
-- Data for Name: switch_interface_out; Type: TABLE DATA; Schema: switch20; Owner: -
--

INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (890, 'src_number_radius', 'varchar', false, 1050, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (891, 'dst_number_radius', 'varchar', false, 1051, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (892, 'orig_gw_name', 'varchar', false, 1052, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (895, 'customer_name', 'varchar', false, 1055, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (894, 'customer_auth_name', 'varchar', true, 1054, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (896, 'customer_account_name', 'varchar', false, 1056, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (900, 'aleg_radius_acc_profile_id', 'smallint', false, 1024, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (901, 'bleg_radius_acc_profile_id', 'smallint', false, 1025, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (739, 'ruri', 'varchar', false, 10, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (899, 'record_audio', 'boolean', false, 1023, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (741, 'from', 'varchar', false, 30, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (744, 'call_id', 'varchar', false, 60, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (746, 'dlg_nat_handling', 'boolean', false, 80, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (747, 'force_outbound_proxy', 'boolean', false, 90, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (748, 'outbound_proxy', 'varchar', false, 100, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (749, 'aleg_force_outbound_proxy', 'boolean', false, 110, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (750, 'aleg_outbound_proxy', 'varchar', false, 120, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (751, 'next_hop', 'varchar', false, 130, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (752, 'next_hop_1st_req', 'boolean', false, 140, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (753, 'aleg_next_hop', 'varchar', false, 150, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (762, 'enable_session_timer', 'boolean', false, 240, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (763, 'enable_aleg_session_timer', 'boolean', false, 250, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (764, 'session_expires', 'integer', false, 260, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (765, 'minimum_timer', 'integer', false, 270, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (766, 'maximum_timer', 'integer', false, 280, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (768, 'accept_501_reply', 'varchar', false, 300, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (769, 'aleg_session_expires', 'integer', false, 310, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (770, 'aleg_minimum_timer', 'integer', false, 320, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (771, 'aleg_maximum_timer', 'integer', false, 330, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (773, 'aleg_accept_501_reply', 'varchar', false, 350, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (774, 'enable_auth', 'boolean', false, 360, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (775, 'auth_user', 'varchar', false, 370, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (776, 'auth_pwd', 'varchar', false, 380, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (777, 'enable_aleg_auth', 'boolean', false, 390, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (778, 'auth_aleg_user', 'varchar', false, 400, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (779, 'auth_aleg_pwd', 'varchar', false, 410, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (780, 'append_headers', 'varchar', false, 420, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (781, 'append_headers_req', 'varchar', false, 430, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (782, 'aleg_append_headers_req', 'varchar', false, 440, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (784, 'enable_rtprelay', 'boolean', false, 460, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (787, 'rtprelay_interface', 'varchar', false, 490, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (788, 'aleg_rtprelay_interface', 'varchar', false, 500, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (791, 'outbound_interface', 'varchar', false, 530, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (792, 'aleg_outbound_interface', 'varchar', false, 540, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (793, 'contact_displayname', 'varchar', false, 550, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (794, 'contact_user', 'varchar', false, 560, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (795, 'contact_host', 'varchar', false, 570, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (796, 'contact_port', 'smallint', false, 580, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (817, 'time_limit', 'integer', false, 790, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (818, 'resources', 'varchar', false, 800, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (742, 'to', 'varchar', false, 40, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (783, 'disconnect_code_id', 'integer', false, 450, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (772, 'aleg_session_refresh_method_id', 'integer', false, 340, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (812, 'dump_level_id', 'smallint', false, 740, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (767, 'session_refresh_method_id', 'integer', false, 290, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (837, 'src_name_in', 'varchar', true, 1880, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (838, 'src_name_out', 'varchar', true, 1890, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (839, 'diversion_in', 'varchar', true, 1900, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (840, 'diversion_out', 'varchar', true, 1910, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (846, 'auth_orig_ip', 'inet', true, 1920, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (713, 'customer_auth_id', 'integer', true, 1700, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (845, 'aleg_single_codec_in_200ok', 'boolean', false, 911, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (758, 'sdp_filter_type_id', 'integer', false, 200, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (847, 'auth_orig_port', 'integer', true, 1930, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (760, 'sdp_alines_filter_type_id', 'integer', false, 220, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (759, 'sdp_filter_list', 'varchar', false, 210, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (761, 'sdp_alines_filter_list', 'varchar', false, 230, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (841, 'aleg_policy_id', 'integer', false, 840, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (842, 'bleg_policy_id', 'integer', false, 850, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (843, 'aleg_codecs_group_id', 'integer', false, 900, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (844, 'bleg_codecs_group_id', 'integer', false, 910, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (848, 'bleg_single_codec_in_200ok', 'boolean', false, 912, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (709, 'customer_id', 'integer', true, 1650, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (710, 'vendor_id', 'integer', true, 1660, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (711, 'customer_acc_id', 'integer', true, 1670, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (712, 'vendor_acc_id', 'integer', true, 1690, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (827, 'destination_next_rate', 'numeric', true, 1771, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (831, 'destination_next_interval', 'integer', true, 1773, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (830, 'destination_initial_interval', 'integer', true, 1772, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (832, 'destination_rate_policy_id', 'smallint', true, 1774, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (833, 'dialpeer_initial_interval', 'integer', true, 1775, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (834, 'dialpeer_next_interval', 'integer', true, 1776, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (835, 'dialpeer_next_rate', 'numeric', true, 1777, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (821, 'cache_time', 'integer', false, 810, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (849, 'ringing_timeout', 'integer', false, 913, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (924, 'try_avoid_transcoding', 'boolean', false, 620, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (925, 'rtprelay_dtmf_filtering', 'boolean', false, 630, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (926, 'rtprelay_dtmf_detection', 'boolean', false, 640, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (927, 'patch_ruri_next_hop', 'boolean', false, 920, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (929, 'rtprelay_force_dtmf_relay', 'boolean', false, 930, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (933, 'aleg_force_symmetric_rtp', 'boolean', false, 935, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (934, 'bleg_force_symmetric_rtp', 'boolean', false, 940, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (937, 'aleg_symmetric_rtp_nonstop', 'boolean', false, 945, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (939, 'bleg_symmetric_rtp_nonstop', 'boolean', false, 950, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (940, 'aleg_symmetric_rtp_ignore_rtcp', 'boolean', false, 955, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (941, 'bleg_symmetric_rtp_ignore_rtcp', 'boolean', false, 960, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (942, 'aleg_rtp_ping', 'boolean', false, 965, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (943, 'bleg_rtp_ping', 'boolean', false, 970, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (946, 'aleg_relay_options', 'boolean', false, 975, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (948, 'bleg_relay_options', 'boolean', false, 980, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (949, 'filter_noaudio_streams', 'boolean', false, 985, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (954, 'aleg_sdp_c_location_id', 'integer', false, 996, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (955, 'bleg_sdp_c_location_id', 'integer', false, 997, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (958, 'trusted_hdrs_gw', 'boolean', false, 998, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (959, 'aleg_append_headers_reply', 'varchar', false, 999, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (961, 'bleg_sdp_alines_filter_list', 'varchar', false, 1000, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (963, 'bleg_sdp_alines_filter_type_id', 'integer', false, 1001, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (715, 'dialpeer_id', 'bigint', true, 1720, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (716, 'orig_gw_id', 'integer', true, 1730, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (717, 'term_gw_id', 'integer', true, 1740, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (718, 'routing_group_id', 'integer', true, 1750, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (719, 'rateplan_id', 'integer', true, 1760, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (721, 'destination_fee', 'numeric', true, 1780, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (723, 'dialpeer_fee', 'numeric', true, 1800, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (726, 'dst_prefix_in', 'varchar', true, 1840, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (727, 'dst_prefix_out', 'varchar', true, 1850, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (728, 'src_prefix_in', 'varchar', true, 1860, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (729, 'src_prefix_out', 'varchar', true, 1870, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (824, 'reply_translations', 'varchar', false, 820, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (720, 'destination_initial_rate', 'numeric', true, 1770, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (722, 'dialpeer_initial_rate', 'numeric', true, 1790, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (850, 'global_tag', 'varchar', false, 914, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (852, 'dead_rtp_time', 'integer', false, 1003, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (854, 'rtp_relay_timestamp_aligning', 'boolean', false, 1005, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (855, 'allow_1xx_wo2tag', 'boolean', false, 1006, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (856, 'invite_timeout', 'integer', false, 1007, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (857, 'srv_failover_timeout', 'integer', false, 1008, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (859, 'rtp_force_relay_cn', 'boolean', false, 1009, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (861, 'dst_country_id', 'integer', true, 1931, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (862, 'dst_network_id', 'integer', true, 1932, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (863, 'aleg_sensor_id', 'smallint', false, 1010, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (866, 'aleg_sensor_level_id', 'smallint', false, 1011, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (867, 'bleg_sensor_id', 'smallint', false, 1012, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (868, 'bleg_sensor_level_id', 'smallint', false, 1013, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (869, 'dst_prefix_routing', 'varchar', true, 1933, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (870, 'src_prefix_routing', 'varchar', true, 1934, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (871, 'routing_plan_id', 'integer', true, 1935, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (872, 'aleg_dtmf_send_mode_id', 'integer', false, 1014, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (873, 'bleg_dtmf_send_mode_id', 'integer', false, 1015, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (874, 'aleg_dtmf_recv_modes', 'integer', false, 1016, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (875, 'bleg_dtmf_recv_modes', 'integer', false, 1017, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (876, 'suppress_early_media', 'boolean', false, 1018, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (877, 'aleg_relay_update', 'boolean', false, 1019, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (878, 'bleg_relay_update', 'boolean', false, 1020, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (951, 'aleg_relay_reinvite', 'boolean', false, 990, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (879, 'bleg_relay_reinvite', 'boolean', false, 991, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (880, 'aleg_relay_hold', 'boolean', false, 992, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (881, 'bleg_relay_hold', 'boolean', false, 993, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (882, 'aleg_relay_prack', 'boolean', false, 994, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (883, 'bleg_relay_prack', 'boolean', false, 995, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (884, 'destination_prefix', 'varchar', true, 1711, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (885, 'dialpeer_prefix', 'varchar', true, 1721, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (886, 'lrn', 'varchar', true, 1936, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (887, 'lnp_database_id', 'smallint', true, 1937, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (888, 'force_one_way_early_media', 'boolean', false, 1021, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (889, 'radius_auth_profile_id', 'smallint', false, 1022, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (904, 'term_gw_name', 'varchar', false, 1057, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (909, 'transit_headers_b2a', 'varchar', false, 1027, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (907, 'transit_headers_a2b', 'varchar', false, 1026, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (714, 'destination_id', 'bigint', true, 1710, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (910, 'from_domain', 'varchar', true, 1938, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (911, 'to_domain', 'varchar', true, 1939, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (912, 'ruri_domain', 'varchar', true, 1940, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (913, 'fake_180_timer', 'smallint', false, 1060, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (914, 'src_area_id', 'integer', true, 1941, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (915, 'dst_area_id', 'integer', true, 1942, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (917, 'bleg_transport_protocol_id', 'smallint', false, 21, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (918, 'aleg_outbound_proxy_transport_protocol_id', 'smallint', false, 121, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (919, 'bleg_outbound_proxy_transport_protocol_id', 'smallint', false, 101, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (920, 'auth_orig_protocol_id', 'smallint', true, 1919, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (921, 'aleg_rel100_mode_id', 'smallint', false, 1061, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (922, 'bleg_rel100_mode_id', 'smallint', false, 1062, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (923, 'pai_in', 'varchar', true, 1944, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1000, 'ppi_in', 'varchar', true, 1945, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1002, 'privacy_in', 'varchar', true, 1946, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1003, 'rpid_in', 'varchar', true, 1947, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1005, 'rpid_privacy_in', 'varchar', true, 1948, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1006, 'pai_out', 'varchar', true, 1949, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1007, 'ppi_out', 'varchar', true, 1950, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1008, 'privacy_out', 'varchar', true, 1951, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1009, 'rpid_out', 'varchar', true, 1952, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1010, 'rpid_privacy_out', 'varchar', true, 1953, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1011, 'bleg_max_30x_redirects', 'smallint', false, 1063, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1012, 'bleg_max_transfers', 'smallint', false, 1064, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1013, 'customer_acc_check_balance', 'boolean', true, 1954, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1014, 'destination_reverse_billing', 'boolean', true, 1955, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1015, 'dialpeer_reverse_billing', 'boolean', true, 1956, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1016, 'aleg_auth_required', 'boolean', false, 1065, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (916, 'routing_tag_ids', 'smallint[]', true, 1943, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1018, 'customer_auth_external_id', 'bigint', true, 1957, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1019, 'customer_external_id', 'bigint', true, 1958, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1020, 'vendor_external_id', 'bigint', true, 1959, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1021, 'customer_acc_external_id', 'bigint', true, 1960, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1022, 'vendor_acc_external_id', 'bigint', true, 1970, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (905, 'orig_gw_external_id', 'bigint', true, 1971, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (906, 'term_gw_external_id', 'bigint', true, 1972, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1023, 'customer_acc_vat', 'numeric', true, 1973, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1024, 'aleg_rtp_filter_inband_dtmf', 'boolean', false, 1066, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1025, 'bleg_rtp_filter_inband_dtmf', 'boolean', false, 1067, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1027, 'bleg_protocol_priority_id', 'smallint', false, 1069, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1028, 'aleg_media_encryption_mode_id', 'smallint', false, 1070, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1029, 'bleg_media_encryption_mode_id', 'smallint', false, 1071, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1030, 'aleg_sip_acl', 'inet[]', false, 1072, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1031, 'aleg_rtp_acl', 'inet[]', false, 1073, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1032, 'bleg_sip_acl', 'inet[]', false, 1074, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1033, 'bleg_rtp_acl', 'inet[]', false, 1075, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1034, 'registered_aor_id', 'integer', false, 1076, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1035, 'lega_identity_attestation_id', 'smallint', true, 1974, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1036, 'lega_identity_verstat_id', 'smallint', true, 1975, true);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1037, 'bleg_force_cancel_routeset', 'boolean', false, 1976, false);
INSERT INTO switch20.switch_interface_out (id, name, type, custom, rank, for_radius) VALUES (1038, 'registered_aor_mode_id', 'smallint', false, 1977, false);

--
-- TOC entry 4515 (class 0 OID 0)
-- Dependencies: 447
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: switch20; Owner: -
--

SELECT pg_catalog.setval('switch20.events_id_seq', 280, true);


--
-- TOC entry 4516 (class 0 OID 0)
-- Dependencies: 449
-- Name: resource_type_id_seq; Type: SEQUENCE SET; Schema: switch20; Owner: -
--

SELECT pg_catalog.setval('switch20.resource_type_id_seq', 6, true);


--
-- TOC entry 4517 (class 0 OID 0)
-- Dependencies: 450
-- Name: switch_in_interface_id_seq; Type: SEQUENCE SET; Schema: switch20; Owner: -
--

SELECT pg_catalog.setval('switch20.switch_in_interface_id_seq', 10, true);


--
-- TOC entry 4518 (class 0 OID 0)
-- Dependencies: 452
-- Name: switch_interface_id_seq; Type: SEQUENCE SET; Schema: switch20; Owner: -
--

SELECT pg_catalog.setval('switch20.switch_interface_id_seq', 1034, true);



-- Completed on 2021-06-14 12:13:59 EEST

--
-- PostgreSQL database dump complete
--


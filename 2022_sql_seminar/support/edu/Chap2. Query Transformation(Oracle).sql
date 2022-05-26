Trace file /idiska/oracle/app/diag/rdbms/orcl11g/orcl11g/trace/orcl11g_ora_35145.trc
Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 - 64bit Production
With the Partitioning, OLAP, Data Mining and Real Application Testing options
ORACLE_HOME = /idiska/oracle/app/11.2.0.1
System name:	Linux
Node name:	psdblcbp
Release:	3.10.0-514.26.2.el7.x86_64
Version:	#1 SMP Tue Jul 4 15:04:05 UTC 2017
Machine:	x86_64
Instance name: orcl11g
Redo thread mounted by this instance: 1
Oracle process number: 26
Unix process pid: 35145, image: oracle@psdblcbp (TNS V1-V3)


*** 2022-03-24 16:54:02.341
*** SESSION ID:(183.333) 2022-03-24 16:54:02.342
*** CLIENT ID:() 2022-03-24 16:54:02.342
*** SERVICE NAME:(SYS$USERS) 2022-03-24 16:54:02.342
*** MODULE NAME:(SQL*Plus) 2022-03-24 16:54:02.342
*** ACTION NAME:() 2022-03-24 16:54:02.342
 
Registered qb: SEL$1 0x23176638 (PARSER)
---------------------
QUERY BLOCK SIGNATURE
---------------------
  signature (): qb_name=SEL$1 nbfros=1 flg=0
    fro(0): flg=4 objn=194321 hint_alias="BOOK"@"SEL$1"

SPM: statement not found in SMB

**************************
Automatic degree of parallelism (ADOP)
**************************
Automatic degree of parallelism is disabled: Parameter.

PM: Considering predicate move-around in query block SEL$1 (#0)
**************************
Predicate Move-Around (PM)
**************************
OPTIMIZER INFORMATION

******************************************
----- Current SQL Statement for this session (sql_id=3s204axjz7tdv) -----
select * from book
 where author = 'zrjthoiqpy'
 order by title 
*******************************************
Legend
The following abbreviations are used by optimizer trace.
CBQT - cost-based query transformation
JPPD - join predicate push-down
OJPPD - old-style (non-cost-based) JPPD
FPD - filter push-down
PM - predicate move-around
CVM - complex view merging
SPJ - select-project-join
SJC - set join conversion
SU - subquery unnesting
OBYE - order by elimination
OST - old style star transformation
ST - new (cbqt) star transformation
CNT - count(col) to count(*) transformation
JE - Join Elimination
JF - join factorization
SLP - select list pruning
DP - distinct placement
qb - query block
LB - leaf blocks
DK - distinct keys
LB/K - average number of leaf blocks per key
DB/K - average number of data blocks per key
CLUF - clustering factor
NDV - number of distinct values
Resp - response cost
Card - cardinality
Resc - resource cost
NL - nested loops (join)
SM - sort merge (join)
HA - hash (join)
CPUSPEED - CPU Speed 
IOTFRSPEED - I/O transfer speed
IOSEEKTIM - I/O seek time
SREADTIM - average single block read time
MREADTIM - average multiblock read time
MBRC - average multiblock read count
MAXTHR - maximum I/O system throughput
SLAVETHR - average slave I/O throughput
dmeth - distribution method
  1: no partitioning required
  2: value partitioned
  4: right is random (round-robin)
  128: left is random (round-robin)
  8: broadcast right and partition left
  16: broadcast left and partition right
  32: partition left using partitioning of right
  64: partition right using partitioning of left
  256: run the join in serial
  0: invalid distribution method
sel - selectivity
ptn - partition
***************************************
PARAMETERS USED BY THE OPTIMIZER
********************************
  *************************************
  PARAMETERS WITH ALTERED VALUES
  ******************************
Compilation Environment Dump
_pga_max_size                       = 2097152 KB
Bug Fix Control Environment


  *************************************
  PARAMETERS WITH DEFAULT VALUES
  ******************************
Compilation Environment Dump
optimizer_mode_hinted               = false
optimizer_features_hinted           = 0.0.0
parallel_execution_enabled          = true
parallel_query_forced_dop           = 0
parallel_dml_forced_dop             = 0
parallel_ddl_forced_degree          = 0
parallel_ddl_forced_instances       = 0
_query_rewrite_fudge                = 90
optimizer_features_enable           = 11.2.0.1
_optimizer_search_limit             = 5
cpu_count                           = 40
active_instance_count               = 1
parallel_threads_per_cpu            = 2
hash_area_size                      = 131072
bitmap_merge_area_size              = 1048576
sort_area_size                      = 65536
sort_area_retained_size             = 0
_sort_elimination_cost_ratio        = 0
_optimizer_block_size               = 8192
_sort_multiblock_read_count         = 2
_hash_multiblock_io_count           = 0
_db_file_optimizer_read_count       = 8
_optimizer_max_permutations         = 2000
pga_aggregate_target                = 18874368 KB
_query_rewrite_maxdisjunct          = 257
_smm_auto_min_io_size               = 56 KB
_smm_auto_max_io_size               = 248 KB
_smm_min_size                       = 1024 KB
_smm_max_size                       = 1048576 KB
_smm_px_max_size                    = 9437184 KB
_cpu_to_io                          = 0
_optimizer_undo_cost_change         = 11.2.0.1
parallel_query_mode                 = enabled
parallel_dml_mode                   = disabled
parallel_ddl_mode                   = enabled
optimizer_mode                      = all_rows
sqlstat_enabled                     = false
_optimizer_percent_parallel         = 101
_always_anti_join                   = choose
_always_semi_join                   = choose
_optimizer_mode_force               = true
_partition_view_enabled             = true
_always_star_transformation         = false
_query_rewrite_or_error             = false
_hash_join_enabled                  = true
cursor_sharing                      = exact
_b_tree_bitmap_plans                = true
star_transformation_enabled         = false
_optimizer_cost_model               = choose
_new_sort_cost_estimate             = true
_complex_view_merging               = true
_unnest_subquery                    = true
_eliminate_common_subexpr           = true
_pred_move_around                   = true
_convert_set_to_join                = false
_push_join_predicate                = true
_push_join_union_view               = true
_fast_full_scan_enabled             = true
_optim_enhance_nnull_detection      = true
_parallel_broadcast_enabled         = true
_px_broadcast_fudge_factor          = 100
_ordered_nested_loop                = true
_no_or_expansion                    = false
optimizer_index_cost_adj            = 100
optimizer_index_caching             = 0
_system_index_caching               = 0
_disable_datalayer_sampling         = false
query_rewrite_enabled               = true
query_rewrite_integrity             = enforced
_query_cost_rewrite                 = true
_query_rewrite_2                    = true
_query_rewrite_1                    = true
_query_rewrite_expression           = true
_query_rewrite_jgmigrate            = true
_query_rewrite_fpc                  = true
_query_rewrite_drj                  = true
_full_pwise_join_enabled            = true
_partial_pwise_join_enabled         = true
_left_nested_loops_random           = true
_improved_row_length_enabled        = true
_index_join_enabled                 = true
_enable_type_dep_selectivity        = true
_improved_outerjoin_card            = true
_optimizer_adjust_for_nulls         = true
_optimizer_degree                   = 0
_use_column_stats_for_function      = true
_subquery_pruning_enabled           = true
_subquery_pruning_mv_enabled        = false
_or_expand_nvl_predicate            = true
_like_with_bind_as_equality         = false
_table_scan_cost_plus_one           = true
_cost_equality_semi_join            = true
_default_non_equality_sel_check     = true
_new_initial_join_orders            = true
_oneside_colstat_for_equijoins      = true
_optim_peek_user_binds              = true
_minimal_stats_aggregation          = true
_force_temptables_for_gsets         = false
workarea_size_policy                = auto
_smm_auto_cost_enabled              = true
_gs_anti_semi_join_allowed          = true
_optim_new_default_join_sel         = true
optimizer_dynamic_sampling          = 2
_pre_rewrite_push_pred              = true
_optimizer_new_join_card_computation = true
_union_rewrite_for_gs               = yes_gset_mvs
_generalized_pruning_enabled        = true
_optim_adjust_for_part_skews        = true
_force_datefold_trunc               = false
statistics_level                    = typical
_optimizer_system_stats_usage       = true
skip_unusable_indexes               = true
_remove_aggr_subquery               = true
_optimizer_push_down_distinct       = 0
_dml_monitoring_enabled             = true
_optimizer_undo_changes             = false
_predicate_elimination_enabled      = true
_nested_loop_fudge                  = 100
_project_view_columns               = true
_local_communication_costing_enabled = true
_local_communication_ratio          = 50
_query_rewrite_vop_cleanup          = true
_slave_mapping_enabled              = true
_optimizer_cost_based_transformation = linear
_optimizer_mjc_enabled              = true
_right_outer_hash_enable            = true
_spr_push_pred_refspr               = true
_optimizer_cache_stats              = false
_optimizer_cbqt_factor              = 50
_optimizer_squ_bottomup             = true
_fic_area_size                      = 131072
_optimizer_skip_scan_enabled        = true
_optimizer_cost_filter_pred         = false
_optimizer_sortmerge_join_enabled   = true
_optimizer_join_sel_sanity_check    = true
_mmv_query_rewrite_enabled          = true
_bt_mmv_query_rewrite_enabled       = true
_add_stale_mv_to_dependency_list    = true
_distinct_view_unnesting            = false
_optimizer_dim_subq_join_sel        = true
_optimizer_disable_strans_sanity_checks = 0
_optimizer_compute_index_stats      = true
_push_join_union_view2              = true
_optimizer_ignore_hints             = false
_optimizer_random_plan              = 0
_query_rewrite_setopgrw_enable      = true
_optimizer_correct_sq_selectivity   = true
_disable_function_based_index       = false
_optimizer_join_order_control       = 3
_optimizer_cartesian_enabled        = true
_optimizer_starplan_enabled         = true
_extended_pruning_enabled           = true
_optimizer_push_pred_cost_based     = true
_optimizer_null_aware_antijoin      = true
_optimizer_extend_jppd_view_types   = true
_sql_model_unfold_forloops          = run_time
_enable_dml_lock_escalation         = false
_bloom_filter_enabled               = true
_update_bji_ipdml_enabled           = 0
_optimizer_extended_cursor_sharing  = udo
_dm_max_shared_pool_pct             = 1
_optimizer_cost_hjsmj_multimatch    = true
_optimizer_transitivity_retain      = true
_px_pwg_enabled                     = true
optimizer_secure_view_merging       = true
_optimizer_join_elimination_enabled = true
flashback_table_rpi                 = non_fbt
_optimizer_cbqt_no_size_restriction = true
_optimizer_enhanced_filter_push     = true
_optimizer_filter_pred_pullup       = true
_rowsrc_trace_level                 = 0
_simple_view_merging                = true
_optimizer_rownum_pred_based_fkr    = true
_optimizer_better_inlist_costing    = all
_optimizer_self_induced_cache_cost  = false
_optimizer_min_cache_blocks         = 10
_optimizer_or_expansion             = depth
_optimizer_order_by_elimination_enabled = true
_optimizer_outer_to_anti_enabled    = true
_selfjoin_mv_duplicates             = true
_dimension_skip_null                = true
_force_rewrite_enable               = false
_optimizer_star_tran_in_with_clause = true
_optimizer_complex_pred_selectivity = true
_optimizer_connect_by_cost_based    = true
_gby_hash_aggregation_enabled       = true
_globalindex_pnum_filter_enabled    = true
_px_minus_intersect                 = true
_fix_control_key                    = 0
_force_slave_mapping_intra_part_loads = false
_force_tmp_segment_loads            = false
_query_mmvrewrite_maxpreds          = 10
_query_mmvrewrite_maxintervals      = 5
_query_mmvrewrite_maxinlists        = 5
_query_mmvrewrite_maxdmaps          = 10
_query_mmvrewrite_maxcmaps          = 20
_query_mmvrewrite_maxregperm        = 512
_query_mmvrewrite_maxmergedcmaps    = 50
_query_mmvrewrite_maxqryinlistvals  = 500
_disable_parallel_conventional_load = false
_trace_virtual_columns              = false
_replace_virtual_columns            = true
_virtual_column_overload_allowed    = true
_kdt_buffering                      = true
_first_k_rows_dynamic_proration     = true
_optimizer_sortmerge_join_inequality = true
_optimizer_aw_stats_enabled         = true
_bloom_pruning_enabled              = true
result_cache_mode                   = MANUAL
_px_ual_serial_input                = true
_optimizer_skip_scan_guess          = false
_enable_row_shipping                = true
_row_shipping_threshold             = 80
_row_shipping_explain               = false
transaction_isolation_level         = read_commited
_optimizer_distinct_elimination     = true
_optimizer_multi_level_push_pred    = true
_optimizer_group_by_placement       = true
_optimizer_rownum_bind_default      = 10
_enable_query_rewrite_on_remote_objs = true
_optimizer_extended_cursor_sharing_rel = simple
_optimizer_adaptive_cursor_sharing  = true
_direct_path_insert_features        = 0
_optimizer_improve_selectivity      = true
optimizer_use_pending_statistics    = false
_optimizer_enable_density_improvements = true
_optimizer_aw_join_push_enabled     = true
_optimizer_connect_by_combine_sw    = true
_enable_pmo_ctas                    = 0
_optimizer_native_full_outer_join   = force
_bloom_predicate_enabled            = true
_optimizer_enable_extended_stats    = true
_is_lock_table_for_ddl_wait_lock    = 0
_pivot_implementation_method        = choose
optimizer_capture_sql_plan_baselines = false
optimizer_use_sql_plan_baselines    = true
_optimizer_star_trans_min_cost      = 0
_optimizer_star_trans_min_ratio     = 0
_with_subquery                      = OPTIMIZER
_optimizer_fkr_index_cost_bias      = 10
_optimizer_use_subheap              = true
parallel_degree_policy              = manual
parallel_degree                     = 0
parallel_min_time_threshold         = 10
_parallel_time_unit                 = 10
_optimizer_or_expansion_subheap     = true
_optimizer_free_transformation_heap = true
_optimizer_reuse_cost_annotations   = true
_result_cache_auto_size_threshold   = 100
_result_cache_auto_time_threshold   = 1000
_optimizer_nested_rollup_for_gset   = 100
_nlj_batching_enabled               = 1
parallel_query_default_dop          = 0
is_recur_flags                      = 0
optimizer_use_invisible_indexes     = false
flashback_data_archive_internal_cursor = 0
_optimizer_extended_stats_usage_control = 224
_parallel_syspls_obey_force         = true
cell_offload_processing             = true
_rdbms_internal_fplib_enabled       = false
db_file_multiblock_read_count       = 128
_bloom_folding_enabled              = true
_mv_generalized_oj_refresh_opt      = true
cell_offload_compaction             = ADAPTIVE
parallel_degree_limit               = 65535
parallel_force_local                = false
parallel_max_degree                 = 80
total_cpu_count                     = 40
cell_offload_plan_display           = AUTO
_optimizer_coalesce_subqueries      = true
_optimizer_fast_pred_transitivity   = true
_optimizer_fast_access_pred_analysis = true
_optimizer_unnest_disjunctive_subq  = true
_optimizer_unnest_corr_set_subq     = true
_optimizer_distinct_agg_transform   = true
_aggregation_optimization_settings  = 0
_optimizer_connect_by_elim_dups     = true
_optimizer_eliminate_filtering_join = true
_connect_by_use_union_all           = true
dst_upgrade_insert_conv             = true
advanced_queuing_internal_cursor    = 0
_optimizer_unnest_all_subqueries    = true
_bloom_predicate_pushdown_to_storage = true
_bloom_vector_elements              = 0
_bloom_pushing_max                  = 524288
parallel_autodop                    = 0
parallel_ddldml                     = 0
_parallel_cluster_cache_policy      = adaptive
_parallel_scalability               = 50
iot_internal_cursor                 = 0
_optimizer_instance_count           = 0
_optimizer_connect_by_cb_whr_only   = false
_suppress_scn_chk_for_cqn           = nosuppress_1466
_optimizer_join_factorization       = true
_optimizer_use_cbqt_star_transformation = true
_optimizer_table_expansion          = true
_and_pruning_enabled                = true
_deferred_constant_folding_mode     = DEFAULT
_optimizer_distinct_placement       = true
partition_pruning_internal_cursor   = 0
parallel_hinted                     = none
_sql_compatibility                  = 0
_optimizer_use_feedback             = true
_optimizer_try_st_before_jppd       = true
Bug Fix Control Environment
    fix  3834770 = 1       
    fix  3746511 = enabled
    fix  4519016 = enabled
    fix  3118776 = enabled
    fix  4488689 = enabled
    fix  2194204 = disabled
    fix  2660592 = enabled
    fix  2320291 = enabled
    fix  2324795 = enabled
    fix  4308414 = enabled
    fix  3499674 = disabled
    fix  4569940 = enabled
    fix  4631959 = enabled
    fix  4519340 = enabled
    fix  4550003 = enabled
    fix  1403283 = enabled
    fix  4554846 = enabled
    fix  4602374 = enabled
    fix  4584065 = enabled
    fix  4545833 = enabled
    fix  4611850 = enabled
    fix  4663698 = enabled
    fix  4663804 = enabled
    fix  4666174 = enabled
    fix  4567767 = enabled
    fix  4556762 = 15      
    fix  4728348 = enabled
    fix  4708389 = enabled
    fix  4175830 = enabled
    fix  4752814 = enabled
    fix  4583239 = enabled
    fix  4386734 = enabled
    fix  4887636 = enabled
    fix  4483240 = enabled
    fix  4872602 = disabled
    fix  4711525 = enabled
    fix  4545802 = enabled
    fix  4605810 = enabled
    fix  4704779 = enabled
    fix  4900129 = enabled
    fix  4924149 = enabled
    fix  4663702 = enabled
    fix  4878299 = enabled
    fix  4658342 = enabled
    fix  4881533 = enabled
    fix  4676955 = enabled
    fix  4273361 = enabled
    fix  4967068 = enabled
    fix  4969880 = disabled
    fix  5005866 = enabled
    fix  5015557 = enabled
    fix  4705343 = enabled
    fix  4904838 = enabled
    fix  4716096 = enabled
    fix  4483286 = disabled
    fix  4722900 = enabled
    fix  4615392 = enabled
    fix  5096560 = enabled
    fix  5029464 = enabled
    fix  4134994 = enabled
    fix  4904890 = enabled
    fix  5104624 = enabled
    fix  5014836 = enabled
    fix  4768040 = enabled
    fix  4600710 = enabled
    fix  5129233 = enabled
    fix  4595987 = enabled
    fix  4908162 = enabled
    fix  5139520 = enabled
    fix  5084239 = enabled
    fix  5143477 = disabled
    fix  2663857 = enabled
    fix  4717546 = enabled
    fix  5240264 = disabled
    fix  5099909 = enabled
    fix  5240607 = enabled
    fix  5195882 = enabled
    fix  5220356 = enabled
    fix  5263572 = enabled
    fix  5385629 = enabled
    fix  5302124 = enabled
    fix  5391942 = enabled
    fix  5384335 = enabled
    fix  5482831 = enabled
    fix  4158812 = enabled
    fix  5387148 = enabled
    fix  5383891 = enabled
    fix  5466973 = enabled
    fix  5396162 = enabled
    fix  5394888 = enabled
    fix  5395291 = enabled
    fix  5236908 = enabled
    fix  5509293 = enabled
    fix  5449488 = enabled
    fix  5567933 = enabled
    fix  5570494 = enabled
    fix  5288623 = enabled
    fix  5505995 = enabled
    fix  5505157 = enabled
    fix  5112460 = enabled
    fix  5554865 = enabled
    fix  5112260 = enabled
    fix  5112352 = enabled
    fix  5547058 = enabled
    fix  5618040 = enabled
    fix  5585313 = enabled
    fix  5547895 = enabled
    fix  5634346 = enabled
    fix  5620485 = enabled
    fix  5483301 = enabled
    fix  5657044 = enabled
    fix  5694984 = enabled
    fix  5868490 = enabled
    fix  5650477 = enabled
    fix  5611962 = enabled
    fix  4279274 = enabled
    fix  5741121 = enabled
    fix  5714944 = enabled
    fix  5391505 = enabled
    fix  5762598 = enabled
    fix  5578791 = enabled
    fix  5259048 = enabled
    fix  5882954 = enabled
    fix  2492766 = enabled
    fix  5707608 = enabled
    fix  5891471 = enabled
    fix  5884780 = enabled
    fix  5680702 = enabled
    fix  5371452 = enabled
    fix  5838613 = enabled
    fix  5949981 = enabled
    fix  5624216 = enabled
    fix  5741044 = enabled
    fix  5976822 = enabled
    fix  6006457 = enabled
    fix  5872956 = enabled
    fix  5923644 = enabled
    fix  5943234 = enabled
    fix  5844495 = enabled
    fix  4168080 = enabled
    fix  6020579 = enabled
    fix  5842686 = disabled
    fix  5996801 = enabled
    fix  5593639 = enabled
    fix  6133948 = enabled
    fix  3151991 = enabled
    fix  6146906 = enabled
    fix  6239909 = enabled
    fix  6267621 = enabled
    fix  5909305 = enabled
    fix  6279918 = enabled
    fix  6141818 = enabled
    fix  6151963 = enabled
    fix  6251917 = enabled
    fix  6282093 = enabled
    fix  6119510 = enabled
    fix  6119382 = enabled
    fix  3801750 = enabled
    fix  5705630 = disabled
    fix  5944076 = enabled
    fix  5406763 = enabled
    fix  6070954 = enabled
    fix  6282944 = enabled
    fix  6138746 = enabled
    fix  6082745 = enabled
    fix  3426050 = enabled
    fix   599680 = enabled
    fix  6062266 = enabled
    fix  6087237 = enabled
    fix  6122894 = enabled
    fix  6377505 = enabled
    fix  5893768 = enabled
    fix  6163564 = enabled
    fix  6073325 = enabled
    fix  6188881 = enabled
    fix  6007259 = enabled
    fix  6239971 = enabled
    fix  5284200 = disabled
    fix  6042205 = enabled
    fix  6051211 = enabled
    fix  6434668 = enabled
    fix  6438752 = enabled
    fix  5936366 = enabled
    fix  6439032 = enabled
    fix  6438892 = enabled
    fix  6006300 = enabled
    fix  5947231 = enabled
    fix  5416118 = 1       
    fix  6365442 = 1       
    fix  6239039 = enabled
    fix  6502845 = enabled
    fix  6913094 = enabled
    fix  6029469 = enabled
    fix  5919513 = enabled
    fix  6057611 = enabled
    fix  6469667 = enabled
    fix  6608941 = disabled
    fix  6368066 = enabled
    fix  6329318 = enabled
    fix  6656356 = enabled
    fix  4507997 = enabled
    fix  6671155 = enabled
    fix  6694548 = enabled
    fix  6688200 = enabled
    fix  6612471 = enabled
    fix  6708183 = disabled
    fix  6326934 = enabled
    fix  6520717 = disabled
    fix  6714199 = enabled
    fix  6681545 = enabled
    fix  6748058 = enabled
    fix  6167716 = enabled
    fix  6674254 = enabled
    fix  6468287 = enabled
    fix  6503543 = enabled
    fix  6808773 = disabled
    fix  6766962 = enabled
    fix  6120483 = enabled
    fix  6670551 = enabled
    fix  6771838 = enabled
    fix  6626018 = disabled
    fix  6530596 = enabled
    fix  6778642 = enabled
    fix  6699059 = enabled
    fix  6376551 = enabled
    fix  6429113 = enabled
    fix  6782437 = enabled
    fix  6776808 = enabled
    fix  6765823 = enabled
    fix  6768660 = enabled
    fix  6782665 = enabled
    fix  6610822 = enabled
    fix  6514189 = enabled
    fix  6818410 = enabled
    fix  6827696 = enabled
    fix  6773613 = enabled
    fix  5902962 = enabled
    fix  6956212 = enabled
    fix  3056297 = enabled
    fix  6440977 = disabled
    fix  6972291 = disabled
    fix  6904146 = enabled
    fix  6221403 = enabled
    fix  5475051 = enabled
    fix  6845871 = enabled
    fix  5468809 = enabled
    fix  6917633 = enabled
    fix  4444536 = disabled
    fix  6955210 = enabled
    fix  6994194 = enabled
    fix  6399597 = disabled
    fix  6951776 = enabled
    fix  5648287 = 3       
    fix  6987082 = disabled
    fix  7132036 = enabled
    fix  6980350 = enabled
    fix  5199213 = enabled
    fix  7138405 = enabled
    fix  7148689 = enabled
    fix  6820988 = enabled
    fix  7032684 = enabled
    fix  6617866 = enabled
    fix  7155968 = enabled
    fix  7127980 = enabled
    fix  6982954 = enabled
    fix  7241819 = enabled
    fix  6897034 = enabled
    fix  7236148 = enabled
    fix  7298570 = enabled
    fix  7249095 = enabled
    fix  7314499 = enabled
    fix  7324224 = enabled
    fix  7289023 = enabled
    fix  7237571 = enabled
    fix  7116357 = enabled
    fix  7345484 = enabled
    fix  7375179 = enabled
    fix  6430500 = disabled
    fix  5897486 = enabled
    fix  6774209 = enabled
    fix  7306637 = enabled
    fix  6451322 = enabled
    fix  7208131 = enabled
    fix  7388652 = enabled
    fix  7127530 = enabled
    fix  6751206 = enabled
    fix  6669103 = enabled
    fix  7430474 = enabled
    fix  6990305 = enabled
    fix  7043307 = enabled
    fix  6921505 = enabled
    fix  7388457 = enabled
    fix  3120429 = enabled
    fix  7452823 = disabled
    fix  6838105 = enabled
    fix  6769711 = enabled
    fix  7170213 = enabled
    fix  6528872 = enabled
    fix  7295298 = enabled
    fix  5922070 = enabled
    fix  7259468 = enabled
    fix  6418552 = enabled
    fix  4619997 = enabled
    fix  7524366 = enabled
    fix  6942476 = enabled
    fix  6418771 = enabled
    fix  7375077 = enabled
    fix  5400639 = enabled
    fix  4570921 = enabled
    fix  7426911 = enabled
    fix  5099019 = disabled
    fix  7528216 = enabled
    fix  7521266 = enabled
    fix  7385140 = enabled
    fix  7576516 = enabled
    fix  7573526 = enabled
    fix  7576476 = enabled
    fix  7165898 = enabled
    fix  7263214 = enabled
    fix  3320140 = enabled
    fix  7555510 = enabled
    fix  7613118 = enabled
    fix  7597059 = enabled
    fix  7558911 = enabled
    fix  5520732 = enabled
    fix  7679490 = disabled
    fix  7449971 = enabled
    fix  3628118 = enabled
    fix  4370840 = enabled
    fix  7281191 = enabled
    fix  7519687 = enabled
    fix  5029592 = 3       
    fix  6012093 = 1       
    fix  6053861 = disabled
    fix  6941515 = disabled
    fix  7696414 = enabled
    fix  7272039 = enabled
    fix  7834811 = enabled
    fix  7640597 = enabled
    fix  7341616 = enabled
    fix  7168184 = enabled
    fix   399198 = enabled
    fix  7831070 = enabled
    fix  7676897 = disabled
    fix  7414637 = enabled
    fix  7585456 = enabled
    fix  8202421 = enabled
    fix  7658097 = disabled
    fix  8251486 = enabled
    fix  7132684 = enabled
    fix  7512227 = enabled
    fix  6972987 = enabled
    fix  7199035 = enabled
    fix  8243446 = enabled
    fix  7650462 = enabled
    fix  6720701 = enabled
    fix  7592673 = enabled
    fix  7718694 = enabled
    fix  7534027 = enabled
    fix  7708267 = enabled
    fix  5716785 = enabled
    fix  7356191 = enabled
    fix  7679161 = enabled
    fix  7597159 = enabled
    fix  7499258 = enabled
    fix  8328363 = enabled
    fix  7452863 = enabled
    fix  8284930 = enabled
    fix  7298626 = enabled
    fix  7657126 = enabled
    fix  8371884 = enabled
    fix  8318020 = enabled
    fix  8255423 = enabled
    fix  7135745 = enabled
    fix  8356253 = enabled
    fix  7534257 = enabled
    fix  8323407 = enabled
    fix  7539815 = enabled
    fix  8289316 = enabled
    fix  8447850 = enabled
    fix  7675944 = enabled
    fix  8355120 = enabled
    fix  7176746 = enabled
    fix  8442891 = enabled
    fix  8373261 = enabled
    fix  7679164 = enabled
    fix  7670533 = enabled
    fix  8408665 = enabled
    fix  8491399 = enabled
    fix  8348392 = enabled
    fix  8348585 = enabled
    fix  8508056 = enabled
    fix  8335178 = enabled
    fix  8515269 = enabled
    fix  8247017 = enabled
    fix  7325597 = enabled
    fix  8531490 = enabled
    fix  6163600 = enabled
    fix  8589278 = disabled
    fix  8557992 = enabled
    fix  7556098 = enabled
    fix  8580883 = enabled
    fix  5892599 = disabled
    fix  8609714 = enabled
    fix  8514561 = enabled
    fix  8619631 = disabled


  ***************************************
  PARAMETERS IN OPT_PARAM HINT
  ****************************
***************************************
Column Usage Monitoring is ON: tracking level = 1
***************************************

Considering Query Transformations on query block SEL$1 (#0)
**************************
Query transformations (QT)
**************************
JF: Checking validity of join factorization for query block SEL$1 (#0)
JF: Bypassed: has order-by clause.
ST: not valid since star transformation parameter is FALSE
TE: Checking validity of table expansion for query block SEL$1 (#0)
TE: Bypassed: No partitioned table in query block.
CBQT bypassed for query block SEL$1 (#0): no complex view, sub-queries or UNION (ALL) queries.
CBQT: Validity checks failed for 3s204axjz7tdv.
CSE: Considering common sub-expression elimination in query block SEL$1 (#0)
*************************
Common Subexpression elimination (CSE)
*************************
CSE:     CSE not performed on query block SEL$1 (#0).
OBYE:   Considering Order-by Elimination from view SEL$1 (#0)
***************************
Order-by elimination (OBYE)
***************************
OBYE:     OBYE performed.
CVM: Considering view merge in query block SEL$1 (#0)
query block SEL$1 (#0) unchanged
Considering Query Transformations on query block SEL$1 (#0)
**************************
Query transformations (QT)
**************************
JF: Checking validity of join factorization for query block SEL$1 (#0)
JF: Bypassed: has order-by clause.
ST: not valid since star transformation parameter is FALSE
TE: Checking validity of table expansion for query block SEL$1 (#0)
TE: Bypassed: No partitioned table in query block.
CBQT bypassed for query block SEL$1 (#0): no complex view, sub-queries or UNION (ALL) queries.
CBQT: Validity checks failed for 3s204axjz7tdv.
CSE: Considering common sub-expression elimination in query block SEL$1 (#0)
*************************
Common Subexpression elimination (CSE)
*************************
CSE:     CSE not performed on query block SEL$1 (#0).
SU: Considering subquery unnesting in query block SEL$1 (#0)
********************
Subquery Unnest (SU)
********************
SJC: Considering set-join conversion in query block SEL$1 (#0)
*************************
Set-Join Conversion (SJC)
*************************
SJC: not performed
PM: Considering predicate move-around in query block SEL$1 (#0)
**************************
Predicate Move-Around (PM)
**************************
PM:     PM bypassed: Outer query contains no views.
PM:     PM bypassed: Outer query contains no views.
query block SEL$1 (#0) unchanged
FPD: Considering simple filter push in query block SEL$1 (#0)
"BOOK"."AUTHOR"='zrjthoiqpy'
try to generate transitive predicate from check constraints for query block SEL$1 (#0)
finally: "BOOK"."AUTHOR"='zrjthoiqpy'

apadrv-start sqlid=4325712215474955707
  :
    call(in-use=10408, alloc=32712), compile(in-use=63240, alloc=66992), execution(in-use=2712, alloc=4032)

*******************************************
Peeked values of the binds in SQL statement
*******************************************

Final query after transformations:******* UNPARSED QUERY IS *******
SELECT "BOOK"."ID" "ID","BOOK"."TITLE" "TITLE","BOOK"."AMT" "AMT","BOOK"."AUTHOR" "AUTHOR","BOOK"."PRESS" "PRESS","BOOK"."ISBN" "ISBN" FROM "YOON"."BOOK" "BOOK" WHERE "BOOK"."AUTHOR"='zrjthoiqpy' ORDER BY "BOOK"."TITLE"
kkoqbc: optimizing query block SEL$1 (#0)
        
        :
    call(in-use=10456, alloc=32712), compile(in-use=64168, alloc=66992), execution(in-use=2712, alloc=4032)

kkoqbc-subheap (create addr=0x7fdc2317da30)
****************
QUERY BLOCK TEXT
****************
select * from book
 where author = 'zrjthoiqpy'
 
---------------------
QUERY BLOCK SIGNATURE
---------------------
signature (optimizer): qb_name=SEL$1 nbfros=1 flg=0
  fro(0): flg=0 objn=194321 hint_alias="BOOK"@"SEL$1"

-----------------------------
SYSTEM STATISTICS INFORMATION
-----------------------------
  Using NOWORKLOAD Stats
  CPUSPEEDNW: 2657 millions instructions/sec (default is 100)
  IOTFRSPEED: 4096 bytes per millisecond (default is 4096)
  IOSEEKTIM: 10 milliseconds (default is 10)
  MBRC: -1 blocks (default is 8)

***************************************
BASE STATISTICAL INFORMATION
***********************
Table Stats::
  Table: BOOK  Alias: BOOK
    #Rows: 1000000  #Blks:  9667  AvgRowLen:  64.00
Index Stats::
  Index: BOOK_IDX  Col#: 4 2
    LVLS: 2  #LB: 6411  #DK: 1000000  LB/K: 1.00  DB/K: 1.00  CLUF: 12847.00
  Index: BOOK_IDX2  Col#: 7
    LVLS: 2  #LB: 2933  #DK: 897838  LB/K: 1.00  DB/K: 1.00  CLUF: 999898.00
  Index: BOOK_IDX3  Col#: 8
    LVLS: 2  #LB: 2233  #DK: 10  LB/K: 223.00  DB/K: 9523.00  CLUF: 95237.00
Access path analysis for BOOK
***************************************
SINGLE TABLE ACCESS PATH 
  Single Table Cardinality Estimation for BOOK[BOOK] 
  Table: BOOK  Alias: BOOK
    Card: Original: 1000000.000000  Rounded: 1  Computed: 1.00  Non Adjusted: 1.00
  Access Path: TableScan
    Cost:  2630.31  Resp: 2630.31  Degree: 0
      Cost_io: 2620.00  Cost_cpu: 328843000
      Resp_io: 2620.00  Resp_cpu: 328843000


  Access Path: index (RangeScan)
    Index: BOOK_IDX
    resc_io: 4.00  resc_cpu: 29386
    ix_sel: 0.000001  ix_sel_with_filters: 0.000001 
    Cost: 4.00  Resp: 4.00  Degree: 1
  Best:: AccessPath: IndexRange
  Index: BOOK_IDX
         Cost: 4.00  Degree: 1  Resp: 4.00  Card: 1.00  Bytes: 0

***************************************


OPTIMIZER STATISTICS AND COMPUTATIONS
***************************************
GENERAL PLANS
***************************************
Considering cardinality-based initial join order.
Permutations for Starting Table :0
Join order[1]:  BOOK[BOOK]#0
***********************
Best so far:  Table#: 0  cost: 4.0009  card: 1.0005  bytes: 64
***********************

****** Recost for ORDER BY (using index) ************
Access path analysis for BOOK
***************************************
SINGLE TABLE ACCESS PATH 
  Single Table Cardinality Estimation for BOOK[BOOK] 
  Table: BOOK  Alias: BOOK
    Card: Original: 1000000.000000  Rounded: 1  Computed: 1.00  Non Adjusted: 1.00
  Access Path: TableScan
    Cost:  2630.31  Resp: 2630.31  Degree: 0
      Cost_io: 2620.00  Cost_cpu: 328843000
      Resp_io: 2620.00  Resp_cpu: 328843000


  Access Path: index (RangeScan)
    Index: BOOK_IDX
    resc_io: 4.00  resc_cpu: 29386
    ix_sel: 0.000001  ix_sel_with_filters: 0.000001 
    Cost: 4.00  Resp: 4.00  Degree: 1
  Best:: AccessPath: IndexRange
  Index: BOOK_IDX
         Cost: 4.00  Degree: 1  Resp: 4.00  Card: 1.00  Bytes: 64

Join order[1]:  BOOK[BOOK]#0
***********************
Best so far:  Table#: 0  cost: 4.0009  card: 1.0005  bytes: 64
***********************
(newjo-stop-1) k:0, spcnt:0, perm:1, maxperm:2000

*********************************
Number of join permutations tried: 1
*********************************
    SORT ressource         Sort statistics
      Sort width:        6142 Area size:     1048576 Max Area size:  1073741824
      Degree:               1
      Blocks to Sort: 1 Row size:     81 Total Rows:              1
      Initial runs:   1 Merge passes:  0 IO Cost / pass:          0
      Total IO sort cost: 0      Total CPU sort cost: 31884146
      Total Temp space used: 0
Trying or-Expansion on query block SEL$1 (#0)
Transfer Optimizer annotations for query block SEL$1 (#0)
id=0 frofkks[i] (index start key) predicate="BOOK"."AUTHOR"='zrjthoiqpy'
id=0 frofkke[i] (index stop key) predicate="BOOK"."AUTHOR"='zrjthoiqpy'
Final cost for query block SEL$1 (#0) - All Rows Plan:
  Best join order: 1
  Cost: 4.0009  Degree: 1  Card: 1.0000  Bytes: 64
  Resc: 4.0009  Resc_io: 4.0000  Resc_cpu: 29386
  Resp: 4.0009  Resp_io: 4.0000  Resc_cpu: 29386
kkoqbc-subheap (delete addr=0x7fdc2317da30, in-use=14336, alloc=15504)
kkoqbc-end:
        :
    call(in-use=26344, alloc=65448), compile(in-use=65216, alloc=66992), execution(in-use=2712, alloc=4032)

kkoqbc: finish optimizing query block SEL$1 (#0)
apadrv-end
          :
    call(in-use=26344, alloc=65448), compile(in-use=66128, alloc=66992), execution(in-use=2712, alloc=4032)


Starting SQL statement dump

user_id=185 user_name=YOON module=SQL*Plus action=
sql_id=3s204axjz7tdv plan_hash_value=-723828592 problem_type=3
----- Current SQL Statement for this session (sql_id=3s204axjz7tdv) -----
select * from book
 where author = 'zrjthoiqpy'
 order by title 
sql_text_length=65
sql=select * from book
 where author = 'zrjthoiqpy'
 order by title 
----- Explain Plan Dump -----
----- Plan Table -----
 
============
Plan Table
============
-----------------------------------------------+-----------------------------------+
| Id  | Operation                    | Name    | Rows  | Bytes | Cost  | Time      |
-----------------------------------------------+-----------------------------------+
| 0   | SELECT STATEMENT             |         |       |       |     4 |           |
| 1   |  TABLE ACCESS BY INDEX ROWID | BOOK    |     1 |    64 |     4 |  00:00:01 |
| 2   |   INDEX RANGE SCAN           | BOOK_IDX|     1 |       |     3 |  00:00:01 |
-----------------------------------------------+-----------------------------------+
Predicate Information:
----------------------
2 - access("AUTHOR"='zrjthoiqpy')
 
Content of other_xml column
===========================
  db_version     : 11.2.0.1
  parse_schema   : YOON
  plan_hash      : 3571138704
  plan_hash_2    : 2462037563
  Outline Data:
  /*+
    BEGIN_OUTLINE_DATA
      IGNORE_OPTIM_EMBEDDED_HINTS
      OPTIMIZER_FEATURES_ENABLE('11.2.0.1')
      DB_VERSION('11.2.0.1')
      ALL_ROWS
      OUTLINE_LEAF(@"SEL$1")
      INDEX_RS_ASC(@"SEL$1" "BOOK"@"SEL$1" ("BOOK"."AUTHOR" "BOOK"."TITLE"))
    END_OUTLINE_DATA
  */
 
Optimizer state dump:
Compilation Environment Dump
optimizer_mode_hinted               = false
optimizer_features_hinted           = 0.0.0
parallel_execution_enabled          = true
parallel_query_forced_dop           = 0
parallel_dml_forced_dop             = 0
parallel_ddl_forced_degree          = 0
parallel_ddl_forced_instances       = 0
_query_rewrite_fudge                = 90
optimizer_features_enable           = 11.2.0.1
_optimizer_search_limit             = 5
cpu_count                           = 40
active_instance_count               = 1
parallel_threads_per_cpu            = 2
hash_area_size                      = 131072
bitmap_merge_area_size              = 1048576
sort_area_size                      = 65536
sort_area_retained_size             = 0
_sort_elimination_cost_ratio        = 0
_optimizer_block_size               = 8192
_sort_multiblock_read_count         = 2
_hash_multiblock_io_count           = 0
_db_file_optimizer_read_count       = 8
_optimizer_max_permutations         = 2000
pga_aggregate_target                = 18874368 KB
_pga_max_size                       = 2097152 KB
_query_rewrite_maxdisjunct          = 257
_smm_auto_min_io_size               = 56 KB
_smm_auto_max_io_size               = 248 KB
_smm_min_size                       = 1024 KB
_smm_max_size                       = 1048576 KB
_smm_px_max_size                    = 9437184 KB
_cpu_to_io                          = 0
_optimizer_undo_cost_change         = 11.2.0.1
parallel_query_mode                 = enabled
parallel_dml_mode                   = disabled
parallel_ddl_mode                   = enabled
optimizer_mode                      = all_rows
sqlstat_enabled                     = false
_optimizer_percent_parallel         = 101
_always_anti_join                   = choose
_always_semi_join                   = choose
_optimizer_mode_force               = true
_partition_view_enabled             = true
_always_star_transformation         = false
_query_rewrite_or_error             = false
_hash_join_enabled                  = true
cursor_sharing                      = exact
_b_tree_bitmap_plans                = true
star_transformation_enabled         = false
_optimizer_cost_model               = choose
_new_sort_cost_estimate             = true
_complex_view_merging               = true
_unnest_subquery                    = true
_eliminate_common_subexpr           = true
_pred_move_around                   = true
_convert_set_to_join                = false
_push_join_predicate                = true
_push_join_union_view               = true
_fast_full_scan_enabled             = true
_optim_enhance_nnull_detection      = true
_parallel_broadcast_enabled         = true
_px_broadcast_fudge_factor          = 100
_ordered_nested_loop                = true
_no_or_expansion                    = false
optimizer_index_cost_adj            = 100
optimizer_index_caching             = 0
_system_index_caching               = 0
_disable_datalayer_sampling         = false
query_rewrite_enabled               = true
query_rewrite_integrity             = enforced
_query_cost_rewrite                 = true
_query_rewrite_2                    = true
_query_rewrite_1                    = true
_query_rewrite_expression           = true
_query_rewrite_jgmigrate            = true
_query_rewrite_fpc                  = true
_query_rewrite_drj                  = true
_full_pwise_join_enabled            = true
_partial_pwise_join_enabled         = true
_left_nested_loops_random           = true
_improved_row_length_enabled        = true
_index_join_enabled                 = true
_enable_type_dep_selectivity        = true
_improved_outerjoin_card            = true
_optimizer_adjust_for_nulls         = true
_optimizer_degree                   = 0
_use_column_stats_for_function      = true
_subquery_pruning_enabled           = true
_subquery_pruning_mv_enabled        = false
_or_expand_nvl_predicate            = true
_like_with_bind_as_equality         = false
_table_scan_cost_plus_one           = true
_cost_equality_semi_join            = true
_default_non_equality_sel_check     = true
_new_initial_join_orders            = true
_oneside_colstat_for_equijoins      = true
_optim_peek_user_binds              = true
_minimal_stats_aggregation          = true
_force_temptables_for_gsets         = false
workarea_size_policy                = auto
_smm_auto_cost_enabled              = true
_gs_anti_semi_join_allowed          = true
_optim_new_default_join_sel         = true
optimizer_dynamic_sampling          = 2
_pre_rewrite_push_pred              = true
_optimizer_new_join_card_computation = true
_union_rewrite_for_gs               = yes_gset_mvs
_generalized_pruning_enabled        = true
_optim_adjust_for_part_skews        = true
_force_datefold_trunc               = false
statistics_level                    = typical
_optimizer_system_stats_usage       = true
skip_unusable_indexes               = true
_remove_aggr_subquery               = true
_optimizer_push_down_distinct       = 0
_dml_monitoring_enabled             = true
_optimizer_undo_changes             = false
_predicate_elimination_enabled      = true
_nested_loop_fudge                  = 100
_project_view_columns               = true
_local_communication_costing_enabled = true
_local_communication_ratio          = 50
_query_rewrite_vop_cleanup          = true
_slave_mapping_enabled              = true
_optimizer_cost_based_transformation = linear
_optimizer_mjc_enabled              = true
_right_outer_hash_enable            = true
_spr_push_pred_refspr               = true
_optimizer_cache_stats              = false
_optimizer_cbqt_factor              = 50
_optimizer_squ_bottomup             = true
_fic_area_size                      = 131072
_optimizer_skip_scan_enabled        = true
_optimizer_cost_filter_pred         = false
_optimizer_sortmerge_join_enabled   = true
_optimizer_join_sel_sanity_check    = true
_mmv_query_rewrite_enabled          = true
_bt_mmv_query_rewrite_enabled       = true
_add_stale_mv_to_dependency_list    = true
_distinct_view_unnesting            = false
_optimizer_dim_subq_join_sel        = true
_optimizer_disable_strans_sanity_checks = 0
_optimizer_compute_index_stats      = true
_push_join_union_view2              = true
_optimizer_ignore_hints             = false
_optimizer_random_plan              = 0
_query_rewrite_setopgrw_enable      = true
_optimizer_correct_sq_selectivity   = true
_disable_function_based_index       = false
_optimizer_join_order_control       = 3
_optimizer_cartesian_enabled        = true
_optimizer_starplan_enabled         = true
_extended_pruning_enabled           = true
_optimizer_push_pred_cost_based     = true
_optimizer_null_aware_antijoin      = true
_optimizer_extend_jppd_view_types   = true
_sql_model_unfold_forloops          = run_time
_enable_dml_lock_escalation         = false
_bloom_filter_enabled               = true
_update_bji_ipdml_enabled           = 0
_optimizer_extended_cursor_sharing  = udo
_dm_max_shared_pool_pct             = 1
_optimizer_cost_hjsmj_multimatch    = true
_optimizer_transitivity_retain      = true
_px_pwg_enabled                     = true
optimizer_secure_view_merging       = true
_optimizer_join_elimination_enabled = true
flashback_table_rpi                 = non_fbt
_optimizer_cbqt_no_size_restriction = true
_optimizer_enhanced_filter_push     = true
_optimizer_filter_pred_pullup       = true
_rowsrc_trace_level                 = 0
_simple_view_merging                = true
_optimizer_rownum_pred_based_fkr    = true
_optimizer_better_inlist_costing    = all
_optimizer_self_induced_cache_cost  = false
_optimizer_min_cache_blocks         = 10
_optimizer_or_expansion             = depth
_optimizer_order_by_elimination_enabled = true
_optimizer_outer_to_anti_enabled    = true
_selfjoin_mv_duplicates             = true
_dimension_skip_null                = true
_force_rewrite_enable               = false
_optimizer_star_tran_in_with_clause = true
_optimizer_complex_pred_selectivity = true
_optimizer_connect_by_cost_based    = true
_gby_hash_aggregation_enabled       = true
_globalindex_pnum_filter_enabled    = true
_px_minus_intersect                 = true
_fix_control_key                    = 0
_force_slave_mapping_intra_part_loads = false
_force_tmp_segment_loads            = false
_query_mmvrewrite_maxpreds          = 10
_query_mmvrewrite_maxintervals      = 5
_query_mmvrewrite_maxinlists        = 5
_query_mmvrewrite_maxdmaps          = 10
_query_mmvrewrite_maxcmaps          = 20
_query_mmvrewrite_maxregperm        = 512
_query_mmvrewrite_maxmergedcmaps    = 50
_query_mmvrewrite_maxqryinlistvals  = 500
_disable_parallel_conventional_load = false
_trace_virtual_columns              = false
_replace_virtual_columns            = true
_virtual_column_overload_allowed    = true
_kdt_buffering                      = true
_first_k_rows_dynamic_proration     = true
_optimizer_sortmerge_join_inequality = true
_optimizer_aw_stats_enabled         = true
_bloom_pruning_enabled              = true
result_cache_mode                   = MANUAL
_px_ual_serial_input                = true
_optimizer_skip_scan_guess          = false
_enable_row_shipping                = true
_row_shipping_threshold             = 80
_row_shipping_explain               = false
transaction_isolation_level         = read_commited
_optimizer_distinct_elimination     = true
_optimizer_multi_level_push_pred    = true
_optimizer_group_by_placement       = true
_optimizer_rownum_bind_default      = 10
_enable_query_rewrite_on_remote_objs = true
_optimizer_extended_cursor_sharing_rel = simple
_optimizer_adaptive_cursor_sharing  = true
_direct_path_insert_features        = 0
_optimizer_improve_selectivity      = true
optimizer_use_pending_statistics    = false
_optimizer_enable_density_improvements = true
_optimizer_aw_join_push_enabled     = true
_optimizer_connect_by_combine_sw    = true
_enable_pmo_ctas                    = 0
_optimizer_native_full_outer_join   = force
_bloom_predicate_enabled            = true
_optimizer_enable_extended_stats    = true
_is_lock_table_for_ddl_wait_lock    = 0
_pivot_implementation_method        = choose
optimizer_capture_sql_plan_baselines = false
optimizer_use_sql_plan_baselines    = true
_optimizer_star_trans_min_cost      = 0
_optimizer_star_trans_min_ratio     = 0
_with_subquery                      = OPTIMIZER
_optimizer_fkr_index_cost_bias      = 10
_optimizer_use_subheap              = true
parallel_degree_policy              = manual
parallel_degree                     = 0
parallel_min_time_threshold         = 10
_parallel_time_unit                 = 10
_optimizer_or_expansion_subheap     = true
_optimizer_free_transformation_heap = true
_optimizer_reuse_cost_annotations   = true
_result_cache_auto_size_threshold   = 100
_result_cache_auto_time_threshold   = 1000
_optimizer_nested_rollup_for_gset   = 100
_nlj_batching_enabled               = 1
parallel_query_default_dop          = 0
is_recur_flags                      = 0
optimizer_use_invisible_indexes     = false
flashback_data_archive_internal_cursor = 0
_optimizer_extended_stats_usage_control = 224
_parallel_syspls_obey_force         = true
cell_offload_processing             = true
_rdbms_internal_fplib_enabled       = false
db_file_multiblock_read_count       = 128
_bloom_folding_enabled              = true
_mv_generalized_oj_refresh_opt      = true
cell_offload_compaction             = ADAPTIVE
parallel_degree_limit               = 65535
parallel_force_local                = false
parallel_max_degree                 = 80
total_cpu_count                     = 40
cell_offload_plan_display           = AUTO
_optimizer_coalesce_subqueries      = true
_optimizer_fast_pred_transitivity   = true
_optimizer_fast_access_pred_analysis = true
_optimizer_unnest_disjunctive_subq  = true
_optimizer_unnest_corr_set_subq     = true
_optimizer_distinct_agg_transform   = true
_aggregation_optimization_settings  = 0
_optimizer_connect_by_elim_dups     = true
_optimizer_eliminate_filtering_join = true
_connect_by_use_union_all           = true
dst_upgrade_insert_conv             = true
advanced_queuing_internal_cursor    = 0
_optimizer_unnest_all_subqueries    = true
_bloom_predicate_pushdown_to_storage = true
_bloom_vector_elements              = 0
_bloom_pushing_max                  = 524288
parallel_autodop                    = 0
parallel_ddldml                     = 0
_parallel_cluster_cache_policy      = adaptive
_parallel_scalability               = 50
iot_internal_cursor                 = 0
_optimizer_instance_count           = 0
_optimizer_connect_by_cb_whr_only   = false
_suppress_scn_chk_for_cqn           = nosuppress_1466
_optimizer_join_factorization       = true
_optimizer_use_cbqt_star_transformation = true
_optimizer_table_expansion          = true
_and_pruning_enabled                = true
_deferred_constant_folding_mode     = DEFAULT
_optimizer_distinct_placement       = true
partition_pruning_internal_cursor   = 0
parallel_hinted                     = none
_sql_compatibility                  = 0
_optimizer_use_feedback             = true
_optimizer_try_st_before_jppd       = true
Bug Fix Control Environment
    fix  3834770 = 1       
    fix  3746511 = enabled
    fix  4519016 = enabled
    fix  3118776 = enabled
    fix  4488689 = enabled
    fix  2194204 = disabled
    fix  2660592 = enabled
    fix  2320291 = enabled
    fix  2324795 = enabled
    fix  4308414 = enabled
    fix  3499674 = disabled
    fix  4569940 = enabled
    fix  4631959 = enabled
    fix  4519340 = enabled
    fix  4550003 = enabled
    fix  1403283 = enabled
    fix  4554846 = enabled
    fix  4602374 = enabled
    fix  4584065 = enabled
    fix  4545833 = enabled
    fix  4611850 = enabled
    fix  4663698 = enabled
    fix  4663804 = enabled
    fix  4666174 = enabled
    fix  4567767 = enabled
    fix  4556762 = 15      
    fix  4728348 = enabled
    fix  4708389 = enabled
    fix  4175830 = enabled
    fix  4752814 = enabled
    fix  4583239 = enabled
    fix  4386734 = enabled
    fix  4887636 = enabled
    fix  4483240 = enabled
    fix  4872602 = disabled
    fix  4711525 = enabled
    fix  4545802 = enabled
    fix  4605810 = enabled
    fix  4704779 = enabled
    fix  4900129 = enabled
    fix  4924149 = enabled
    fix  4663702 = enabled
    fix  4878299 = enabled
    fix  4658342 = enabled
    fix  4881533 = enabled
    fix  4676955 = enabled
    fix  4273361 = enabled
    fix  4967068 = enabled
    fix  4969880 = disabled
    fix  5005866 = enabled
    fix  5015557 = enabled
    fix  4705343 = enabled
    fix  4904838 = enabled
    fix  4716096 = enabled
    fix  4483286 = disabled
    fix  4722900 = enabled
    fix  4615392 = enabled
    fix  5096560 = enabled
    fix  5029464 = enabled
    fix  4134994 = enabled
    fix  4904890 = enabled
    fix  5104624 = enabled
    fix  5014836 = enabled
    fix  4768040 = enabled
    fix  4600710 = enabled
    fix  5129233 = enabled
    fix  4595987 = enabled
    fix  4908162 = enabled
    fix  5139520 = enabled
    fix  5084239 = enabled
    fix  5143477 = disabled
    fix  2663857 = enabled
    fix  4717546 = enabled
    fix  5240264 = disabled
    fix  5099909 = enabled
    fix  5240607 = enabled
    fix  5195882 = enabled
    fix  5220356 = enabled
    fix  5263572 = enabled
    fix  5385629 = enabled
    fix  5302124 = enabled
    fix  5391942 = enabled
    fix  5384335 = enabled
    fix  5482831 = enabled
    fix  4158812 = enabled
    fix  5387148 = enabled
    fix  5383891 = enabled
    fix  5466973 = enabled
    fix  5396162 = enabled
    fix  5394888 = enabled
    fix  5395291 = enabled
    fix  5236908 = enabled
    fix  5509293 = enabled
    fix  5449488 = enabled
    fix  5567933 = enabled
    fix  5570494 = enabled
    fix  5288623 = enabled
    fix  5505995 = enabled
    fix  5505157 = enabled
    fix  5112460 = enabled
    fix  5554865 = enabled
    fix  5112260 = enabled
    fix  5112352 = enabled
    fix  5547058 = enabled
    fix  5618040 = enabled
    fix  5585313 = enabled
    fix  5547895 = enabled
    fix  5634346 = enabled
    fix  5620485 = enabled
    fix  5483301 = enabled
    fix  5657044 = enabled
    fix  5694984 = enabled
    fix  5868490 = enabled
    fix  5650477 = enabled
    fix  5611962 = enabled
    fix  4279274 = enabled
    fix  5741121 = enabled
    fix  5714944 = enabled
    fix  5391505 = enabled
    fix  5762598 = enabled
    fix  5578791 = enabled
    fix  5259048 = enabled
    fix  5882954 = enabled
    fix  2492766 = enabled
    fix  5707608 = enabled
    fix  5891471 = enabled
    fix  5884780 = enabled
    fix  5680702 = enabled
    fix  5371452 = enabled
    fix  5838613 = enabled
    fix  5949981 = enabled
    fix  5624216 = enabled
    fix  5741044 = enabled
    fix  5976822 = enabled
    fix  6006457 = enabled
    fix  5872956 = enabled
    fix  5923644 = enabled
    fix  5943234 = enabled
    fix  5844495 = enabled
    fix  4168080 = enabled
    fix  6020579 = enabled
    fix  5842686 = disabled
    fix  5996801 = enabled
    fix  5593639 = enabled
    fix  6133948 = enabled
    fix  3151991 = enabled
    fix  6146906 = enabled
    fix  6239909 = enabled
    fix  6267621 = enabled
    fix  5909305 = enabled
    fix  6279918 = enabled
    fix  6141818 = enabled
    fix  6151963 = enabled
    fix  6251917 = enabled
    fix  6282093 = enabled
    fix  6119510 = enabled
    fix  6119382 = enabled
    fix  3801750 = enabled
    fix  5705630 = disabled
    fix  5944076 = enabled
    fix  5406763 = enabled
    fix  6070954 = enabled
    fix  6282944 = enabled
    fix  6138746 = enabled
    fix  6082745 = enabled
    fix  3426050 = enabled
    fix   599680 = enabled
    fix  6062266 = enabled
    fix  6087237 = enabled
    fix  6122894 = enabled
    fix  6377505 = enabled
    fix  5893768 = enabled
    fix  6163564 = enabled
    fix  6073325 = enabled
    fix  6188881 = enabled
    fix  6007259 = enabled
    fix  6239971 = enabled
    fix  5284200 = disabled
    fix  6042205 = enabled
    fix  6051211 = enabled
    fix  6434668 = enabled
    fix  6438752 = enabled
    fix  5936366 = enabled
    fix  6439032 = enabled
    fix  6438892 = enabled
    fix  6006300 = enabled
    fix  5947231 = enabled
    fix  5416118 = 1       
    fix  6365442 = 1       
    fix  6239039 = enabled
    fix  6502845 = enabled
    fix  6913094 = enabled
    fix  6029469 = enabled
    fix  5919513 = enabled
    fix  6057611 = enabled
    fix  6469667 = enabled
    fix  6608941 = disabled
    fix  6368066 = enabled
    fix  6329318 = enabled
    fix  6656356 = enabled
    fix  4507997 = enabled
    fix  6671155 = enabled
    fix  6694548 = enabled
    fix  6688200 = enabled
    fix  6612471 = enabled
    fix  6708183 = disabled
    fix  6326934 = enabled
    fix  6520717 = disabled
    fix  6714199 = enabled
    fix  6681545 = enabled
    fix  6748058 = enabled
    fix  6167716 = enabled
    fix  6674254 = enabled
    fix  6468287 = enabled
    fix  6503543 = enabled
    fix  6808773 = disabled
    fix  6766962 = enabled
    fix  6120483 = enabled
    fix  6670551 = enabled
    fix  6771838 = enabled
    fix  6626018 = disabled
    fix  6530596 = enabled
    fix  6778642 = enabled
    fix  6699059 = enabled
    fix  6376551 = enabled
    fix  6429113 = enabled
    fix  6782437 = enabled
    fix  6776808 = enabled
    fix  6765823 = enabled
    fix  6768660 = enabled
    fix  6782665 = enabled
    fix  6610822 = enabled
    fix  6514189 = enabled
    fix  6818410 = enabled
    fix  6827696 = enabled
    fix  6773613 = enabled
    fix  5902962 = enabled
    fix  6956212 = enabled
    fix  3056297 = enabled
    fix  6440977 = disabled
    fix  6972291 = disabled
    fix  6904146 = enabled
    fix  6221403 = enabled
    fix  5475051 = enabled
    fix  6845871 = enabled
    fix  5468809 = enabled
    fix  6917633 = enabled
    fix  4444536 = disabled
    fix  6955210 = enabled
    fix  6994194 = enabled
    fix  6399597 = disabled
    fix  6951776 = enabled
    fix  5648287 = 3       
    fix  6987082 = disabled
    fix  7132036 = enabled
    fix  6980350 = enabled
    fix  5199213 = enabled
    fix  7138405 = enabled
    fix  7148689 = enabled
    fix  6820988 = enabled
    fix  7032684 = enabled
    fix  6617866 = enabled
    fix  7155968 = enabled
    fix  7127980 = enabled
    fix  6982954 = enabled
    fix  7241819 = enabled
    fix  6897034 = enabled
    fix  7236148 = enabled
    fix  7298570 = enabled
    fix  7249095 = enabled
    fix  7314499 = enabled
    fix  7324224 = enabled
    fix  7289023 = enabled
    fix  7237571 = enabled
    fix  7116357 = enabled
    fix  7345484 = enabled
    fix  7375179 = enabled
    fix  6430500 = disabled
    fix  5897486 = enabled
    fix  6774209 = enabled
    fix  7306637 = enabled
    fix  6451322 = enabled
    fix  7208131 = enabled
    fix  7388652 = enabled
    fix  7127530 = enabled
    fix  6751206 = enabled
    fix  6669103 = enabled
    fix  7430474 = enabled
    fix  6990305 = enabled
    fix  7043307 = enabled
    fix  6921505 = enabled
    fix  7388457 = enabled
    fix  3120429 = enabled
    fix  7452823 = disabled
    fix  6838105 = enabled
    fix  6769711 = enabled
    fix  7170213 = enabled
    fix  6528872 = enabled
    fix  7295298 = enabled
    fix  5922070 = enabled
    fix  7259468 = enabled
    fix  6418552 = enabled
    fix  4619997 = enabled
    fix  7524366 = enabled
    fix  6942476 = enabled
    fix  6418771 = enabled
    fix  7375077 = enabled
    fix  5400639 = enabled
    fix  4570921 = enabled
    fix  7426911 = enabled
    fix  5099019 = disabled
    fix  7528216 = enabled
    fix  7521266 = enabled
    fix  7385140 = enabled
    fix  7576516 = enabled
    fix  7573526 = enabled
    fix  7576476 = enabled
    fix  7165898 = enabled
    fix  7263214 = enabled
    fix  3320140 = enabled
    fix  7555510 = enabled
    fix  7613118 = enabled
    fix  7597059 = enabled
    fix  7558911 = enabled
    fix  5520732 = enabled
    fix  7679490 = disabled
    fix  7449971 = enabled
    fix  3628118 = enabled
    fix  4370840 = enabled
    fix  7281191 = enabled
    fix  7519687 = enabled
    fix  5029592 = 3       
    fix  6012093 = 1       
    fix  6053861 = disabled
    fix  6941515 = disabled
    fix  7696414 = enabled
    fix  7272039 = enabled
    fix  7834811 = enabled
    fix  7640597 = enabled
    fix  7341616 = enabled
    fix  7168184 = enabled
    fix   399198 = enabled
    fix  7831070 = enabled
    fix  7676897 = disabled
    fix  7414637 = enabled
    fix  7585456 = enabled
    fix  8202421 = enabled
    fix  7658097 = disabled
    fix  8251486 = enabled
    fix  7132684 = enabled
    fix  7512227 = enabled
    fix  6972987 = enabled
    fix  7199035 = enabled
    fix  8243446 = enabled
    fix  7650462 = enabled
    fix  6720701 = enabled
    fix  7592673 = enabled
    fix  7718694 = enabled
    fix  7534027 = enabled
    fix  7708267 = enabled
    fix  5716785 = enabled
    fix  7356191 = enabled
    fix  7679161 = enabled
    fix  7597159 = enabled
    fix  7499258 = enabled
    fix  8328363 = enabled
    fix  7452863 = enabled
    fix  8284930 = enabled
    fix  7298626 = enabled
    fix  7657126 = enabled
    fix  8371884 = enabled
    fix  8318020 = enabled
    fix  8255423 = enabled
    fix  7135745 = enabled
    fix  8356253 = enabled
    fix  7534257 = enabled
    fix  8323407 = enabled
    fix  7539815 = enabled
    fix  8289316 = enabled
    fix  8447850 = enabled
    fix  7675944 = enabled
    fix  8355120 = enabled
    fix  7176746 = enabled
    fix  8442891 = enabled
    fix  8373261 = enabled
    fix  7679164 = enabled
    fix  7670533 = enabled
    fix  8408665 = enabled
    fix  8491399 = enabled
    fix  8348392 = enabled
    fix  8348585 = enabled
    fix  8508056 = enabled
    fix  8335178 = enabled
    fix  8515269 = enabled
    fix  8247017 = enabled
    fix  7325597 = enabled
    fix  8531490 = enabled
    fix  6163600 = enabled
    fix  8589278 = disabled
    fix  8557992 = enabled
    fix  7556098 = enabled
    fix  8580883 = enabled
    fix  5892599 = disabled
    fix  8609714 = enabled
    fix  8514561 = enabled
    fix  8619631 = disabled


Query Block Registry:
SEL$1 0x23176638 (PARSER) [FINAL]

:
    call(in-use=29264, alloc=65448), compile(in-use=99136, alloc=164040), execution(in-use=9264, alloc=12144)

End of Optimizer State Dump
Dumping Hints
=============
====================== END SQL Statement Dump ======================
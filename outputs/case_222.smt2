; SMT2 file generated from compliance case automatic
; Case ID: case_222
; Generated at: 2025-10-21T04:56:08.033693
;
; This file can be executed with Z3:
;   z3 case_222.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const centralized_clearing_at_designated_clearinghouse Bool)
(declare-const evade_investigation Bool)
(declare-const not_announce_documents Bool)
(declare-const not_justified_refuse_arrival Bool)
(declare-const not_prepare_documents Bool)
(declare-const not_preserve_documents Bool)
(declare-const not_report_documents Bool)
(declare-const not_store_documents Bool)
(declare-const obstruct_inspection Bool)
(declare-const obstruct_investigation Bool)
(declare-const overdue_not_submit_documents Bool)
(declare-const penalty Bool)
(declare-const penalty_applicable Bool)
(declare-const refuse_inspection Bool)
(declare-const refuse_investigation Bool)
(declare-const refuse_provide_documents Bool)
(declare-const violate_article_104_2 Bool)
(declare-const violate_article_105 Bool)
(declare-const violate_article_10_1 Bool)
(declare-const violate_article_18 Bool)
(declare-const violate_article_3_2_exception Bool)
(declare-const violate_article_45_2_pre Bool)
(declare-const violate_article_5 Bool)
(declare-const violate_article_56_4 Bool)
(declare-const violate_article_57_1 Bool)
(declare-const violate_article_64 Bool)
(declare-const violate_article_65_1 Bool)
(declare-const violate_article_66_1 Bool)
(declare-const violate_article_67 Bool)
(declare-const violate_article_70_1 Bool)
(declare-const violate_article_72_1 Bool)
(declare-const violate_article_73 Bool)
(declare-const violate_article_74 Bool)
(declare-const violate_article_78_1 Bool)
(declare-const violate_article_80_3 Bool)
(declare-const violate_article_82_2 Bool)
(declare-const violate_article_84_2_pre Bool)
(declare-const violate_article_85_1 Bool)
(declare-const violate_article_87_1 Bool)
(declare-const violate_article_97_1_1 Bool)
(declare-const violate_article_97_1_3 Bool)
(declare-const violate_clearinghouse_article_55 Bool)
(declare-const violate_futures_broker_article_79 Bool)
(declare-const violate_futures_service_article_88 Bool)
(declare-const violate_leveraged_trader_article_81 Bool)
(declare-const violate_order_45_2_post Bool)
(declare-const violate_order_56_5 Bool)
(declare-const violate_order_80_4 Bool)
(declare-const violate_order_82_3 Bool)
(declare-const violate_order_85_2 Bool)
(declare-const violate_order_8_2 Bool)
(declare-const violate_order_93 Bool)
(declare-const violation_1 Bool)
(declare-const violation_2 Bool)
(declare-const violation_3 Bool)
(declare-const violation_4 Bool)
(declare-const violation_5 Bool)
(declare-const violation_6 Bool)
(declare-const violation_7 Bool)
(declare-const violation_8 Bool)
(declare-const violation_9 Bool)
(declare-const violation_minor Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [futures:violation_1] 違反期貨交易法指定條文之一
(assert (= violation_1
   (or violate_article_82_2
       violate_article_80_3
       violate_article_64
       violate_article_65_1
       violate_article_97_1_1
       violate_article_85_1
       violate_article_66_1
       violate_article_105
       violate_article_104_2
       violate_article_10_1
       violate_article_70_1
       violate_article_84_2_pre
       violate_article_57_1
       violate_article_97_1_3
       violate_article_72_1
       violate_article_73
       violate_article_18
       violate_article_56_4
       violate_article_5
       violate_article_87_1
       violate_article_67
       violate_article_74
       violate_article_78_1
       violate_article_45_2_pre)))

; [futures:violation_2] 違反依指定條文發布之命令
(assert (= violation_2
   (or violate_order_82_3
       violate_order_56_5
       violate_order_8_2
       violate_order_45_2_post
       violate_order_85_2
       violate_order_80_4
       violate_order_93)))

; [futures:violation_3] 違反第三條第二項但書未依主管機關規定於指定期貨結算機構集中結算或期貨結算機構違反第五十五條準用第十八條
(assert (= violation_3
   (or (and violate_article_3_2_exception
            (not centralized_clearing_at_designated_clearinghouse))
       violate_clearinghouse_article_55)))

; [futures:violation_4] 期貨商違反第七十九條準用第十八條規定
(assert (= violation_4 violate_futures_broker_article_79))

; [futures:violation_5] 槓桿交易商違反指定條文
(assert (= violation_5
   (or violate_article_64
       violate_article_65_1
       violate_article_66_1
       violate_article_70_1
       violate_article_57_1
       violate_article_72_1
       violate_article_73
       violate_article_67
       violate_article_74
       violate_article_78_1
       violate_leveraged_trader_article_81)))

; [futures:violation_6] 期貨服務事業違反指定條文
(assert (= violation_6
   (or violate_article_64
       violate_article_65_1
       violate_article_66_1
       violate_article_57_1
       violate_article_74
       violate_futures_service_article_88)))

; [futures:violation_7] 逾期不提出帳簿書類或妨礙主管機關檢查
(assert (= violation_7
   (or overdue_not_submit_documents refuse_inspection obstruct_inspection)))

; [futures:violation_8] 期貨交易所等未依法製作、申報、公告、備置或保存相關文件
(assert (= violation_8
   (or not_store_documents
       not_announce_documents
       not_report_documents
       not_prepare_documents
       not_preserve_documents)))

; [futures:violation_9] 規避、妨礙或拒絕主管機關調查或通知備詢無正當理由拒不到達
(assert (= violation_9
   (or refuse_investigation
       refuse_provide_documents
       not_justified_refuse_arrival
       obstruct_investigation
       evade_investigation)))

; [futures:penalty_applicable] 違反任一規定且情節非輕微者適用處罰
(assert (= penalty_applicable
   (and (or violation_1
            violation_2
            violation_3
            violation_4
            violation_5
            violation_6
            violation_7
            violation_8
            violation_9)
        (not violation_minor))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反期貨交易法第119條規定且非輕微情節時處罰
(assert (= penalty penalty_applicable))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_order_82_3 true))
(assert (= violation_2 true))
(assert (= penalty_applicable true))
(assert (= penalty true))
(assert (= violation_minor false))
(assert (= centralized_clearing_at_designated_clearinghouse true))
(assert (= evade_investigation false))
(assert (= not_announce_documents false))
(assert (= not_justified_refuse_arrival false))
(assert (= not_prepare_documents false))
(assert (= not_preserve_documents false))
(assert (= not_report_documents false))
(assert (= not_store_documents false))
(assert (= obstruct_inspection false))
(assert (= obstruct_investigation false))
(assert (= overdue_not_submit_documents false))
(assert (= refuse_inspection false))
(assert (= refuse_investigation false))
(assert (= refuse_provide_documents false))
(assert (= violate_article_104_2 false))
(assert (= violate_article_105 false))
(assert (= violate_article_10_1 false))
(assert (= violate_article_18 false))
(assert (= violate_article_3_2_exception false))
(assert (= violate_article_45_2_pre false))
(assert (= violate_article_5 false))
(assert (= violate_article_56_4 false))
(assert (= violate_article_57_1 false))
(assert (= violate_article_64 false))
(assert (= violate_article_65_1 false))
(assert (= violate_article_66_1 false))
(assert (= violate_article_67 false))
(assert (= violate_article_70_1 false))
(assert (= violate_article_72_1 false))
(assert (= violate_article_73 false))
(assert (= violate_article_74 false))
(assert (= violate_article_78_1 false))
(assert (= violate_article_80_3 false))
(assert (= violate_article_82_2 false))
(assert (= violate_article_84_2_pre false))
(assert (= violate_article_85_1 false))
(assert (= violate_article_87_1 false))
(assert (= violate_article_97_1_1 false))
(assert (= violate_article_97_1_3 false))
(assert (= violate_clearinghouse_article_55 false))
(assert (= violate_futures_broker_article_79 false))
(assert (= violate_futures_service_article_88 false))
(assert (= violate_leveraged_trader_article_81 false))
(assert (= violate_order_45_2_post false))
(assert (= violate_order_56_5 false))
(assert (= violate_order_80_4 false))
(assert (= violate_order_85_2 false))
(assert (= violate_order_8_2 false))
(assert (= violate_order_93 false))
(assert (= violation_1 false))
(assert (= violation_3 false))
(assert (= violation_4 false))
(assert (= violation_5 false))
(assert (= violation_6 false))
(assert (= violation_7 false))
(assert (= violation_8 false))
(assert (= violation_9 false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 62
; Total facts: 62
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

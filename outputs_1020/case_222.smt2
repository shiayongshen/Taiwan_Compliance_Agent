; SMT2 file generated from compliance case automatic
; Case ID: case_222
; Generated at: 2025-10-19T10:49:03.792911
;
; This file can be executed with Z3:
;   z3 case_222.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const not_announce_documents Bool)
(declare-const not_prepare_documents Bool)
(declare-const not_preserve_documents Bool)
(declare-const not_produce_documents Bool)
(declare-const not_report_documents Bool)
(declare-const obstruct_inspection Bool)
(declare-const obstruct_investigation Bool)
(declare-const overdue_not_submitted_documents Bool)
(declare-const penalty Bool)
(declare-const refuse_arrival_without_reason Bool)
(declare-const refuse_inspection Bool)
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
(declare-const violate_clearing_entity_article_55 Bool)
(declare-const violate_futures_broker_article_79 Bool)
(declare-const violate_futures_service_article_88 Bool)
(declare-const violate_leverage_article_81 Bool)
(declare-const violate_order_article_45_2_post Bool)
(declare-const violate_order_article_56_5 Bool)
(declare-const violate_order_article_80_4 Bool)
(declare-const violate_order_article_82_3 Bool)
(declare-const violate_order_article_85_2 Bool)
(declare-const violate_order_article_8_2 Bool)
(declare-const violate_order_article_93 Bool)
(declare-const violation_any Bool)
(declare-const violation_clearing Bool)
(declare-const violation_document_mismanagement Bool)
(declare-const violation_futures_broker Bool)
(declare-const violation_futures_service Bool)
(declare-const violation_leverage_trader Bool)
(declare-const violation_minor_exception Bool)
(declare-const violation_non_submission_or_obstruction Bool)
(declare-const violation_obstruct_investigation Bool)
(declare-const violation_order Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [futures:violation_any] 違反期貨交易法第119條所列任一規定
(assert (= violation_any
   (or violate_article_56_4
       violate_article_66_1
       violate_article_10_1
       violate_article_97_1_3
       violate_article_85_1
       violate_article_82_2
       violate_article_5
       violate_article_74
       violate_article_104_2
       violate_article_67
       violate_article_84_2_pre
       violate_article_45_2_pre
       violate_article_80_3
       violate_article_73
       violate_article_87_1
       violate_article_70_1
       violate_article_57_1
       violate_article_64
       violate_article_72_1
       violate_article_78_1
       violate_article_105
       violate_article_18
       violate_article_65_1
       violate_article_97_1_1)))

; [futures:violation_order] 違反依第8條第2項、第45條第2項後段、第56條第5項、第80條第4項、第82條第3項、第85條第2項或第93條所發布之命令
(assert (= violation_order
   (or violate_order_article_93
       violate_order_article_56_5
       violate_order_article_85_2
       violate_order_article_45_2_post
       violate_order_article_82_3
       violate_order_article_80_4
       violate_order_article_8_2)))

; [futures:violation_clearing] 違反第三條第二項但書未依主管機關規定於指定期貨結算機構集中結算，或期貨結算機構違反第五十五條準用第十八條規定
(assert (= violation_clearing
   (or violate_article_3_2_exception violate_clearing_entity_article_55)))

; [futures:violation_futures_broker] 期貨商違反第七十九條準用第十八條規定
(assert (= violation_futures_broker violate_futures_broker_article_79))

; [futures:violation_leverage_trader] 槓桿交易商違反第八十一條準用第十八條、第五十七條第一項、第六十四條、第六十五條第一項、第六十六條第一項、第六十七條、第七十條第一項、第七十二條第一項、第七十三條、第七十四條或第七十八條第一項規定
(assert (= violation_leverage_trader
   (or violate_article_66_1
       violate_article_74
       violate_article_67
       violate_leverage_article_81
       violate_article_73
       violate_article_70_1
       violate_article_57_1
       violate_article_64
       violate_article_72_1
       violate_article_78_1
       violate_article_65_1)))

; [futures:violation_futures_service] 期貨服務事業違反第八十八條準用第十八條、第五十七條第一項、第六十四條、第六十五條第一項、第六十六條第一項或第七十四條規定
(assert (= violation_futures_service
   (or violate_article_66_1
       violate_futures_service_article_88
       violate_article_74
       violate_article_57_1
       violate_article_64
       violate_article_65_1)))

; [futures:violation_non_submission_or_obstruction] 逾期不提出主管機關命令之帳簿、書類或其他有關物件或報告資料，或規避、妨礙、拒絕主管機關依法檢查
(assert (= violation_non_submission_or_obstruction
   (or overdue_not_submitted_documents obstruct_inspection refuse_inspection)))

; [futures:violation_document_mismanagement] 期貨交易所、期貨結算機構、期貨業、同業公會未依法製作、申報、公告、備置或保存帳簿、文據、財務報告或其他業務文件
(assert (= violation_document_mismanagement
   (or not_report_documents
       not_produce_documents
       not_announce_documents
       not_preserve_documents
       not_prepare_documents)))

; [futures:violation_obstruct_investigation] 規避、妨礙或拒絕主管機關調查，或拒不提供資料文件，無正當理由拒不到達辦公處所備詢
(assert (= violation_obstruct_investigation
   (or refuse_provide_documents
       refuse_arrival_without_reason
       obstruct_investigation)))

; [futures:penalty_default_false] 預設不處罰
(assert (not penalty))

; [futures:penalty_conditions] 處罰條件：違反期貨交易法第119條任一規定且情節非輕微時處罰
(assert (= penalty
   (and (or violation_obstruct_investigation
            violation_any
            violation_futures_broker
            violation_order
            violation_clearing
            violation_futures_service
            violation_non_submission_or_obstruction
            violation_document_mismanagement
            violation_leverage_trader)
        (not violation_minor_exception))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_order_article_82_3 true))
(assert (= violation_order true))
(assert (= violation_any false))
(assert (= violation_clearing false))
(assert (= violation_futures_broker false))
(assert (= violation_leverage_trader false))
(assert (= violation_futures_service false))
(assert (= violation_non_submission_or_obstruction false))
(assert (= violation_document_mismanagement false))
(assert (= violation_obstruct_investigation false))
(assert (= violation_minor_exception false))
(assert (= penalty true))
(assert (= not_announce_documents false))
(assert (= not_prepare_documents false))
(assert (= not_preserve_documents false))
(assert (= not_produce_documents false))
(assert (= not_report_documents false))
(assert (= obstruct_inspection false))
(assert (= obstruct_investigation false))
(assert (= overdue_not_submitted_documents false))
(assert (= refuse_arrival_without_reason false))
(assert (= refuse_inspection false))
(assert (= refuse_provide_documents false))
(assert (= violate_article_5 false))
(assert (= violate_article_10_1 false))
(assert (= violate_article_18 false))
(assert (= violate_article_3_2_exception false))
(assert (= violate_article_45_2_pre false))
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
(assert (= violate_article_104_2 false))
(assert (= violate_article_105 false))
(assert (= violate_clearing_entity_article_55 false))
(assert (= violate_futures_broker_article_79 false))
(assert (= violate_futures_service_article_88 false))
(assert (= violate_leverage_article_81 false))
(assert (= violate_order_article_45_2_post false))
(assert (= violate_order_article_56_5 false))
(assert (= violate_order_article_80_4 false))
(assert (= violate_order_article_85_2 false))
(assert (= violate_order_article_8_2 false))
(assert (= violate_order_article_93 false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 11
; Total variables: 58
; Total facts: 58
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

; SMT2 file generated from compliance case automatic
; Case ID: case_309
; Generated at: 2025-10-19T12:45:57.792773
;
; This file can be executed with Z3:
;   z3 case_309.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const approved_by_authority Bool)
(declare-const cleared_at_designated_clearinghouse Bool)
(declare-const clearinghouse_violate_article_55_apply_18 Bool)
(declare-const dedicated_department_assigned Bool)
(declare-const dedicated_person_assigned Bool)
(declare-const fail_announce_documents Bool)
(declare-const fail_create_documents Bool)
(declare-const fail_preserve_documents Bool)
(declare-const fail_report_documents Bool)
(declare-const fail_store_documents Bool)
(declare-const futures_contract Bool)
(declare-const futures_option_contract Bool)
(declare-const internal_control_system_approved_by_board Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_reported_and_recorded Bool)
(declare-const internal_control_system_set_by_rules Bool)
(declare-const internal_control_system_updated_if_notified Bool)
(declare-const late_submit_documents Bool)
(declare-const legal_futures_transaction_definition_met Bool)
(declare-const leverage_margin_contract Bool)
(declare-const no_prohibited_conditions_for_registration Bool)
(declare-const no_untrustworthy_activities Bool)
(declare-const not_at_futures_exchange Bool)
(declare-const not_cleared_at_designated_clearinghouse Bool)
(declare-const obstruct_inspection Bool)
(declare-const obstruct_investigation Bool)
(declare-const operation_managed_by_dedicated_department Bool)
(declare-const option_contract Bool)
(declare-const other_contract_types Bool)
(declare-const penalty Bool)
(declare-const penalty_applicable Bool)
(declare-const qualified_training_completed Bool)
(declare-const refuse_arrival_without_reason Bool)
(declare-const refuse_inspection Bool)
(declare-const refuse_provide_documents Bool)
(declare-const registered_qualified_salesperson_execute Bool)
(declare-const registration_done_by_futures_assistant Bool)
(declare-const registration_reported_within_5_days Bool)
(declare-const salesperson_registration_compliant Bool)
(declare-const swap_contract Bool)
(declare-const transaction_at_futures_exchange Bool)
(declare-const violate_article_104_2 Bool)
(declare-const violate_article_105 Bool)
(declare-const violate_article_10_1 Bool)
(declare-const violate_article_18 Bool)
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
(declare-const violate_article_79_apply_18 Bool)
(declare-const violate_article_80_3 Bool)
(declare-const violate_article_81_apply_18 Bool)
(declare-const violate_article_82_2 Bool)
(declare-const violate_article_84_2_pre Bool)
(declare-const violate_article_85_1 Bool)
(declare-const violate_article_87_1 Bool)
(declare-const violate_article_88_apply_18 Bool)
(declare-const violate_article_97_1_1 Bool)
(declare-const violate_article_97_1_3 Bool)
(declare-const violate_order_article_45_2_post Bool)
(declare-const violate_order_article_56_5 Bool)
(declare-const violate_order_article_80_4 Bool)
(declare-const violate_order_article_82_3 Bool)
(declare-const violate_order_article_85_2 Bool)
(declare-const violate_order_article_8_2 Bool)
(declare-const violate_order_article_93 Bool)
(declare-const violation_clearing_mandate Bool)
(declare-const violation_fail_document_management Bool)
(declare-const violation_futures_broker Bool)
(declare-const violation_futures_service Bool)
(declare-const violation_late_or_obstruct_report Bool)
(declare-const violation_leverage_trader Bool)
(declare-const violation_minor_exempt Bool)
(declare-const violation_obstruct_investigation Bool)
(declare-const violation_occurred Bool)
(declare-const violation_order_issued Bool)
(declare-const work_permit_handled_properly Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [futures:violation_occurred] 違反期貨交易法第119條所列規定之一
(assert (= violation_occurred
   (or violate_article_84_2_pre
       violate_article_67
       violate_article_18
       violate_article_56_4
       violate_article_87_1
       violate_article_82_2
       violate_article_64
       violate_article_5
       violate_article_80_3
       violate_article_45_2_pre
       violate_article_66_1
       violate_article_105
       violate_article_78_1
       violate_article_97_1_3
       violate_article_97_1_1
       violate_article_73
       violate_article_74
       violate_article_85_1
       violate_article_104_2
       violate_article_72_1
       violate_article_57_1
       violate_article_70_1
       violate_article_65_1
       violate_article_10_1)))

; [futures:violation_order_issued] 違反依第8條第2項、第45條第2項後段、第56條第5項、第80條第4項、第82條第3項、第85條第2項或第93條所發布命令
(assert (= violation_order_issued
   (or violate_order_article_8_2
       violate_order_article_82_3
       violate_order_article_45_2_post
       violate_order_article_85_2
       violate_order_article_80_4
       violate_order_article_56_5
       violate_order_article_93)))

; [futures:violation_clearing_mandate] 違反第三條第二項但書未依主管機關規定於指定期貨結算機構集中結算或期貨結算機構違反第五十五條準用第十八條
(assert (= violation_clearing_mandate
   (or clearinghouse_violate_article_55_apply_18
       not_cleared_at_designated_clearinghouse)))

; [futures:violation_futures_broker] 期貨商違反第七十九條準用第十八條規定
(assert (= violation_futures_broker violate_article_79_apply_18))

; [futures:violation_leverage_trader] 槓桿交易商違反第八十一條準用第十八條、第五十七條第一項、第六十四條、第六十五條第一項、第六十六條第一項、第六十七條、第七十條第一項、第七十二條第一項、第七十三條、第七十四條或第七十八條第一項規定
(assert (= violation_leverage_trader
   (or violate_article_67
       violate_article_64
       violate_article_66_1
       violate_article_78_1
       violate_article_73
       violate_article_74
       violate_article_72_1
       violate_article_57_1
       violate_article_70_1
       violate_article_65_1
       violate_article_81_apply_18)))

; [futures:violation_futures_service] 期貨服務事業違反第八十八條準用第十八條、第五十七條第一項、第六十四條、第六十五條第一項、第六十六條第一項或第七十四條規定
(assert (= violation_futures_service
   (or violate_article_64
       violate_article_66_1
       violate_article_88_apply_18
       violate_article_74
       violate_article_57_1
       violate_article_65_1)))

; [futures:violation_late_or_obstruct_report] 逾期不提出主管機關命令之帳簿、書類或其他有關物件或報告資料，或規避、妨礙、拒絕主管機關檢查
(assert (= violation_late_or_obstruct_report
   (or late_submit_documents obstruct_inspection refuse_inspection)))

; [futures:violation_fail_document_management] 期貨交易所、期貨結算機構、期貨業、同業公會未依法製作、申報、公告、備置或保存帳簿、文據、財務報告或其他業務文件
(assert (= violation_fail_document_management
   (or fail_report_documents
       fail_preserve_documents
       fail_store_documents
       fail_announce_documents
       fail_create_documents)))

; [futures:violation_obstruct_investigation] 規避、妨礙或拒絕主管機關調查，拒不提供資料文件或無正當理由拒不到達備詢處所
(assert (= violation_obstruct_investigation
   (or refuse_arrival_without_reason
       obstruct_investigation
       refuse_provide_documents)))

; [futures:penalty_applicable] 違反期貨交易法第119條規定且情節非輕微者應處罰
(assert (= penalty_applicable
   (and (or violation_clearing_mandate
            violation_obstruct_investigation
            violation_futures_broker
            violation_fail_document_management
            violation_futures_service
            violation_order_issued
            violation_leverage_trader
            violation_occurred
            violation_late_or_obstruct_report)
        (not violation_minor_exempt))))

; [futures:internal_control_system_established] 期貨交易輔助人依規定訂定內部控制制度
(assert (= internal_control_system_established
   (and internal_control_system_set_by_rules
        internal_control_system_approved_by_board
        internal_control_system_reported_and_recorded
        internal_control_system_updated_if_notified)))

; [futures:operation_managed_by_dedicated_department] 證券商經營期貨交易輔助業務由專責部門辦理並指派專人管理，且由登記合格業務員執行
(assert (= operation_managed_by_dedicated_department
   (and dedicated_department_assigned
        dedicated_person_assigned
        registered_qualified_salesperson_execute)))

; [futures:salesperson_registration_compliant] 期貨交易輔助人負責人、經理人及業務員登記異動符合規定
(assert (= salesperson_registration_compliant
   (and registration_done_by_futures_assistant
        no_prohibited_conditions_for_registration
        qualified_training_completed
        no_untrustworthy_activities
        registration_reported_within_5_days
        work_permit_handled_properly)))

; [futures:legal_futures_transaction_definition_met] 期貨交易符合期貨交易法第三條定義及集中結算規定
(assert (= legal_futures_transaction_definition_met
   (and (or swap_contract
            other_contract_types
            futures_option_contract
            leverage_margin_contract
            futures_contract
            option_contract)
        (or transaction_at_futures_exchange
            (and not_at_futures_exchange
                 approved_by_authority
                 cleared_at_designated_clearinghouse)))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反期貨交易法第119條規定且非輕微情節時處罰
(assert (= penalty
   (and (or violation_clearing_mandate
            violation_obstruct_investigation
            violation_futures_broker
            violation_fail_document_management
            violation_futures_service
            violation_order_issued
            violation_leverage_trader
            violation_occurred
            violation_late_or_obstruct_report)
        (not violation_minor_exempt))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_order_article_82_3 true))
(assert (= registered_qualified_salesperson_execute false))
(assert (= registration_reported_within_5_days false))
(assert (= violation_order_issued true))
(assert (= violation_occurred false))
(assert (= violation_minor_exempt false))
(assert (= penalty_applicable true))
(assert (= penalty true))
(assert (= dedicated_department_assigned true))
(assert (= dedicated_person_assigned true))
(assert (= registration_done_by_futures_assistant false))
(assert (= no_prohibited_conditions_for_registration true))
(assert (= qualified_training_completed true))
(assert (= no_untrustworthy_activities true))
(assert (= work_permit_handled_properly false))
(assert (= internal_control_system_set_by_rules false))
(assert (= internal_control_system_approved_by_board false))
(assert (= internal_control_system_reported_and_recorded false))
(assert (= internal_control_system_updated_if_notified false))
(assert (= internal_control_system_established false))
(assert (= late_submit_documents false))
(assert (= obstruct_inspection false))
(assert (= refuse_inspection false))
(assert (= obstruct_investigation false))
(assert (= refuse_provide_documents false))
(assert (= refuse_arrival_without_reason false))
(assert (= fail_create_documents false))
(assert (= fail_report_documents false))
(assert (= fail_announce_documents false))
(assert (= fail_store_documents false))
(assert (= fail_preserve_documents false))
(assert (= approved_by_authority false))
(assert (= cleared_at_designated_clearinghouse false))
(assert (= clearinghouse_violate_article_55_apply_18 false))
(assert (= futures_contract false))
(assert (= option_contract false))
(assert (= futures_option_contract false))
(assert (= leverage_margin_contract false))
(assert (= swap_contract false))
(assert (= other_contract_types false))
(assert (= transaction_at_futures_exchange false))
(assert (= not_at_futures_exchange false))
(assert (= not_cleared_at_designated_clearinghouse false))
(assert (= violate_article_5 false))
(assert (= violate_article_10_1 false))
(assert (= violate_article_18 false))
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
(assert (= violate_article_79_apply_18 false))
(assert (= violate_article_81_apply_18 false))
(assert (= violate_article_88_apply_18 false))
(assert (= violate_order_article_45_2_post false))
(assert (= violate_order_article_56_5 false))
(assert (= violate_order_article_80_4 false))
(assert (= violate_order_article_85_2 false))
(assert (= violate_order_article_8_2 false))
(assert (= violate_order_article_93 false))
(assert (= legal_futures_transaction_definition_met false))
(assert (= operation_managed_by_dedicated_department false))
(assert (= salesperson_registration_compliant false))
(assert (= violation_clearing_mandate false))
(assert (= violation_fail_document_management false))
(assert (= violation_futures_broker false))
(assert (= violation_futures_service false))
(assert (= violation_late_or_obstruct_report false))
(assert (= violation_leverage_trader false))
(assert (= violation_obstruct_investigation false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 16
; Total variables: 86
; Total facts: 86
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

; SMT2 file generated from compliance case automatic
; Case ID: case_111
; Generated at: 2025-10-19T08:18:45.226739
;
; This file can be executed with Z3:
;   z3 case_111.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_operated_according_to_articles Bool)
(declare-const business_operated_according_to_internal_control Bool)
(declare-const business_operated_according_to_law Bool)
(declare-const business_operated_according_to_law_and_internal_control Bool)
(declare-const fail_to_execute_internal_control Bool)
(declare-const fail_to_prepare_or_preserve_documents Bool)
(declare-const fail_to_submit_required_documents Bool)
(declare-const improvement_completed Bool)
(declare-const improvement_ordered Bool)
(declare-const internal_control_change_notice_received Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_updated_after_change_notice Bool)
(declare-const internal_control_updated_within_deadline Bool)
(declare-const obstruct_or_refuse_inspection Bool)
(declare-const penalty Bool)
(declare-const penalty_applicable Bool)
(declare-const penalty_fine_conditions Bool)
(declare-const penalty_fine_improvement_status Bool)
(declare-const violate_financial_business_management_rules Bool)
(declare-const violate_other_regulations Bool)
(declare-const violate_specified_articles Bool)
(declare-const violation_is_minor Bool)
(declare-const violation_occurred Bool)
(declare-const violation_of_law_or_orders Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:internal_control_established] 證券商依本會及相關機構訂定標準建立內部控制制度
(assert (= internal_control_established internal_control_system_established))

; [securities:business_operated_according_to_law_and_internal_control] 證券商業務依法令、章程及內部控制制度經營
(assert (= business_operated_according_to_law_and_internal_control
   (and business_operated_according_to_law
        business_operated_according_to_articles
        business_operated_according_to_internal_control)))

; [securities:internal_control_updated_after_change_notice] 內部控制制度經本會或相關機構通知變更後於限期內變更
(assert (= internal_control_updated_after_change_notice
   (or internal_control_updated_within_deadline
       (not internal_control_change_notice_received))))

; [securities:violation_of_law_or_orders] 證券商違反證券交易法或依該法發布之命令
(assert (= violation_of_law_or_orders violation_occurred))

; [securities:penalty_applicable] 證券商違反法令情節輕重及處分適用
(assert (= penalty_applicable violation_of_law_or_orders))

; [securities:penalty_fine_conditions] 證券商違反特定條文或未確實執行內部控制制度等情事
(assert (= penalty_fine_conditions
   (or obstruct_or_refuse_inspection
       violate_financial_business_management_rules
       violate_other_regulations
       fail_to_execute_internal_control
       violate_specified_articles
       fail_to_submit_required_documents
       fail_to_prepare_or_preserve_documents)))

; [securities:penalty_fine_improvement_status] 違反行為屬輕微且已限期改善完成者免罰
(assert (= penalty_fine_improvement_status
   (or (not violation_occurred)
       (and violation_occurred
            violation_is_minor
            improvement_ordered
            improvement_completed))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反法令且未屬輕微或未改善者處罰
(assert (= penalty
   (and violation_occurred
        (not (and violation_is_minor improvement_ordered improvement_completed)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established true))
(assert (= internal_control_established true))
(assert (= business_operated_according_to_law true))
(assert (= business_operated_according_to_articles true))
(assert (= business_operated_according_to_internal_control false))
(assert (= business_operated_according_to_law_and_internal_control false))
(assert (= violation_occurred true))
(assert (= violation_of_law_or_orders true))
(assert (= violate_specified_articles false))
(assert (= fail_to_submit_required_documents false))
(assert (= obstruct_or_refuse_inspection false))
(assert (= fail_to_prepare_or_preserve_documents false))
(assert (= fail_to_execute_internal_control true))
(assert (= violate_financial_business_management_rules false))
(assert (= violate_other_regulations false))
(assert (= penalty_applicable true))
(assert (= violation_is_minor false))
(assert (= improvement_ordered true))
(assert (= improvement_completed false))
(assert (= penalty_fine_conditions true))
(assert (= penalty_fine_improvement_status false))
(assert (= penalty true))
(assert (= internal_control_change_notice_received false))
(assert (= internal_control_updated_within_deadline false))
(assert (= internal_control_updated_after_change_notice true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 9
; Total variables: 25
; Total facts: 25
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

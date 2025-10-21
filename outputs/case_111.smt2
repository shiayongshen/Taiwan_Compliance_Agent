; SMT2 file generated from compliance case automatic
; Case ID: case_111
; Generated at: 2025-10-21T01:56:38.733710
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
(declare-const fail_to_produce_or_report_documents Bool)
(declare-const fail_to_submit_required_documents Bool)
(declare-const improvement_completed Bool)
(declare-const internal_control_change_notified Bool)
(declare-const internal_control_changed_within_deadline Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_established_by_commission Bool)
(declare-const internal_control_established_by_exchange Bool)
(declare-const internal_control_updated_after_notification Bool)
(declare-const obstruct_or_refuse_inspection Bool)
(declare-const penalty Bool)
(declare-const penalty_applicable Bool)
(declare-const penalty_fine_conditions Bool)
(declare-const penalty_fine_imposed Bool)
(declare-const violate_financial_or_management_rules Bool)
(declare-const violate_orders_issued_under_law Bool)
(declare-const violate_other_regulations Bool)
(declare-const violate_securities_law Bool)
(declare-const violate_specified_articles Bool)
(declare-const violation_of_law_or_orders Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:internal_control_established] 證券商依規定訂定內部控制制度
(assert (= internal_control_established
   (and internal_control_established_by_commission
        internal_control_established_by_exchange)))

; [securities:business_operated_according_to_law_and_internal_control] 證券商業務依法令、章程及內部控制制度經營
(assert (= business_operated_according_to_law_and_internal_control
   (and business_operated_according_to_law
        business_operated_according_to_articles
        business_operated_according_to_internal_control)))

; [securities:internal_control_updated_after_notification] 內部控制制度經本會或證券相關機構通知變更後限期內完成變更
(assert (= internal_control_updated_after_notification
   (or (not internal_control_change_notified)
       internal_control_changed_within_deadline)))

; [securities:violation_of_law_or_orders] 證券商違反證券交易法或依該法發布之命令
(assert (= violation_of_law_or_orders
   (or violate_securities_law violate_orders_issued_under_law)))

; [securities:penalty_applicable] 主管機關得依情節輕重處分並命限期改善
(assert (= penalty_applicable violation_of_law_or_orders))

; [securities:penalty_fine_conditions] 證券商違反特定條文或未提出資料、妨礙檢查、未執行內部控制等情事
(assert (= penalty_fine_conditions
   (or violate_other_regulations
       fail_to_produce_or_report_documents
       fail_to_submit_required_documents
       obstruct_or_refuse_inspection
       violate_specified_articles
       violate_financial_or_management_rules
       fail_to_execute_internal_control)))

; [securities:penalty_fine_imposed] 違反罰鍰條件且未改善者處罰
(assert (= penalty_fine_imposed
   (and penalty_fine_conditions (not improvement_completed))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反證券交易法相關規定且未改善時處罰
(assert (= penalty
   (or (and violation_of_law_or_orders (not improvement_completed))
       (and penalty_fine_conditions (not improvement_completed)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_established_by_commission false))
(assert (= internal_control_established_by_exchange false))
(assert (= internal_control_established false))
(assert (= business_operated_according_to_law true))
(assert (= business_operated_according_to_articles true))
(assert (= business_operated_according_to_internal_control false))
(assert (= business_operated_according_to_law_and_internal_control false))
(assert (= fail_to_execute_internal_control true))
(assert (= fail_to_produce_or_report_documents false))
(assert (= fail_to_submit_required_documents false))
(assert (= improvement_completed false))
(assert (= internal_control_change_notified false))
(assert (= internal_control_changed_within_deadline false))
(assert (= internal_control_updated_after_notification true))
(assert (= obstruct_or_refuse_inspection false))
(assert (= violate_securities_law true))
(assert (= violate_orders_issued_under_law true))
(assert (= violation_of_law_or_orders true))
(assert (= violate_specified_articles false))
(assert (= violate_financial_or_management_rules true))
(assert (= violate_other_regulations false))
(assert (= penalty_applicable true))
(assert (= penalty_fine_conditions true))
(assert (= penalty_fine_imposed true))
(assert (= penalty true))

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

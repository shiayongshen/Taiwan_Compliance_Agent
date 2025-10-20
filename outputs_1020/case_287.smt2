; SMT2 file generated from compliance case automatic
; Case ID: case_287
; Generated at: 2025-10-19T12:10:26.731027
;
; This file can be executed with Z3:
;   z3 case_287.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_operated_according_to_articles Bool)
(declare-const business_operated_according_to_internal_control Bool)
(declare-const business_operated_according_to_law Bool)
(declare-const business_operated_according_to_law_and_internal_control Bool)
(declare-const compliance Bool)
(declare-const internal_control_change_notified Bool)
(declare-const internal_control_changed_within_deadline Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_system_complies_with_regulations Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_updated_on_time Bool)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:internal_control_established] 證券商依規定訂定內部控制制度
(assert (= internal_control_established
   (and internal_control_system_established
        internal_control_system_complies_with_regulations)))

; [securities:business_operated_according_to_law_and_internal_control] 證券商業務依法令、章程及內部控制制度經營
(assert (= business_operated_according_to_law_and_internal_control
   (and business_operated_according_to_law
        business_operated_according_to_articles
        business_operated_according_to_internal_control)))

; [securities:internal_control_updated_on_time] 內部控制制度於限期內完成變更
(assert (= internal_control_updated_on_time
   (or (not internal_control_change_notified)
       (and internal_control_change_notified
            internal_control_changed_within_deadline))))

; [securities:compliance] 證券商遵守證券交易法及內部控制相關規定
(assert (= compliance
   (and internal_control_established
        business_operated_according_to_law_and_internal_control
        internal_control_updated_on_time)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反證券交易法或內部控制相關規定時處罰
(assert (not (= compliance penalty)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_complies_with_regulations false))
(assert (= internal_control_change_notified false))
(assert (= internal_control_changed_within_deadline false))
(assert (= business_operated_according_to_law false))
(assert (= business_operated_according_to_articles true))
(assert (= business_operated_according_to_internal_control false))
(assert (= business_operated_according_to_law_and_internal_control false))
(assert (= compliance false))
(assert (= internal_control_established false))
(assert (= internal_control_updated_on_time false))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 6
; Total variables: 12
; Total facts: 12
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

; SMT2 file generated from compliance case automatic
; Case ID: case_287
; Generated at: 2025-10-21T06:25:22.728700
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
(declare-const internal_control_change_notice_received Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_established_by_exchange_and_related_institutions Bool)
(declare-const internal_control_established_by_financial_supervisor Bool)
(declare-const internal_control_updated_after_change_notice Bool)
(declare-const internal_control_updated_within_deadline Bool)
(declare-const penalty Bool)
(declare-const penalty_dismiss_officer Bool)
(declare-const penalty_other_measures Bool)
(declare-const penalty_revoke_license Bool)
(declare-const penalty_suspension Bool)
(declare-const penalty_warning Bool)
(declare-const violation_of_law_or_orders Bool)
(declare-const violation_of_orders_issued_under_law Bool)
(declare-const violation_of_securities_law Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:internal_control_established] 證券商依規定訂定內部控制制度
(assert (= internal_control_established
   (and internal_control_established_by_financial_supervisor
        internal_control_established_by_exchange_and_related_institutions)))

; [securities:business_operated_according_to_law_and_internal_control] 證券商業務依法令、章程及內部控制制度經營
(assert (= business_operated_according_to_law_and_internal_control
   (and business_operated_according_to_law
        business_operated_according_to_articles
        business_operated_according_to_internal_control)))

; [securities:internal_control_updated_after_change_notice] 內部控制制度變更後於限期內完成變更
(assert (= internal_control_updated_after_change_notice
   (or internal_control_updated_within_deadline
       (not internal_control_change_notice_received))))

; [securities:violation_of_law_or_orders] 證券商違反證券交易法或依本法發布之命令
(assert (= violation_of_law_or_orders
   (or violation_of_orders_issued_under_law violation_of_securities_law)))

; [securities:penalty_warning] 主管機關可對違反者處以警告
(assert (= penalty_warning violation_of_law_or_orders))

; [securities:penalty_dismiss_officer] 主管機關可命違反者解除董事、監察人或經理人職務
(assert (= penalty_dismiss_officer violation_of_law_or_orders))

; [securities:penalty_suspension] 主管機關可對違反者公司或分支機構停業六個月以內
(assert (= penalty_suspension violation_of_law_or_orders))

; [securities:penalty_revoke_license] 主管機關可撤銷或廢止違反者公司或分支機構營業許可
(assert (= penalty_revoke_license violation_of_law_or_orders))

; [securities:penalty_other_measures] 主管機關可對違反者採取其他必要處置
(assert (= penalty_other_measures violation_of_law_or_orders))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：證券商違反證券交易法或依本法發布之命令時處罰
(assert (= penalty violation_of_law_or_orders))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= business_operated_according_to_articles true))
(assert (= business_operated_according_to_internal_control false))
(assert (= business_operated_according_to_law false))
(assert (= internal_control_change_notice_received false))
(assert (= internal_control_established_by_exchange_and_related_institutions true))
(assert (= internal_control_established_by_financial_supervisor true))
(assert (= internal_control_established true))
(assert (= internal_control_updated_within_deadline false))
(assert (= internal_control_updated_after_change_notice true))
(assert (= violation_of_securities_law true))
(assert (= violation_of_orders_issued_under_law false))
(assert (= violation_of_law_or_orders true))
(assert (= penalty true))
(assert (= penalty_warning true))
(assert (= penalty_dismiss_officer true))
(assert (= penalty_suspension true))
(assert (= penalty_revoke_license true))
(assert (= penalty_other_measures true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 11
; Total variables: 19
; Total facts: 18
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

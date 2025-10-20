; SMT2 file generated from compliance case automatic
; Case ID: case_254
; Generated at: 2025-10-19T11:25:46.493506
;
; This file can be executed with Z3:
;   z3 case_254.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const asset_disposal_ordered Bool)
(declare-const audit_procedures_established Bool)
(declare-const beneficiary_transfer_limit_disclosed Bool)
(declare-const branch_closure_ordered Bool)
(declare-const client_notified Bool)
(declare-const compliance_with_regulations Bool)
(declare-const contract_disclosure_compliant Bool)
(declare-const control_procedures Bool)
(declare-const dedicated_personnel_assigned Bool)
(declare-const director_supervisor_removed Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_implemented Bool)
(declare-const investment_restricted Bool)
(declare-const law_and_orders_complied Bool)
(declare-const law_and_regulations_complied Bool)
(declare-const manager_duty_suspended Bool)
(declare-const operation_scope_disclosed Bool)
(declare-const other_measures_taken Bool)
(declare-const other_required_matters_established Bool)
(declare-const partial_business_suspended Bool)
(declare-const penalty Bool)
(declare-const regulatory_compliance Bool)
(declare-const reserve_fund_mandated Bool)
(declare-const resolution_revoked Bool)
(declare-const risk_assessment_report_updated Bool)
(declare-const risk_disclosure_done Bool)
(declare-const supervisory_measures Bool)
(declare-const training_held Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [aml:internal_control_established] 建立洗錢防制內部控制與稽核制度
(assert (= internal_control_established
   (and control_procedures
        training_held
        dedicated_personnel_assigned
        risk_assessment_report_updated
        audit_procedures_established
        other_required_matters_established)))

; [aml:internal_control_executed] 洗錢防制內部控制制度確實執行
(assert (= internal_control_executed internal_control_implemented))

; [trust:contract_disclosure_compliant] 信託契約載明營運範圍、受益權轉讓限制及風險揭露並告知委託人
(assert (= contract_disclosure_compliant
   (and operation_scope_disclosed
        beneficiary_transfer_limit_disclosed
        risk_disclosure_done
        client_notified)))

; [trust:compliance_with_regulations] 遵守信託業法及主管機關命令
(assert (= compliance_with_regulations law_and_orders_complied))

; [bank:regulatory_compliance] 銀行遵守法令、章程及健全經營規定
(assert (= regulatory_compliance law_and_regulations_complied))

; [bank:supervisory_measures] 主管機關對銀行違規採取處分措施
(assert (= supervisory_measures
   (or partial_business_suspended
       manager_duty_suspended
       reserve_fund_mandated
       investment_restricted
       director_supervisor_removed
       resolution_revoked
       branch_closure_ordered
       asset_disposal_ordered
       other_measures_taken)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反洗錢防制法第7條建立或執行制度規定，或信託業法違規，或銀行法違規時處罰
(assert (= penalty
   (or (not regulatory_compliance)
       (not internal_control_established)
       (not compliance_with_regulations)
       (not internal_control_executed))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= control_procedures false))
(assert (= training_held false))
(assert (= dedicated_personnel_assigned false))
(assert (= risk_assessment_report_updated false))
(assert (= audit_procedures_established false))
(assert (= other_required_matters_established false))
(assert (= internal_control_implemented false))
(assert (= law_and_orders_complied false))
(assert (= law_and_regulations_complied false))
(assert (= asset_disposal_ordered false))
(assert (= branch_closure_ordered false))
(assert (= client_notified false))
(assert (= beneficiary_transfer_limit_disclosed false))
(assert (= operation_scope_disclosed false))
(assert (= risk_disclosure_done false))
(assert (= director_supervisor_removed false))
(assert (= investment_restricted false))
(assert (= manager_duty_suspended false))
(assert (= other_measures_taken false))
(assert (= partial_business_suspended false))
(assert (= reserve_fund_mandated false))
(assert (= resolution_revoked false))
(assert (= penalty true))
(assert (= compliance_with_regulations false))
(assert (= contract_disclosure_compliant false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= regulatory_compliance false))
(assert (= supervisory_measures false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 8
; Total variables: 29
; Total facts: 29
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

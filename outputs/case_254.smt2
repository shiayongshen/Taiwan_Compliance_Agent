; SMT2 file generated from compliance case automatic
; Case ID: case_254
; Generated at: 2025-10-21T05:35:47.795896
;
; This file can be executed with Z3:
;   z3 case_254.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const audit_procedures_established Bool)
(declare-const beneficiary_transfer_restriction_specified Bool)
(declare-const client_informed Bool)
(declare-const compliance_ok Bool)
(declare-const contract_requirements_met Bool)
(declare-const control_procedures Bool)
(declare-const dedicated_personnel_assigned Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_implemented Bool)
(declare-const law_or_order_violated Bool)
(declare-const law_or_regulation_violated Bool)
(declare-const operation_scope_specified Bool)
(declare-const order_asset_disposal_or_transfer Bool)
(declare-const order_branch_closure Bool)
(declare-const order_director_supervisor_dismissal_or_suspension Bool)
(declare-const order_manager_dismissal_or_suspension Bool)
(declare-const order_reserve_provision Bool)
(declare-const other_necessary_measures Bool)
(declare-const other_required_matters_established Bool)
(declare-const penalty Bool)
(declare-const penalty_measures Bool)
(declare-const restrict_investment Bool)
(declare-const revoke_meeting_resolution Bool)
(declare-const risk_assessment_report_updated Bool)
(declare-const risk_disclosure_specified Bool)
(declare-const suspend_partial_business Bool)
(declare-const training_held Bool)
(declare-const violation Bool)

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

; [aml:compliance_ok] 洗錢防制制度建立且確實執行
(assert (= compliance_ok (and internal_control_established internal_control_executed)))

; [trust:contract_requirements_met] 信託契約載明營運範圍、受益權轉讓限制及風險揭露並告知委託人
(assert (= contract_requirements_met
   (and operation_scope_specified
        beneficiary_transfer_restriction_specified
        risk_disclosure_specified
        client_informed)))

; [trust:compliance_ok] 信託業契約要求符合
(assert (= compliance_ok contract_requirements_met))

; [trust:violation] 違反信託業法或授權命令中強制或禁止規定
(assert (= violation law_or_order_violated))

; [bank:violation] 銀行違反法令、章程或有礙健全經營之虞
(assert (= violation law_or_regulation_violated))

; [bank:penalty_measures] 主管機關可對銀行採取處分措施
(assert (= penalty_measures
   (or order_reserve_provision
       revoke_meeting_resolution
       other_necessary_measures
       order_manager_dismissal_or_suspension
       restrict_investment
       order_director_supervisor_dismissal_or_suspension
       suspend_partial_business
       order_branch_closure
       order_asset_disposal_or_transfer)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反洗錢防制法第7條規定或信託業法第57條規定或銀行法第61-1條規定時處罰
(assert (= penalty (or violation (not compliance_ok))))

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
(assert (= operation_scope_specified false))
(assert (= beneficiary_transfer_restriction_specified false))
(assert (= risk_disclosure_specified false))
(assert (= client_informed false))
(assert (= law_or_order_violated true))
(assert (= law_or_regulation_violated true))
(assert (= revoke_meeting_resolution false))
(assert (= suspend_partial_business false))
(assert (= restrict_investment false))
(assert (= order_asset_disposal_or_transfer false))
(assert (= order_branch_closure false))
(assert (= order_manager_dismissal_or_suspension false))
(assert (= order_director_supervisor_dismissal_or_suspension false))
(assert (= order_reserve_provision false))
(assert (= other_necessary_measures false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= compliance_ok false))
(assert (= contract_requirements_met false))
(assert (= violation true))
(assert (= penalty true))
(assert (= penalty_measures false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 10
; Total variables: 29
; Total facts: 29
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

; SMT2 file generated from compliance case automatic
; Case ID: case_140
; Generated at: 2025-10-19T09:03:54.802050
;
; This file can be executed with Z3:
;   z3 case_140.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accountant_audit_commissioned Bool)
(declare-const advertisement_approved Bool)
(declare-const advertisement_content_approved Bool)
(declare-const audit_personnel_set Bool)
(declare-const audit_system_established Bool)
(declare-const audit_system_executed Bool)
(declare-const bond_deposited Bool)
(declare-const compliance_163_4 Bool)
(declare-const compliance_163_5_applied Bool)
(declare-const compliance_163_7 Bool)
(declare-const compliance_165_1 Bool)
(declare-const insurance_purchased Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_measures_ok Bool)
(declare-const legal_compliance_officer_set Bool)
(declare-const license_and_insurance_compliance Bool)
(declare-const license_obtained Bool)
(declare-const management_rule_compliance Bool)
(declare-const penalty Bool)
(declare-const self_assessment_implemented Bool)
(declare-const solicitation_handling_established Bool)
(declare-const solicitation_handling_executed Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:management_rule_compliance] 遵守第一百六十三條第四項及第七項、第一百六十五條第一項及第五項準用規定
(assert (= management_rule_compliance
   (and compliance_163_4
        compliance_163_7
        compliance_165_1
        compliance_163_5_applied)))

; [insurance:internal_control_compliance] 建立且確實執行內部控制、稽核制度及招攬處理制度
(assert (= internal_control_compliance
   (and internal_control_established
        internal_control_executed
        audit_system_established
        audit_system_executed
        solicitation_handling_established
        solicitation_handling_executed)))

; [insurance:internal_control_measures] 內部控制、稽核及招攬處理制度應包含稽核人員設置、自行評估、會計師查核及法令遵循
(assert (= internal_control_measures_ok
   (and audit_personnel_set
        self_assessment_implemented
        accountant_audit_commissioned
        legal_compliance_officer_set)))

; [insurance:advertisement_approval] 經紀人公司或銀行所任用經紀人及業務員使用之宣傳及廣告內容經核可
(assert (= advertisement_approved advertisement_content_approved))

; [insurance:license_and_insurance_compliance] 保險代理人、經紀人、公證人應經主管機關許可、繳存保證金並投保相關保險
(assert (= license_and_insurance_compliance
   (and license_obtained bond_deposited insurance_purchased)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：違反管理規則或未建立或未確實執行內部控制、稽核制度、招攬處理制度或程序時處罰
(assert (= penalty
   (or (not management_rule_compliance) (not internal_control_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= audit_system_established false))
(assert (= audit_system_executed false))
(assert (= self_assessment_implemented false))
(assert (= solicitation_handling_established false))
(assert (= solicitation_handling_executed false))
(assert (= advertisement_content_approved false))
(assert (= advertisement_approved false))
(assert (= audit_personnel_set false))
(assert (= accountant_audit_commissioned false))
(assert (= legal_compliance_officer_set false))
(assert (= compliance_163_4 false))
(assert (= compliance_163_7 false))
(assert (= compliance_165_1 false))
(assert (= compliance_163_5_applied false))
(assert (= management_rule_compliance false))
(assert (= license_obtained true))
(assert (= bond_deposited true))
(assert (= insurance_purchased true))
(assert (= license_and_insurance_compliance true))
(assert (= penalty true))
(assert (= internal_control_compliance false))
(assert (= internal_control_measures_ok false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 7
; Total variables: 24
; Total facts: 24
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

; SMT2 file generated from compliance case automatic
; Case ID: case_140
; Generated at: 2025-10-21T02:53:10.029031
;
; This file can be executed with Z3:
;   z3 case_140.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const advertisement_approved Bool)
(declare-const advertisement_content_approved_by_company_or_bank Bool)
(declare-const audit_system_established Bool)
(declare-const audit_system_executed Bool)
(declare-const compliance_163_4_financial_business Bool)
(declare-const compliance_163_5_applied_165_1 Bool)
(declare-const compliance_163_7 Bool)
(declare-const compliance_165_1 Bool)
(declare-const guarantee_deposit_paid Bool)
(declare-const internal_control_audit_solicitation_compliance Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const license_and_insurance_compliance Bool)
(declare-const license_obtained Bool)
(declare-const management_rule_compliance Bool)
(declare-const penalty Bool)
(declare-const related_insurance_purchased Bool)
(declare-const solicitation_handling_established Bool)
(declare-const solicitation_handling_executed Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:management_rule_compliance] 遵守第一百六十三條第四項及第七項、第一百六十五條第一項及第五項準用規定之財務或業務管理規則
(assert (= management_rule_compliance
   (and compliance_163_4_financial_business
        compliance_163_7
        compliance_165_1
        compliance_163_5_applied_165_1)))

; [insurance:internal_control_compliance] 建立且確實執行內部控制、稽核制度及招攬處理制度或程序
(assert (= internal_control_compliance
   (and internal_control_established
        internal_control_executed
        audit_system_established
        audit_system_executed
        solicitation_handling_established
        solicitation_handling_executed)))

; [insurance:advertisement_approval] 經紀人公司或銀行所任用經紀人及業務員使用之宣傳及廣告內容經所屬公司或銀行核可
(assert (= advertisement_approved advertisement_content_approved_by_company_or_bank))

; [insurance:license_and_insurance_compliance] 保險代理人、經紀人、公證人依法取得許可、繳存保證金並投保相關保險
(assert (= license_and_insurance_compliance
   (and license_obtained guarantee_deposit_paid related_insurance_purchased)))

; [insurance:internal_control_audit_solicitation_compliance] 依第一百六十五條第三項及第一百六十三條第五項準用規定建立且確實執行內部控制、稽核制度及招攬處理制度或程序
(assert (= internal_control_audit_solicitation_compliance
   (and internal_control_established
        internal_control_executed
        audit_system_established
        audit_system_executed
        solicitation_handling_established
        solicitation_handling_executed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反管理規則或未建立或未確實執行內部控制、稽核制度及招攬處理制度或程序時處罰
(assert (= penalty
   (or (not internal_control_audit_solicitation_compliance)
       (not management_rule_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= audit_system_established false))
(assert (= audit_system_executed false))
(assert (= solicitation_handling_established false))
(assert (= solicitation_handling_executed false))
(assert (= advertisement_content_approved_by_company_or_bank false))
(assert (= advertisement_approved false))
(assert (= compliance_163_4_financial_business true))
(assert (= compliance_163_7 true))
(assert (= compliance_165_1 true))
(assert (= compliance_163_5_applied_165_1 true))
(assert (= license_obtained true))
(assert (= guarantee_deposit_paid true))
(assert (= related_insurance_purchased true))
(assert (= management_rule_compliance true))
(assert (= internal_control_compliance false))
(assert (= internal_control_audit_solicitation_compliance false))
(assert (= license_and_insurance_compliance true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 7
; Total variables: 20
; Total facts: 20
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

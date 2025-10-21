; SMT2 file generated from compliance case automatic
; Case ID: case_205
; Generated at: 2025-10-21T21:38:14.520017
;
; This file can be executed with Z3:
;   z3 case_205.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const customer_from_high_risk_country Bool)
(declare-const customer_from_ineffective_aml_high_risk_area Bool)
(declare-const enhanced_cdd_measures_required Bool)
(declare-const enhanced_cdd_measures_taken Bool)
(declare-const enhanced_cdd_measures_taken_before_payout Bool)
(declare-const enhanced_ongoing_monitoring Bool)
(declare-const fatf_non_compliance_announced Bool)
(declare-const fatf_serious_deficiency_announced Bool)
(declare-const high_risk_cdd_measures Bool)
(declare-const high_risk_country Bool)
(declare-const high_risk_situation Bool)
(declare-const insurance_beneficiary_enhanced_cdd Bool)
(declare-const insurance_beneficiary_high_risk Bool)
(declare-const insurance_beneficiary_high_risk_considered Bool)
(declare-const insurance_beneficiary_is_corporate_or_trustee Bool)
(declare-const management_approval_obtained Bool)
(declare-const other_concrete_evidence_high_risk Bool)
(declare-const penalty Bool)
(declare-const reasonable_measures_to_understand_wealth_and_funds_source Bool)
(declare-const simplified_cdd_not_allowed Bool)
(declare-const suspected_money_laundering_or_terrorist_financing Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [aml:high_risk_country_definition] 洗錢或資恐高風險國家或地區定義
(assert (= high_risk_country
   (or fatf_serious_deficiency_announced
       fatf_non_compliance_announced
       other_concrete_evidence_high_risk)))

; [aml:enhanced_cdd_measures_required] 對洗錢或資恐高風險國家或地區客戶應採取強化確認客戶身分措施
(assert (= enhanced_cdd_measures_required customer_from_high_risk_country))

; [aml:enhanced_cdd_measures_for_high_risk] 高風險情形應加強確認客戶身分及持續審查措施
(assert (= high_risk_cdd_measures
   (and high_risk_situation
        management_approval_obtained
        reasonable_measures_to_understand_wealth_and_funds_source
        enhanced_ongoing_monitoring)))

; [aml:simplified_cdd_not_allowed_conditions] 不得採取簡化確認客戶身分措施之情形
(assert (= simplified_cdd_not_allowed
   (or customer_from_ineffective_aml_high_risk_area
       suspected_money_laundering_or_terrorist_financing)))

; [aml:insurance_beneficiary_high_risk_consideration] 保險業應將人壽保險契約受益人納入強化確認客戶身分措施考量
(assert (= insurance_beneficiary_high_risk_considered insurance_beneficiary_high_risk))

; [aml:insurance_beneficiary_enhanced_cdd] 人壽保險契約受益人為法人或信託受託人且評估為較高風險者，應採取強化確認客戶身分措施
(assert (= insurance_beneficiary_enhanced_cdd
   (and insurance_beneficiary_is_corporate_or_trustee
        insurance_beneficiary_high_risk
        enhanced_cdd_measures_taken_before_payout)))

; [aml:penalty_default_false] 預設不處罰
(assert (not penalty))

; [aml:penalty_conditions] 處罰條件：未對高風險國家或地區採取強化措施或違反簡化措施禁止規定時處罰
(assert (= penalty
   (or (and insurance_beneficiary_high_risk
            (not enhanced_cdd_measures_taken_before_payout))
       (and customer_from_high_risk_country (not enhanced_cdd_measures_taken))
       simplified_cdd_not_allowed)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= customer_from_high_risk_country false))
(assert (= customer_from_ineffective_aml_high_risk_area false))
(assert (= enhanced_cdd_measures_required false))
(assert (= enhanced_cdd_measures_taken false))
(assert (= enhanced_cdd_measures_taken_before_payout false))
(assert (= enhanced_ongoing_monitoring false))
(assert (= fatf_non_compliance_announced false))
(assert (= fatf_serious_deficiency_announced false))
(assert (= high_risk_cdd_measures false))
(assert (= high_risk_country false))
(assert (= high_risk_situation false))
(assert (= insurance_beneficiary_enhanced_cdd false))
(assert (= insurance_beneficiary_high_risk false))
(assert (= insurance_beneficiary_high_risk_considered false))
(assert (= insurance_beneficiary_is_corporate_or_trustee false))
(assert (= management_approval_obtained false))
(assert (= other_concrete_evidence_high_risk false))
(assert (= penalty true))
(assert (= reasonable_measures_to_understand_wealth_and_funds_source false))
(assert (= simplified_cdd_not_allowed true))
(assert (= suspected_money_laundering_or_terrorist_financing true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 8
; Total variables: 21
; Total facts: 21
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

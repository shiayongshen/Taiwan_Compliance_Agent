; SMT2 file generated from compliance case automatic
; Case ID: case_415
; Generated at: 2025-10-19T15:17:53.594368
;
; This file can be executed with Z3:
;   z3 case_415.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const bank_responsible_person_director_or_supervisor_or_manager_company_security Bool)
(declare-const investment_in_responsible_person_company_security Bool)
(declare-const investment_relationship_approved_by_authority Bool)
(declare-const investment_restriction_compliance Bool)
(declare-const investment_restriction_exemption Bool)
(declare-const is_asset_backed_security Bool)
(declare-const is_bank_issued_transferable_time_deposit_certificate Bool)
(declare-const is_beneficiary_certificate_within_one_year Bool)
(declare-const is_financial_bond Bool)
(declare-const is_other_bank_guaranteed_corporate_bond Bool)
(declare-const is_other_bank_guaranteed_or_accepted_short_term_note Bool)
(declare-const is_other_broker_underwritten_or_traded Bool)
(declare-const penalty Bool)
(declare-const violation_of_investment_restriction Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:investment_restriction_exemption] 投資於負責人擔任董事、監察人或經理人公司之有價證券之例外情形
(assert (= investment_restriction_exemption
   (or is_financial_bond
       (and is_other_bank_guaranteed_or_accepted_short_term_note
            is_other_broker_underwritten_or_traded)
       is_bank_issued_transferable_time_deposit_certificate
       (and investment_relationship_approved_by_authority
            bank_responsible_person_director_or_supervisor_or_manager_company_security)
       is_asset_backed_security
       is_beneficiary_certificate_within_one_year
       is_other_bank_guaranteed_corporate_bond)))

; [bank:investment_restriction_compliance] 投資符合負責人擔任董事、監察人或經理人公司有價證券限制規定
(assert (= investment_restriction_compliance
   (or investment_restriction_exemption
       (not investment_in_responsible_person_company_security))))

; [bank:violation_of_investment_restriction] 違反投資限制規定
(assert (not (= investment_restriction_compliance violation_of_investment_restriction)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反投資限制規定時處罰
(assert (= penalty violation_of_investment_restriction))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= bank_responsible_person_director_or_supervisor_or_manager_company_security true))
(assert (= investment_in_responsible_person_company_security true))
(assert (= investment_relationship_approved_by_authority false))
(assert (= is_financial_bond false))
(assert (= is_other_bank_guaranteed_corporate_bond false))
(assert (= is_other_bank_guaranteed_or_accepted_short_term_note false))
(assert (= is_other_broker_underwritten_or_traded false))
(assert (= is_bank_issued_transferable_time_deposit_certificate false))
(assert (= is_beneficiary_certificate_within_one_year false))
(assert (= is_asset_backed_security false))
(assert (= investment_restriction_compliance false))
(assert (= investment_restriction_exemption false))
(assert (= penalty false))
(assert (= violation_of_investment_restriction false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 5
; Total variables: 14
; Total facts: 14
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

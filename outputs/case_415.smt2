; SMT2 file generated from compliance case automatic
; Case ID: case_415
; Generated at: 2025-10-21T09:06:02.740391
;
; This file can be executed with Z3:
;   z3 case_415.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const asset_backed_security Bool)
(declare-const bond_conversion_right_certificate Bool)
(declare-const financial_bond Bool)
(declare-const investment_prohibited_securities Bool)
(declare-const investment_relationship_approved_by_authority Bool)
(declare-const new_equity_certificate Bool)
(declare-const other_bank_guaranteed_corporate_bond Bool)
(declare-const other_bank_guaranteed_or_accepted_short_term_note Bool)
(declare-const penalty Bool)
(declare-const security_maturity_years Int)
(declare-const security_type Int)
(declare-const security_underwritten_or_traded_by_other_broker Bool)
(declare-const stock Bool)
(declare-const subordinated_financial_bond Bool)
(declare-const transferable_time_deposit_certificate Bool)
(declare-const violate_article_115_1 Bool)
(declare-const violate_article_123_apply_74 Bool)
(declare-const violate_article_74 Bool)
(declare-const violate_article_89_2 Bool)
(declare-const violation_of_investment_restrictions Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:investment_prohibited_securities] 銀行不得投資於負責人擔任董事、監察人或經理人公司所發行之特定證券，除法定例外
(assert (let ((a!1 (and investment_relationship_approved_by_authority
                (or (= security_type (ite stock 1 0))
                    (= security_type
                       (ite bond_conversion_right_certificate 1 0))
                    (= security_type (ite new_equity_certificate 1 0))))))
(let ((a!2 (or (>= 1.0 (to_real security_maturity_years))
               (= security_type (ite financial_bond 1 0))
               (= security_type (ite asset_backed_security 1 0))
               a!1
               (= security_type (ite other_bank_guaranteed_corporate_bond 1 0))
               (= security_type (ite transferable_time_deposit_certificate 1 0))
               (= security_type (ite subordinated_financial_bond 1 0))
               (and (= security_type
                       (ite other_bank_guaranteed_or_accepted_short_term_note
                            1
                            0))
                    security_underwritten_or_traded_by_other_broker))))
  (not (= a!2 investment_prohibited_securities)))))

; [bank:violation_of_investment_restrictions] 違反銀行法第74條及相關規定投資有價證券
(assert (= violation_of_investment_restrictions
   (or violate_article_123_apply_74
       violate_article_115_1
       violate_article_74
       violate_article_89_2)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反銀行法第74條及相關規定投資有價證券時處罰
(assert (= penalty violation_of_investment_restrictions))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= stock true))
(assert (= financial_bond false))
(assert (= subordinated_financial_bond false))
(assert (= other_bank_guaranteed_corporate_bond false))
(assert (= other_bank_guaranteed_or_accepted_short_term_note false))
(assert (= security_underwritten_or_traded_by_other_broker false))
(assert (= transferable_time_deposit_certificate false))
(assert (= asset_backed_security false))
(assert (= investment_relationship_approved_by_authority false))
(assert (= new_equity_certificate false))
(assert (= bond_conversion_right_certificate false))
(assert (= security_maturity_years 0))
(assert (= violate_article_74 true))
(assert (= violate_article_89_2 false))
(assert (= violate_article_115_1 false))
(assert (= violate_article_123_apply_74 false))
(assert (= violation_of_investment_restrictions true))
(assert (= investment_prohibited_securities true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 4
; Total variables: 20
; Total facts: 19
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

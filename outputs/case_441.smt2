; SMT2 file generated from compliance case automatic
; Case ID: case_441
; Generated at: 2025-10-21T09:55:56.369450
;
; This file can be executed with Z3:
;   z3 case_441.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const credit_exclusion_government Real)
(declare-const credit_exclusion_policy_approved Real)
(declare-const credit_exclusion_secured_bonds Real)
(declare-const credit_exclusion_small_loans Real)
(declare-const credit_exposure_government Real)
(declare-const credit_exposure_legal_person_total Real)
(declare-const credit_exposure_legal_person_unsecured Real)
(declare-const credit_exposure_natural_person_total Real)
(declare-const credit_exposure_natural_person_unsecured Real)
(declare-const credit_exposure_policy_approved Real)
(declare-const credit_exposure_public_enterprise_total Real)
(declare-const credit_exposure_related_enterprise_total Real)
(declare-const credit_exposure_related_enterprise_unsecured Real)
(declare-const credit_exposure_related_person_natural_total Real)
(declare-const credit_exposure_related_person_natural_unsecured Real)
(declare-const credit_exposure_related_person_total Real)
(declare-const credit_exposure_related_person_unsecured_total Real)
(declare-const credit_exposure_secured_bonds Real)
(declare-const credit_exposure_small_loans Real)
(declare-const credit_limit_legal_person_total Real)
(declare-const credit_limit_legal_person_unsecured Real)
(declare-const credit_limit_natural_person_total Real)
(declare-const credit_limit_natural_person_unsecured Real)
(declare-const credit_limit_public_enterprise_total Real)
(declare-const credit_limit_related_enterprise_total Real)
(declare-const credit_limit_related_enterprise_unsecured Real)
(declare-const credit_limit_related_person_natural_total Real)
(declare-const credit_limit_related_person_natural_unsecured Real)
(declare-const credit_limit_related_person_total Real)
(declare-const credit_limit_related_person_unsecured_total Real)
(declare-const net_worth Real)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:credit_limit_natural_person_total] 銀行對同一自然人授信總餘額不得超過淨值百分之三
(assert (= credit_limit_natural_person_total
   (ite (<= credit_exposure_natural_person_total (* (/ 3.0 100.0) net_worth))
        1.0
        0.0)))

; [bank:credit_limit_natural_person_unsecured] 銀行對同一自然人無擔保授信總餘額不得超過淨值百分之一
(assert (= credit_limit_natural_person_unsecured
   (ite (<= credit_exposure_natural_person_unsecured
            (* (/ 1.0 100.0) net_worth))
        1.0
        0.0)))

; [bank:credit_limit_legal_person_total] 銀行對同一法人授信總餘額不得超過淨值百分之十五
(assert (= credit_limit_legal_person_total
   (ite (<= credit_exposure_legal_person_total (* (/ 3.0 20.0) net_worth))
        1.0
        0.0)))

; [bank:credit_limit_legal_person_unsecured] 銀行對同一法人無擔保授信總餘額不得超過淨值百分之五
(assert (= credit_limit_legal_person_unsecured
   (ite (<= credit_exposure_legal_person_unsecured (* (/ 1.0 20.0) net_worth))
        1.0
        0.0)))

; [bank:credit_limit_public_enterprise_total] 銀行對同一公營事業授信總餘額不得超過淨值
(assert (= credit_limit_public_enterprise_total
   (ite (<= credit_exposure_public_enterprise_total net_worth) 1.0 0.0)))

; [bank:credit_limit_related_person_total] 銀行對同一關係人授信總餘額不得超過淨值百分之四十
(assert (= credit_limit_related_person_total
   (ite (<= credit_exposure_related_person_total (* (/ 2.0 5.0) net_worth))
        1.0
        0.0)))

; [bank:credit_limit_related_person_natural_total] 銀行對同一關係人中自然人授信總餘額不得超過淨值百分之六
(assert (= credit_limit_related_person_natural_total
   (ite (<= credit_exposure_related_person_natural_total
            (* (/ 3.0 50.0) net_worth))
        1.0
        0.0)))

; [bank:credit_limit_related_person_unsecured_total] 銀行對同一關係人無擔保授信總餘額不得超過淨值百分之十
(assert (= credit_limit_related_person_unsecured_total
   (ite (<= credit_exposure_related_person_unsecured_total
            (* (/ 1.0 10.0) net_worth))
        1.0
        0.0)))

; [bank:credit_limit_related_person_natural_unsecured] 銀行對同一關係人中自然人無擔保授信總餘額不得超過淨值百分之二
(assert (= credit_limit_related_person_natural_unsecured
   (ite (<= credit_exposure_related_person_natural_unsecured
            (* (/ 1.0 50.0) net_worth))
        1.0
        0.0)))

; [bank:credit_limit_related_enterprise_total] 銀行對同一關係企業授信總餘額不得超過淨值百分之四十
(assert (= credit_limit_related_enterprise_total
   (ite (<= credit_exposure_related_enterprise_total (* (/ 2.0 5.0) net_worth))
        1.0
        0.0)))

; [bank:credit_limit_related_enterprise_unsecured] 銀行對同一關係企業無擔保授信總餘額不得超過淨值百分之十五
(assert (= credit_limit_related_enterprise_unsecured
   (ite (<= credit_exposure_related_enterprise_unsecured
            (* (/ 3.0 20.0) net_worth))
        1.0
        0.0)))

; [bank:credit_exclusion_policy_approved] 配合政府政策經主管機關專案核准之專案授信不計入授信總餘額
(assert (= credit_exclusion_policy_approved
   (ite (= credit_exposure_policy_approved 1.0) 1.0 0.0)))

; [bank:credit_exclusion_government] 對政府機關之授信不計入授信總餘額
(assert (= credit_exclusion_government (ite (= credit_exposure_government 1.0) 1.0 0.0)))

; [bank:credit_exclusion_secured_bonds] 以公債、國庫券、中央銀行儲蓄券、中央銀行可轉讓定期存單、本行存單或本行金融債券為擔保品授信不計入授信總餘額
(assert (= credit_exclusion_secured_bonds
   (ite (= credit_exposure_secured_bonds 1.0) 1.0 0.0)))

; [bank:credit_exclusion_small_loans] 依小額放款業務要點辦理之新臺幣一百萬元以下授信不計入授信總餘額
(assert (= credit_exclusion_small_loans
   (ite (= credit_exposure_small_loans 1.0) 1.0 0.0)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反授信限額規定時處罰
(assert (= penalty
   (or (not (= credit_limit_legal_person_total 1.0))
       (not (= credit_limit_related_person_total 1.0))
       (not (= credit_limit_related_person_unsecured_total 1.0))
       (not (= credit_limit_related_person_natural_total 1.0))
       (not (= credit_limit_public_enterprise_total 1.0))
       (not (= credit_limit_related_person_natural_unsecured 1.0))
       (not (= credit_limit_related_enterprise_total 1.0))
       (not (= credit_limit_natural_person_unsecured 1.0))
       (not (= credit_limit_natural_person_total 1.0))
       (not (= credit_limit_legal_person_unsecured 1.0))
       (not (= credit_limit_related_enterprise_unsecured 1.0)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= credit_exposure_related_person_natural_total 1476000000))
(assert (= net_worth 24600000000))
(assert (= credit_exposure_government 0))
(assert (= credit_exposure_policy_approved 0))
(assert (= credit_exposure_secured_bonds 0))
(assert (= credit_exposure_small_loans 0))
(assert (= credit_exposure_legal_person_total 0))
(assert (= credit_exposure_legal_person_unsecured 0))
(assert (= credit_exposure_natural_person_total 0))
(assert (= credit_exposure_natural_person_unsecured 0))
(assert (= credit_exposure_public_enterprise_total 0))
(assert (= credit_exposure_related_enterprise_total 0))
(assert (= credit_exposure_related_enterprise_unsecured 0))
(assert (= credit_exposure_related_person_natural_unsecured 0))
(assert (= credit_exposure_related_person_unsecured_total 0))
(assert (= credit_limit_legal_person_total 1))
(assert (= credit_limit_legal_person_unsecured 1))
(assert (= credit_limit_natural_person_total 1))
(assert (= credit_limit_natural_person_unsecured 1))
(assert (= credit_limit_public_enterprise_total 1))
(assert (= credit_limit_related_enterprise_total 1))
(assert (= credit_limit_related_enterprise_unsecured 1))
(assert (= credit_limit_related_person_natural_total 0))
(assert (= credit_limit_related_person_natural_unsecured 1))
(assert (= credit_limit_related_person_total 0))
(assert (= credit_limit_related_person_unsecured_total 1))
(assert (= credit_exclusion_government 0))
(assert (= credit_exclusion_policy_approved 0))
(assert (= credit_exclusion_secured_bonds 0))
(assert (= credit_exclusion_small_loans 0))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 17
; Total variables: 32
; Total facts: 31
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

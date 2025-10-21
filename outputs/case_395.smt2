; SMT2 file generated from compliance case automatic
; Case ID: case_395
; Generated at: 2025-10-21T08:43:54.916018
;
; This file can be executed with Z3:
;   z3 case_395.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_liability_insurance Bool)
(declare-const agent_license_granted Bool)
(declare-const broker_guarantee_insurance Bool)
(declare-const broker_liability_insurance Bool)
(declare-const broker_license_granted Bool)
(declare-const deposit_and_insurance_ok Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const guarantee_deposit_minimum Real)
(declare-const license_and_deposit_and_insurance_ok Bool)
(declare-const license_required Bool)
(declare-const notary_liability_insurance Bool)
(declare-const notary_license_granted Bool)
(declare-const penalty Bool)
(declare-const practice_certificate_held Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:license_required] 保險代理人、經紀人、公證人須經主管機關許可
(assert (= license_required
   (and agent_license_granted broker_license_granted notary_license_granted)))

; [insurance:deposit_guarantee_and_insurance_required] 須繳存保證金並投保相關保險
(assert (= deposit_and_insurance_ok
   (and (>= guarantee_deposit_amount guarantee_deposit_minimum)
        agent_liability_insurance
        notary_liability_insurance
        broker_liability_insurance
        broker_guarantee_insurance)))

; [insurance:license_and_deposit_and_insurance_ok] 領有執業證照且繳存保證金並投保相關保險後，始得經營或執行業務
(assert (= license_and_deposit_and_insurance_ok
   (and license_required deposit_and_insurance_ok practice_certificate_held)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：未經主管機關許可、未繳存保證金或未投保相關保險，或未持有執業證照者處罰
(assert (= penalty
   (or (not practice_certificate_held)
       (not license_required)
       (not deposit_and_insurance_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent_license_granted true))
(assert (= broker_license_granted true))
(assert (= notary_license_granted true))
(assert (= guarantee_deposit_amount 0.0))
(assert (= guarantee_deposit_minimum 1000000.0))
(assert (= agent_liability_insurance true))
(assert (= broker_liability_insurance true))
(assert (= broker_guarantee_insurance true))
(assert (= notary_liability_insurance true))
(assert (= practice_certificate_held true))
(assert (= license_required true))
(assert (= deposit_and_insurance_ok false))
(assert (= license_and_deposit_and_insurance_ok false))
(assert (= penalty true))

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

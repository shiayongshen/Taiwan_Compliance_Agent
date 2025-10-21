; SMT2 file generated from compliance case automatic
; Case ID: case_408
; Generated at: 2025-10-21T08:57:10.322516
;
; This file can be executed with Z3:
;   z3 case_408.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent Bool)
(declare-const approved_by_authority Bool)
(declare-const broker Bool)
(declare-const business_allowed Bool)
(declare-const deposit_and_insurance_required Bool)
(declare-const deposit_paid Bool)
(declare-const illegal_operation Bool)
(declare-const insurance_purchased Bool)
(declare-const insurance_type Bool)
(declare-const insurance_type_correct Bool)
(declare-const license_held Bool)
(declare-const license_required Bool)
(declare-const notary Bool)
(declare-const operating_business Bool)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:license_required] 必須經主管機關許可並領有執業證照
(assert (= license_required (and approved_by_authority license_held)))

; [insurance:deposit_and_insurance_required] 必須繳存保證金並投保相關保險
(assert (= deposit_and_insurance_required (and deposit_paid insurance_purchased)))

; [insurance:insurance_type_correct] 保險類型符合代理人、經紀人、公證人規定
(assert (= insurance_type_correct
   (or (and agent insurance_type)
       (and broker insurance_type)
       (and notary insurance_type))))

; [insurance:business_allowed] 領有執業證照且符合繳存保證金及投保要求，始得經營或執行業務
(assert (= business_allowed (and license_required deposit_and_insurance_required)))

; [insurance:illegal_operation] 未領有執業證照而經營或執行保險代理人、經紀人、公證人業務
(assert (= illegal_operation (and operating_business (not license_held))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未領有執業證照而經營或執行業務時處罰
(assert (= penalty illegal_operation))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent false))
(assert (= broker true))
(assert (= notary false))
(assert (= approved_by_authority false))
(assert (= license_held false))
(assert (= license_required false))
(assert (= deposit_paid false))
(assert (= insurance_purchased false))
(assert (= insurance_type false))
(assert (= operating_business true))
(assert (= illegal_operation true))
(assert (= business_allowed false))
(assert (= deposit_and_insurance_required false))
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
; Total variables: 15
; Total facts: 14
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

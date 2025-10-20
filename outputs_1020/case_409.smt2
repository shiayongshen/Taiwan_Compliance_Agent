; SMT2 file generated from compliance case automatic
; Case ID: case_409
; Generated at: 2025-10-19T15:09:11.148183
;
; This file can be executed with Z3:
;   z3 case_409.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_or_notary Bool)
(declare-const approved_by_authority Bool)
(declare-const bond_and_insurance_required Bool)
(declare-const bond_deposited Bool)
(declare-const broker Bool)
(declare-const business_allowed Bool)
(declare-const business_executed Bool)
(declare-const guarantee_insurance_purchased Bool)
(declare-const illegal_non_insurance_agent Bool)
(declare-const illegal_operation Bool)
(declare-const insurance_purchased Bool)
(declare-const insurance_type_required Bool)
(declare-const liability_insurance_purchased Bool)
(declare-const license_held Bool)
(declare-const license_required Bool)
(declare-const non_legal_insurance_agent Bool)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:license_required] 保險代理人、經紀人、公證人須經主管機關許可並領有執業證照
(assert (= license_required (and approved_by_authority license_held)))

; [insurance:bond_and_insurance_required] 保險代理人、經紀人、公證人須繳存保證金並投保相關保險
(assert (= bond_and_insurance_required (and bond_deposited insurance_purchased)))

; [insurance:insurance_type_required] 保險代理人、公證人須投保責任保險；保險經紀人須投保責任保險及保證保險
(assert (= insurance_type_required
   (or (and agent_or_notary liability_insurance_purchased)
       (and broker liability_insurance_purchased guarantee_insurance_purchased))))

; [insurance:business_allowed] 領有執業證照且完成繳存保證金及投保相關保險後，始得經營或執行業務
(assert (= business_allowed (and license_required bond_and_insurance_required)))

; [insurance:illegal_operation] 未領有執業證照而經營或執行保險代理人、經紀人、公證人業務
(assert (= illegal_operation (and business_executed (not license_held))))

; [insurance:illegal_non_insurance_agent] 非本法之保險業或外國保險業代理、經紀或招攬保險業務
(assert (= illegal_non_insurance_agent non_legal_insurance_agent))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未領有執業證照經營業務或非合法保險代理經紀招攬業務時處罰
(assert (= penalty (or illegal_non_insurance_agent illegal_operation)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent_or_notary false))
(assert (= approved_by_authority false))
(assert (= bond_deposited false))
(assert (= broker true))
(assert (= business_executed true))
(assert (= guarantee_insurance_purchased false))
(assert (= illegal_non_insurance_agent true))
(assert (= illegal_operation true))
(assert (= insurance_purchased false))
(assert (= liability_insurance_purchased false))
(assert (= license_held false))
(assert (= license_required false))
(assert (= non_legal_insurance_agent true))
(assert (= penalty true))
(assert (= bond_and_insurance_required false))
(assert (= business_allowed false))
(assert (= insurance_type_required false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 8
; Total variables: 17
; Total facts: 17
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

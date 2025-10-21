; SMT2 file generated from compliance case automatic
; Case ID: case_244
; Generated at: 2025-10-21T05:23:23.658486
;
; This file can be executed with Z3:
;   z3 case_244.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const audit_system_established Bool)
(declare-const audit_system_performed Bool)
(declare-const fixed_office_and_account_book Bool)
(declare-const has_certain_scale Bool)
(declare-const has_dedicated_account_book Bool)
(declare-const has_fixed_office Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_performed Bool)
(declare-const internal_control_required Bool)
(declare-const is_property_insurance_solicitation Bool)
(declare-const is_publicly_listed Bool)
(declare-const number_of_licenses_held Int)
(declare-const penalty Bool)
(declare-const single_license Bool)
(declare-const solicitation_handling_7th_clause_applicable Bool)
(declare-const solicitation_handling_system_established Bool)
(declare-const solicitation_handling_system_performed Bool)
(declare-const violation_internal_control Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:fixed_office_and_account_book] 保險代理人、經紀人、公證人應有固定業務處所並專設帳簿記載業務收支
(assert (= fixed_office_and_account_book
   (and has_fixed_office has_dedicated_account_book)))

; [insurance:single_license] 兼有保險代理人、經紀人、公證人資格者僅得擇一申領執業證照
(assert (= single_license (= 1 number_of_licenses_held)))

; [insurance:internal_control_required] 保險代理人公司、經紀人公司為公開發行公司或具一定規模者應建立內部控制、稽核制度與招攬處理制度及程序
(assert (= internal_control_required
   (or (not (or is_publicly_listed has_certain_scale))
       (and internal_control_established
            audit_system_established
            solicitation_handling_system_established))))

; [insurance:internal_control_executed] 保險代理人公司、經紀人公司內部控制、稽核制度及招攬處理制度確實執行
(assert (= internal_control_executed
   (and internal_control_established
        audit_system_established
        solicitation_handling_system_established
        internal_control_performed
        audit_system_performed
        solicitation_handling_system_performed)))

; [insurance:violation_internal_control] 違反未建立或未確實執行內部控制、稽核制度、招攬處理制度或程序
(assert (= violation_internal_control
   (or (not solicitation_handling_system_performed)
       (not solicitation_handling_system_established)
       (not internal_control_established)
       (not audit_system_established)
       (not audit_system_performed)
       (not internal_control_performed))))

; [insurance:solicitation_handling_exclusions] 招攬處理制度第七款於招攬財產保險時不適用
(assert (not (= is_property_insurance_solicitation
        solicitation_handling_7th_clause_applicable)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反未建立或未確實執行內部控制、稽核制度、招攬處理制度或程序時處罰
(assert (= penalty violation_internal_control))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= has_fixed_office true))
(assert (= has_dedicated_account_book true))
(assert (= fixed_office_and_account_book true))
(assert (= number_of_licenses_held 1))
(assert (= single_license true))
(assert (= is_publicly_listed false))
(assert (= has_certain_scale true))
(assert (= internal_control_established false))
(assert (= audit_system_established false))
(assert (= solicitation_handling_system_established false))
(assert (= internal_control_performed false))
(assert (= audit_system_performed false))
(assert (= solicitation_handling_system_performed false))
(assert (= internal_control_required true))
(assert (= internal_control_executed false))
(assert (= is_property_insurance_solicitation true))
(assert (= solicitation_handling_7th_clause_applicable false))
(assert (= violation_internal_control true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 8
; Total variables: 19
; Total facts: 19
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

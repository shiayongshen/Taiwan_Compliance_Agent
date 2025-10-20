; SMT2 file generated from compliance case automatic
; Case ID: case_150
; Generated at: 2025-10-19T09:23:35.808598
;
; This file can be executed with Z3:
;   z3 case_150.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_broker_company_internal_control_established Bool)
(declare-const agent_broker_company_internal_control_ok Bool)
(declare-const agent_broker_notary_fixed_office_and_accounting Bool)
(declare-const agent_broker_notary_license_ok Bool)
(declare-const agent_broker_notary_single_license Bool)
(declare-const fixed_office_exists Bool)
(declare-const guarantee_deposit_paid Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_ok Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const internal_operation_established Bool)
(declare-const internal_operation_executed Bool)
(declare-const internal_operation_ok Bool)
(declare-const internal_operation_system_established Bool)
(declare-const internal_operation_system_executed Bool)
(declare-const license_permitted Bool)
(declare-const number_of_licenses_held Int)
(declare-const penalty Bool)
(declare-const related_insurance_purchased Bool)
(declare-const special_accounting_books_kept Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [bank:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [bank:internal_operation_established] 建立內部作業制度及程序
(assert (= internal_operation_established internal_operation_system_established))

; [bank:internal_control_executed] 內部控制及稽核制度確實執行
(assert (= internal_control_executed internal_control_system_executed))

; [bank:internal_handling_executed] 內部處理制度及程序確實執行
(assert (= internal_handling_executed internal_handling_system_executed))

; [bank:internal_operation_executed] 內部作業制度及程序確實執行
(assert (= internal_operation_executed internal_operation_system_executed))

; [bank:internal_control_ok] 內部控制及稽核制度建立且確實執行
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [bank:internal_handling_ok] 內部處理制度及程序建立且確實執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [bank:internal_operation_ok] 內部作業制度及程序建立且確實執行
(assert (= internal_operation_ok
   (and internal_operation_established internal_operation_executed)))

; [insurance:agent_broker_notary_license_ok] 保險代理人、經紀人、公證人經主管機關許可並繳存保證金及投保相關保險
(assert (= agent_broker_notary_license_ok
   (and license_permitted guarantee_deposit_paid related_insurance_purchased)))

; [insurance:agent_broker_notary_fixed_office_and_accounting] 保險代理人、經紀人、公證人有固定業務處所並專設帳簿記載業務收支
(assert (= agent_broker_notary_fixed_office_and_accounting
   (and fixed_office_exists special_accounting_books_kept)))

; [insurance:agent_broker_notary_single_license] 兼有保險代理人、經紀人、公證人資格者僅得擇一申領執業證照
(assert (= agent_broker_notary_single_license (>= 1 number_of_licenses_held)))

; [insurance:agent_broker_company_internal_control_ok] 保險代理人公司、經紀人公司建立內部控制、稽核制度與招攬處理制度及程序
(assert (= agent_broker_company_internal_control_ok
   agent_broker_company_internal_control_established))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未依規定建立或執行內部控制、內部處理、內部作業制度及程序時處罰
(assert (= penalty
   (or (not internal_control_ok)
       (not internal_handling_ok)
       (not internal_operation_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_control_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_established false))
(assert (= internal_handling_system_executed false))
(assert (= internal_handling_executed false))
(assert (= internal_operation_system_established false))
(assert (= internal_operation_established false))
(assert (= internal_operation_system_executed false))
(assert (= internal_operation_executed false))
(assert (= agent_broker_company_internal_control_established false))
(assert (= agent_broker_company_internal_control_ok false))
(assert (= license_permitted false))
(assert (= guarantee_deposit_paid false))
(assert (= related_insurance_purchased false))
(assert (= agent_broker_notary_license_ok false))
(assert (= fixed_office_exists false))
(assert (= special_accounting_books_kept false))
(assert (= agent_broker_notary_fixed_office_and_accounting false))
(assert (= number_of_licenses_held 0))
(assert (= agent_broker_notary_single_license true))
(assert (= penalty true))
(assert (= internal_control_ok false))
(assert (= internal_handling_ok false))
(assert (= internal_operation_ok false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 27
; Total facts: 27
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

; SMT2 file generated from compliance case automatic
; Case ID: case_446
; Generated at: 2025-10-21T10:02:13.305935
;
; This file can be executed with Z3:
;   z3 case_446.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const branch_establishment_approved_by_mof Bool)
(declare-const branch_establishment_permitted Bool)
(declare-const business_direct_transaction_permitted Bool)
(declare-const claims_handled_properly Bool)
(declare-const compulsory_insurance_benefit_items Bool)
(declare-const death_benefit_covered Bool)
(declare-const disability_benefit_covered Bool)
(declare-const financial_institution_permitted_by_mof Bool)
(declare-const injury_medical_expense_covered Bool)
(declare-const internal_control_and_audit_system_established Bool)
(declare-const internal_control_and_audit_system_executed Bool)
(declare-const internal_control_and_handling_system_established_and_executed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const mof_restriction_order_active Bool)
(declare-const mof_restriction_order_enforced Bool)
(declare-const penalty Bool)
(declare-const underwriting_and_claim_recording_compliance Bool)
(declare-const underwriting_data_correctly_recorded Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:compulsory_insurance_benefit_items] 強制汽車責任保險給付項目包含傷害醫療費用、失能給付及死亡給付
(assert (= compulsory_insurance_benefit_items
   (and injury_medical_expense_covered
        disability_benefit_covered
        death_benefit_covered)))

; [insurance:underwriting_and_claim_recording_compliance] 保險人應正確記載承保資料及辦理理賠
(assert (= underwriting_and_claim_recording_compliance
   (and underwriting_data_correctly_recorded claims_handled_properly)))

; [insurance:internal_control_and_handling_system_established_and_executed] 保險業建立並執行內部控制及稽核制度與內部處理制度及程序
(assert (= internal_control_and_handling_system_established_and_executed
   (and internal_control_and_audit_system_established
        internal_control_and_audit_system_executed
        internal_handling_system_established
        internal_handling_system_executed)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：違反承保資料記載、理賠辦理、內部控制及內部處理制度規定時處罰
(assert (= penalty
   (or (not internal_control_and_handling_system_established_and_executed)
       (not underwriting_and_claim_recording_compliance))))

; [taiwan_china:business_direct_transaction_permitted] 臺灣地區金融保險證券期貨機構及其境外分支機構經財政部許可得與大陸地區人民及機構有業務直接往來
(assert (= business_direct_transaction_permitted financial_institution_permitted_by_mof))

; [taiwan_china:branch_establishment_permitted] 臺灣地區金融保險證券期貨機構在大陸地區設立分支機構應報經財政部許可
(assert (= branch_establishment_permitted branch_establishment_approved_by_mof))

; [taiwan_china:mof_restriction_order_enforced] 財政部得報請行政院核定後限制或禁止業務直接往來
(assert (= mof_restriction_order_enforced mof_restriction_order_active))

; [taiwan_china:penalty_default_false] 預設不處罰
(assert (not penalty))

; [taiwan_china:penalty_conditions] 處罰條件：違反業務直接往來許可、分支機構設立許可或違反限制命令時處罰
(assert (= penalty
   (or mof_restriction_order_enforced
       (not branch_establishment_permitted)
       (not business_direct_transaction_permitted))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= injury_medical_expense_covered false))
(assert (= disability_benefit_covered true))
(assert (= death_benefit_covered true))
(assert (= underwriting_data_correctly_recorded false))
(assert (= claims_handled_properly false))
(assert (= internal_control_and_audit_system_established false))
(assert (= internal_control_and_audit_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= financial_institution_permitted_by_mof false))
(assert (= branch_establishment_approved_by_mof false))
(assert (= mof_restriction_order_active false))
(assert (= mof_restriction_order_enforced false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 10
; Total variables: 19
; Total facts: 13
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

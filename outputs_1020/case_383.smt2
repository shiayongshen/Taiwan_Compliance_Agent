; SMT2 file generated from compliance case automatic
; Case ID: case_383
; Generated at: 2025-10-19T14:33:22.704358
;
; This file can be executed with Z3:
;   z3 case_383.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_execution_compliance Bool)
(declare-const business_execution_violation Bool)
(declare-const business_procedures_executed Bool)
(declare-const financial_underwriting_compliance Bool)
(declare-const financial_underwriting_done Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_control_violation Bool)
(declare-const internal_handling_compliance Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const internal_handling_violation Bool)
(declare-const no_harm_to_insured_or_beneficiary Bool)
(declare-const no_retroactive_policy Bool)
(declare-const other_protection_compliance Bool)
(declare-const penalty Bool)
(declare-const premium_source_assessed Bool)
(declare-const premium_source_assessment_compliance Bool)
(declare-const signatures_and_evidence_verified Bool)
(declare-const underwriting_evaluation_compliance Bool)
(declare-const underwriting_evaluation_done Bool)
(declare-const underwriting_qualification_compliance Bool)
(declare-const underwriting_retroactive_prohibition Bool)
(declare-const underwriting_signature_compliance Bool)
(declare-const underwriting_staff_qualified Bool)
(declare-const underwriting_training_completed Bool)
(declare-const underwriting_training_compliance Bool)
(declare-const underwriting_violation Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [insurance:internal_control_executed] 執行內部控制及稽核制度
(assert (= internal_control_executed internal_control_system_executed))

; [insurance:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [insurance:internal_handling_executed] 執行內部處理制度及程序
(assert (= internal_handling_executed internal_handling_system_executed))

; [insurance:internal_control_compliance] 內部控制及稽核制度建立且執行
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_compliance] 內部處理制度及程序建立且執行
(assert (= internal_handling_compliance
   (and internal_handling_established internal_handling_executed)))

; [insurance:underwriting_training_compliance] 核保人員每年參加公平對待65歲以上客戶相關教育訓練
(assert (= underwriting_training_compliance underwriting_training_completed))

; [insurance:underwriting_qualification_compliance] 核保人員具資格執行核保簽署作業
(assert (= underwriting_qualification_compliance underwriting_staff_qualified))

; [insurance:underwriting_evaluation_compliance] 依保險商品內容評估適合度並簽署承保
(assert (= underwriting_evaluation_compliance underwriting_evaluation_done))

; [insurance:underwriting_retroactive_prohibition] 不得以保單追溯生效方式承保（除法定例外）
(assert (= underwriting_retroactive_prohibition no_retroactive_policy))

; [insurance:underwriting_signature_compliance] 審閱要保人、被保險人及招攬人員簽章及相關證據
(assert (= underwriting_signature_compliance signatures_and_evidence_verified))

; [insurance:financial_underwriting_compliance] 落實財務核保程序、保險通報機制及適合度政策，並保留相關文件
(assert (= financial_underwriting_compliance financial_underwriting_done))

; [insurance:premium_source_assessment_compliance] 瞭解繳交保險費資金來源並評估適當性
(assert (= premium_source_assessment_compliance premium_source_assessed))

; [insurance:other_protection_compliance] 無損害要保人、被保險人或受益人權益之情事
(assert (= other_protection_compliance no_harm_to_insured_or_beneficiary))

; [insurance:internal_control_violation] 違反內部控制及稽核制度建立或執行
(assert (not (= internal_control_compliance internal_control_violation)))

; [insurance:internal_handling_violation] 違反內部處理制度及程序建立或執行
(assert (not (= internal_handling_compliance internal_handling_violation)))

; [insurance:underwriting_violation] 核保相關規定違反（含資格、適合度、簽章、財務核保等）
(assert (= underwriting_violation
   (or (not underwriting_retroactive_prohibition)
       (not underwriting_qualification_compliance)
       (not underwriting_training_compliance)
       (not premium_source_assessment_compliance)
       (not underwriting_evaluation_compliance)
       (not underwriting_signature_compliance)
       (not financial_underwriting_compliance)
       (not other_protection_compliance))))

; [insurance:business_execution_compliance] 招攬、核保及理賠處理制度及程序確實執行
(assert (= business_execution_compliance business_procedures_executed))

; [insurance:business_execution_violation] 招攬、核保及理賠人員未依規定執行業務
(assert (not (= business_execution_compliance business_execution_violation)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反內部控制、內部處理制度或招攬核保理賠執行規定時處罰
(assert (= penalty
   (or internal_control_violation
       underwriting_violation
       business_execution_violation
       internal_handling_violation)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= financial_underwriting_done false))
(assert (= premium_source_assessed true))
(assert (= signatures_and_evidence_verified true))
(assert (= underwriting_training_completed true))
(assert (= underwriting_staff_qualified true))
(assert (= underwriting_evaluation_done true))
(assert (= no_retroactive_policy true))
(assert (= no_harm_to_insured_or_beneficiary true))
(assert (= business_procedures_executed false))
(assert (= business_execution_compliance false))
(assert (= business_execution_violation false))
(assert (= financial_underwriting_compliance false))
(assert (= internal_control_compliance false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_violation false))
(assert (= internal_handling_compliance false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_handling_violation false))
(assert (= other_protection_compliance false))
(assert (= penalty false))
(assert (= premium_source_assessment_compliance false))
(assert (= underwriting_evaluation_compliance false))
(assert (= underwriting_qualification_compliance false))
(assert (= underwriting_retroactive_prohibition false))
(assert (= underwriting_signature_compliance false))
(assert (= underwriting_training_compliance false))
(assert (= underwriting_violation false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 21
; Total variables: 33
; Total facts: 33
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

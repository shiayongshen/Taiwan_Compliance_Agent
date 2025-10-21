; SMT2 file generated from compliance case automatic
; Case ID: case_383
; Generated at: 2025-10-21T08:35:38.989613
;
; This file can be executed with Z3:
;   z3 case_383.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

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
(declare-const penalty Bool)
(declare-const personnel_performance_compliant Bool)
(declare-const solicitation_underwriting_claims_compliance Bool)
(declare-const solicitation_underwriting_claims_personnel_compliance Bool)
(declare-const solicitation_underwriting_claims_systems_executed Bool)
(declare-const underwriting_execution_compliance Bool)
(declare-const underwriting_system_compliance Bool)
(declare-const underwriting_system_established_and_compliant Bool)
(declare-const underwriting_system_executed Bool)
(declare-const underwriting_training_completed Bool)
(declare-const underwriting_training_compliance Bool)

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

; [insurance:internal_control_ok] 內部控制及稽核制度建立且執行
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_ok] 內部處理制度及程序建立且執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [insurance:underwriting_training_compliance] 核保人員每年參加公平對待65歲以上客戶相關教育訓練
(assert (= underwriting_training_compliance underwriting_training_completed))

; [insurance:underwriting_system_compliance] 訂定核保處理制度及程序並符合第7條規定
(assert (= underwriting_system_compliance underwriting_system_established_and_compliant))

; [insurance:underwriting_execution_compliance] 確實執行核保處理制度及程序
(assert (= underwriting_execution_compliance underwriting_system_executed))

; [insurance:solicitation_underwriting_claims_compliance] 確實執行招攬、核保及理賠處理制度及程序
(assert (= solicitation_underwriting_claims_compliance
   solicitation_underwriting_claims_systems_executed))

; [insurance:solicitation_underwriting_claims_personnel_compliance] 招攬、核保及理賠人員依規定執行業務
(assert (= solicitation_underwriting_claims_personnel_compliance
   personnel_performance_compliant))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未建立或未執行內部控制或稽核制度，或未建立或未執行內部處理制度或程序，或招攬核保理賠人員未依規定執行業務時處罰
(assert (= penalty
   (or (not internal_control_ok)
       (not internal_handling_ok)
       (not solicitation_underwriting_claims_personnel_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established true))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established true))
(assert (= internal_handling_system_executed false))
(assert (= personnel_performance_compliant true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 21
; Total facts: 5
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

; SMT2 file generated from compliance case automatic
; Case ID: case_412
; Generated at: 2025-10-21T09:02:14.331195
;
; This file can be executed with Z3:
;   z3 case_412.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_established_flag Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_executed_flag Bool)
(declare-const internal_handling_compliance Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_established_flag Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_executed_flag Bool)
(declare-const owner_equity_total Real)
(declare-const owner_use_real_estate_investment Bool)
(declare-const penalty Bool)
(declare-const real_estate_internal_procedure_flag Bool)
(declare-const real_estate_investment_compliance Bool)
(declare-const real_estate_investment_excluding_owner_use Real)
(declare-const real_estate_investment_internal_procedure_ok Bool)
(declare-const real_estate_investment_limit_ok Bool)
(declare-const real_estate_investment_use_and_income_ok Bool)
(declare-const real_estate_use_and_income_flag Bool)
(declare-const real_estate_valuation_flag Bool)
(declare-const real_estate_valuation_ok Bool)
(declare-const social_housing_exception Bool)
(declare-const total_funds Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_established_flag))

; [insurance:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_established_flag))

; [insurance:internal_control_executed] 內部控制及稽核制度確實執行
(assert (= internal_control_executed internal_control_executed_flag))

; [insurance:internal_handling_executed] 內部處理制度及程序確實執行
(assert (= internal_handling_executed internal_handling_executed_flag))

; [insurance:internal_control_compliance] 內部控制及稽核制度建立且執行
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_compliance] 內部處理制度及程序建立且執行
(assert (= internal_handling_compliance
   (and internal_handling_established internal_handling_executed)))

; [insurance:real_estate_investment_limit_ok] 不動產投資總額不超過資金30%且自用不動產不超過業主權益總額
(assert (= real_estate_investment_limit_ok
   (and (<= real_estate_investment_excluding_owner_use
            (* (/ 3.0 10.0) total_funds))
        (>= owner_equity_total (ite owner_use_real_estate_investment 1.0 0.0)))))

; [insurance:real_estate_investment_use_and_income_ok] 不動產即時利用並有收益
(assert (= real_estate_investment_use_and_income_ok real_estate_use_and_income_flag))

; [insurance:real_estate_investment_compliance] 不動產投資符合即時利用並有收益限制或住宅法例外
(assert (= real_estate_investment_compliance
   (or real_estate_investment_use_and_income_ok social_housing_exception)))

; [insurance:real_estate_investment_internal_procedure_ok] 不動產投資內部處理程序及條件限制符合主管機關規定
(assert (= real_estate_investment_internal_procedure_ok
   real_estate_internal_procedure_flag))

; [insurance:real_estate_valuation_ok] 不動產取得及處分經合法鑑價機構評價
(assert (= real_estate_valuation_ok real_estate_valuation_flag))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未建立或未執行內部控制或稽核制度，或未建立或未執行內部處理制度或程序，或不動產投資違反限制，或不動產取得未經合法鑑價時處罰
(assert (= penalty
   (or (not real_estate_investment_internal_procedure_ok)
       (not real_estate_valuation_ok)
       (not internal_control_compliance)
       (not real_estate_investment_limit_ok)
       (not real_estate_investment_compliance)
       (not internal_handling_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_established_flag false))
(assert (= internal_control_executed_flag false))
(assert (= internal_handling_established_flag true))
(assert (= internal_handling_executed_flag true))
(assert (= real_estate_internal_procedure_flag false))
(assert (= real_estate_use_and_income_flag false))
(assert (= real_estate_valuation_flag true))
(assert (= owner_use_real_estate_investment true))
(assert (= owner_equity_total 10000000))
(assert (= real_estate_investment_excluding_owner_use 4000000))
(assert (= total_funds 10000000))
(assert (= social_housing_exception false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 24
; Total facts: 12
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

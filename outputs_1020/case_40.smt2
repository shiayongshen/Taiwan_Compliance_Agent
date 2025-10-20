; SMT2 file generated from compliance case automatic
; Case ID: case_40
; Generated at: 2025-10-19T06:19:35.088985
;
; This file can be executed with Z3:
;   z3 case_40.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const cash_card_interest_rate Real)
(declare-const cash_card_interest_rate_ok Bool)
(declare-const internal_control_compliance Bool)
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
(declare-const money_market_or_credit_card_approved Bool)
(declare-const money_market_or_credit_card_permitted Bool)
(declare-const penalty Bool)

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

; [bank:internal_control_ok] 建立並確實執行內部控制及稽核制度
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [bank:internal_handling_ok] 建立並確實執行內部處理制度及程序
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [bank:internal_operation_ok] 建立並確實執行內部作業制度及程序
(assert (= internal_operation_ok
   (and internal_operation_established internal_operation_executed)))

; [bank:money_market_or_credit_card_permitted] 經營貨幣市場業務或信用卡業務經主管機關許可
(assert (= money_market_or_credit_card_permitted money_market_or_credit_card_approved))

; [bank:cash_card_interest_rate_ok] 現金卡利率或信用卡循環信用利率不超過15%年利率
(assert (= cash_card_interest_rate_ok (<= cash_card_interest_rate (/ 3.0 20.0))))

; [bank:internal_control_compliance] 符合銀行法第45-1條內部控制及稽核制度規定
(assert (= internal_control_compliance
   (and internal_control_established
        internal_control_executed
        internal_handling_established
        internal_handling_executed
        internal_operation_established
        internal_operation_executed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未建立或未確實執行內部控制、內部處理或內部作業制度時處罰
(assert (= penalty
   (or (not internal_control_ok)
       (not internal_handling_ok)
       (not internal_operation_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= internal_operation_system_established false))
(assert (= internal_operation_system_executed false))
(assert (= money_market_or_credit_card_approved false))
(assert (= cash_card_interest_rate 0.0))
(assert (= cash_card_interest_rate_ok false))
(assert (= internal_control_compliance false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_ok false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_handling_ok false))
(assert (= internal_operation_established false))
(assert (= internal_operation_executed false))
(assert (= internal_operation_ok false))
(assert (= money_market_or_credit_card_permitted false))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 21
; Total facts: 21
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

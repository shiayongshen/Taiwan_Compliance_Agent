; SMT2 file generated from compliance case automatic
; Case ID: case_224
; Generated at: 2025-10-19T10:50:23.118358
;
; This file can be executed with Z3:
;   z3 case_224.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const credit_card_annual_interest_rate Real)
(declare-const credit_card_interest_rate_limit Real)
(declare-const derivative_operation_compliance Bool)
(declare-const derivative_operation_established Bool)
(declare-const derivative_operation_executed Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_compliance Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_operation_compliance Bool)
(declare-const internal_operation_established Bool)
(declare-const internal_operation_executed Bool)
(declare-const money_market_credit_card_permit Bool)
(declare-const penalty Bool)
(declare-const permit_granted Bool)
(declare-const violation_penalty_129_7 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:internal_control_compliance] 建立內部控制及稽核制度且確實執行
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [bank:internal_handling_compliance] 建立內部處理制度及程序且確實執行
(assert (= internal_handling_compliance
   (and internal_handling_established internal_handling_executed)))

; [bank:internal_operation_compliance] 建立內部作業制度及程序且確實執行
(assert (= internal_operation_compliance
   (and internal_operation_established internal_operation_executed)))

; [bank:derivative_operation_compliance] 衍生性金融商品業務內部作業制度及程序訂定
(assert (= derivative_operation_compliance
   (and derivative_operation_established derivative_operation_executed)))

; [bank:money_market_credit_card_permit] 經營貨幣市場業務或信用卡業務經主管機關許可
(assert (= money_market_credit_card_permit permit_granted))

; [bank:credit_card_interest_rate_limit] 信用卡循環信用利率不得超過年利率15%
(assert (= credit_card_interest_rate_limit
   (ite (>= 15.0 credit_card_annual_interest_rate) 1.0 0.0)))

; [bank:violation_penalty_129_7] 未依規定建立內部控制、內部處理、內部作業制度或未確實執行
(assert (= violation_penalty_129_7
   (or (not internal_control_compliance)
       (not internal_handling_compliance)
       (not internal_operation_compliance))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反第129條第7款規定時處罰
(assert (= penalty
   (or (not internal_control_compliance)
       (not internal_handling_compliance)
       (not internal_operation_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_operation_established false))
(assert (= internal_operation_executed false))
(assert (= derivative_operation_established false))
(assert (= derivative_operation_executed false))
(assert (= permit_granted true))
(assert (= credit_card_annual_interest_rate 15.0))
(assert (= credit_card_interest_rate_limit 0.0))
(assert (= derivative_operation_compliance false))
(assert (= internal_control_compliance false))
(assert (= internal_handling_compliance false))
(assert (= internal_operation_compliance false))
(assert (= money_market_credit_card_permit false))
(assert (= penalty false))
(assert (= violation_penalty_129_7 false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 9
; Total variables: 18
; Total facts: 18
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

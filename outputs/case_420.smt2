; SMT2 file generated from compliance case automatic
; Case ID: case_420
; Generated at: 2025-10-21T09:14:10.731172
;
; This file can be executed with Z3:
;   z3 case_420.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const equity_swap_agreement Bool)
(declare-const equity_swap_authorization Bool)
(declare-const equity_swap_commission_agreement Bool)
(declare-const equity_swap_other_contract Bool)
(declare-const equity_swap_other_method Bool)
(declare-const equity_swap_trust_agreement Bool)
(declare-const insured_interest_not_harmed Bool)
(declare-const internal_control_and_handling_ok Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const penalty Bool)
(declare-const prohibit_equity_swap Bool)
(declare-const prohibit_proxy_solicitor Bool)
(declare-const protect_insured_interest Bool)
(declare-const proxy_solicitor_others Bool)
(declare-const proxy_solicitor_self Bool)
(declare-const report_vote_record Bool)
(declare-const submit_vote_evaluation Bool)
(declare-const vote_evaluation_reported_before_meeting Bool)
(declare-const vote_record_reported_to_board Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:prohibit_equity_swap] 禁止與被投資公司或第三人以信託、委任或其他契約約定或協議、授權等方式進行股權交換或利益輸送
(assert (not (= (or equity_swap_commission_agreement
            equity_swap_agreement
            equity_swap_authorization
            equity_swap_other_contract
            equity_swap_other_method
            equity_swap_trust_agreement)
        prohibit_equity_swap)))

; [insurance:protect_insured_interest] 不得損及要保人、被保險人或受益人之利益
(assert (= protect_insured_interest insured_interest_not_harmed))

; [insurance:submit_vote_evaluation] 出席被投資公司股東會前，應作成行使表決權之評估分析說明
(assert (= submit_vote_evaluation vote_evaluation_reported_before_meeting))

; [insurance:report_vote_record] 股東會後，應將行使表決權之書面紀錄提報董事會
(assert (= report_vote_record vote_record_reported_to_board))

; [insurance:prohibit_proxy_solicitor] 不得擔任被投資公司之委託書徵求人或委託他人擔任委託書徵求人
(assert (= prohibit_proxy_solicitor
   (and (not proxy_solicitor_self) (not proxy_solicitor_others))))

; [insurance:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [insurance:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [insurance:internal_control_executed] 執行內部控制及稽核制度
(assert (= internal_control_executed internal_control_system_executed))

; [insurance:internal_handling_executed] 執行內部處理制度及程序
(assert (= internal_handling_executed internal_handling_system_executed))

; [insurance:internal_control_and_handling_ok] 內部控制及稽核制度與內部處理制度及程序均已建立且執行
(assert (= internal_control_and_handling_ok
   (and internal_control_established
        internal_control_executed
        internal_handling_established
        internal_handling_executed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反股權交換、利益輸送、損害被保險人利益、未提交或未報告表決權評估及紀錄、擔任委託書徵求人、未建立或未執行內部控制及處理制度時處罰
(assert (= penalty
   (or (not protect_insured_interest)
       (not internal_control_established)
       (not submit_vote_evaluation)
       (not internal_handling_established)
       (not internal_handling_executed)
       (not internal_control_executed)
       (not prohibit_proxy_solicitor)
       (not report_vote_record)
       (not prohibit_equity_swap))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= equity_swap_agreement false))
(assert (= equity_swap_authorization false))
(assert (= equity_swap_commission_agreement false))
(assert (= equity_swap_other_contract false))
(assert (= equity_swap_other_method false))
(assert (= equity_swap_trust_agreement false))
(assert (= insured_interest_not_harmed true))
(assert (= internal_control_system_established true))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established true))
(assert (= internal_handling_system_executed false))
(assert (= proxy_solicitor_self false))
(assert (= proxy_solicitor_others false))
(assert (= vote_evaluation_reported_before_meeting false))
(assert (= vote_record_reported_to_board false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 26
; Total facts: 15
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

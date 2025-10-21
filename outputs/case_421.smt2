; SMT2 file generated from compliance case automatic
; Case ID: case_421
; Generated at: 2025-10-21T09:16:12.536525
;
; This file can be executed with Z3:
;   z3 case_421.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const insured_interest_harmed Bool)
(declare-const internal_control_and_handling_ok Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const no_harm_to_insured_interest Bool)
(declare-const no_proxy_solicitor Bool)
(declare-const not_proxy_solicitor_others Bool)
(declare-const not_proxy_solicitor_self Bool)
(declare-const penalty Bool)
(declare-const prohibited_share_exchange Bool)
(declare-const share_exchange_agreement Bool)
(declare-const share_exchange_authorization Bool)
(declare-const share_exchange_commission_agreement Bool)
(declare-const share_exchange_other_contract Bool)
(declare-const share_exchange_other_method Bool)
(declare-const share_exchange_trust_agreement Bool)
(declare-const violate_article_138_1_3_5_or_2 Bool)
(declare-const violate_article_138_2_4_5_7_or_138_3 Bool)
(declare-const violate_article_143 Bool)
(declare-const violate_article_143_5_or_measures Bool)
(declare-const violate_article_146_1_2_3_5_or_146_5 Bool)
(declare-const violate_article_146_1_3_5_7_or_6_or_8 Bool)
(declare-const violate_article_146_2_4 Bool)
(declare-const violate_article_146_3_2_4 Bool)
(declare-const violate_article_146_3_loan_guarantee Bool)
(declare-const violate_article_146_3_loan_limit Bool)
(declare-const violate_article_146_4_2_3 Bool)
(declare-const violate_article_146_5_1_or_documents Bool)
(declare-const violate_article_146_6_1_2_3 Bool)
(declare-const violate_article_146_7_loan_limit_or_resolution Bool)
(declare-const violate_article_146_9 Bool)
(declare-const violation_internal_control Bool)
(declare-const violation_internal_handling Bool)
(declare-const violation_of_regulations Bool)
(declare-const vote_evaluation_report_before_meeting Bool)
(declare-const vote_evaluation_report_made Bool)
(declare-const vote_record_report_after_meeting Bool)
(declare-const vote_record_report_submitted Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:prohibited_share_exchange] 不得與被投資公司或第三人以信託、委任或其他契約約定或以協議、授權或其他方法進行股權交換或利益輸送
(assert (not (= (or share_exchange_commission_agreement
            share_exchange_authorization
            share_exchange_other_method
            share_exchange_other_contract
            share_exchange_trust_agreement
            share_exchange_agreement)
        prohibited_share_exchange)))

; [insurance:no_harm_to_insured_interest] 不得損及要保人、被保險人或受益人之利益
(assert (not (= insured_interest_harmed no_harm_to_insured_interest)))

; [insurance:vote_evaluation_report_before_meeting] 出席被投資公司股東會前，應作成行使表決權之評估分析說明
(assert (= vote_evaluation_report_before_meeting vote_evaluation_report_made))

; [insurance:vote_record_report_after_meeting] 股東會後，應將行使表決權之書面紀錄提報董事會
(assert (= vote_record_report_after_meeting vote_record_report_submitted))

; [insurance:no_proxy_solicitor] 不得擔任被投資公司之委託書徵求人或委託他人擔任委託書徵求人
(assert (= no_proxy_solicitor (and not_proxy_solicitor_self not_proxy_solicitor_others)))

; [insurance:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [insurance:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [insurance:internal_control_executed] 內部控制及稽核制度確實執行
(assert (= internal_control_executed internal_control_system_executed))

; [insurance:internal_handling_executed] 內部處理制度及程序確實執行
(assert (= internal_handling_executed internal_handling_system_executed))

; [insurance:internal_control_and_handling_ok] 內部控制及稽核制度與內部處理制度及程序均建立且執行
(assert (= internal_control_and_handling_ok
   (and internal_control_established
        internal_control_executed
        internal_handling_established
        internal_handling_executed)))

; [insurance:violation_of_regulations] 違反相關規定
(assert (= violation_of_regulations
   (or violate_article_146_1_2_3_5_or_146_5
       violate_article_146_4_2_3
       violate_article_143_5_or_measures
       violate_article_146_7_loan_limit_or_resolution
       violate_article_146_2_4
       violate_article_138_2_4_5_7_or_138_3
       violate_article_143
       violate_article_146_1_3_5_7_or_6_or_8
       violate_article_146_3_2_4
       violate_article_146_3_loan_limit
       violate_article_146_5_1_or_documents
       violate_article_146_6_1_2_3
       violate_article_146_3_loan_guarantee
       violate_article_146_9
       violate_article_138_1_3_5_or_2)))

; [insurance:violation_internal_control] 未建立或未執行內部控制或稽核制度
(assert (= violation_internal_control
   (or (not internal_control_established) (not internal_control_executed))))

; [insurance:violation_internal_handling] 未建立或未執行內部處理制度或程序
(assert (= violation_internal_handling
   (or (not internal_handling_established) (not internal_handling_executed))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一規定或未建立或執行內部控制及內部處理制度時處罰
(assert (= penalty
   (or violation_of_regulations
       violation_internal_control
       violation_internal_handling)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= share_exchange_trust_agreement false))
(assert (= share_exchange_commission_agreement false))
(assert (= share_exchange_other_contract false))
(assert (= share_exchange_agreement false))
(assert (= share_exchange_authorization false))
(assert (= share_exchange_other_method false))
(assert (= prohibited_share_exchange true))
(assert (= insured_interest_harmed false))
(assert (= no_harm_to_insured_interest true))
(assert (= not_proxy_solicitor_self true))
(assert (= not_proxy_solicitor_others true))
(assert (= no_proxy_solicitor true))
(assert (= vote_evaluation_report_made false))
(assert (= vote_evaluation_report_before_meeting false))
(assert (= vote_record_report_submitted false))
(assert (= vote_record_report_after_meeting false))
(assert (= internal_control_system_established false))
(assert (= internal_control_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_control_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_established false))
(assert (= internal_handling_system_executed false))
(assert (= internal_handling_executed false))
(assert (= internal_control_and_handling_ok false))
(assert (= violate_article_146_9 true))
(assert (= violation_of_regulations true))
(assert (= violation_internal_control true))
(assert (= violation_internal_handling true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 44
; Total facts: 30
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

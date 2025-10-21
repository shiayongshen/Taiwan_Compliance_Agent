; SMT2 file generated from compliance case automatic
; Case ID: case_11
; Generated at: 2025-10-20T22:59:32.899989
;
; This file can be executed with Z3:
;   z3 case_11.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const audit_system_established Bool)
(declare-const audit_system_executed Bool)
(declare-const cannot_fulfill_contract Bool)
(declare-const cannot_pay_debts Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_insufficient_measures_executed Bool)
(declare-const capital_level Int)
(declare-const capital_severely_insufficient_measures_executed Bool)
(declare-const capital_significantly_insufficient_measures_executed Bool)
(declare-const explanation_doc_false Bool)
(declare-const explanation_doc_not_according_to_rules Bool)
(declare-const financial_or_business_condition_deteriorated Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const level_3_measures_executed Bool)
(declare-const level_4_measures_executed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const not_proactively_disclose Bool)
(declare-const not_provide_explanation_doc Bool)
(declare-const not_report_to_authority_in_time Bool)
(declare-const penalty Bool)
(declare-const report_or_disclosure_false Bool)
(declare-const risk_to_insured_rights Bool)
(declare-const supervisory_action_required Bool)
(declare-const violate_148_1_2 Bool)
(declare-const violation_148_1_2 Bool)
(declare-const violation_148_2_1 Bool)
(declare-const violation_148_2_2 Bool)
(declare-const violation_148_3_1 Bool)
(declare-const violation_148_3_2 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violation_148_1_2] 違反第一百四十八條之一第一項或第二項規定
(assert (= violation_148_1_2 violate_148_1_2))

; [insurance:violation_148_2_1] 違反第一百四十八條之二第一項規定，未提供說明文件供查閱、或所提供之說明文件未依規定記載、或所提供之說明文件記載不實
(assert (= violation_148_2_1
   (or explanation_doc_false
       not_provide_explanation_doc
       explanation_doc_not_according_to_rules)))

; [insurance:violation_148_2_2] 違反第一百四十八條之二第二項規定，未依限向主管機關報告或主動公開說明，或向主管機關報告或公開說明之內容不實
(assert (= violation_148_2_2
   (or report_or_disclosure_false
       not_report_to_authority_in_time
       not_proactively_disclose)))

; [insurance:violation_148_3_1] 違反第一百四十八條之三第一項規定，未建立或未執行內部控制或稽核制度
(assert (= violation_148_3_1
   (or (not internal_control_established)
       (not audit_system_established)
       (not audit_system_executed)
       (not internal_control_executed))))

; [insurance:violation_148_3_2] 違反第一百四十八條之三第二項規定，未建立或未執行內部處理制度或程序
(assert (= violation_148_3_2
   (or (not internal_handling_system_established)
       (not internal_handling_system_executed))))

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未分類）
(assert (let ((a!1 (ite (and (<= 150.0 capital_adequacy_ratio)
                     (not (<= 200.0 capital_adequacy_ratio)))
                2
                (ite (<= 200.0 capital_adequacy_ratio) 1 0))))
(let ((a!2 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio))
                     (<= 0.0 net_worth_ratio)
                     (not (<= 2.0 net_worth_ratio)))
                3
                a!1)))
(let ((a!3 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:capital_severely_insufficient_measures_executed] 資本嚴重不足等級(4)應採取之措施已執行
(assert (= capital_severely_insufficient_measures_executed level_4_measures_executed))

; [insurance:capital_significantly_insufficient_measures_executed] 資本顯著不足等級(3)應採取之措施已執行
(assert (= capital_significantly_insufficient_measures_executed
   level_3_measures_executed))

; [insurance:capital_insufficient_measures_executed] 資本不足等級(2)應採取之措施已執行
(assert (= capital_insufficient_measures_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:supervisory_action_required] 需主管機關監管、接管、勒令停業清理或命令解散
(assert (let ((a!1 (or (and (not (<= 4 capital_level)) (not (<= capital_level 0)))
               (= 2 capital_level))))
  (= supervisory_action_required
     (or (and (= 3 capital_level)
              (not capital_significantly_insufficient_measures_executed))
         (and financial_or_business_condition_deteriorated
              cannot_fulfill_contract)
         (and financial_or_business_condition_deteriorated cannot_pay_debts)
         (and a!1 (not capital_insufficient_measures_executed))
         (and (= 4 capital_level)
              (not capital_severely_insufficient_measures_executed))
         (and financial_or_business_condition_deteriorated
              risk_to_insured_rights)))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反相關條文或未執行資本不足等級措施或財務狀況惡化時處罰
(assert (= penalty
   (or (and (= 3 capital_level)
            (not capital_significantly_insufficient_measures_executed))
       violation_148_2_2
       violation_148_2_1
       violation_148_3_2
       (and financial_or_business_condition_deteriorated
            (or cannot_fulfill_contract risk_to_insured_rights cannot_pay_debts))
       (and (= 4 capital_level)
            (not capital_severely_insufficient_measures_executed))
       violation_148_3_1
       violation_148_1_2
       (and (= 2 capital_level) (not capital_insufficient_measures_executed)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_148_1_2 true))
(assert (= violation_148_2_1 true))
(assert (= violation_148_2_2 false))
(assert (= violation_148_3_1 true))
(assert (= violation_148_3_2 true))
(assert (= not_provide_explanation_doc false))
(assert (= explanation_doc_not_according_to_rules false))
(assert (= explanation_doc_false false))
(assert (= not_report_to_authority_in_time false))
(assert (= not_proactively_disclose false))
(assert (= report_or_disclosure_false false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= audit_system_established false))
(assert (= audit_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio 3.0))
(assert (= capital_level 0))
(assert (= capital_insufficient_measures_executed false))
(assert (= capital_significantly_insufficient_measures_executed false))
(assert (= capital_severely_insufficient_measures_executed false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= level_3_measures_executed false))
(assert (= level_4_measures_executed false))
(assert (= financial_or_business_condition_deteriorated false))
(assert (= cannot_pay_debts false))
(assert (= cannot_fulfill_contract false))
(assert (= risk_to_insured_rights false))
(assert (= penalty true))
(assert (= supervisory_action_required false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 35
; Total facts: 34
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

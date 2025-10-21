; SMT2 file generated from compliance case automatic
; Case ID: case_121
; Generated at: 2025-10-21T02:16:36.790698
;
; This file can be executed with Z3:
;   z3 case_121.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_insufficient_measures_executed Bool)
(declare-const capital_level Int)
(declare-const capital_severe_insufficient_measures_done Bool)
(declare-const capital_severe_insufficient_measures_executed Bool)
(declare-const capital_significant_insufficient_measures_done Bool)
(declare-const capital_significant_insufficient_measures_executed Bool)
(declare-const explanation_document_compliant Bool)
(declare-const explanation_document_provided Bool)
(declare-const explanation_document_truthful Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const public_explanation_provided Bool)
(declare-const report_content_truthful Bool)
(declare-const reported_to_authority_on_time Bool)
(declare-const sales_and_underwriting_rules_executed Bool)
(declare-const supervision_measures_enforced Bool)
(declare-const supervision_measures_taken Bool)
(declare-const violate_148_1_1_or_2 Bool)
(declare-const violate_148_1_2 Bool)
(declare-const violate_148_2_1 Bool)
(declare-const violate_148_2_2 Bool)
(declare-const violate_148_3_1 Bool)
(declare-const violate_148_3_2 Bool)
(declare-const violate_sales_and_underwriting_rules Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violate_148_1_2] 違反第一百四十八條之一第一項或第二項規定
(assert (= violate_148_1_2 violate_148_1_1_or_2))

; [insurance:violate_148_2_1] 違反第一百四十八條之二第一項規定，未提供說明文件供查閱、或所提供之說明文件未依規定記載、或所提供之說明文件記載不實
(assert (= violate_148_2_1
   (or (not explanation_document_truthful)
       (not explanation_document_compliant)
       (not explanation_document_provided))))

; [insurance:violate_148_2_2] 違反第一百四十八條之二第二項規定，未依限向主管機關報告或主動公開說明，或向主管機關報告或公開說明之內容不實
(assert (= violate_148_2_2
   (or (not public_explanation_provided)
       (not reported_to_authority_on_time)
       (not report_content_truthful))))

; [insurance:violate_148_3_1] 違反第一百四十八條之三第一項規定，未建立或未執行內部控制或稽核制度
(assert (= violate_148_3_1
   (or (not internal_control_established) (not internal_control_executed))))

; [insurance:violate_148_3_2] 違反第一百四十八條之三第二項規定，未建立或未執行內部處理制度或程序
(assert (= violate_148_3_2
   (or (not internal_handling_established) (not internal_handling_executed))))

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
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

; [insurance:capital_severe_insufficient_measures_executed] 資本嚴重不足等級措施已執行
(assert (= capital_severe_insufficient_measures_executed
   capital_severe_insufficient_measures_done))

; [insurance:capital_significant_insufficient_measures_executed] 資本顯著不足等級措施已執行
(assert (= capital_significant_insufficient_measures_executed
   capital_significant_insufficient_measures_done))

; [insurance:capital_insufficient_measures_executed] 資本不足等級措施已執行
(assert (= capital_insufficient_measures_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:supervision_measures_taken] 主管機關已對違反法令或有礙健全經營之虞保險業採取監管措施
(assert (= supervision_measures_taken supervision_measures_enforced))

; [insurance:violate_sales_and_underwriting_rules] 未確實執行招攬、核保及理賠處理制度及程序
(assert (not (= sales_and_underwriting_rules_executed
        violate_sales_and_underwriting_rules)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反相關條文規定或資本不足且未執行對應措施時處罰
(assert (= penalty
   (or violate_148_2_1
       violate_148_2_2
       violate_148_1_2
       (and (= 4 capital_level)
            (not capital_severe_insufficient_measures_executed))
       violate_148_3_2
       (and (= 2 capital_level) (not capital_insufficient_measures_executed))
       violate_148_3_1
       (and (= 3 capital_level)
            (not capital_significant_insufficient_measures_executed))
       violate_sales_and_underwriting_rules)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 50.0))
(assert (= net_worth_ratio (/ 3.0 2.0)))
(assert (= capital_level 3))
(assert (= capital_significant_insufficient_measures_done false))
(assert (= capital_significant_insufficient_measures_executed false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= explanation_document_provided false))
(assert (= explanation_document_compliant false))
(assert (= explanation_document_truthful false))
(assert (= reported_to_authority_on_time false))
(assert (= public_explanation_provided false))
(assert (= report_content_truthful false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= sales_and_underwriting_rules_executed false))
(assert (= violate_148_1_2 true))
(assert (= violate_148_2_1 true))
(assert (= violate_148_2_2 true))
(assert (= violate_148_3_1 true))
(assert (= violate_148_3_2 true))
(assert (= violate_sales_and_underwriting_rules true))
(assert (= violate_148_1_1_or_2 true))
(assert (= penalty true))
(assert (= supervision_measures_enforced true))
(assert (= supervision_measures_taken true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 32
; Total facts: 29
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

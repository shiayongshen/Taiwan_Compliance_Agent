; SMT2 file generated from compliance case automatic
; Case ID: case_108
; Generated at: 2025-10-19T08:15:25.349922
;
; This file can be executed with Z3:
;   z3 case_108.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_insufficient_measures_executed Bool)
(declare-const capital_insufficient_measures_executed_flag Bool)
(declare-const capital_level Int)
(declare-const capital_severely_insufficient_measures_executed Bool)
(declare-const capital_severely_insufficient_measures_executed_flag Bool)
(declare-const capital_significantly_insufficient_measures_executed Bool)
(declare-const capital_significantly_insufficient_measures_executed_flag Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const penalty_171_1 Bool)
(declare-const penalty_171_2 Bool)
(declare-const penalty_171_3 Bool)
(declare-const penalty_171_4 Bool)
(declare-const penalty_171_5 Bool)
(declare-const violate_148_1_2 Bool)
(declare-const violate_148_1_2_flag Bool)
(declare-const violate_148_2_1 Bool)
(declare-const violate_148_2_1_flag Bool)
(declare-const violate_148_2_2 Bool)
(declare-const violate_148_2_2_flag Bool)
(declare-const violate_148_3_1 Bool)
(declare-const violate_148_3_1_flag Bool)
(declare-const violate_148_3_2 Bool)
(declare-const violate_148_3_2_flag Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未分類）
(assert (let ((a!1 (or (and (not (<= 2.0 net_worth_ratio)) (<= 0.0 net_worth_ratio))
               (and (<= 50.0 capital_adequacy_ratio)
                    (not (<= 150.0 capital_adequacy_ratio)))))
      (a!2 (or (and (<= 150.0 capital_adequacy_ratio)
                    (not (<= 200.0 capital_adequacy_ratio)))
               (and (not (<= 3.0 net_worth_ratio)) (<= 2.0 net_worth_ratio)))))
(let ((a!3 (ite a!1 3 (ite a!2 2 (ite (<= 200.0 capital_adequacy_ratio) 1 0)))))
(let ((a!4 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                a!3)))
  (= capital_level a!4)))))

; [insurance:violate_148_1_2] 違反第一百四十八條之一第一項或第二項規定
(assert (= violate_148_1_2 violate_148_1_2_flag))

; [insurance:violate_148_2_1] 違反第一百四十八條之二第一項規定（未提供說明文件、文件未依規定記載或記載不實）
(assert (= violate_148_2_1 violate_148_2_1_flag))

; [insurance:violate_148_2_2] 違反第一百四十八條之二第二項規定（未依限報告或公開說明，或內容不實）
(assert (= violate_148_2_2 violate_148_2_2_flag))

; [insurance:violate_148_3_1] 違反第一百四十八條之三第一項規定（未建立或未執行內部控制或稽核制度）
(assert (= violate_148_3_1 violate_148_3_1_flag))

; [insurance:violate_148_3_2] 違反第一百四十八條之三第二項規定（未建立或未執行內部處理制度或程序）
(assert (= violate_148_3_2 violate_148_3_2_flag))

; [insurance:penalty_171_1] 違反第148-1條規定處罰（罰鍰60萬以上600萬）
(assert (= penalty_171_1 violate_148_1_2))

; [insurance:penalty_171_2] 違反第148-2條第一項規定處罰（罰鍰60萬以上600萬）
(assert (= penalty_171_2 violate_148_2_1))

; [insurance:penalty_171_3] 違反第148-2條第二項規定處罰（罰鍰30萬以上300萬）
(assert (= penalty_171_3 violate_148_2_2))

; [insurance:penalty_171_4] 違反第148-3條第一項規定處罰（罰鍰60萬以上1200萬）
(assert (= penalty_171_4 violate_148_3_1))

; [insurance:penalty_171_5] 違反第148-3條第二項規定處罰（罰鍰60萬以上1200萬）
(assert (= penalty_171_5 violate_148_3_2))

; [insurance:capital_insufficient_measures_executed] 資本不足等級措施已執行
(assert (= capital_insufficient_measures_executed
   capital_insufficient_measures_executed_flag))

; [insurance:capital_significantly_insufficient_measures_executed] 資本顯著不足等級措施已執行
(assert (= capital_significantly_insufficient_measures_executed
   capital_significantly_insufficient_measures_executed_flag))

; [insurance:capital_severely_insufficient_measures_executed] 資本嚴重不足等級措施已執行
(assert (= capital_severely_insufficient_measures_executed
   capital_severely_insufficient_measures_executed_flag))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反第171-1條規定或違反第148-1、148-2、148-3條規定，或資本不足等級未執行對應措施時處罰
(assert (= penalty
   (or penalty_171_1
       penalty_171_3
       penalty_171_4
       penalty_171_5
       (and (= 3 capital_level)
            (not capital_significantly_insufficient_measures_executed))
       (and (= 2 capital_level) (not capital_insufficient_measures_executed))
       penalty_171_2
       (and (= 4 capital_level)
            (not capital_severely_insufficient_measures_executed)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 180.0))
(assert (= net_worth 500.0))
(assert (= net_worth_ratio (/ 5.0 2.0)))
(assert (= violate_148_3_1_flag true))
(assert (= violate_148_3_1 true))
(assert (= violate_148_1_2_flag false))
(assert (= violate_148_1_2 false))
(assert (= violate_148_2_1_flag false))
(assert (= violate_148_2_1 false))
(assert (= violate_148_2_2_flag false))
(assert (= violate_148_2_2 false))
(assert (= violate_148_3_2_flag false))
(assert (= violate_148_3_2 false))
(assert (= penalty_171_4 true))
(assert (= penalty_171_1 false))
(assert (= penalty_171_2 false))
(assert (= penalty_171_3 false))
(assert (= penalty_171_5 false))
(assert (= capital_insufficient_measures_executed_flag false))
(assert (= capital_insufficient_measures_executed false))
(assert (= capital_significantly_insufficient_measures_executed_flag false))
(assert (= capital_significantly_insufficient_measures_executed false))
(assert (= capital_severely_insufficient_measures_executed_flag false))
(assert (= capital_severely_insufficient_measures_executed false))
(assert (= capital_level 0))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 16
; Total variables: 26
; Total facts: 26
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

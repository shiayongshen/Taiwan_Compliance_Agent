; SMT2 file generated from compliance case automatic
; Case ID: case_120
; Generated at: 2025-10-21T02:14:40.584022
;
; This file can be executed with Z3:
;   z3 case_120.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_insufficient_measures_executed Bool)
(declare-const capital_level Int)
(declare-const capital_severely_insufficient_measures_executed Bool)
(declare-const capital_significantly_insufficient_measures_executed Bool)
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
(declare-const net_worth_ratio_prev Real)
(declare-const penalty Bool)
(declare-const public_explanation_made Bool)
(declare-const report_content_truthful Bool)
(declare-const report_to_authority_on_time Bool)
(declare-const responsible_person_duty_suspended Bool)
(declare-const responsible_person_removed Bool)
(declare-const special_asset_disposal_approved Bool)
(declare-const supervisory_measures_taken Bool)
(declare-const violate_148_1_2 Bool)
(declare-const violate_148_1_2_flag Bool)
(declare-const violate_148_2_1 Bool)
(declare-const violate_148_2_2 Bool)
(declare-const violate_148_3_1 Bool)
(declare-const violate_148_3_2 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 保險業資本等級分類（1=資本適足, 2=資本不足, 3=資本顯著不足, 4=資本嚴重不足）
(assert (let ((a!1 (or (and (<= 150.0 capital_adequacy_ratio)
                    (not (<= 200.0 capital_adequacy_ratio)))
               (and (not (<= 3.0 net_worth_ratio)) (<= 2.0 net_worth_ratio))))
      (a!2 (ite (and (<= 200.0 capital_adequacy_ratio)
                     (or (<= 3.0 net_worth_ratio) (<= 3.0 net_worth_ratio_prev)))
                1
                0)))
(let ((a!3 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio))
                     (<= 0.0 net_worth_ratio)
                     (not (<= 2.0 net_worth_ratio)))
                3
                (ite a!1 2 a!2))))
(let ((a!4 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                a!3)))
  (= capital_level a!4)))))

; [insurance:violate_148_1_2] 違反保險法第148條之一第一項或第二項規定
(assert (= violate_148_1_2 violate_148_1_2_flag))

; [insurance:violate_148_2_1] 違反保險法第148條之二第一項規定（未提供說明文件供查閱、或說明文件未依規定記載或記載不實）
(assert (= violate_148_2_1
   (or (not explanation_document_provided)
       (not explanation_document_truthful)
       (not explanation_document_compliant))))

; [insurance:violate_148_2_2] 違反保險法第148條之二第二項規定（未依限向主管機關報告或主動公開說明，或報告或公開說明內容不實）
(assert (= violate_148_2_2
   (or (not report_to_authority_on_time)
       (not public_explanation_made)
       (not report_content_truthful))))

; [insurance:violate_148_3_1] 違反保險法第148條之三第一項規定（未建立或未執行內部控制或稽核制度）
(assert (= violate_148_3_1
   (or (not internal_control_established) (not internal_control_executed))))

; [insurance:violate_148_3_2] 違反保險法第148條之三第二項規定（未建立或未執行內部處理制度或程序）
(assert (= violate_148_3_2
   (or (not internal_handling_established) (not internal_handling_executed))))

; [insurance:capital_insufficient_measures_executed] 資本不足等級2應採取之措施已執行
(assert (= capital_insufficient_measures_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:capital_significantly_insufficient_measures_executed] 資本顯著不足等級3應採取之措施已執行
(assert (= capital_significantly_insufficient_measures_executed
   (and capital_insufficient_measures_executed
        responsible_person_removed
        responsible_person_duty_suspended
        special_asset_disposal_approved)))

; [insurance:capital_severely_insufficient_measures_executed] 資本嚴重不足等級4應採取之措施已執行
(assert (= capital_severely_insufficient_measures_executed
   (and capital_significantly_insufficient_measures_executed
        supervisory_measures_taken)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一規定或資本不足且未執行對應措施時處罰
(assert (= penalty
   (or (and (= 3 capital_level)
            (not capital_significantly_insufficient_measures_executed))
       (and (= 4 capital_level)
            (not capital_severely_insufficient_measures_executed))
       violate_148_3_2
       violate_148_2_2
       violate_148_2_1
       violate_148_3_1
       violate_148_1_2
       (and (= 2 capital_level) (not capital_insufficient_measures_executed)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 45.0))
(assert (= net_worth_ratio (/ 3.0 2.0)))
(assert (= net_worth_ratio_prev (/ 3.0 2.0)))
(assert (= violate_148_1_2_flag true))
(assert (= violate_148_1_2 true))
(assert (= violate_148_2_1 true))
(assert (= violate_148_2_2 false))
(assert (= violate_148_3_1 false))
(assert (= violate_148_3_2 false))
(assert (= capital_level 4))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= capital_insufficient_measures_executed false))
(assert (= capital_significantly_insufficient_measures_executed false))
(assert (= capital_severely_insufficient_measures_executed false))
(assert (= explanation_document_provided false))
(assert (= explanation_document_compliant false))
(assert (= explanation_document_truthful false))
(assert (= report_to_authority_on_time true))
(assert (= public_explanation_made true))
(assert (= report_content_truthful true))
(assert (= internal_control_established true))
(assert (= internal_control_executed true))
(assert (= internal_handling_established true))
(assert (= internal_handling_executed true))
(assert (= responsible_person_removed false))
(assert (= responsible_person_duty_suspended false))
(assert (= special_asset_disposal_approved false))
(assert (= supervisory_measures_taken false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 11
; Total variables: 31
; Total facts: 29
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

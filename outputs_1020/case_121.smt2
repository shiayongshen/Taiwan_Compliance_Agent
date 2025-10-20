; SMT2 file generated from compliance case automatic
; Case ID: case_121
; Generated at: 2025-10-19T08:32:08.737009
;
; This file can be executed with Z3:
;   z3 case_121.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_execution_compliance Bool)
(declare-const business_execution_executed Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_increase_completed Bool)
(declare-const capital_level Int)
(declare-const capital_level_2_compliance Bool)
(declare-const capital_level_3_compliance Bool)
(declare-const capital_level_4_compliance Bool)
(declare-const explanation_document_compliant Bool)
(declare-const explanation_document_provided Bool)
(declare-const explanation_document_truthful Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_executed_flag Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const improvement_plan_submitted_flag Bool)
(declare-const internal_audit_established Bool)
(declare-const internal_audit_executed Bool)
(declare-const internal_control_and_audit_ok Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const merged Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const public_explanation_provided Bool)
(declare-const report_content_truthful Bool)
(declare-const reported_to_authority_on_time Bool)
(declare-const violate_148_1_1_or_2 Bool)
(declare-const violate_148_1_2 Bool)
(declare-const violate_148_2_1 Bool)
(declare-const violate_148_2_2 Bool)
(declare-const violate_148_3_1 Bool)
(declare-const violate_148_3_2 Bool)
(declare-const violate_149 Bool)
(declare-const violate_149_rule Bool)

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
   (or (not reported_to_authority_on_time)
       (not public_explanation_provided)
       (not report_content_truthful))))

; [insurance:violate_148_3_1] 違反第一百四十八條之三第一項規定，未建立或未執行內部控制或稽核制度
(assert (= violate_148_3_1
   (or (not internal_control_established)
       (not internal_control_executed)
       (not internal_audit_established)
       (not internal_audit_executed))))

; [insurance:violate_148_3_2] 違反第一百四十八條之三第二項規定，未建立或未執行內部處理制度或程序
(assert (= violate_148_3_2
   (or (not internal_handling_established) (not internal_handling_executed))))

; [insurance:violate_149] 違反保險法第149條規定，法令、章程或有礙健全經營之虞
(assert (= violate_149 violate_149_rule))

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
(let ((a!3 (ite (or (not (<= 50.0 capital_adequacy_ratio))
                    (not (<= 0.0 net_worth)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:improvement_plan_submitted] 已提交財務或業務改善計畫
(assert (= improvement_plan_submitted improvement_plan_submitted_flag))

; [insurance:improvement_plan_executed] 已執行財務或業務改善計畫
(assert (= improvement_plan_executed improvement_plan_executed_flag))

; [insurance:capital_level_4_compliance] 資本嚴重不足等級措施完成
(assert (= capital_level_4_compliance
   (and (= 4 capital_level)
        (or capital_increase_completed
            merged
            (and improvement_plan_submitted improvement_plan_executed)))))

; [insurance:capital_level_3_compliance] 資本顯著不足等級措施完成
(assert (= capital_level_3_compliance
   (and (= 3 capital_level)
        (or capital_increase_completed
            (and improvement_plan_submitted improvement_plan_executed)
            merged))))

; [insurance:capital_level_2_compliance] 資本不足等級措施完成
(assert (= capital_level_2_compliance
   (and (= 2 capital_level)
        improvement_plan_submitted
        improvement_plan_executed)))

; [insurance:internal_control_and_audit_ok] 內部控制及稽核制度已建立且執行
(assert (= internal_control_and_audit_ok
   (and internal_control_established
        internal_control_executed
        internal_audit_established
        internal_audit_executed)))

; [insurance:internal_handling_ok] 內部處理制度及程序已建立且執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [insurance:business_execution_compliance] 招攬、核保及理賠處理制度及程序確實執行
(assert (= business_execution_compliance business_execution_executed))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一規定時處罰
(assert (= penalty
   (or violate_148_2_2
       (not business_execution_compliance)
       (not internal_handling_ok)
       violate_149
       (and (= 3 capital_level) (not capital_level_3_compliance))
       violate_148_3_2
       violate_148_3_1
       (not internal_control_and_audit_ok)
       (and (= 4 capital_level) (not capital_level_4_compliance))
       (and (= 2 capital_level) (not capital_level_2_compliance))
       violate_148_2_1
       violate_148_1_2)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_148_1_2 true))
(assert (= violate_148_2_1 false))
(assert (= explanation_document_provided true))
(assert (= explanation_document_compliant true))
(assert (= explanation_document_truthful true))
(assert (= violate_148_2_2 false))
(assert (= reported_to_authority_on_time true))
(assert (= public_explanation_provided true))
(assert (= report_content_truthful true))
(assert (= violate_148_3_1 true))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_audit_established false))
(assert (= internal_audit_executed false))
(assert (= violate_148_3_2 true))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= violate_149 true))
(assert (= violate_149_rule true))
(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 1000000.0))
(assert (= net_worth_ratio 3.0))
(assert (= capital_level 1))
(assert (= capital_increase_completed false))
(assert (= improvement_plan_submitted_flag false))
(assert (= improvement_plan_executed_flag false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= capital_level_2_compliance false))
(assert (= capital_level_3_compliance false))
(assert (= capital_level_4_compliance false))
(assert (= merged false))
(assert (= internal_control_and_audit_ok false))
(assert (= internal_handling_ok false))
(assert (= business_execution_executed false))
(assert (= business_execution_compliance false))
(assert (= violate_148_1_1_or_2 true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 17
; Total variables: 38
; Total facts: 38
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

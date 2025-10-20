; SMT2 file generated from compliance case automatic
; Case ID: case_344
; Generated at: 2025-10-19T13:38:39.828407
;
; This file can be executed with Z3:
;   z3 case_344.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const adjustment_plan_completed Bool)
(declare-const adjustment_plan_violation_count Int)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_increase_or_improvement_completed Bool)
(declare-const capital_level Int)
(declare-const capital_level_2_measures_executed Bool)
(declare-const capital_level_3_measures_executed Bool)
(declare-const capital_level_3_measures_ok Bool)
(declare-const capital_level_4_measures_executed Bool)
(declare-const capital_level_4_measures_ok Bool)
(declare-const explanation_document_compliant Bool)
(declare-const explanation_document_provided Bool)
(declare-const explanation_document_truthful Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const foreign_investment_approval_ok Bool)
(declare-const foreign_investment_approval_revoked Bool)
(declare-const foreign_investment_approved Bool)
(declare-const funds_used_compliant Bool)
(declare-const improvement_plan_approved_and_executed Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const internal_audit_established Bool)
(declare-const internal_audit_executed Bool)
(declare-const internal_control_and_audit_ok Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const other_violation_or_risk Bool)
(declare-const penalty Bool)
(declare-const public_explanation_made Bool)
(declare-const reinsurance_compliance Bool)
(declare-const reinsurance_contract_compliant Bool)
(declare-const reinsurance_mechanism_compliant Bool)
(declare-const report_content_truthful Bool)
(declare-const reported_to_authority_on_time Bool)
(declare-const supervision_action_required Bool)
(declare-const supervision_penalty Bool)
(declare-const violate_148_1_1 Bool)
(declare-const violate_148_1_2 Bool)
(declare-const violate_148_2_1 Bool)
(declare-const violate_148_2_2 Bool)
(declare-const violate_148_3_1 Bool)
(declare-const violate_148_3_2 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violate_148_1_2] 違反第一百四十八條之一第一項或第二項規定
(assert (= violate_148_1_2 (or violate_148_1_1 violate_148_1_2)))

; [insurance:violate_148_2_1] 違反第一百四十八條之二第一項規定：未提供說明文件供查閱、或所提供之說明文件未依規定記載、或所提供之說明文件記載不實
(assert (= violate_148_2_1
   (or (not explanation_document_truthful)
       (not explanation_document_provided)
       (not explanation_document_compliant))))

; [insurance:violate_148_2_2] 違反第一百四十八條之二第二項規定：未依限向主管機關報告或主動公開說明，或向主管機關報告或公開說明內容不實
(assert (= violate_148_2_2
   (or (not reported_to_authority_on_time)
       (not report_content_truthful)
       (not public_explanation_made))))

; [insurance:violate_148_3_1] 違反第一百四十八條之三第一項規定：未建立或未執行內部控制或稽核制度
(assert (= violate_148_3_1
   (or (not internal_control_established)
       (not internal_control_executed)
       (not internal_audit_executed)
       (not internal_audit_established))))

; [insurance:violate_148_3_2] 違反第一百四十八條之三第二項規定：未建立或未執行內部處理制度或程序
(assert (= violate_148_3_2
   (or (not internal_handling_established) (not internal_handling_executed))))

; [insurance:supervision_action_required] 保險業違反法令、章程或有礙健全經營之虞時，主管機關得予以糾正或令其限期改善
(assert (= supervision_action_required
   (or violate_148_1_1
       violate_148_1_2
       violate_148_3_1
       violate_148_2_2
       other_violation_or_risk
       violate_148_2_1
       violate_148_3_2)))

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
(let ((a!3 (ite (or (not (<= 50.0 capital_adequacy_ratio))
                    (not (<= 0.0 net_worth)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:capital_level_4_measures_executed] 資本嚴重不足等級(4)應採取措施已執行
(assert (= capital_level_4_measures_executed capital_level_4_measures_ok))

; [insurance:capital_level_3_measures_executed] 資本顯著不足等級(3)應採取措施已執行
(assert (= capital_level_3_measures_executed capital_level_3_measures_ok))

; [insurance:capital_level_2_measures_executed] 資本不足等級(2)應採取措施已執行
(assert (= capital_level_2_measures_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:supervision_penalty_conditions] 處分條件：資本嚴重不足且未完成增資或改善計畫，或財務狀況惡化未改善
(assert (= supervision_penalty
   (or (and financial_or_business_deterioration
            (not improvement_plan_approved_and_executed))
       (and (= 4 capital_level) (not capital_increase_or_improvement_completed)))))

; [insurance:internal_control_and_audit_ok] 建立且執行內部控制及稽核制度
(assert (= internal_control_and_audit_ok
   (and internal_control_established
        internal_control_executed
        internal_audit_established
        internal_audit_executed)))

; [insurance:internal_handling_ok] 建立且執行內部處理制度及程序
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [insurance:reinsurance_compliance] 再保險分出分入及其他危險分散機制符合規定
(assert (= reinsurance_compliance
   (and reinsurance_mechanism_compliant reinsurance_contract_compliant)))

; [insurance:foreign_investment_approval_ok] 國外投資額度核准且符合相關規定
(assert (= foreign_investment_approval_ok
   (and foreign_investment_approved
        funds_used_compliant
        adjustment_plan_completed)))

; [insurance:foreign_investment_approval_revoked] 國外投資額度核准被廢止
(assert (= foreign_investment_approval_revoked
   (or (not foreign_investment_approval_ok)
       (not (<= adjustment_plan_violation_count 1)))))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反相關規定或未完成資本改善措施或未建立內部制度等
(assert (= penalty
   (or violate_148_1_1
       violate_148_1_2
       violate_148_3_1
       violate_148_2_2
       (not reinsurance_compliance)
       (not internal_control_and_audit_ok)
       (not internal_handling_ok)
       violate_148_2_1
       (and (= 2 capital_level) (not capital_level_2_measures_executed))
       violate_148_3_2
       foreign_investment_approval_revoked
       (and (= 3 capital_level) (not capital_level_3_measures_executed))
       (and (= 4 capital_level) (not capital_level_4_measures_executed)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_148_3_2 true))
(assert (= violate_148_3_1 false))
(assert (= violate_148_1_1 false))
(assert (= violate_148_1_2 false))
(assert (= violate_148_2_1 false))
(assert (= violate_148_2_2 false))
(assert (= explanation_document_provided true))
(assert (= explanation_document_compliant true))
(assert (= explanation_document_truthful true))
(assert (= reported_to_authority_on_time true))
(assert (= public_explanation_made true))
(assert (= report_content_truthful true))
(assert (= internal_control_established true))
(assert (= internal_control_executed true))
(assert (= internal_audit_established true))
(assert (= internal_audit_executed true))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= other_violation_or_risk true))
(assert (= supervision_action_required true))
(assert (= capital_adequacy_ratio 200.0))
(assert (= net_worth_ratio 2.0))
(assert (= net_worth 100.0))
(assert (= capital_level 1))
(assert (= capital_level_2_measures_executed true))
(assert (= improvement_plan_submitted true))
(assert (= improvement_plan_executed false))
(assert (= capital_increase_or_improvement_completed false))
(assert (= financial_or_business_deterioration false))
(assert (= improvement_plan_approved_and_executed false))
(assert (= capital_level_3_measures_executed true))
(assert (= capital_level_4_measures_executed true))
(assert (= capital_level_3_measures_ok true))
(assert (= capital_level_4_measures_ok true))
(assert (= adjustment_plan_completed true))
(assert (= adjustment_plan_violation_count 0))
(assert (= foreign_investment_approved true))
(assert (= foreign_investment_approval_ok true))
(assert (= funds_used_compliant true))
(assert (= foreign_investment_approval_revoked false))
(assert (= internal_control_and_audit_ok true))
(assert (= internal_handling_ok false))
(assert (= reinsurance_mechanism_compliant true))
(assert (= reinsurance_contract_compliant true))
(assert (= reinsurance_compliance true))
(assert (= penalty true))
(assert (= supervision_penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 18
; Total variables: 47
; Total facts: 47
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

; SMT2 file generated from compliance case automatic
; Case ID: case_75
; Generated at: 2025-10-21T00:50:27.454312
;
; This file can be executed with Z3:
;   z3 case_75.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_conduct_compliance Bool)
(declare-const business_conduct_executed Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const capital_level_2_3_deterioration Bool)
(declare-const capital_level_4_noncompliance Bool)
(declare-const capital_level_4_remedial_completed Bool)
(declare-const compliance_internal_control_and_handling Bool)
(declare-const customer_age_over_65 Bool)
(declare-const explanation_document_compliant Bool)
(declare-const explanation_document_provided Bool)
(declare-const explanation_document_truthful Bool)
(declare-const financial_business_deterioration_accelerated Bool)
(declare-const financial_business_deterioration_unimproved Bool)
(declare-const financial_business_improvement_approved Bool)
(declare-const internal_control_and_audit_ok Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const investment_product_risk_assessed Bool)
(declare-const investment_product_sales_recorded Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const penalty_171_1 Bool)
(declare-const public_explanation_made Bool)
(declare-const report_content_truthful Bool)
(declare-const reported_to_authority_on_time Bool)
(declare-const risk_assessment_completed Bool)
(declare-const risk_level Int)
(declare-const sales_process_recorded Bool)
(declare-const sales_process_reviewed Bool)
(declare-const supervision_measures_required Bool)
(declare-const violate_148_1_2 Bool)
(declare-const violate_148_1_2_flag Bool)
(declare-const violate_148_2_1 Bool)
(declare-const violate_148_2_2 Bool)
(declare-const violate_148_3_1 Bool)
(declare-const violate_148_3_2 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violate_148_1_2] 違反第一百四十八條之一第一項或第二項規定
(assert (= violate_148_1_2 violate_148_1_2_flag))

; [insurance:violate_148_2_1] 違反第一百四十八條之二第一項規定（未提供說明文件、文件未依規定記載或記載不實）
(assert (= violate_148_2_1
   (or (not explanation_document_compliant)
       (not explanation_document_provided)
       (not explanation_document_truthful))))

; [insurance:violate_148_2_2] 違反第一百四十八條之二第二項規定（未依限報告或公開說明，或報告內容不實）
(assert (= violate_148_2_2
   (or (not report_content_truthful)
       (not public_explanation_made)
       (not reported_to_authority_on_time))))

; [insurance:violate_148_3_1] 違反第一百四十八條之三第一項規定（未建立或未執行內部控制或稽核制度）
(assert (= violate_148_3_1
   (or (not internal_control_established) (not internal_control_executed))))

; [insurance:violate_148_3_2] 違反第一百四十八條之三第二項規定（未建立或未執行內部處理制度或程序）
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
(let ((a!3 (ite (or (not (<= 50.0 capital_adequacy_ratio))
                    (not (<= 0.0 net_worth)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:capital_level_4_noncompliance] 資本嚴重不足且未依主管機關規定期限完成增資、改善計畫或合併
(assert (= capital_level_4_noncompliance
   (and (= 4 capital_level) (not capital_level_4_remedial_completed))))

; [insurance:capital_level_2_3_deterioration] 資本等級非嚴重不足但財務或業務狀況顯著惡化且未改善
(assert (= capital_level_2_3_deterioration
   (and (or (= 3 capital_level) (= 2 capital_level))
        (not financial_business_improvement_approved)
        (or financial_business_deterioration_accelerated
            financial_business_deterioration_unimproved))))

; [insurance:supervision_measures_required] 主管機關得為監管、接管、勒令停業清理或命令解散之處分
(assert (= supervision_measures_required
   (or capital_level_2_3_deterioration capital_level_4_noncompliance)))

; [insurance:internal_control_and_audit_ok] 建立且執行內部控制及稽核制度
(assert (= internal_control_and_audit_ok
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_ok] 建立且執行內部處理制度及程序
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [insurance:compliance_internal_control_and_handling] 內部控制及稽核制度與內部處理制度均符合規定
(assert (= compliance_internal_control_and_handling
   (and internal_control_and_audit_ok internal_handling_ok)))

; [insurance:business_conduct_compliance] 招攬、核保及理賠制度及程序確實執行
(assert (= business_conduct_compliance business_conduct_executed))

; [insurance:investment_product_sales_recorded] 六十五歲以上客戶投資型保險商品銷售過程錄音錄影或電子設備留存並覆審
(assert (= investment_product_sales_recorded
   (and customer_age_over_65 sales_process_recorded sales_process_reviewed)))

; [insurance:investment_product_risk_assessed] 六十五歲以上客戶投資型保險商品風險承受能力評估及分級
(assert (= investment_product_risk_assessed
   (and customer_age_over_65 risk_assessment_completed (<= 1 risk_level))))

; [insurance:noncompliance_penalty_171_1] 違反第171-1條規定之罰鍰條件
(assert (= penalty_171_1
   (or violate_148_1_2
       violate_148_2_1
       violate_148_2_2
       violate_148_3_1
       violate_148_3_2)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反第171-1條任一規定時處罰
(assert (= penalty penalty_171_1))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_148_1_2_flag true))
(assert (= violate_148_1_2 true))
(assert (= violate_148_2_1 false))
(assert (= violate_148_2_2 false))
(assert (= violate_148_3_1 false))
(assert (= violate_148_3_2 true))
(assert (= business_conduct_executed false))
(assert (= business_conduct_compliance false))
(assert (= internal_control_established true))
(assert (= internal_control_executed true))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= compliance_internal_control_and_handling false))
(assert (= capital_adequacy_ratio 180.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio (/ 5.0 2.0)))
(assert (= capital_level 2))
(assert (= capital_level_4_remedial_completed false))
(assert (= capital_level_4_noncompliance false))
(assert (= capital_level_2_3_deterioration false))
(assert (= financial_business_improvement_approved false))
(assert (= financial_business_deterioration_accelerated false))
(assert (= financial_business_deterioration_unimproved false))
(assert (= customer_age_over_65 true))
(assert (= sales_process_recorded false))
(assert (= sales_process_reviewed false))
(assert (= investment_product_sales_recorded false))
(assert (= risk_assessment_completed false))
(assert (= investment_product_risk_assessed false))
(assert (= reported_to_authority_on_time true))
(assert (= public_explanation_made true))
(assert (= report_content_truthful true))
(assert (= explanation_document_provided true))
(assert (= explanation_document_compliant true))
(assert (= explanation_document_truthful true))
(assert (= penalty_171_1 true))
(assert (= penalty true))
(assert (= risk_level 0))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 18
; Total variables: 41
; Total facts: 38
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

; SMT2 file generated from compliance case automatic
; Case ID: case_301
; Generated at: 2025-10-21T06:41:36.728854
;
; This file can be executed with Z3:
;   z3 case_301.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const actuary_assigned Bool)
(declare-const actuary_employed Bool)
(declare-const actuary_reports_fair_and_true Bool)
(declare-const annual_audit_plan_executed Bool)
(declare-const board_and_management_evaluated_internal_control Bool)
(declare-const board_approval_for_actuary Bool)
(declare-const board_approved_external_actuary Bool)
(declare-const board_approved_signing_actuary Bool)
(declare-const contract_accounting_handling_specified Bool)
(declare-const contract_insolvency_handling_specified Bool)
(declare-const contract_other_mandated_items_specified Bool)
(declare-const contract_risk_scope_specified Bool)
(declare-const contract_termination_conditions_specified Bool)
(declare-const deficiencies_and_anomalies_improved Bool)
(declare-const external_actuary_hired Bool)
(declare-const external_actuary_report_fair_and_true Bool)
(declare-const external_actuary_review_executed Bool)
(declare-const external_actuary_reviewed Bool)
(declare-const financial_and_business_disclosure_compliant Bool)
(declare-const financial_business_documents_prepared Bool)
(declare-const insurance_amount Real)
(declare-const insurance_product_approval_and_disclosure Bool)
(declare-const insurance_product_approved_or_filed Bool)
(declare-const insurance_product_information_publicly_available Bool)
(declare-const insurance_product_review_compliant Bool)
(declare-const insurance_product_review_procedures_followed Bool)
(declare-const insurance_rate_collected_accordingly Bool)
(declare-const insurance_rate_compliance Bool)
(declare-const insurance_rate_set_by_authority Bool)
(declare-const insured_object_market_value Real)
(declare-const internal_audit_manual_compiled Bool)
(declare-const internal_audit_organization_planned Bool)
(declare-const internal_audit_plan_and_execution Bool)
(declare-const internal_audit_report_format_compliant Bool)
(declare-const internal_audit_report_handled_and_stored Bool)
(declare-const internal_audit_report_handling Bool)
(declare-const internal_audit_review_and_improvement Bool)
(declare-const internal_audit_review_done Bool)
(declare-const internal_control_audit_and_evaluation_done Bool)
(declare-const internal_control_effectiveness_evaluated Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_established_and_executed Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_statement_issued Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_established_and_executed Bool)
(declare-const internal_handling_executed Bool)
(declare-const intra_group_reinsurance_risk_management_compliant Bool)
(declare-const major_information_publicly_disclosed Bool)
(declare-const major_information_reported_within_2_days Bool)
(declare-const over_insurance_prohibited Bool)
(declare-const penalty Bool)
(declare-const reinsurance_business_compliant Bool)
(declare-const reinsurance_compliance Bool)
(declare-const reinsurance_contract_content_compliant Bool)
(declare-const reinsurance_in_risk_management_compliant Bool)
(declare-const reinsurance_out_risk_management_compliant Bool)
(declare-const reinsurance_risk_management_plan_compliant Bool)
(declare-const required_documents_submitted Bool)
(declare-const retention_risk_management_compliant Bool)
(declare-const self_audit_supervised Bool)
(declare-const signing_actuary_assigned Bool)
(declare-const signing_actuary_report_fair_and_true Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:over_insurance_prohibited] 保險金額不得超過保險標的物市價
(assert (= over_insurance_prohibited (<= insurance_amount insured_object_market_value)))

; [insurance:actuary_assigned] 聘用精算人員並指派簽證精算人員
(assert (= actuary_assigned (and actuary_employed signing_actuary_assigned)))

; [insurance:external_actuary_reviewed] 聘請外部複核精算人員並執行複核
(assert (= external_actuary_reviewed
   (and external_actuary_hired external_actuary_review_executed)))

; [insurance:board_approval_for_actuary] 董（理）事會同意簽證精算人員指派及外部複核精算人員聘請
(assert (= board_approval_for_actuary
   (and board_approved_signing_actuary board_approved_external_actuary)))

; [insurance:actuary_reports_fair_and_true] 簽證精算人員及外部複核精算人員報告內容公正且無虛偽錯誤
(assert (= actuary_reports_fair_and_true
   (and signing_actuary_report_fair_and_true
        external_actuary_report_fair_and_true)))

; [insurance:internal_control_established_and_executed] 建立並執行內部控制及稽核制度
(assert (= internal_control_established_and_executed
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_established_and_executed] 建立並執行內部處理制度及程序
(assert (= internal_handling_established_and_executed
   (and internal_handling_established internal_handling_executed)))

; [insurance:reinsurance_compliance] 再保險分出、分入及其他危險分散機制符合主管機關規定
(assert (= reinsurance_compliance reinsurance_business_compliant))

; [insurance:reinsurance_contract_content_compliant] 再保險契約內容符合規定事項
(assert (= reinsurance_contract_content_compliant
   (and contract_risk_scope_specified
        contract_termination_conditions_specified
        contract_insolvency_handling_specified
        contract_accounting_handling_specified
        contract_other_mandated_items_specified)))

; [insurance:financial_and_business_disclosure_compliant] 依規定編製說明文件並公開重大訊息
(assert (= financial_and_business_disclosure_compliant
   (and financial_business_documents_prepared
        major_information_reported_within_2_days
        major_information_publicly_disclosed)))

; [insurance:insurance_product_review_compliant] 保險商品銷售前程序符合主管機關規定
(assert (= insurance_product_review_compliant
   (and insurance_product_review_procedures_followed
        required_documents_submitted)))

; [insurance:insurance_product_approval_and_disclosure] 保險商品經主管機關核准或備查並公開必要資料
(assert (= insurance_product_approval_and_disclosure
   (and insurance_product_approved_or_filed
        insurance_product_information_publicly_available)))

; [insurance:insurance_rate_compliance] 保險費率依主管機關規定訂定及計收
(assert (= insurance_rate_compliance
   (and insurance_rate_set_by_authority insurance_rate_collected_accordingly)))

; [insurance:reinsurance_risk_management_plan_compliant] 再保險風險管理計畫符合規定並執行
(assert (= reinsurance_risk_management_plan_compliant
   (and retention_risk_management_compliant
        reinsurance_out_risk_management_compliant
        reinsurance_in_risk_management_compliant
        intra_group_reinsurance_risk_management_compliant)))

; [insurance:internal_audit_organization_planned] 規劃內部稽核組織、編制與職掌並編撰工作手冊
(assert (= internal_audit_organization_planned
   (and internal_audit_organization_planned internal_audit_manual_compiled)))

; [insurance:internal_audit_plan_and_execution] 執行年度稽核計畫及內部控制查核評估
(assert (= internal_audit_plan_and_execution
   (and annual_audit_plan_executed internal_control_audit_and_evaluation_done)))

; [insurance:internal_audit_report_handling] 內部稽核報告格式、處理及保存符合規定
(assert (= internal_audit_report_handling
   (and internal_audit_report_format_compliant
        internal_audit_report_handled_and_stored)))

; [insurance:internal_audit_review_and_improvement] 督促自行查核並覆核，改善缺失及異常事項
(assert (= internal_audit_review_and_improvement
   (and self_audit_supervised
        internal_audit_review_done
        deficiencies_and_anomalies_improved)))

; [insurance:internal_control_effectiveness_evaluated] 董（理）事會及相關主管評估內部控制制度有效性並出具聲明書
(assert (= internal_control_effectiveness_evaluated
   (and board_and_management_evaluated_internal_control
        internal_control_statement_issued)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一法定規定時處罰
(assert (= penalty
   (or (not internal_audit_review_and_improvement)
       (not reinsurance_risk_management_plan_compliant)
       (not financial_and_business_disclosure_compliant)
       (not insurance_rate_compliance)
       (not actuary_assigned)
       (not over_insurance_prohibited)
       (not internal_audit_report_handling)
       (not external_actuary_reviewed)
       (not insurance_product_approval_and_disclosure)
       (not internal_handling_established_and_executed)
       (not internal_audit_plan_and_execution)
       (not internal_control_established_and_executed)
       (not reinsurance_contract_content_compliant)
       (not board_approval_for_actuary)
       (not reinsurance_compliance)
       (not internal_control_effectiveness_evaluated)
       (not insurance_product_review_compliant)
       (not internal_audit_organization_planned)
       (not actuary_reports_fair_and_true))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= over_insurance_prohibited false))
(assert (= actuary_employed false))
(assert (= signing_actuary_assigned false))
(assert (= external_actuary_hired false))
(assert (= external_actuary_review_executed false))
(assert (= board_approved_signing_actuary false))
(assert (= board_approved_external_actuary false))
(assert (= signing_actuary_report_fair_and_true false))
(assert (= external_actuary_report_fair_and_true false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= reinsurance_business_compliant false))
(assert (= contract_risk_scope_specified false))
(assert (= contract_termination_conditions_specified false))
(assert (= contract_insolvency_handling_specified false))
(assert (= contract_accounting_handling_specified false))
(assert (= contract_other_mandated_items_specified false))
(assert (= financial_business_documents_prepared false))
(assert (= major_information_reported_within_2_days false))
(assert (= major_information_publicly_disclosed false))
(assert (= insurance_product_review_procedures_followed false))
(assert (= required_documents_submitted false))
(assert (= insurance_product_approved_or_filed false))
(assert (= insurance_product_information_publicly_available false))
(assert (= insurance_rate_set_by_authority false))
(assert (= insurance_rate_collected_accordingly false))
(assert (= retention_risk_management_compliant false))
(assert (= reinsurance_out_risk_management_compliant false))
(assert (= reinsurance_in_risk_management_compliant false))
(assert (= intra_group_reinsurance_risk_management_compliant false))
(assert (= internal_audit_organization_planned false))
(assert (= internal_audit_manual_compiled false))
(assert (= annual_audit_plan_executed false))
(assert (= internal_control_audit_and_evaluation_done false))
(assert (= internal_audit_report_format_compliant false))
(assert (= internal_audit_report_handled_and_stored false))
(assert (= self_audit_supervised false))
(assert (= internal_audit_review_done false))
(assert (= deficiencies_and_anomalies_improved false))
(assert (= board_and_management_evaluated_internal_control false))
(assert (= internal_control_statement_issued false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 21
; Total variables: 63
; Total facts: 43
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

; SMT2 file generated from compliance case automatic
; Case ID: case_304
; Generated at: 2025-10-19T12:38:44.008458
;
; This file can be executed with Z3:
;   z3 case_304.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const act_144_actuarial_staff_assigned Bool)
(declare-const act_144_board_approval_obtained Bool)
(declare-const act_144_external_review_engaged Bool)
(declare-const act_144_reports_fair_and_true Bool)
(declare-const act_148_3_internal_control_established Bool)
(declare-const act_148_3_internal_handling_established Bool)
(declare-const act_171_1_violation_148_3_1_2 Bool)
(declare-const act_171_violation_144_145 Bool)
(declare-const act_171_violation_144_5 Bool)
(declare-const actuarial_staff_hired Bool)
(declare-const approval_days_since_complete_application Int)
(declare-const audit_confirmed_fee_adjustment_compliance Bool)
(declare-const board_approval_obtained Bool)
(declare-const chief_auditor_statement_issued Bool)
(declare-const claims_cannot_review_own_underwriting Bool)
(declare-const claims_procedures_executed Bool)
(declare-const claims_process_defined Bool)
(declare-const claims_prohibited_practices Bool)
(declare-const claims_staff Bool)
(declare-const claims_staff_qualified Bool)
(declare-const claims_system_compliance Bool)
(declare-const claims_training_completed Bool)
(declare-const decision_days_since_complete_application Int)
(declare-const execute_sales_underwriting_claims_procedures Bool)
(declare-const explanation_provided Bool)
(declare-const external_review_actuarial_staff_hired Bool)
(declare-const external_review_report_fair_and_true Bool)
(declare-const filing_days_after_sales_start Int)
(declare-const guaranteed_renewal_rate_audit Bool)
(declare-const guaranteed_renewal_rate_increased Bool)
(declare-const guaranteed_renewal_rate_notification Bool)
(declare-const insurance_product_approved Bool)
(declare-const insurance_product_filed Bool)
(declare-const insurance_product_modification_review Bool)
(declare-const insurance_sales_approval_or_filing Bool)
(declare-const insurance_sales_approval_timing Bool)
(declare-const insurance_sales_reapproval_timing Bool)
(declare-const internal_control_and_audit_system_established Bool)
(declare-const internal_handling_system_established Bool)
(declare-const modification_is_major Bool)
(declare-const notification_sent_3_months_before Bool)
(declare-const penalty Bool)
(declare-const reapproval_days_since_complete_application Int)
(declare-const reapproval_decision_days_since_complete_application Int)
(declare-const review_own_solicited_cases Bool)
(declare-const review_own_underwriting_within_3_years Bool)
(declare-const sales_procedures_executed Bool)
(declare-const signing_actuarial_staff_assigned Bool)
(declare-const signing_report_fair_and_true Bool)
(declare-const staff_cannot_review_own_cases Bool)
(declare-const staff_has_claims_qualification Bool)
(declare-const staff_has_underwriting_qualification Bool)
(declare-const staff_is_underwriting_or_claims Bool)
(declare-const staff_performs_both_roles Bool)
(declare-const underwriting_claims_staff_exclusive Bool)
(declare-const underwriting_documents_retained Bool)
(declare-const underwriting_policies_compliant Bool)
(declare-const underwriting_procedures_executed Bool)
(declare-const underwriting_process_defined Bool)
(declare-const underwriting_prohibited_practices Bool)
(declare-const underwriting_staff_qualified Bool)
(declare-const underwriting_system_compliance Bool)
(declare-const underwriting_training_completed Bool)
(declare-const violate_act_144_1_to_4_or_145 Bool)
(declare-const violate_act_144_5 Bool)
(declare-const violate_act_148_3_1 Bool)
(declare-const violate_act_148_3_2 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:act_144_actuarial_staff_assigned] 保險業聘用精算人員並指派簽證精算人員
(assert (= act_144_actuarial_staff_assigned
   (and actuarial_staff_hired signing_actuarial_staff_assigned)))

; [insurance:act_144_external_review_engaged] 保險業聘請外部複核精算人員
(assert (= act_144_external_review_engaged external_review_actuarial_staff_hired))

; [insurance:act_144_board_approval_obtained] 簽證精算人員指派及外部複核精算人員聘請經董（理）事會同意
(assert (= act_144_board_approval_obtained
   (and signing_actuarial_staff_assigned
        external_review_actuarial_staff_hired
        board_approval_obtained)))

; [insurance:act_144_reports_fair_and_true] 簽證及複核報告內容公正公平且無虛偽隱匿遺漏錯誤
(assert (= act_144_reports_fair_and_true
   (and signing_report_fair_and_true external_review_report_fair_and_true)))

; [insurance:act_148_3_internal_control_established] 保險業建立內部控制及稽核制度
(assert (= act_148_3_internal_control_established
   internal_control_and_audit_system_established))

; [insurance:act_148_3_internal_handling_established] 保險業建立內部處理制度及程序
(assert (= act_148_3_internal_handling_established internal_handling_system_established))

; [insurance:act_171_violation_144_145] 違反第144條第一項至第四項或第145條規定
(assert (= act_171_violation_144_145 violate_act_144_1_to_4_or_145))

; [insurance:act_171_violation_144_5] 簽證精算人員或外部複核精算人員違反第144條第五項規定
(assert (= act_171_violation_144_5 violate_act_144_5))

; [insurance:act_171_1_violation_148_3_1_2] 違反第148條之三第一項或第二項規定
(assert (= act_171_1_violation_148_3_1_2 (or violate_act_148_3_1 violate_act_148_3_2)))

; [insurance:insurance_sales_approval_or_filing] 保險商品銷售前完成核准或備查程序
(assert (= insurance_sales_approval_or_filing
   (or insurance_product_approved
       (and insurance_product_filed (>= 15 filing_days_after_sales_start)))))

; [insurance:insurance_sales_approval_timing] 主管機關於收齊申請文件後40工作日內核復，75工作日內准駁決定
(assert (= insurance_sales_approval_timing
   (and (>= 40 approval_days_since_complete_application)
        (>= 75 decision_days_since_complete_application))))

; [insurance:insurance_sales_reapproval_timing] 駁回後30工作日內再次送審，主管機關25工作日內核復，45工作日內准駁決定
(assert (= insurance_sales_reapproval_timing
   (and (>= 25 reapproval_days_since_complete_application)
        (>= 45 reapproval_decision_days_since_complete_application))))

; [insurance:insurance_product_modification_review] 保險商品修改重大變更應依核准程序辦理，非重大變更適用備查程序
(assert insurance_product_modification_review)

; [insurance:guaranteed_renewal_rate_notification] 保證續保個人健康保險商品調高續保費率應提前三個月通知要保人並說明
(assert (= guaranteed_renewal_rate_notification
   (or (not guaranteed_renewal_rate_increased)
       (and guaranteed_renewal_rate_increased
            notification_sent_3_months_before
            explanation_provided))))

; [insurance:guaranteed_renewal_rate_audit] 稽核單位查核保證續保費率調整規定是否落實並由總稽核出具聲明書
(assert (= guaranteed_renewal_rate_audit
   (and audit_confirmed_fee_adjustment_compliance
        chief_auditor_statement_issued)))

; [insurance:underwriting_system_compliance] 保險業建立符合規定之核保處理制度及程序
(assert (= underwriting_system_compliance
   (and underwriting_staff_qualified
        underwriting_training_completed
        underwriting_process_defined
        underwriting_policies_compliant
        underwriting_documents_retained
        (not underwriting_prohibited_practices))))

; [insurance:claims_system_compliance] 保險業建立符合規定之理賠處理制度及程序
(assert (= claims_system_compliance
   (and claims_staff_qualified
        claims_training_completed
        claims_process_defined
        (not claims_prohibited_practices))))

; [insurance:underwriting_claims_staff_exclusive] 同時具有核保及理賠人員資格者僅得擇一擔任
(assert (not (= (and staff_has_underwriting_qualification
             staff_has_claims_qualification
             staff_performs_both_roles)
        underwriting_claims_staff_exclusive)))

; [insurance:claims_cannot_review_own_underwriting] 理賠人員不得對三年內核保簽署案件執行理賠審核或簽署
(assert (not (= (and claims_staff review_own_underwriting_within_3_years)
        claims_cannot_review_own_underwriting)))

; [insurance:staff_cannot_review_own_cases] 核保或理賠人員不得對其招攬案件執行核保或理賠審核或簽署
(assert (not (= (and staff_is_underwriting_or_claims review_own_solicited_cases)
        staff_cannot_review_own_cases)))

; [insurance:execute_sales_underwriting_claims_procedures] 保險業確實執行招攬、核保及理賠處理制度及程序
(assert (= execute_sales_underwriting_claims_procedures
   (and sales_procedures_executed
        underwriting_procedures_executed
        claims_procedures_executed)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：違反相關法條規定時處罰
(assert (= penalty
   (or (not underwriting_system_compliance)
       (not act_148_3_internal_control_established)
       (not act_144_actuarial_staff_assigned)
       (not insurance_sales_approval_or_filing)
       (not staff_cannot_review_own_cases)
       (not act_144_reports_fair_and_true)
       (not insurance_sales_approval_timing)
       (not execute_sales_underwriting_claims_procedures)
       (not act_148_3_internal_handling_established)
       (not guaranteed_renewal_rate_notification)
       (not claims_system_compliance)
       act_171_violation_144_5
       act_171_violation_144_145
       (not guaranteed_renewal_rate_audit)
       (not underwriting_claims_staff_exclusive)
       act_171_1_violation_148_3_1_2
       (not act_144_board_approval_obtained)
       (not claims_cannot_review_own_underwriting)
       (not insurance_sales_reapproval_timing)
       (not act_144_external_review_engaged))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= act_144_actuarial_staff_assigned true))
(assert (= act_144_board_approval_obtained true))
(assert (= act_144_external_review_engaged true))
(assert (= act_144_reports_fair_and_true true))
(assert (= act_148_3_internal_control_established true))
(assert (= act_148_3_internal_handling_established true))
(assert (= act_171_1_violation_148_3_1_2 true))
(assert (= act_171_violation_144_145 true))
(assert (= act_171_violation_144_5 true))
(assert (= actuarial_staff_hired true))
(assert (= approval_days_since_complete_application 7))
(assert (= audit_confirmed_fee_adjustment_compliance false))
(assert (= board_approval_obtained true))
(assert (= chief_auditor_statement_issued false))
(assert (= claims_cannot_review_own_underwriting false))
(assert (= claims_procedures_executed false))
(assert (= claims_process_defined false))
(assert (= claims_prohibited_practices true))
(assert (= claims_staff true))
(assert (= claims_staff_qualified false))
(assert (= claims_system_compliance false))
(assert (= claims_training_completed false))
(assert (= decision_days_since_complete_application 7))
(assert (= execute_sales_underwriting_claims_procedures false))
(assert (= explanation_provided false))
(assert (= external_review_actuarial_staff_hired true))
(assert (= external_review_report_fair_and_true true))
(assert (= filing_days_after_sales_start 7))
(assert (= guaranteed_renewal_rate_audit false))
(assert (= guaranteed_renewal_rate_increased false))
(assert (= guaranteed_renewal_rate_notification false))
(assert (= insurance_product_approved false))
(assert (= insurance_product_filed false))
(assert (= insurance_product_modification_review false))
(assert (= insurance_sales_approval_or_filing false))
(assert (= insurance_sales_approval_timing false))
(assert (= insurance_sales_reapproval_timing false))
(assert (= internal_control_and_audit_system_established true))
(assert (= internal_handling_system_established true))
(assert (= modification_is_major false))
(assert (= notification_sent_3_months_before false))
(assert (= penalty true))
(assert (= reapproval_days_since_complete_application 7))
(assert (= reapproval_decision_days_since_complete_application 7))
(assert (= review_own_solicited_cases true))
(assert (= review_own_underwriting_within_3_years true))
(assert (= sales_procedures_executed false))
(assert (= signing_actuarial_staff_assigned true))
(assert (= signing_report_fair_and_true true))
(assert (= staff_cannot_review_own_cases false))
(assert (= staff_has_claims_qualification true))
(assert (= staff_has_underwriting_qualification true))
(assert (= staff_is_underwriting_or_claims true))
(assert (= staff_performs_both_roles true))
(assert (= underwriting_claims_staff_exclusive false))
(assert (= underwriting_documents_retained false))
(assert (= underwriting_policies_compliant false))
(assert (= underwriting_procedures_executed false))
(assert (= underwriting_process_defined false))
(assert (= underwriting_prohibited_practices true))
(assert (= underwriting_staff_qualified false))
(assert (= underwriting_system_compliance false))
(assert (= underwriting_training_completed false))
(assert (= violate_act_144_1_to_4_or_145 true))
(assert (= violate_act_144_5 true))
(assert (= violate_act_148_3_1 true))
(assert (= violate_act_148_3_2 true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 23
; Total variables: 67
; Total facts: 67
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

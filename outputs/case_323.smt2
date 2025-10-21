; SMT2 file generated from compliance case automatic
; Case ID: case_323
; Generated at: 2025-10-21T07:15:24.695017
;
; This file can be executed with Z3:
;   z3 case_323.smt2
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
(declare-const act_171_1_violation_internal_control Bool)
(declare-const act_171_1_violation_internal_handling Bool)
(declare-const actuarial_staff_hired Bool)
(declare-const actuarial_staff_reviewed Bool)
(declare-const claims_staff_reviewed Bool)
(declare-const customer_appropriateness_confirmed Bool)
(declare-const external_review_actuary_hired Bool)
(declare-const external_review_board_approved Bool)
(declare-const external_review_report_fair Bool)
(declare-const financial_underwriting_mechanism_established Bool)
(declare-const general_manager_reviewed Bool)
(declare-const internal_business_procedures_compliant Bool)
(declare-const internal_control_established Bool)
(declare-const internal_handling_established Bool)
(declare-const internet_only_insurer_restrictions Bool)
(declare-const investment_staff_reviewed Bool)
(declare-const legal_staff_reviewed Bool)
(declare-const no_brokers Bool)
(declare-const no_insurance_agents Bool)
(declare-const no_misleading_sales_practices Bool)
(declare-const no_prohibited_practices Bool)
(declare-const no_unfair_treatment Bool)
(declare-const penalty Bool)
(declare-const personal_data_protection_compliant Bool)
(declare-const policy_service_staff_reviewed Bool)
(declare-const product_sales_review_responsibilities Bool)
(declare-const recording_and_review_compliant Bool)
(declare-const risk_management_staff_reviewed Bool)
(declare-const risk_reporting_mechanism_established Bool)
(declare-const signing_actuary_assigned Bool)
(declare-const signing_actuary_board_approved Bool)
(declare-const signing_actuary_report_fair Bool)
(declare-const underwriting_documents_retained Bool)
(declare-const underwriting_evaluation_performed Bool)
(declare-const underwriting_procedure_compliance Bool)
(declare-const underwriting_signature_valid Bool)
(declare-const underwriting_staff_qualified Bool)
(declare-const underwriting_staff_reviewed Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:act_144_actuarial_staff_assigned] 保險業聘用精算人員並指派簽證精算人員
(assert (= act_144_actuarial_staff_assigned
   (and actuarial_staff_hired signing_actuary_assigned)))

; [insurance:act_144_external_review_engaged] 保險業聘請外部複核精算人員
(assert (= act_144_external_review_engaged external_review_actuary_hired))

; [insurance:act_144_board_approval_obtained] 簽證精算人員指派及外部複核精算人員聘請經董（理）事會同意
(assert (= act_144_board_approval_obtained
   (and signing_actuary_board_approved external_review_board_approved)))

; [insurance:act_144_reports_fair_and_true] 簽證報告及複核報告內容公正且無虛偽隱匿遺漏錯誤
(assert (= act_144_reports_fair_and_true
   (and signing_actuary_report_fair external_review_report_fair)))

; [insurance:act_148_3_internal_control_established] 保險業建立內部控制及稽核制度
(assert (= act_148_3_internal_control_established internal_control_established))

; [insurance:act_148_3_internal_handling_established] 保險業建立內部處理制度及程序
(assert (= act_148_3_internal_handling_established internal_handling_established))

; [insurance:act_171_1_violation_internal_control] 違反第148-3條第一項規定，未建立或未執行內部控制或稽核制度
(assert (not (= internal_control_established act_171_1_violation_internal_control)))

; [insurance:act_171_1_violation_internal_handling] 違反第148-3條第二項規定，未建立或未執行內部處理制度或程序
(assert (not (= internal_handling_established act_171_1_violation_internal_handling)))

; [insurance:product_sales_review_responsibilities] 保險商品銷售前各職務負責檢視及審核事項
(assert (= product_sales_review_responsibilities
   (and general_manager_reviewed
        underwriting_staff_reviewed
        claims_staff_reviewed
        actuarial_staff_reviewed
        policy_service_staff_reviewed
        legal_staff_reviewed
        investment_staff_reviewed
        risk_management_staff_reviewed)))

; [insurance:underwriting_procedure_compliance] 保險業訂定核保處理制度及程序並符合規定
(assert (= underwriting_procedure_compliance
   (and underwriting_staff_qualified
        underwriting_evaluation_performed
        underwriting_signature_valid
        underwriting_documents_retained
        financial_underwriting_mechanism_established
        risk_reporting_mechanism_established
        personal_data_protection_compliant
        no_unfair_treatment
        no_prohibited_practices)))

; [insurance:internet_only_insurer_restrictions] 純網路保險公司不得有保險業務員及相關限制
(assert (= internet_only_insurer_restrictions
   (and no_insurance_agents
        no_brokers
        internal_business_procedures_compliant
        no_misleading_sales_practices
        customer_appropriateness_confirmed
        recording_and_review_compliant)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反法定內部控制、內部處理制度或程序、簽證報告不實、核保程序不符規定、純網路保險公司違規等情形時處罰
(assert (= penalty
   (or (not act_148_3_internal_control_established)
       (not act_144_external_review_engaged)
       (not act_144_reports_fair_and_true)
       (not act_144_board_approval_obtained)
       (not underwriting_procedure_compliance)
       (not internet_only_insurer_restrictions)
       (not act_148_3_internal_handling_established)
       (not act_144_actuarial_staff_assigned))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= actuarial_staff_hired false))
(assert (= signing_actuary_assigned false))
(assert (= external_review_actuary_hired false))
(assert (= signing_actuary_board_approved false))
(assert (= external_review_board_approved false))
(assert (= signing_actuary_report_fair false))
(assert (= external_review_report_fair false))
(assert (= internal_control_established false))
(assert (= internal_handling_established false))
(assert (= underwriting_staff_qualified false))
(assert (= underwriting_evaluation_performed false))
(assert (= underwriting_signature_valid false))
(assert (= underwriting_documents_retained false))
(assert (= financial_underwriting_mechanism_established false))
(assert (= risk_reporting_mechanism_established false))
(assert (= personal_data_protection_compliant false))
(assert (= no_unfair_treatment false))
(assert (= no_prohibited_practices false))
(assert (= general_manager_reviewed false))
(assert (= underwriting_staff_reviewed false))
(assert (= claims_staff_reviewed false))
(assert (= actuarial_staff_reviewed false))
(assert (= policy_service_staff_reviewed false))
(assert (= legal_staff_reviewed false))
(assert (= investment_staff_reviewed false))
(assert (= risk_management_staff_reviewed false))
(assert (= no_insurance_agents true))
(assert (= no_brokers true))
(assert (= internal_business_procedures_compliant false))
(assert (= no_misleading_sales_practices false))
(assert (= customer_appropriateness_confirmed false))
(assert (= recording_and_review_compliant false))
(assert (= internet_only_insurer_restrictions false))
(assert (= act_144_actuarial_staff_assigned false))
(assert (= act_144_external_review_engaged false))
(assert (= act_144_board_approval_obtained false))
(assert (= act_144_reports_fair_and_true false))
(assert (= act_148_3_internal_control_established false))
(assert (= act_148_3_internal_handling_established false))
(assert (= underwriting_procedure_compliance false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 44
; Total facts: 41
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

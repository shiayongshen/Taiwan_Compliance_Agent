; SMT2 file generated from compliance case automatic
; Case ID: case_81
; Generated at: 2025-10-19T07:27:02.427276
;
; This file can be executed with Z3:
;   z3 case_81.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const act_144_board_approval Bool)
(declare-const act_144_compliance Bool)
(declare-const act_144_designated_signing_actuary Bool)
(declare-const act_144_employed_actuary Bool)
(declare-const act_144_fair_and_honest_reports Bool)
(declare-const act_144_hired_external_review_actuary Bool)
(declare-const act_145_compliance Bool)
(declare-const act_148_3_compliance Bool)
(declare-const act_171_1_violation Bool)
(declare-const act_171_5_violation Bool)
(declare-const act_171_violation Bool)
(declare-const actuarial_data_verified Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const documents_complete_or_corrected Bool)
(declare-const documents_printed Bool)
(declare-const evaluation_consistent_with_assessment Bool)
(declare-const financial_underwriting_and_reporting_procedures_followed Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const no_damaging_behavior_to_clients Bool)
(declare-const no_false_statements Bool)
(declare-const no_important_omissions Bool)
(declare-const no_major_errors Bool)
(declare-const no_unfair_treatment_of_disabled Bool)
(declare-const no_unqualified_personnel_performing_underwriting Bool)
(declare-const not_rejected_three_times Bool)
(declare-const penalty Bool)
(declare-const product_design_completed Bool)
(declare-const product_information_disclosed Bool)
(declare-const product_management_meeting_held Bool)
(declare-const product_preparation_completed Bool)
(declare-const product_review_completed Bool)
(declare-const proper_documentation_and_signatures Bool)
(declare-const risk_assessment_and_premium_calculation_based_on_actuarial_data Bool)
(declare-const risk_control_and_reinsurance_arranged Bool)
(declare-const sales_document_integrity Bool)
(declare-const sales_preparation_compliance Bool)
(declare-const senior_customer_education_and_training Bool)
(declare-const senior_customer_follow_up_and_care_done Bool)
(declare-const senior_customer_product_suitability_assessed Bool)
(declare-const senior_customer_protection Bool)
(declare-const senior_customer_recording_and_review_done Bool)
(declare-const signed_by_authorized_personnel Bool)
(declare-const solicitation_and_underwriting_compliance Bool)
(declare-const solicitation_system_established Bool)
(declare-const source_of_premium_funds_assessed Bool)
(declare-const submission_method_compliant Bool)
(declare-const system_setup_and_testing_done Bool)
(declare-const training_conducted Bool)
(declare-const underwriting_policies_followed Bool)
(declare-const underwriting_system_established Bool)
(declare-const underwriting_training_completed Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 保險業資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
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

; [insurance:act_144_compliance] 符合保險法第144條聘用及指派精算人員及外部複核精算人員規定
(assert (= act_144_compliance
   (and act_144_employed_actuary
        act_144_designated_signing_actuary
        act_144_hired_external_review_actuary
        act_144_board_approval
        act_144_fair_and_honest_reports)))

; [insurance:act_148_3_compliance] 符合保險法第148-3條建立內部控制及內部處理制度規定
(assert (= act_148_3_compliance
   (and internal_control_established
        internal_control_executed
        internal_handling_established
        internal_handling_executed)))

; [insurance:act_171_violation] 違反保險法第171條第144條第一項至第四項及第145條規定
(assert (= act_171_violation (or (not act_144_compliance) (not act_145_compliance))))

; [insurance:act_171_5_violation] 違反保險法第171條第144條第五項簽證精算人員及外部複核精算人員規定
(assert (not (= act_144_fair_and_honest_reports act_171_5_violation)))

; [insurance:act_171_1_violation] 違反保險法第171-1條第148-3條內部控制及內部處理制度規定
(assert (= act_171_1_violation
   (or (not internal_control_established)
       (not internal_control_executed)
       (not internal_handling_established)
       (not internal_handling_executed))))

; [insurance:sales_preparation_compliance] 保險商品銷售前程序符合規定
(assert (= sales_preparation_compliance
   (and product_design_completed
        product_review_completed
        product_preparation_completed
        product_management_meeting_held
        product_information_disclosed
        actuarial_data_verified
        risk_control_and_reinsurance_arranged
        system_setup_and_testing_done
        documents_printed
        training_conducted
        evaluation_consistent_with_assessment)))

; [insurance:sales_document_integrity] 保險商品送審資料無重大錯誤、不實或缺漏
(assert (= sales_document_integrity
   (and no_major_errors
        no_false_statements
        no_important_omissions
        signed_by_authorized_personnel
        submission_method_compliant
        documents_complete_or_corrected
        not_rejected_three_times)))

; [insurance:solicitation_and_underwriting_compliance] 保險業招攬及核保理賠制度符合規定
(assert (= solicitation_and_underwriting_compliance
   (and solicitation_system_established
        underwriting_system_established
        underwriting_training_completed
        underwriting_policies_followed
        risk_assessment_and_premium_calculation_based_on_actuarial_data
        no_unfair_treatment_of_disabled
        no_unqualified_personnel_performing_underwriting
        proper_documentation_and_signatures
        financial_underwriting_and_reporting_procedures_followed
        source_of_premium_funds_assessed
        no_damaging_behavior_to_clients)))

; [insurance:senior_customer_protection] 對六十五歲以上客戶提供適當保險商品及相關保護措施
(assert (= senior_customer_protection
   (and senior_customer_education_and_training
        senior_customer_product_suitability_assessed
        senior_customer_recording_and_review_done
        senior_customer_follow_up_and_care_done)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：違反保險法第144條聘用及指派精算人員規定或內部控制及處理制度規定，或保險商品銷售前程序不合規，或招攬及核保理賠制度不合規，或未對六十五歲以上客戶提供適當保護時處罰
(assert (= penalty
   (or (not act_144_compliance)
       (not sales_document_integrity)
       (not sales_preparation_compliance)
       (not solicitation_and_underwriting_compliance)
       (not senior_customer_protection)
       (not act_148_3_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= act_144_employed_actuary false))
(assert (= act_144_designated_signing_actuary false))
(assert (= act_144_hired_external_review_actuary false))
(assert (= act_144_board_approval false))
(assert (= act_144_fair_and_honest_reports false))
(assert (= act_145_compliance false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= product_design_completed false))
(assert (= product_review_completed false))
(assert (= product_preparation_completed false))
(assert (= product_management_meeting_held false))
(assert (= product_information_disclosed false))
(assert (= actuarial_data_verified false))
(assert (= risk_control_and_reinsurance_arranged false))
(assert (= system_setup_and_testing_done false))
(assert (= documents_printed false))
(assert (= training_conducted false))
(assert (= evaluation_consistent_with_assessment false))
(assert (= no_major_errors false))
(assert (= no_false_statements false))
(assert (= no_important_omissions false))
(assert (= signed_by_authorized_personnel false))
(assert (= submission_method_compliant false))
(assert (= documents_complete_or_corrected false))
(assert (= not_rejected_three_times false))
(assert (= solicitation_system_established false))
(assert (= underwriting_system_established false))
(assert (= underwriting_training_completed false))
(assert (= underwriting_policies_followed false))
(assert (= risk_assessment_and_premium_calculation_based_on_actuarial_data false))
(assert (= no_unfair_treatment_of_disabled false))
(assert (= no_unqualified_personnel_performing_underwriting false))
(assert (= proper_documentation_and_signatures false))
(assert (= financial_underwriting_and_reporting_procedures_followed false))
(assert (= source_of_premium_funds_assessed false))
(assert (= no_damaging_behavior_to_clients false))
(assert (= senior_customer_education_and_training false))
(assert (= senior_customer_product_suitability_assessed false))
(assert (= senior_customer_recording_and_review_done false))
(assert (= senior_customer_follow_up_and_care_done false))
(assert (= act_144_compliance false))
(assert (= act_148_3_compliance false))
(assert (= act_171_1_violation false))
(assert (= act_171_5_violation false))
(assert (= act_171_violation false))
(assert (= capital_adequacy_ratio 0.0))
(assert (= capital_level 0))
(assert (= net_worth 0.0))
(assert (= net_worth_ratio 0.0))
(assert (= penalty false))
(assert (= sales_document_integrity false))
(assert (= sales_preparation_compliance false))
(assert (= senior_customer_protection false))
(assert (= solicitation_and_underwriting_compliance false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 57
; Total facts: 57
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

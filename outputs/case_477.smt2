; SMT2 file generated from compliance case automatic
; Case ID: case_477
; Generated at: 2025-10-21T10:33:54.581457
;
; This file can be executed with Z3:
;   z3 case_477.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accounting_and_financial_reporting_compliance Bool)
(declare-const article_138_1_compliance Bool)
(declare-const article_138_2_2_compliance Bool)
(declare-const article_138_2_4_compliance Bool)
(declare-const article_138_2_5_compliance Bool)
(declare-const article_138_2_7_compliance Bool)
(declare-const article_138_3_1_3_compliance Bool)
(declare-const article_138_3_compliance Bool)
(declare-const article_138_5_compliance Bool)
(declare-const article_138_related_compliance Bool)
(declare-const article_143_5_compliance Bool)
(declare-const article_143_6_measures_compliance Bool)
(declare-const article_143_compliance Bool)
(declare-const article_144_1_4_compliance Bool)
(declare-const article_144_5_actuary_compliance Bool)
(declare-const article_145_compliance Bool)
(declare-const article_15_compliance Bool)
(declare-const article_18_1_compliance Bool)
(declare-const article_19_1_compliance Bool)
(declare-const article_19_2_compliance Bool)
(declare-const article_20_compliance Bool)
(declare-const article_45_4_compliance Bool)
(declare-const article_46_related_compliance Bool)
(declare-const article_47_1_compliance Bool)
(declare-const article_47_2_compliance Bool)
(declare-const article_8_compliance Bool)
(declare-const care_days Int)
(declare-const claim_handling_properly Bool)
(declare-const compensation_excludes_nhi_payment Bool)
(declare-const correct_record_and_claim_handling Bool)
(declare-const daily_care_fee Real)
(declare-const daily_meal_fee Real)
(declare-const daily_room_fee_difference Real)
(declare-const days_since_application_complete Int)
(declare-const days_since_resubmission Int)
(declare-const days_since_sales_start Int)
(declare-const dental_prosthesis_fee Real)
(declare-const dental_prosthesis_total_fee Real)
(declare-const insurance_payment_amount Real)
(declare-const insurance_product_review_approved Bool)
(declare-const insurance_product_review_timing_compliance Bool)
(declare-const loan_guarantee_and_limit_compliance Bool)
(declare-const loan_limit_and_resolution_compliance Bool)
(declare-const loan_without_sufficient_collateral_compliance Bool)
(declare-const medical_expense_components_limit Real)
(declare-const medical_expense_limit_per_victim_per_accident Real)
(declare-const ocular_prosthesis_fee Real)
(declare-const other_medical_materials_fee Real)
(declare-const penalty Bool)
(declare-const product_approved_by_authority Bool)
(declare-const product_filed_for_record Bool)
(declare-const product_not_requiring_approval Bool)
(declare-const prosthetic_upper_lower_limb_fee Real)
(declare-const special_compensation_excludes_nhi Bool)
(declare-const subrogation_amount Real)
(declare-const subrogation_limit Real)
(declare-const total_medical_expense_paid Real)
(declare-const transportation_fee Real)
(declare-const underwriting_data_recorded_correctly Bool)
(declare-const violation_article_138_2_and_others Bool)
(declare-const violation_article_138_and_related Bool)
(declare-const violation_article_143 Bool)
(declare-const violation_article_143_5_and_6_measures Bool)
(declare-const violation_article_144_145 Bool)
(declare-const violation_article_144_5_by_actuaries Bool)
(declare-const violation_article_15_19_or_article_46_related_record_claim_notify Bool)
(declare-const violation_article_18_or_20 Bool)
(declare-const violation_article_45_4_or_47_1_2_or_related_accounting Bool)
(declare-const violation_article_8 Bool)
(declare-const violation_fund_management_146_1_2_3_4_5 Bool)
(declare-const violation_fund_management_146_1_3_5_7_6_8 Bool)
(declare-const violation_fund_management_146_5_approval Bool)
(declare-const violation_fund_management_146_6_reporting Bool)
(declare-const violation_fund_management_146_9 Bool)
(declare-const violation_fund_management_and_investment Bool)
(declare-const violation_loan_guarantee_and_limit Bool)
(declare-const violation_loan_limit_and_resolution Bool)
(declare-const violation_loan_without_sufficient_collateral Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:correct_record_and_claim_handling] 保險人應正確記載承保資料及辦理理賠
(assert (= correct_record_and_claim_handling
   (and underwriting_data_recorded_correctly claim_handling_properly)))

; [insurance:violation_article_8] 違反第八條第一項規定
(assert (not (= article_8_compliance violation_article_8)))

; [insurance:violation_article_18_or_20] 違反第十八條第一項或第二十條規定
(assert (= violation_article_18_or_20
   (or (not article_18_1_compliance) (not article_20_compliance))))

; [insurance:violation_article_45_4_or_47_1_2_or_related_accounting] 違反第四十五條第四項、第四十七條第一項、第二項或相關會計處理及財務資料陳報規定
(assert (= violation_article_45_4_or_47_1_2_or_related_accounting
   (or (not article_47_2_compliance)
       (not article_45_4_compliance)
       (not article_47_1_compliance)
       (not accounting_and_financial_reporting_compliance))))

; [insurance:violation_article_15_19_or_article_46_related_record_claim_notify] 違反第十五條、第十九條第一項、第二項或依第四十六條所定辦法中有關正確記載承保資料、辦理理賠或第十五條通知方式之規定
(assert (= violation_article_15_19_or_article_46_related_record_claim_notify
   (or (not article_15_compliance)
       (not article_19_1_compliance)
       (not article_19_2_compliance)
       (not article_46_related_compliance))))

; [insurance:violation_article_144_145] 違反第一百四十四條第一項至第四項、第一百四十五條規定
(assert (= violation_article_144_145
   (or (not article_144_1_4_compliance) (not article_145_compliance))))

; [insurance:violation_article_144_5_by_actuaries] 簽證精算人員或外部複核精算人員違反第一百四十四條第五項規定
(assert (not (= article_144_5_actuary_compliance violation_article_144_5_by_actuaries)))

; [insurance:violation_article_138_and_related] 違反第一百三十八條第一項、第三項、第五項或相關業務範圍規定
(assert (= violation_article_138_and_related
   (or (not article_138_1_compliance)
       (not article_138_3_compliance)
       (not article_138_5_compliance)
       (not article_138_related_compliance))))

; [insurance:violation_article_138_2_and_others] 違反第一百三十八條之二第二項、第四項、第五項、第七項及相關規定
(assert (= violation_article_138_2_and_others
   (or (not article_138_2_2_compliance)
       (not article_138_2_4_compliance)
       (not article_138_2_5_compliance)
       (not article_138_2_7_compliance)
       (not article_138_3_1_3_compliance))))

; [insurance:violation_article_143] 違反第一百四十三條規定
(assert (not (= article_143_compliance violation_article_143)))

; [insurance:violation_article_143_5_and_6_measures] 違反第一百四十三條之五或主管機關依第一百四十三條之六各款規定所為措施
(assert (= violation_article_143_5_and_6_measures
   (or (not article_143_5_compliance) (not article_143_6_measures_compliance))))

; [insurance:violation_fund_management_and_investment] 違反保險業資金運用相關規定
(assert (= violation_fund_management_and_investment
   (or (not violation_fund_management_146_5_approval)
       (not violation_fund_management_146_1_2_3_4_5)
       (not violation_fund_management_146_6_reporting)
       (not violation_fund_management_146_1_3_5_7_6_8)
       (not violation_fund_management_146_9))))

; [insurance:violation_loan_without_sufficient_collateral] 依第一百四十六條之三第三項或第一百四十六條之八第一項規定所為放款無十足擔保或條件優於其他同類放款對象
(assert (not (= loan_without_sufficient_collateral_compliance
        violation_loan_without_sufficient_collateral)))

; [insurance:violation_loan_guarantee_and_limit] 擔保放款未經董事會三分之二以上董事出席及四分之三以上同意，或違反放款限額規定
(assert (not (= loan_guarantee_and_limit_compliance violation_loan_guarantee_and_limit)))

; [insurance:violation_loan_limit_and_resolution] 違反第一百四十六條之七第一項所定放款或其他交易限額規定，或決議程序規定
(assert (not (= loan_limit_and_resolution_compliance
        violation_loan_limit_and_resolution)))

; [insurance:insurance_product_review_approved] 保險商品核准審查程序完成
(assert (= insurance_product_review_approved
   (or product_approved_by_authority
       (and product_not_requiring_approval
            (>= 15 days_since_sales_start)
            product_filed_for_record))))

; [insurance:insurance_product_review_timing_compliance] 主管機關於規定期限內完成核復及准駁決定
(assert (= insurance_product_review_timing_compliance
   (or (and (>= 25 days_since_resubmission) (>= 45 days_since_resubmission))
       (and (>= 40 days_since_application_complete)
            (>= 75 days_since_application_complete)))))

; [insurance:medical_expense_limit_per_victim_per_accident] 每一受害人每一事故之傷害醫療費用給付總額限額
(assert (= medical_expense_limit_per_victim_per_accident
   (ite (>= 200000.0 total_medical_expense_paid) 1.0 0.0)))

; [insurance:medical_expense_components_limit] 醫療費用各項限額規定
(assert (= medical_expense_components_limit
   (ite (and (>= 1500.0 daily_room_fee_difference)
             (>= 180.0 daily_meal_fee)
             (>= 50000.0 prosthetic_upper_lower_limb_fee)
             (>= 10000.0 dental_prosthesis_fee)
             (>= 50000.0 dental_prosthesis_total_fee)
             (>= 10000.0 ocular_prosthesis_fee)
             (>= 20000.0 other_medical_materials_fee)
             (>= 20000.0 transportation_fee)
             (>= 1200.0 daily_care_fee)
             (>= 30 care_days))
        1.0
        0.0)))

; [insurance:subrogation_limit] 全民健康保險代位請求金額限額
(assert (let ((a!1 (ite (<= subrogation_amount
                    (+ 200000.0 (* (- 1.0) insurance_payment_amount)))
                1.0
                0.0)))
  (= subrogation_limit a!1)))

; [insurance:compensation_excludes_nhi_payment] 特別補償基金給付不包括全民健康保險給付金額
(assert (= compensation_excludes_nhi_payment special_compensation_excludes_nhi))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一規定時處罰
(assert (= penalty
   (or violation_article_18_or_20
       violation_loan_without_sufficient_collateral
       violation_article_144_5_by_actuaries
       violation_article_138_2_and_others
       violation_loan_guarantee_and_limit
       violation_fund_management_and_investment
       violation_article_15_19_or_article_46_related_record_claim_notify
       violation_loan_limit_and_resolution
       violation_article_138_and_related
       violation_article_45_4_or_47_1_2_or_related_accounting
       violation_article_143
       violation_article_144_145
       violation_article_8
       violation_article_143_5_and_6_measures)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= underwriting_data_recorded_correctly false))
(assert (= claim_handling_properly false))
(assert (= article_15_compliance false))
(assert (= article_46_related_compliance false))
(assert (= violation_article_15_19_or_article_46_related_record_claim_notify true))
(assert (= violation_article_8 true))
(assert (= article_8_compliance false))
(assert (= violation_fund_management_and_investment true))
(assert (= violation_fund_management_146_1_3_5_7_6_8 false))
(assert (= violation_fund_management_146_1_2_3_4_5 false))
(assert (= violation_fund_management_146_5_approval false))
(assert (= violation_fund_management_146_6_reporting false))
(assert (= violation_fund_management_146_9 false))
(assert (= violation_loan_guarantee_and_limit true))
(assert (= loan_guarantee_and_limit_compliance false))
(assert (= violation_article_138_2_and_others true))
(assert (= article_138_2_2_compliance false))
(assert (= article_138_2_4_compliance false))
(assert (= article_138_2_5_compliance false))
(assert (= article_138_2_7_compliance false))
(assert (= article_138_3_1_3_compliance false))
(assert (= violation_article_138_and_related true))
(assert (= article_138_1_compliance false))
(assert (= article_138_3_compliance false))
(assert (= article_138_5_compliance false))
(assert (= article_138_related_compliance false))
(assert (= accounting_and_financial_reporting_compliance false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 23
; Total variables: 78
; Total facts: 27
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

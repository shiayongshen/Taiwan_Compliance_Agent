; SMT2 file generated from compliance case automatic
; Case ID: case_477
; Generated at: 2025-10-19T16:54:14.689822
;
; This file can be executed with Z3:
;   z3 case_477.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accounting_and_financial_reporting_complied Bool)
(declare-const article_138_1_complied Bool)
(declare-const article_138_2_2_complied Bool)
(declare-const article_138_2_4_complied Bool)
(declare-const article_138_2_5_complied Bool)
(declare-const article_138_2_7_complied Bool)
(declare-const article_138_3_1_complied Bool)
(declare-const article_138_3_2_complied Bool)
(declare-const article_138_3_3_complied Bool)
(declare-const article_138_3_complied Bool)
(declare-const article_138_5_complied Bool)
(declare-const article_143_5_complied Bool)
(declare-const article_143_6_complied Bool)
(declare-const article_143_complied Bool)
(declare-const article_144_1_to_4_complied Bool)
(declare-const article_144_5_complied Bool)
(declare-const article_145_complied Bool)
(declare-const article_15_complied Bool)
(declare-const article_18_1_complied Bool)
(declare-const article_19_1_complied Bool)
(declare-const article_19_2_complied Bool)
(declare-const article_20_complied Bool)
(declare-const article_45_4_complied Bool)
(declare-const article_46_complied Bool)
(declare-const article_47_1_complied Bool)
(declare-const article_47_2_complied Bool)
(declare-const article_8_complied Bool)
(declare-const board_approval_obtained Bool)
(declare-const board_member_recusal_compliant Bool)
(declare-const bond_rating_substitution_compliant Bool)
(declare-const bond_rating_substitution_rule Bool)
(declare-const care_fee_days Int)
(declare-const claim_handling_properly Bool)
(declare-const compensation_excludes_nhi_payment Bool)
(declare-const compliance_article_138_2_and_others Bool)
(declare-const compliance_article_138_and_related Bool)
(declare-const compliance_article_143 Bool)
(declare-const compliance_article_143_5_and_6 Bool)
(declare-const compliance_article_144_145 Bool)
(declare-const compliance_article_144_5 Bool)
(declare-const compliance_article_146_1_2_3_5 Bool)
(declare-const compliance_article_146_1_3_5_7_6 Bool)
(declare-const compliance_article_146_2_1_2_4 Bool)
(declare-const compliance_article_146_3_1_2_4 Bool)
(declare-const compliance_article_146_4_1_2_3 Bool)
(declare-const compliance_article_146_5_1 Bool)
(declare-const compliance_article_146_5_3_4 Bool)
(declare-const compliance_article_146_6_1_2_3 Bool)
(declare-const compliance_article_146_8 Bool)
(declare-const compliance_article_146_9_1_2_3 Bool)
(declare-const compliance_article_15_19_46 Bool)
(declare-const compliance_article_18_20 Bool)
(declare-const compliance_article_45_47_and_related Bool)
(declare-const compliance_article_8 Bool)
(declare-const compliance_fund_management_and_investment Bool)
(declare-const compliance_loan_guarantee_and_limits Bool)
(declare-const control_and_affiliation_defined Bool)
(declare-const control_and_affiliation_definition Bool)
(declare-const correct_record_and_claim_handling Bool)
(declare-const credit_rating_agencies_definition Bool)
(declare-const daily_care_fee_expense Real)
(declare-const daily_meal_fee_expense Real)
(declare-const daily_room_fee_expense Real)
(declare-const days_after_sales_start Int)
(declare-const days_to_decision_after_resubmission Int)
(declare-const days_to_review_after_resubmission Int)
(declare-const dental_expense_per_tooth Real)
(declare-const dental_expense_total Real)
(declare-const domestic_credit_agencies_defined Bool)
(declare-const eye_prosthesis_expense_per_unit Real)
(declare-const foreign_bank_defined Bool)
(declare-const foreign_bank_definition Bool)
(declare-const foreign_branch_manager_approval_obtained Bool)
(declare-const foreign_branch_manager_board_approval Bool)
(declare-const foreign_credit_agencies_defined Bool)
(declare-const foreign_government_defined Bool)
(declare-const foreign_government_definition Bool)
(declare-const foreign_investment_allowed_securities Bool)
(declare-const foreign_real_estate_defined Bool)
(declare-const foreign_real_estate_definition Bool)
(declare-const insurance_payment_amount Real)
(declare-const insurance_payment_multiple_victims_separate Bool)
(declare-const insurance_payment_standard_effective_date Bool)
(declare-const insurance_payment_standard_follow_authority Bool)
(declare-const insurance_product_review_approved Bool)
(declare-const insurance_product_review_filed Bool)
(declare-const insurance_product_review_reapproval_timely Bool)
(declare-const internal_procedure_authorized Bool)
(declare-const investment_securities_compliant Bool)
(declare-const investment_total_calculation_compliant Bool)
(declare-const investment_total_calculation_method Bool)
(declare-const loan_guarantee_board_approval_complied Bool)
(declare-const loan_limit_and_resolution_complied Bool)
(declare-const loan_no_full_guarantee_complied Bool)
(declare-const major_penalties_defined Bool)
(declare-const major_penalties_definition Bool)
(declare-const medical_expense_care_fee_daily_limit Real)
(declare-const medical_expense_dental_limit Real)
(declare-const medical_expense_eye_prosthesis_limit Real)
(declare-const medical_expense_limit_per_person_per_accident Real)
(declare-const medical_expense_meal_fee_daily_limit Real)
(declare-const medical_expense_other_materials_limit Real)
(declare-const medical_expense_prosthesis_upper_limit Real)
(declare-const medical_expense_room_fee_daily_limit Real)
(declare-const medical_expense_transportation_limit Real)
(declare-const multiple_victims_payment_separate Bool)
(declare-const other_medical_materials_expense Real)
(declare-const payment_standard_effective_date_followed Bool)
(declare-const payment_standard_followed Bool)
(declare-const penalty Bool)
(declare-const product_approved Bool)
(declare-const product_filed Bool)
(declare-const prosthesis_expense_per_limb Real)
(declare-const related_party_transaction_board_approval Bool)
(declare-const related_party_transaction_compliant Bool)
(declare-const related_party_transaction_conditions Bool)
(declare-const related_party_transaction_exceptions Bool)
(declare-const related_party_transaction_exemptions Bool)
(declare-const related_party_transaction_single_transaction_limit Bool)
(declare-const single_transaction_limit_compliant Bool)
(declare-const special_compensation_excludes_nhi Bool)
(declare-const subrogation_amount Real)
(declare-const subrogation_limit Real)
(declare-const total_medical_expense_paid Real)
(declare-const transportation_expense Real)
(declare-const underwriting_data_recorded_correctly Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:correct_record_and_claim_handling] 保險人應正確記載承保資料及辦理理賠
(assert (= correct_record_and_claim_handling
   (and underwriting_data_recorded_correctly claim_handling_properly)))

; [insurance:compliance_article_8] 遵守保險法第8條第一項規定
(assert (= compliance_article_8 article_8_complied))

; [insurance:compliance_article_18_20] 遵守保險法第18條第一項及第二十條規定
(assert (= compliance_article_18_20 (and article_18_1_complied article_20_complied)))

; [insurance:compliance_article_45_47_and_related] 遵守保險法第45條第四項、第47條第一項、第二項及相關會計處理與財務資料陳報規定
(assert (= compliance_article_45_47_and_related
   (and article_45_4_complied
        article_47_1_complied
        article_47_2_complied
        accounting_and_financial_reporting_complied)))

; [insurance:compliance_article_15_19_and_46] 遵守保險法第15條、第19條第一項、第二項及第46條所定正確記載承保資料、理賠及通知方式規定
(assert (= compliance_article_15_19_46
   (and article_15_complied
        article_19_1_complied
        article_19_2_complied
        article_46_complied)))

; [insurance:compliance_article_144_145] 遵守保險法第144條第一項至第四項及第145條規定
(assert (= compliance_article_144_145
   (and article_144_1_to_4_complied article_145_complied)))

; [insurance:compliance_article_144_5] 保險業簽證精算人員或外部複核精算人員遵守保險法第144條第五項規定
(assert (= compliance_article_144_5 article_144_5_complied))

; [insurance:compliance_article_138_and_related] 遵守保險法第138條第一項、第三項、第五項及相關辦法規定
(assert (= compliance_article_138_and_related
   (and article_138_1_complied article_138_3_complied article_138_5_complied)))

; [insurance:compliance_article_138_2_and_others] 遵守保險法第138條之二第二項、第四項、第五項、第七項及第138條之三第一項、第二項、第三項規定
(assert (= compliance_article_138_2_and_others
   (and article_138_2_2_complied
        article_138_2_4_complied
        article_138_2_5_complied
        article_138_2_7_complied
        article_138_3_1_complied
        article_138_3_2_complied
        article_138_3_3_complied)))

; [insurance:compliance_article_143] 遵守保險法第143條規定
(assert (= compliance_article_143 article_143_complied))

; [insurance:compliance_article_143_5_and_6] 遵守保險法第143條之五及主管機關依第143條之六所為措施
(assert (= compliance_article_143_5_and_6
   (and article_143_5_complied article_143_6_complied)))

; [insurance:compliance_fund_management_and_investment] 遵守保險業資金運用相關規定
(assert (= compliance_fund_management_and_investment
   (and compliance_article_146_1_3_5_7_6
        compliance_article_146_8
        compliance_article_146_1_2_3_5
        compliance_article_146_5_3_4
        compliance_article_146_2_1_2_4
        compliance_article_146_3_1_2_4
        compliance_article_146_4_1_2_3
        compliance_article_146_5_1
        compliance_article_146_6_1_2_3
        compliance_article_146_9_1_2_3)))

; [insurance:compliance_loan_guarantee_and_limits] 遵守保險業放款無十足擔保及擔保放款董事會決議及限額規定
(assert (= compliance_loan_guarantee_and_limits
   (and loan_no_full_guarantee_complied
        loan_guarantee_board_approval_complied
        loan_limit_and_resolution_complied)))

; [insurance:insurance_product_review_approved] 保險商品經主管機關核准
(assert (= insurance_product_review_approved product_approved))

; [insurance:insurance_product_review_filed] 保險商品備查且於開始銷售後十五個工作日內送交主管機關備查
(assert (= insurance_product_review_filed
   (and product_filed (>= 15 days_after_sales_start))))

; [insurance:insurance_product_review_reapproval_timely] 主管機關於駁回後三十日內再次送審者，於二十五個工作日內核復，並於四十五個工作日內為准駁決定
(assert (= insurance_product_review_reapproval_timely
   (and (>= 25 days_to_review_after_resubmission)
        (>= 45 days_to_decision_after_resubmission))))

; [insurance:medical_expense_limit_per_person_per_accident] 每一受害人每一事故之傷害醫療費用給付總額以新臺幣二十萬元為限
(assert (= medical_expense_limit_per_person_per_accident
   (ite (>= 200000.0 total_medical_expense_paid) 1.0 0.0)))

; [insurance:medical_expense_room_fee_daily_limit] 自行負擔病房費差額每日以新臺幣一千五百元為限
(assert (= medical_expense_room_fee_daily_limit
   (ite (>= 1500.0 daily_room_fee_expense) 1.0 0.0)))

; [insurance:medical_expense_meal_fee_daily_limit] 膳食費每日以新臺幣一百八十元為限
(assert (= medical_expense_meal_fee_daily_limit
   (ite (>= 180.0 daily_meal_fee_expense) 1.0 0.0)))

; [insurance:medical_expense_prosthesis_upper_limit] 自行負擔義肢器材及裝置費每一上肢或下肢以新臺幣五萬元為限
(assert (= medical_expense_prosthesis_upper_limit
   (ite (>= 50000.0 prosthesis_expense_per_limb) 1.0 0.0)))

; [insurance:medical_expense_dental_limit] 義齒器材及裝置費每缺損一齒以新臺幣一萬元為限，缺損五齒以上合計以新臺幣五萬元為限
(assert (= medical_expense_dental_limit
   (ite (and (>= 10000.0 dental_expense_per_tooth)
             (>= 50000.0 dental_expense_total))
        1.0
        0.0)))

; [insurance:medical_expense_eye_prosthesis_limit] 義眼器材及裝置費每顆以新臺幣一萬元為限
(assert (= medical_expense_eye_prosthesis_limit
   (ite (>= 10000.0 eye_prosthesis_expense_per_unit) 1.0 0.0)))

; [insurance:medical_expense_other_materials_limit] 其他非全民健康保險法規定給付範圍之醫療材料及非積極治療性裝具以新臺幣二萬元為限
(assert (= medical_expense_other_materials_limit
   (ite (>= 20000.0 other_medical_materials_expense) 1.0 0.0)))

; [insurance:medical_expense_transportation_limit] 接送費用以新臺幣二萬元為限
(assert (= medical_expense_transportation_limit
   (ite (>= 20000.0 transportation_expense) 1.0 0.0)))

; [insurance:medical_expense_care_fee_daily_limit] 看護費用每日以新臺幣一千二百元為限且不得逾三十日
(assert (= medical_expense_care_fee_daily_limit
   (ite (and (>= 1200.0 daily_care_fee_expense) (>= 30 care_fee_days)) 1.0 0.0)))

; [insurance:subrogation_limit] 全民健康保險代位請求金額以二十萬元扣除本保險給付後之餘額為限
(assert (let ((a!1 (ite (<= subrogation_amount
                    (+ 200000.0 (* (- 1.0) insurance_payment_amount)))
                1.0
                0.0)))
  (= subrogation_limit a!1)))

; [insurance:compensation_excludes_nhi_payment] 特別補償基金給付不包括全民健康保險給付金額
(assert (= compensation_excludes_nhi_payment special_compensation_excludes_nhi))

; [insurance:insurance_payment_standard_follow_authority] 保險給付項目及標準依主管機關訂定之強制汽車責任保險給付標準辦理
(assert (= insurance_payment_standard_follow_authority payment_standard_followed))

; [insurance:insurance_payment_multiple_victims_separate] 多名受害人保險給付分別依給付標準辦理
(assert (= insurance_payment_multiple_victims_separate
   multiple_victims_payment_separate))

; [insurance:insurance_payment_standard_effective_date] 給付標準變更後，修正生效日後事故依修正標準辦理
(assert (= insurance_payment_standard_effective_date
   payment_standard_effective_date_followed))

; [insurance:foreign_investment_allowed_securities] 保險業可投資之國外有價證券種類符合規定
(assert (= foreign_investment_allowed_securities investment_securities_compliant))

; [insurance:foreign_government_definition] 外國政府定義符合規定
(assert (= foreign_government_definition foreign_government_defined))

; [insurance:foreign_bank_definition] 外國銀行定義符合規定
(assert (= foreign_bank_definition foreign_bank_defined))

; [insurance:credit_rating_agencies_definition] 國內外信用評等機構定義符合規定
(assert (= credit_rating_agencies_definition
   (and foreign_credit_agencies_defined domestic_credit_agencies_defined)))

; [insurance:foreign_real_estate_definition] 國外或大陸地區不動產定義符合規定
(assert (= foreign_real_estate_definition foreign_real_estate_defined))

; [insurance:control_and_affiliation_definition] 控制與從屬關係定義符合規定
(assert (= control_and_affiliation_definition control_and_affiliation_defined))

; [insurance:major_penalties_definition] 重大裁罰及處分定義符合規定
(assert (= major_penalties_definition major_penalties_defined))

; [insurance:investment_total_calculation_method] 一定等級投資項目投資總額計算方式符合規定
(assert (= investment_total_calculation_method investment_total_calculation_compliant))

; [insurance:bond_rating_substitution_rule] 無債券發行評等時以信用評等等級替代
(assert (= bond_rating_substitution_rule bond_rating_substitution_compliant))

; [insurance:related_party_transaction_conditions] 保險業與利害關係人從事放款以外其他交易條件符合規定
(assert (= related_party_transaction_conditions related_party_transaction_compliant))

; [insurance:related_party_transaction_board_approval] 相關交易經董事會三分之二以上出席及四分之三以上同意
(assert (= related_party_transaction_board_approval board_approval_obtained))

; [insurance:related_party_transaction_exceptions] 出席董事迴避及單一法人股東例外規定符合
(assert (= related_party_transaction_exceptions board_member_recusal_compliant))

; [insurance:related_party_transaction_exemptions] 特定交易類別得研擬內部作業規範並經董事會授權辦理
(assert (= related_party_transaction_exemptions internal_procedure_authorized))

; [insurance:related_party_transaction_single_transaction_limit] 單筆交易金額認定標準符合規定
(assert (= related_party_transaction_single_transaction_limit
   single_transaction_limit_compliant))

; [insurance:foreign_branch_manager_board_approval] 外國保險業在臺分公司負責人經董事會三分之二以上出席及四分之三以上同意決議
(assert (= foreign_branch_manager_board_approval
   foreign_branch_manager_approval_obtained))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一法定規定時處罰
(assert (= penalty
   (or (not foreign_real_estate_definition)
       (not control_and_affiliation_definition)
       (not compliance_article_45_47_and_related)
       (not (= medical_expense_limit_per_person_per_accident 1.0))
       (not (= subrogation_limit 1.0))
       (not (= medical_expense_dental_limit 1.0))
       (not correct_record_and_claim_handling)
       (not foreign_government_definition)
       (not compliance_fund_management_and_investment)
       (not related_party_transaction_exemptions)
       (not compliance_article_143_5_and_6)
       (not (= medical_expense_meal_fee_daily_limit 1.0))
       (not insurance_payment_standard_effective_date)
       (not investment_total_calculation_method)
       (not (= medical_expense_care_fee_daily_limit 1.0))
       (not related_party_transaction_exceptions)
       (not compliance_article_144_145)
       (not related_party_transaction_single_transaction_limit)
       (not related_party_transaction_conditions)
       (not (= medical_expense_transportation_limit 1.0))
       (not related_party_transaction_board_approval)
       (not insurance_product_review_filed)
       (not compensation_excludes_nhi_payment)
       (not compliance_article_144_5)
       (not insurance_payment_multiple_victims_separate)
       (not foreign_investment_allowed_securities)
       (not (= medical_expense_eye_prosthesis_limit 1.0))
       (not (= medical_expense_prosthesis_upper_limit 1.0))
       (not insurance_payment_standard_follow_authority)
       (not compliance_article_8)
       (not compliance_article_138_2_and_others)
       (not insurance_product_review_approved)
       (not compliance_article_143)
       (not foreign_branch_manager_board_approval)
       (not compliance_loan_guarantee_and_limits)
       (not (= medical_expense_room_fee_daily_limit 1.0))
       (not credit_rating_agencies_definition)
       (not foreign_bank_definition)
       (not compliance_article_15_19_46)
       (not major_penalties_definition)
       (not compliance_article_138_and_related)
       (not compliance_article_18_20)
       (not (= medical_expense_other_materials_limit 1.0))
       (not bond_rating_substitution_rule)
       (not insurance_product_review_reapproval_timely))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= underwriting_data_recorded_correctly false))
(assert (= claim_handling_properly false))
(assert (= article_8_complied true))
(assert (= article_18_1_complied true))
(assert (= article_20_complied true))
(assert (= article_45_4_complied true))
(assert (= article_47_1_complied true))
(assert (= article_47_2_complied true))
(assert (= accounting_and_financial_reporting_complied true))
(assert (= article_15_complied false))
(assert (= article_19_1_complied true))
(assert (= article_19_2_complied true))
(assert (= article_46_complied false))
(assert (= article_144_1_to_4_complied true))
(assert (= article_145_complied true))
(assert (= article_144_5_complied true))
(assert (= article_138_1_complied true))
(assert (= article_138_2_2_complied true))
(assert (= article_138_2_4_complied true))
(assert (= article_138_2_5_complied true))
(assert (= article_138_2_7_complied true))
(assert (= article_138_3_1_complied true))
(assert (= article_138_3_2_complied true))
(assert (= article_138_3_3_complied true))
(assert (= article_138_3_complied true))
(assert (= article_138_5_complied true))
(assert (= article_143_complied true))
(assert (= article_143_5_complied true))
(assert (= article_143_6_complied true))
(assert (= compliance_article_146_1_3_5_7_6 true))
(assert (= compliance_article_146_8 true))
(assert (= compliance_article_146_1_2_3_5 true))
(assert (= compliance_article_146_5_3_4 true))
(assert (= compliance_article_146_2_1_2_4 true))
(assert (= compliance_article_146_3_1_2_4 true))
(assert (= compliance_article_146_4_1_2_3 true))
(assert (= compliance_article_146_5_1 true))
(assert (= compliance_article_146_6_1_2_3 true))
(assert (= compliance_article_146_9_1_2_3 true))
(assert (= compliance_article_8 true))
(assert (= compliance_article_18_20 true))
(assert (= compliance_article_45_47_and_related true))
(assert (= compliance_article_15_19_46 false))
(assert (= compliance_article_144_145 true))
(assert (= compliance_article_144_5 true))
(assert (= compliance_article_138_and_related true))
(assert (= compliance_article_138_2_and_others true))
(assert (= compliance_article_143 true))
(assert (= compliance_article_143_5_and_6 true))
(assert (= compliance_fund_management_and_investment false))
(assert (= compliance_loan_guarantee_and_limits true))
(assert (= insurance_product_review_approved true))
(assert (= insurance_product_review_filed true))
(assert (= insurance_product_review_reapproval_timely true))
(assert (= medical_expense_limit_per_person_per_accident 1.0))
(assert (= medical_expense_room_fee_daily_limit 1.0))
(assert (= medical_expense_meal_fee_daily_limit 1.0))
(assert (= medical_expense_prosthesis_upper_limit 1.0))
(assert (= medical_expense_dental_limit 1.0))
(assert (= medical_expense_eye_prosthesis_limit 1.0))
(assert (= medical_expense_other_materials_limit 1.0))
(assert (= medical_expense_transportation_limit 1.0))
(assert (= medical_expense_care_fee_daily_limit 1.0))
(assert (= subrogation_amount 0.0))
(assert (= insurance_payment_amount 0.0))
(assert (= compensation_excludes_nhi_payment false))
(assert (= payment_standard_followed false))
(assert (= insurance_payment_standard_follow_authority false))
(assert (= multiple_victims_payment_separate true))
(assert (= insurance_payment_multiple_victims_separate true))
(assert (= payment_standard_effective_date_followed true))
(assert (= insurance_payment_standard_effective_date true))
(assert (= investment_securities_compliant false))
(assert (= foreign_investment_allowed_securities false))
(assert (= foreign_government_defined true))
(assert (= foreign_government_definition true))
(assert (= foreign_bank_defined true))
(assert (= foreign_bank_definition true))
(assert (= foreign_credit_agencies_defined true))
(assert (= domestic_credit_agencies_defined true))
(assert (= credit_rating_agencies_definition true))
(assert (= foreign_real_estate_defined true))
(assert (= foreign_real_estate_definition true))
(assert (= control_and_affiliation_defined true))
(assert (= control_and_affiliation_definition true))
(assert (= major_penalties_defined true))
(assert (= major_penalties_definition true))
(assert (= investment_total_calculation_compliant true))
(assert (= investment_total_calculation_method true))
(assert (= bond_rating_substitution_compliant true))
(assert (= bond_rating_substitution_rule true))
(assert (= related_party_transaction_compliant false))
(assert (= related_party_transaction_conditions false))
(assert (= board_approval_obtained false))
(assert (= related_party_transaction_board_approval false))
(assert (= board_member_recusal_compliant true))
(assert (= related_party_transaction_exceptions true))
(assert (= internal_procedure_authorized false))
(assert (= related_party_transaction_exemptions false))
(assert (= single_transaction_limit_compliant true))
(assert (= related_party_transaction_single_transaction_limit true))
(assert (= foreign_branch_manager_approval_obtained true))
(assert (= foreign_branch_manager_board_approval true))
(assert (= penalty true))
(assert (= care_fee_days 0))
(assert (= correct_record_and_claim_handling false))
(assert (= daily_care_fee_expense 0.0))
(assert (= daily_meal_fee_expense 0.0))
(assert (= daily_room_fee_expense 0.0))
(assert (= days_after_sales_start 0))
(assert (= days_to_decision_after_resubmission 0))
(assert (= days_to_review_after_resubmission 0))
(assert (= dental_expense_per_tooth 0.0))
(assert (= dental_expense_total 0.0))
(assert (= eye_prosthesis_expense_per_unit 0.0))
(assert (= loan_guarantee_board_approval_complied false))
(assert (= loan_limit_and_resolution_complied false))
(assert (= loan_no_full_guarantee_complied false))
(assert (= other_medical_materials_expense 0.0))
(assert (= product_approved false))
(assert (= product_filed false))
(assert (= prosthesis_expense_per_limb 0.0))
(assert (= special_compensation_excludes_nhi false))
(assert (= subrogation_limit 0.0))
(assert (= total_medical_expense_paid 0.0))
(assert (= transportation_expense 0.0))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 47
; Total variables: 126
; Total facts: 126
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

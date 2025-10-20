; SMT2 file generated from compliance case automatic
; Case ID: case_198
; Generated at: 2025-10-19T10:14:40.692464
;
; This file can be executed with Z3:
;   z3 case_198.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const advisor_contract_compliance Bool)
(declare-const advisor_contract_confidentiality Bool)
(declare-const advisor_contract_no_fund_receipt Bool)
(declare-const advisor_contract_retained_5_years Bool)
(declare-const advisor_contract_retention Bool)
(declare-const advisor_contract_termination_compensation_limit Bool)
(declare-const advisor_contract_termination_right Bool)
(declare-const claim_damages_on_termination Bool)
(declare-const claim_penalty_on_termination Bool)
(declare-const client_termination_within_7_days Bool)
(declare-const confidentiality_observed Bool)
(declare-const contract_contains_required_items Bool)
(declare-const contract_signed Bool)
(declare-const fund_received_from_client Bool)
(declare-const information_confidentiality Bool)
(declare-const information_disclosed_or_provided_to_others Bool)
(declare-const information_provided_to_authorities Bool)
(declare-const information_provision_to_authorities Bool)
(declare-const information_used_for_supervision_or_protection Bool)
(declare-const inspection_assigned_professional Bool)
(declare-const inspection_fee_burden Bool)
(declare-const inspection_fee_paid_by_inspected Bool)
(declare-const inspection_report_submission Bool)
(declare-const inspection_report_submitted Bool)
(declare-const investment_agent Bool)
(declare-const investment_analysis_report_compliance Bool)
(declare-const investment_analysis_report_made Bool)
(declare-const investment_analysis_report_retained_5_years Bool)
(declare-const investment_analysis_report_retention Bool)
(declare-const media_record_retained_1_year Bool)
(declare-const media_record_retention Bool)
(declare-const not_provide_inspection_as_per_article_20 Bool)
(declare-const obstruction_or_refusal Bool)
(declare-const penalty Bool)
(declare-const report_contains_reasonable_basis Bool)
(declare-const report_submission_and_cooperation Bool)
(declare-const report_submitted_within_deadline Bool)
(declare-const violate_article_101_1_report_or_obstruction Bool)
(declare-const violate_article_11_4_or_43_2 Bool)
(declare-const violate_article_17_1_or_2 Bool)
(declare-const violate_article_26_49_74_81_99_100 Bool)
(declare-const violate_article_29_43_45_96_announcement Bool)
(declare-const violate_article_47_2 Bool)
(declare-const violate_article_60_1_2 Bool)
(declare-const violate_article_62_1_4_5 Bool)
(declare-const violate_article_69_72_personnel_or_department Bool)
(declare-const violate_article_94_conflict_of_interest Bool)
(declare-const violate_article_96_2_refuse_designated_assignee Bool)
(declare-const violation_113 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:report_submission_and_cooperation] 證券投資信託及顧問事業等應於期限內提出報告且不得規避妨礙檢查
(assert (= report_submission_and_cooperation
   (and report_submitted_within_deadline (not obstruction_or_refusal))))

; [securities:inspection_report_submission] 指定律師、會計師或專業人員檢查並據實提出報告
(assert (= inspection_report_submission
   (and inspection_assigned_professional inspection_report_submitted)))

; [securities:inspection_fee_burden] 檢查費用由被檢查人負擔
(assert (= inspection_fee_burden inspection_fee_paid_by_inspected))

; [securities:information_provision_to_authorities] 主管機關得要求相關機關提供必要資訊或紀錄
(assert (= information_provision_to_authorities information_provided_to_authorities))

; [securities:information_confidentiality] 前三項資訊除監理及保護投資人必要外，不得公布或提供他人
(assert (= information_confidentiality
   (or information_used_for_supervision_or_protection
       (not information_disclosed_or_provided_to_others))))

; [securities:penalty_violation_list] 違反證券投資信託及顧問法第113條列舉事項
(assert (= violation_113
   (or violate_article_69_72_personnel_or_department
       violate_article_96_2_refuse_designated_assignee
       not_provide_inspection_as_per_article_20
       violate_article_101_1_report_or_obstruction
       violate_article_47_2
       violate_article_17_1_or_2
       violate_article_26_49_74_81_99_100
       violate_article_11_4_or_43_2
       violate_article_94_conflict_of_interest
       violate_article_60_1_2
       violate_article_62_1_4_5
       violate_article_29_43_45_96_announcement)))

; [securities:penalty_imposed] 違反第113條規定者處罰
(assert (= penalty violation_113))

; [securities:advisor_contract_compliance] 證券投資顧問事業應訂定書面契約並載明必要事項
(assert (= advisor_contract_compliance
   (and contract_signed contract_contains_required_items)))

; [securities:advisor_contract_confidentiality] 證券投資顧問事業應保守客戶財產狀況及個人情況秘密
(assert (= advisor_contract_confidentiality confidentiality_observed))

; [securities:advisor_contract_no_fund_receipt] 證券投資顧問事業不得收受客戶資金或代理證券投資行為
(assert (= advisor_contract_no_fund_receipt
   (and (not fund_received_from_client) (not investment_agent))))

; [securities:advisor_contract_termination_right] 客戶得於收受書面契約七日內以書面終止契約
(assert (= advisor_contract_termination_right client_termination_within_7_days))

; [securities:advisor_contract_termination_compensation_limit] 契約終止時不得請求損害賠償或違約金
(assert (= advisor_contract_termination_compensation_limit
   (and (not claim_damages_on_termination) (not claim_penalty_on_termination))))

; [securities:investment_analysis_report_compliance] 證券投資顧問事業應作成投資分析報告並載明合理分析基礎及根據
(assert (= investment_analysis_report_compliance
   (and investment_analysis_report_made report_contains_reasonable_basis)))

; [securities:investment_analysis_report_retention] 投資分析報告副本及紀錄保存五年，可電子媒體儲存
(assert (= investment_analysis_report_retention
   investment_analysis_report_retained_5_years))

; [securities:advisor_contract_retention] 證券投資顧問契約權利義務關係消滅日起保存五年
(assert (= advisor_contract_retention advisor_contract_retained_5_years))

; [securities:media_record_retention] 證券投資顧問事業提供投資分析節目錄影錄音存查至少保存一年
(assert (= media_record_retention media_record_retained_1_year))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反第113條列舉事項時處罰
(assert (= penalty violation_113))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= report_submitted_within_deadline false))
(assert (= obstruction_or_refusal true))
(assert (= violate_article_101_1_report_or_obstruction true))
(assert (= violation_113 true))
(assert (= penalty true))
(assert (= investment_analysis_report_made false))
(assert (= investment_analysis_report_retained_5_years false))
(assert (= investment_analysis_report_compliance false))
(assert (= investment_analysis_report_retention false))
(assert (= violate_article_11_4_or_43_2 true))
(assert (= contract_signed false))
(assert (= contract_contains_required_items false))
(assert (= advisor_contract_compliance false))
(assert (= confidentiality_observed false))
(assert (= advisor_contract_confidentiality false))
(assert (= fund_received_from_client false))
(assert (= investment_agent false))
(assert (= advisor_contract_no_fund_receipt true))
(assert (= client_termination_within_7_days false))
(assert (= advisor_contract_termination_right false))
(assert (= claim_damages_on_termination false))
(assert (= claim_penalty_on_termination false))
(assert (= advisor_contract_termination_compensation_limit true))
(assert (= advisor_contract_retained_5_years false))
(assert (= advisor_contract_retention false))
(assert (= media_record_retained_1_year false))
(assert (= media_record_retention false))
(assert (= report_contains_reasonable_basis false))
(assert (= report_submission_and_cooperation false))
(assert (= inspection_assigned_professional false))
(assert (= inspection_report_submitted false))
(assert (= inspection_report_submission false))
(assert (= inspection_fee_paid_by_inspected false))
(assert (= inspection_fee_burden false))
(assert (= information_provided_to_authorities false))
(assert (= information_provision_to_authorities false))
(assert (= information_used_for_supervision_or_protection false))
(assert (= information_disclosed_or_provided_to_others false))
(assert (= information_confidentiality true))
(assert (= not_provide_inspection_as_per_article_20 false))
(assert (= violate_article_17_1_or_2 false))
(assert (= violate_article_26_49_74_81_99_100 false))
(assert (= violate_article_29_43_45_96_announcement false))
(assert (= violate_article_47_2 false))
(assert (= violate_article_60_1_2 false))
(assert (= violate_article_62_1_4_5 false))
(assert (= violate_article_69_72_personnel_or_department false))
(assert (= violate_article_94_conflict_of_interest false))
(assert (= violate_article_96_2_refuse_designated_assignee false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 18
; Total variables: 49
; Total facts: 49
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

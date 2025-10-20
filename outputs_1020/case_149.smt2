; SMT2 file generated from compliance case automatic
; Case ID: case_149
; Generated at: 2025-10-19T09:22:33.040463
;
; This file can be executed with Z3:
;   z3 case_149.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const claims_systems_established Bool)
(declare-const claims_systems_executed Bool)
(declare-const consumer_basic_info_complete Bool)
(declare-const consumer_insurance_conditions_set Bool)
(declare-const consumer_insurance_type_amount_fee_match_need Bool)
(declare-const consumer_other_required_info_complete Bool)
(declare-const consumer_purchases_foreign_currency_non_investment_insurance Bool)
(declare-const consumer_relationship_info_complete Bool)
(declare-const consumer_understands_exchange_rate_risk Bool)
(declare-const consumer_understands_premium_usage Bool)
(declare-const consumer_underwriting_review_done Bool)
(declare-const explanation_doc_false Bool)
(declare-const explanation_doc_not_according_to_rule Bool)
(declare-const financial_consumer_info_complete Bool)
(declare-const financial_consumer_suitability_checked Bool)
(declare-const financial_consumer_understanding Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_ok Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const not_provide_explanation_doc Bool)
(declare-const not_public_explanation Bool)
(declare-const not_report_to_authority_in_time Bool)
(declare-const penalty Bool)
(declare-const personnel_perform_as_required Bool)
(declare-const report_or_explanation_false Bool)
(declare-const sales_and_underwriting_compliance Bool)
(declare-const sales_and_underwriting_personnel_compliance Bool)
(declare-const sales_systems_established Bool)
(declare-const sales_systems_executed Bool)
(declare-const underwriting_systems_established Bool)
(declare-const underwriting_systems_executed Bool)
(declare-const violate_148_1_1_or_2 Bool)
(declare-const violate_148_1_2 Bool)
(declare-const violate_148_2_1 Bool)
(declare-const violate_148_2_2 Bool)
(declare-const violate_148_3_1 Bool)
(declare-const violate_148_3_2 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violate_148_1_2] 違反保險法第148條之一第一項或第二項規定
(assert (= violate_148_1_2 violate_148_1_1_or_2))

; [insurance:violate_148_2_1] 違反保險法第148條之二第一項規定：未提供說明文件供查閱、或說明文件未依規定記載、或說明文件記載不實
(assert (= violate_148_2_1
   (or explanation_doc_false
       explanation_doc_not_according_to_rule
       not_provide_explanation_doc)))

; [insurance:violate_148_2_2] 違反保險法第148條之二第二項規定：未依限向主管機關報告或主動公開說明，或報告或公開說明內容不實
(assert (= violate_148_2_2
   (or not_public_explanation
       report_or_explanation_false
       not_report_to_authority_in_time)))

; [insurance:violate_148_3_1] 違反保險法第148條之三第一項規定：未建立或未執行內部控制或稽核制度
(assert (= violate_148_3_1
   (or (not internal_control_established) (not internal_control_executed))))

; [insurance:violate_148_3_2] 違反保險法第148條之三第二項規定：未建立或未執行內部處理制度或程序
(assert (= violate_148_3_2
   (or (not internal_handling_established) (not internal_handling_executed))))

; [insurance:internal_control_ok] 建立且執行內部控制及稽核制度
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_ok] 建立且執行內部處理制度及程序
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [insurance:financial_consumer_info_complete] 保險業充分瞭解金融消費者相關資料
(assert (= financial_consumer_info_complete
   (and consumer_basic_info_complete
        consumer_relationship_info_complete
        consumer_other_required_info_complete)))

; [insurance:financial_consumer_understanding] 保險業充分瞭解金融消費者投保條件及審查原則
(assert (= financial_consumer_understanding
   (and consumer_insurance_conditions_set consumer_underwriting_review_done)))

; [insurance:financial_consumer_suitability_checked] 保險業對金融消費者保險商品適合度事項已考量
(assert (= financial_consumer_suitability_checked
   (and consumer_understands_premium_usage
        consumer_insurance_type_amount_fee_match_need
        (or consumer_understands_exchange_rate_risk
            (not consumer_purchases_foreign_currency_non_investment_insurance)))))

; [insurance:sales_and_underwriting_compliance] 保險業招攬及核保理賠制度及程序確實執行
(assert (= sales_and_underwriting_compliance
   (and sales_systems_established
        underwriting_systems_established
        claims_systems_established
        sales_systems_executed
        underwriting_systems_executed
        claims_systems_executed)))

; [insurance:sales_and_underwriting_personnel_compliance] 招攬、核保及理賠人員依規定執行業務
(assert (= sales_and_underwriting_personnel_compliance personnel_perform_as_required))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一相關規定時處罰
(assert (= penalty
   (or (not financial_consumer_info_complete)
       (not sales_and_underwriting_compliance)
       (not financial_consumer_understanding)
       (not financial_consumer_suitability_checked)
       violate_148_2_2
       (not sales_and_underwriting_personnel_compliance)
       violate_148_1_2
       violate_148_3_1
       violate_148_3_2
       violate_148_2_1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_148_1_1_or_2 true))
(assert (= violate_148_1_2 true))
(assert (= violate_148_2_1 false))
(assert (= violate_148_2_2 false))
(assert (= violate_148_3_1 false))
(assert (= violate_148_3_2 false))
(assert (= not_provide_explanation_doc false))
(assert (= explanation_doc_not_according_to_rule false))
(assert (= explanation_doc_false false))
(assert (= not_report_to_authority_in_time false))
(assert (= not_public_explanation false))
(assert (= report_or_explanation_false false))
(assert (= internal_control_established true))
(assert (= internal_control_executed true))
(assert (= internal_handling_established true))
(assert (= internal_handling_executed true))
(assert (= consumer_basic_info_complete false))
(assert (= consumer_relationship_info_complete false))
(assert (= consumer_other_required_info_complete false))
(assert (= financial_consumer_info_complete false))
(assert (= consumer_insurance_conditions_set false))
(assert (= consumer_underwriting_review_done false))
(assert (= financial_consumer_understanding false))
(assert (= consumer_understands_premium_usage false))
(assert (= consumer_insurance_type_amount_fee_match_need false))
(assert (= consumer_purchases_foreign_currency_non_investment_insurance false))
(assert (= consumer_understands_exchange_rate_risk true))
(assert (= financial_consumer_suitability_checked false))
(assert (= sales_systems_established true))
(assert (= underwriting_systems_established true))
(assert (= claims_systems_established true))
(assert (= sales_systems_executed true))
(assert (= underwriting_systems_executed true))
(assert (= claims_systems_executed true))
(assert (= sales_and_underwriting_compliance false))
(assert (= personnel_perform_as_required false))
(assert (= sales_and_underwriting_personnel_compliance false))
(assert (= internal_control_ok false))
(assert (= internal_handling_ok false))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 40
; Total facts: 40
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

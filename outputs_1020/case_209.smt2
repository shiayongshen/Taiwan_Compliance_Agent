; SMT2 file generated from compliance case automatic
; Case ID: case_209
; Generated at: 2025-10-19T10:32:11.534363
;
; This file can be executed with Z3:
;   z3 case_209.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const audit_procedures_established Bool)
(declare-const client_acceptance_rules Bool)
(declare-const client_investment_ability_assessed Bool)
(declare-const client_review_procedures Bool)
(declare-const client_understanding_established Bool)
(declare-const consumer_data_collected Bool)
(declare-const consumer_data_understood Bool)
(declare-const consumer_protection_compliance Bool)
(declare-const control_procedures Bool)
(declare-const dedicated_personnel_assigned Bool)
(declare-const inspection_cooperation Bool)
(declare-const inspection_obstructed Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_implemented Bool)
(declare-const monitoring_mechanism_established Bool)
(declare-const non_professional_investor_compliance Bool)
(declare-const other_designated_matters_complied Bool)
(declare-const penalty Bool)
(declare-const product_suitability_ensured Bool)
(declare-const product_suitability_rules_established Bool)
(declare-const risk_assessment_report_updated Bool)
(declare-const risk_disclosure_to_client Bool)
(declare-const risk_level_classification_established Bool)
(declare-const suitability_assessed Bool)
(declare-const training_held Bool)
(declare-const violation_advertising Bool)
(declare-const violation_advertising_rule Bool)
(declare-const violation_compensation Bool)
(declare-const violation_compensation_rule Bool)
(declare-const violation_consumer_data Bool)
(declare-const violation_consumer_data_rule Bool)
(declare-const violation_disclosure Bool)
(declare-const violation_disclosure_rule Bool)
(declare-const violation_formal_appearance Bool)
(declare-const violation_formal_appearance_rule Bool)
(declare-const violation_major Bool)
(declare-const violation_major_rule Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [aml:internal_control_established] 建立洗錢防制內部控制與稽核制度
(assert (= internal_control_established
   (and control_procedures
        training_held
        dedicated_personnel_assigned
        risk_assessment_report_updated
        audit_procedures_established
        other_designated_matters_complied)))

; [aml:internal_control_executed] 洗錢防制內部控制制度確實執行
(assert (= internal_control_executed internal_control_implemented))

; [aml:internal_control_compliance] 洗錢防制內部控制制度建立且確實執行
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [aml:inspection_cooperation] 配合中央目的事業主管機關查核
(assert (not (= inspection_obstructed inspection_cooperation)))

; [fcp:consumer_data_understood] 充分瞭解金融消費者相關資料
(assert (= consumer_data_understood consumer_data_collected))

; [fcp:product_suitability_ensured] 確保金融商品或服務對金融消費者之適合度
(assert (= product_suitability_ensured suitability_assessed))

; [fcp:consumer_protection_compliance] 金融消費者保護法第9條規定遵守
(assert (= consumer_protection_compliance
   (and consumer_data_understood product_suitability_ensured)))

; [fcp:violation_advertising] 違反廣告、業務招攬、營業促銷活動方式或內容規定
(assert (= violation_advertising violation_advertising_rule))

; [fcp:violation_consumer_data] 違反未充分瞭解金融消費者資料及適合度規定
(assert (= violation_consumer_data violation_consumer_data_rule))

; [fcp:violation_disclosure] 違反未充分說明金融商品、服務、契約重要內容或揭露風險規定
(assert (= violation_disclosure violation_disclosure_rule))

; [fcp:violation_compensation] 違反酬金制度訂定或執行規定
(assert (= violation_compensation violation_compensation_rule))

; [fcp:violation_formal_appearance] 協助創造符合形式上之外觀條件違規
(assert (= violation_formal_appearance violation_formal_appearance_rule))

; [fcp:violation_major] 違規且情節重大
(assert (= violation_major violation_major_rule))

; [trust:client_understanding_established] 建立充分瞭解客戶作業準則
(assert (= client_understanding_established
   (and client_acceptance_rules
        client_review_procedures
        client_investment_ability_assessed)))

; [trust:non_professional_investor_compliance] 非專業投資人遵守商品適合度規章及風險告知
(assert (= non_professional_investor_compliance
   (and product_suitability_rules_established
        risk_level_classification_established
        monitoring_mechanism_established
        risk_disclosure_to_client)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反洗錢防制法第7條規定或妨礙查核時處罰
(assert (= penalty
   (or (not internal_control_executed)
       (not internal_control_established)
       inspection_obstructed
       (not inspection_cooperation))))

; [meta:penalty_conditions_fcp] 處罰條件：違反金融消費者保護法第30-1條規定時處罰
(assert (= penalty
   (or violation_consumer_data
       violation_compensation
       violation_disclosure
       violation_formal_appearance
       violation_advertising)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= control_procedures false))
(assert (= training_held false))
(assert (= dedicated_personnel_assigned false))
(assert (= risk_assessment_report_updated false))
(assert (= audit_procedures_established false))
(assert (= other_designated_matters_complied false))
(assert (= internal_control_implemented false))
(assert (= inspection_obstructed false))
(assert (= consumer_data_collected false))
(assert (= suitability_assessed false))
(assert (= violation_consumer_data_rule true))
(assert (= violation_consumer_data true))
(assert (= violation_advertising_rule false))
(assert (= violation_advertising false))
(assert (= violation_disclosure_rule false))
(assert (= violation_disclosure false))
(assert (= violation_compensation_rule false))
(assert (= violation_compensation false))
(assert (= violation_formal_appearance_rule false))
(assert (= violation_formal_appearance false))
(assert (= violation_major_rule false))
(assert (= violation_major false))
(assert (= client_acceptance_rules false))
(assert (= client_review_procedures false))
(assert (= client_investment_ability_assessed false))
(assert (= consumer_data_understood false))
(assert (= product_suitability_ensured false))
(assert (= product_suitability_rules_established false))
(assert (= risk_disclosure_to_client false))
(assert (= risk_level_classification_established false))
(assert (= monitoring_mechanism_established false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_compliance false))
(assert (= inspection_cooperation true))
(assert (= penalty true))
(assert (= non_professional_investor_compliance false))
(assert (= client_understanding_established false))
(assert (= consumer_protection_compliance false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 18
; Total variables: 39
; Total facts: 39
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

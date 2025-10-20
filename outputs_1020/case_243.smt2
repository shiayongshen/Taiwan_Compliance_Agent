; SMT2 file generated from compliance case automatic
; Case ID: case_243
; Generated at: 2025-10-19T11:12:19.179339
;
; This file can be executed with Z3:
;   z3 case_243.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const ability_assessment_compliant Bool)
(declare-const agent_management_compliant Bool)
(declare-const annual_training_completed Bool)
(declare-const basic_info_compliant Bool)
(declare-const broker_compliance Bool)
(declare-const broker_management_compliant Bool)
(declare-const broker_no_contract_termination_inducement Bool)
(declare-const broker_no_harm_to_insured Bool)
(declare-const broker_no_improper_inducement Bool)
(declare-const broker_understand_premium_source Bool)
(declare-const business_execution_compliance Bool)
(declare-const business_execution_discipline Bool)
(declare-const business_processes_executed Bool)
(declare-const compensation_risk_linked_assessment_compliant Bool)
(declare-const discipline_measures_taken Bool)
(declare-const fee_collection_management_compliant Bool)
(declare-const honest_report_filled Bool)
(declare-const insurance_condition_compliant Bool)
(declare-const insurance_purpose_compliant Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_ok Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const marketing_channel_compliance Bool)
(declare-const no_prohibited_behavior Bool)
(declare-const penalty Bool)
(declare-const post_sale_contact_compliance Bool)
(declare-const post_sale_contact_compliant Bool)
(declare-const premium_source_compliant Bool)
(declare-const product_suitability_policy_compliant Bool)
(declare-const qualified_recruitment_personnel Bool)
(declare-const recording_sales_process_compliance Bool)
(declare-const recording_sales_process_content_compliance Bool)
(declare-const recruitment_65yo_ability_assessment_compliance Bool)
(declare-const recruitment_agent_management_compliance Bool)
(declare-const recruitment_basic_info_compliance Bool)
(declare-const recruitment_compensation_compliance Bool)
(declare-const recruitment_fee_management_compliance Bool)
(declare-const recruitment_honest_report_compliance Bool)
(declare-const recruitment_insurance_condition_compliance Bool)
(declare-const recruitment_insurance_purpose_compliance Bool)
(declare-const recruitment_marketing_compliance Bool)
(declare-const recruitment_premium_source_compliance Bool)
(declare-const recruitment_product_suitability_policy_compliance Bool)
(declare-const recruitment_prohibited_behavior_compliance Bool)
(declare-const recruitment_qualification_compliance Bool)
(declare-const recruitment_training_compliance Bool)
(declare-const sales_process_record_content_compliant Bool)
(declare-const sales_process_recorded_and_reviewed Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [insurance:internal_control_executed] 執行內部控制及稽核制度
(assert (= internal_control_executed internal_control_system_executed))

; [insurance:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [insurance:internal_handling_executed] 執行內部處理制度及程序
(assert (= internal_handling_executed internal_handling_system_executed))

; [insurance:internal_control_ok] 內部控制及稽核制度建立且執行
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_ok] 內部處理制度及程序建立且執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [insurance:recruitment_training_compliance] 保險招攬業務人員每年參加公平對待65歲以上客戶相關教育訓練
(assert (= recruitment_training_compliance annual_training_completed))

; [insurance:recruitment_qualification_compliance] 保險招攬業務人員具備資格
(assert (= recruitment_qualification_compliance qualified_recruitment_personnel))

; [insurance:recruitment_compensation_compliance] 保險招攬業務人員酬金與承受風險及支給時間連結考核合規
(assert (= recruitment_compensation_compliance
   compensation_risk_linked_assessment_compliant))

; [insurance:recruitment_fee_management_compliance] 保險招攬業務人員代收保險費收費作業及管理合規
(assert (= recruitment_fee_management_compliance fee_collection_management_compliant))

; [insurance:recruitment_marketing_compliance] 依行銷通路別及特性訂定應遵行事項合規
(assert (= recruitment_marketing_compliance marketing_channel_compliance))

; [insurance:recruitment_basic_info_compliance] 要保人及被保險人基本資料完整且合規
(assert (= recruitment_basic_info_compliance basic_info_compliant))

; [insurance:recruitment_insurance_condition_compliance] 要保人及被保險人符合投保條件
(assert (= recruitment_insurance_condition_compliance insurance_condition_compliant))

; [insurance:recruitment_insurance_purpose_compliance] 要保人及被保險人投保目的及需求合規
(assert (= recruitment_insurance_purpose_compliance insurance_purpose_compliant))

; [insurance:recruitment_premium_source_compliance] 繳交保險費資金來源合規
(assert (= recruitment_premium_source_compliance premium_source_compliant))

; [insurance:recruitment_65yo_ability_assessment_compliance] 65歲以上客戶辨識不利投保權益能力評估合規
(assert (= recruitment_65yo_ability_assessment_compliance ability_assessment_compliant))

; [insurance:recruitment_product_suitability_policy_compliance] 保險商品適合度政策合規
(assert (= recruitment_product_suitability_policy_compliance
   product_suitability_policy_compliant))

; [insurance:recruitment_honest_report_compliance] 誠實填寫招攬報告書義務合規
(assert (= recruitment_honest_report_compliance honest_report_filled))

; [insurance:recruitment_prohibited_behavior_compliance] 無不當招攬行為
(assert (= recruitment_prohibited_behavior_compliance no_prohibited_behavior))

; [insurance:recruitment_agent_management_compliance] 保險代理人及業務員遵循管理規則及合約
(assert (= recruitment_agent_management_compliance agent_management_compliant))

; [insurance:recording_sales_process_compliance] 銷售過程錄音錄影或電子設備留存及覆審合規
(assert (= recording_sales_process_compliance sales_process_recorded_and_reviewed))

; [insurance:recording_sales_process_content_compliance] 銷售過程錄音錄影內容完整且保存期限合規
(assert (= recording_sales_process_content_compliance
   sales_process_record_content_compliant))

; [insurance:post_sale_contact_compliance] 銷售後電話、視訊或遠距訪問及錄音錄影保存合規
(assert (= post_sale_contact_compliance post_sale_contact_compliant))

; [insurance:broker_compliance] 業務往來保險經紀人遵行管理規則及合約且無不當行為
(assert (= broker_compliance
   (and broker_management_compliant
        broker_no_improper_inducement
        broker_no_contract_termination_inducement
        broker_understand_premium_source
        broker_no_harm_to_insured)))

; [insurance:business_execution_compliance] 招攬、核保及理賠處理制度及程序確實執行
(assert (= business_execution_compliance business_processes_executed))

; [insurance:business_execution_discipline] 對未依規定執行業務人員予以警告或適當處置
(assert (= business_execution_discipline discipline_measures_taken))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未建立或未執行內部控制或稽核制度，或未建立或未執行內部處理制度或程序，或未依規定執行招攬、核保及理賠制度程序，或招攬業務人員違反規定時處罰
(assert (= penalty
   (or (not recruitment_insurance_condition_compliance)
       (not internal_handling_ok)
       (not recruitment_product_suitability_policy_compliance)
       (not recruitment_honest_report_compliance)
       (not recruitment_65yo_ability_assessment_compliance)
       (not recruitment_agent_management_compliance)
       (not recruitment_compensation_compliance)
       (not recruitment_prohibited_behavior_compliance)
       (not recruitment_premium_source_compliance)
       (not recruitment_basic_info_compliance)
       (not business_execution_compliance)
       (not recruitment_training_compliance)
       (not recording_sales_process_content_compliance)
       (not post_sale_contact_compliance)
       (not recruitment_insurance_purpose_compliance)
       (not recruitment_qualification_compliance)
       (not internal_control_ok)
       (not recruitment_marketing_compliance)
       (not recruitment_fee_management_compliance)
       (not broker_compliance)
       (not recording_sales_process_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= business_processes_executed false))
(assert (= annual_training_completed false))
(assert (= qualified_recruitment_personnel false))
(assert (= compensation_risk_linked_assessment_compliant false))
(assert (= fee_collection_management_compliant false))
(assert (= marketing_channel_compliance false))
(assert (= basic_info_compliant false))
(assert (= insurance_condition_compliant false))
(assert (= insurance_purpose_compliant false))
(assert (= premium_source_compliant false))
(assert (= ability_assessment_compliant false))
(assert (= product_suitability_policy_compliant false))
(assert (= honest_report_filled false))
(assert (= no_prohibited_behavior false))
(assert (= agent_management_compliant false))
(assert (= sales_process_recorded_and_reviewed false))
(assert (= sales_process_record_content_compliant false))
(assert (= post_sale_contact_compliant false))
(assert (= broker_management_compliant false))
(assert (= broker_no_improper_inducement false))
(assert (= broker_no_contract_termination_inducement false))
(assert (= broker_understand_premium_source false))
(assert (= broker_no_harm_to_insured false))
(assert (= discipline_measures_taken false))
(assert (= broker_compliance false))
(assert (= business_execution_compliance false))
(assert (= business_execution_discipline false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_ok false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= internal_handling_ok false))
(assert (= penalty false))
(assert (= post_sale_contact_compliance false))
(assert (= recording_sales_process_compliance false))
(assert (= recording_sales_process_content_compliance false))
(assert (= recruitment_65yo_ability_assessment_compliance false))
(assert (= recruitment_agent_management_compliance false))
(assert (= recruitment_basic_info_compliance false))
(assert (= recruitment_compensation_compliance false))
(assert (= recruitment_fee_management_compliance false))
(assert (= recruitment_honest_report_compliance false))
(assert (= recruitment_insurance_condition_compliance false))
(assert (= recruitment_insurance_purpose_compliance false))
(assert (= recruitment_marketing_compliance false))
(assert (= recruitment_premium_source_compliance false))
(assert (= recruitment_product_suitability_policy_compliance false))
(assert (= recruitment_prohibited_behavior_compliance false))
(assert (= recruitment_qualification_compliance false))
(assert (= recruitment_training_compliance false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 28
; Total variables: 55
; Total facts: 55
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

; SMT2 file generated from compliance case automatic
; Case ID: case_351
; Generated at: 2025-10-19T13:49:16.775491
;
; This file can be executed with Z3:
;   z3 case_351.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const asset_acquisition_disposal_procedure_compliance Bool)
(declare-const case_improved Bool)
(declare-const case_is_minor Bool)
(declare-const derivative_transaction_risk_management_compliance Bool)
(declare-const derivative_transaction_risk_management_measures_compliance Bool)
(declare-const fail_to_comply_documentation_requirements Bool)
(declare-const fail_to_establish_or_comply_compensation_committee_rules Bool)
(declare-const fail_to_submit_or_obstruct_inspection Bool)
(declare-const foreign_company_violation_178_3_or_4 Bool)
(declare-const internal_audit_system_established Bool)
(declare-const is_corporation_or_foreign_company Bool)
(declare-const is_foreign_company_issuer Bool)
(declare-const issuer_responsible_person_punishable Bool)
(declare-const major_financial_business_rules_defined Bool)
(declare-const other_important_risk_measures_implemented Bool)
(declare-const penalty Bool)
(declare-const penalty_exempted_for_minor_cases Bool)
(declare-const positions_evaluated_weekly_or_more Bool)
(declare-const procedure_control_subsidiary_asset Bool)
(declare-const procedure_followed Bool)
(declare-const procedure_penalty_for_violation Bool)
(declare-const procedure_record_announcement_declaration Bool)
(declare-const procedure_record_asset_scope Bool)
(declare-const procedure_record_evaluation_process Bool)
(declare-const procedure_record_limits Bool)
(declare-const procedure_record_operation_process Bool)
(declare-const procedure_record_other_important_matters Bool)
(declare-const regular_evaluation_and_abnormal_handling_defined Bool)
(declare-const regulations_defined_by_authority Bool)
(declare-const risk_control_personnel_separated_and_report_to_board Bool)
(declare-const risk_management_measures_implemented Bool)
(declare-const risk_management_scope_includes_all Bool)
(declare-const trading_and_settlement_personnel_separated Bool)
(declare-const transaction_principles_and_policies_defined Bool)
(declare-const violate_14_4_1_2_or_165_1_applied_14_4_1_2_or_14_4_5_or_165_1_applied_14_4_5 Bool)
(declare-const violate_22_2_1_or_2_or_26_1_or_165_1_applied_22_2_1_or_2 Bool)
(declare-const violate_25_1_or_165_1_applied_25_1_rules Bool)
(declare-const violate_26_2_rules Bool)
(declare-const violate_26_3_1_7_8_or_165_1_applied_26_3 Bool)
(declare-const violate_28_2_2_4_7_or_165_1_applied_28_2 Bool)
(declare-const violate_36_1_or_165_1_applied_36_1_rules Bool)
(declare-const violate_43_2_1_43_3_1_43_5_1_or_165_1_165_2_applied_43_2_3_etc Bool)
(declare-const violate_specified_articles_14_14_1_14_2_etc Bool)
(declare-const violation_177_1 Bool)
(declare-const violation_178_1 Bool)
(declare-const violation_178_10 Bool)
(declare-const violation_178_11 Bool)
(declare-const violation_178_12 Bool)
(declare-const violation_178_2 Bool)
(declare-const violation_178_3 Bool)
(declare-const violation_178_4 Bool)
(declare-const violation_178_5 Bool)
(declare-const violation_178_6 Bool)
(declare-const violation_178_7 Bool)
(declare-const violation_178_8 Bool)
(declare-const violation_178_9 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:major_financial_business_rules_defined] 主管機關定公開發行公司重大財務業務行為處理準則
(assert (= major_financial_business_rules_defined regulations_defined_by_authority))

; [securities:violation_178_1] 違反第22-2條第一項、第二項、第26-1條或第165-1條準用第22-2條第一項、第二項規定
(assert (= violation_178_1 violate_22_2_1_or_2_or_26_1_or_165_1_applied_22_2_1_or_2))

; [securities:violation_178_2] 違反第14條第三項、第14條之一第一項、第三項、第14條之二第一項、第三項、第6項、第14條之三、第14條之五第一項至第三項、第21條之一第五項、第25條第一項、第二項、第四項、第31條第一項、第36條第五項、第七項、第41條、第43條之一第一項、第43條之四第一項、第43條之六第五項至第七項、第165條之一或第165條之二準用相關規定
(assert (= violation_178_2 violate_specified_articles_14_14_1_14_2_etc))

; [securities:violation_178_3] 發行人、公開收購人或其關係人、證券商委託人未依主管機關命令提出帳簿、表冊、文件或其他資料，或規避、妨礙、拒絕檢查
(assert (= violation_178_3 fail_to_submit_or_obstruct_inspection))

; [securities:violation_178_4] 發行人、公開收購人未依規定製作、申報、公告、備置或保存帳簿、表冊、傳票、財務報告或其他有關業務文件
(assert (= violation_178_4 fail_to_comply_documentation_requirements))

; [securities:violation_178_5] 違反第14條之四第一項、第二項或第165條之一準用該條規定，或違反第14條之四第五項、第一百六十五條之一準用該項辦法有關作業程序、職權行使或議事錄應載明事項規定
(assert (= violation_178_5
   violate_14_4_1_2_or_165_1_applied_14_4_1_2_or_14_4_5_or_165_1_applied_14_4_5))

; [securities:violation_178_6] 違反第14條之六第一項前段或第165條之一準用該段規定未設置薪資報酬委員會，或違反後段及相關規定
(assert (= violation_178_6 fail_to_establish_or_comply_compensation_committee_rules))

; [securities:violation_178_7] 違反第25條之一或第165條之一準用該條規定有關徵求人、受託代理人資格條件、委託書徵求與取得方式、股東會應遵守事項及主管機關要求提供資料拒絕提供
(assert (= violation_178_7 violate_25_1_or_165_1_applied_25_1_rules))

; [securities:violation_178_8] 違反主管機關依第26條第二項所定公開發行公司董事監察人股權成數及查核實施規則通知及查核規定
(assert (= violation_178_8 violate_26_2_rules))

; [securities:violation_178_9] 違反第26條之三第一項、第七項、第八項前段或第165條之一準用該條規定，或違反第26條之三第八項後段、第一百六十五條之一準用該項後段辦法有關主要議事內容、作業程序、議事錄應載明事項或公告規定
(assert (= violation_178_9 violate_26_3_1_7_8_or_165_1_applied_26_3))

; [securities:violation_178_10] 違反第28條之二第二項、第四項至第七項或第165條之一準用該條規定，或違反第28條之二第三項、第一百六十五條之一準用該項辦法有關買回股份程序、價格、數量、方式、轉讓方法或申報公告事項
(assert (= violation_178_10 violate_28_2_2_4_7_or_165_1_applied_28_2))

; [securities:violation_178_11] 違反第36條之一或第165條之一準用該條規定有關取得或處分資產、衍生性商品交易、資金貸與、背書保證及財務預測資訊重大財務業務行為適用範圍、作業程序、公告申報規定
(assert (= violation_178_11 violate_36_1_or_165_1_applied_36_1_rules))

; [securities:violation_178_12] 違反第43條之二第一項、第43條之三第一項、第43條之五第一項或第165條之一、第一百六十五條之二準用該條規定，或違反第43條之一第四項、第五項、第一百六十五條之一、第一百六十五條之二準用該條規定有關收購有價證券範圍、條件、期間、關係人或申報公告事項
(assert (= violation_178_12
   violate_43_2_1_43_3_1_43_5_1_or_165_1_165_2_applied_43_2_3_etc))

; [securities:foreign_company_violation_178_3_or_4] 外國公司為發行人時，違反第178條第三款或第四款規定
(assert (= foreign_company_violation_178_3_or_4
   (and is_foreign_company_issuer (or violation_178_3 violation_178_4))))

; [securities:penalty_exemption_for_minor_cases] 情節輕微者得免處罰或先限期改善，已改善完成者免處罰
(assert (= penalty_exempted_for_minor_cases (or case_is_minor case_improved)))

; [securities:penalty_for_violations] 違反第178條各款規定且不符合免罰條件時處罰
(assert (= penalty
   (and (or violation_178_5
            violation_178_12
            violation_178_6
            violation_178_4
            violation_178_7
            violation_178_3
            violation_178_10
            violation_178_2
            violation_178_8
            violation_178_9
            foreign_company_violation_178_3_or_4
            violation_178_11
            violation_178_1)
        (not penalty_exempted_for_minor_cases))))

; [securities:issuer_responsible_person_punishable] 法人及外國公司違反本法規定，除特定條款外，依本章規定處罰其負責人
(assert (= issuer_responsible_person_punishable
   (and is_corporation_or_foreign_company
        (or violation_178_5
            violation_178_12
            violation_178_6
            violation_178_4
            violation_178_7
            violation_178_3
            violation_178_10
            violation_178_2
            violation_178_8
            violation_178_9
            foreign_company_violation_178_3_or_4
            violation_177_1
            violation_178_11
            violation_178_1))))

; [securities:asset_acquisition_disposal_procedure_compliance] 公開發行公司訂定並依取得或處分資產處理程序辦理
(assert (= asset_acquisition_disposal_procedure_compliance
   (and procedure_record_asset_scope
        procedure_record_evaluation_process
        procedure_record_operation_process
        procedure_record_announcement_declaration
        procedure_record_limits
        procedure_control_subsidiary_asset
        procedure_penalty_for_violation
        procedure_record_other_important_matters
        procedure_followed)))

; [securities:derivative_transaction_risk_management_compliance] 公開發行公司從事衍生性商品交易風險管理及稽核事項控管納入處理程序
(assert (= derivative_transaction_risk_management_compliance
   (and transaction_principles_and_policies_defined
        risk_management_measures_implemented
        internal_audit_system_established
        regular_evaluation_and_abnormal_handling_defined)))

; [securities:derivative_transaction_risk_management_measures_compliance] 公開發行公司從事衍生性商品交易採行風險管理措施
(assert (= derivative_transaction_risk_management_measures_compliance
   (and risk_management_scope_includes_all
        trading_and_settlement_personnel_separated
        risk_control_personnel_separated_and_report_to_board
        positions_evaluated_weekly_or_more
        other_important_risk_measures_implemented)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= is_corporation_or_foreign_company true))
(assert (= regulations_defined_by_authority true))
(assert (= major_financial_business_rules_defined true))
(assert (= violate_36_1_or_165_1_applied_36_1_rules true))
(assert (= violation_178_11 true))
(assert (= violation_178_1 false))
(assert (= violation_178_2 false))
(assert (= violation_178_3 false))
(assert (= violation_178_4 false))
(assert (= violation_178_5 false))
(assert (= violation_178_6 false))
(assert (= violation_178_7 false))
(assert (= violation_178_8 false))
(assert (= violation_178_9 false))
(assert (= violation_178_10 false))
(assert (= violation_178_12 false))
(assert (= foreign_company_violation_178_3_or_4 false))
(assert (= asset_acquisition_disposal_procedure_compliance false))
(assert (= procedure_record_asset_scope false))
(assert (= procedure_record_evaluation_process false))
(assert (= procedure_record_operation_process false))
(assert (= procedure_record_announcement_declaration false))
(assert (= procedure_record_limits false))
(assert (= procedure_control_subsidiary_asset false))
(assert (= procedure_penalty_for_violation false))
(assert (= procedure_record_other_important_matters false))
(assert (= procedure_followed false))
(assert (= derivative_transaction_risk_management_compliance false))
(assert (= transaction_principles_and_policies_defined false))
(assert (= risk_management_measures_implemented false))
(assert (= internal_audit_system_established false))
(assert (= regular_evaluation_and_abnormal_handling_defined false))
(assert (= derivative_transaction_risk_management_measures_compliance false))
(assert (= risk_management_scope_includes_all false))
(assert (= trading_and_settlement_personnel_separated false))
(assert (= risk_control_personnel_separated_and_report_to_board false))
(assert (= positions_evaluated_weekly_or_more false))
(assert (= other_important_risk_measures_implemented false))
(assert (= fail_to_comply_documentation_requirements false))
(assert (= fail_to_establish_or_comply_compensation_committee_rules false))
(assert (= fail_to_submit_or_obstruct_inspection false))
(assert (= case_is_minor false))
(assert (= case_improved false))
(assert (= penalty_exempted_for_minor_cases false))
(assert (= penalty true))
(assert (= issuer_responsible_person_punishable true))
(assert (= violate_22_2_1_or_2_or_26_1_or_165_1_applied_22_2_1_or_2 false))
(assert (= violate_specified_articles_14_14_1_14_2_etc false))
(assert (= violate_14_4_1_2_or_165_1_applied_14_4_1_2_or_14_4_5_or_165_1_applied_14_4_5 false))
(assert (= violate_25_1_or_165_1_applied_25_1_rules false))
(assert (= violate_26_2_rules false))
(assert (= violate_26_3_1_7_8_or_165_1_applied_26_3 false))
(assert (= violate_28_2_2_4_7_or_165_1_applied_28_2 false))
(assert (= violate_43_2_1_43_3_1_43_5_1_or_165_1_165_2_applied_43_2_3_etc false))
(assert (= is_foreign_company_issuer false))
(assert (= violation_177_1 false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 21
; Total variables: 56
; Total facts: 56
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

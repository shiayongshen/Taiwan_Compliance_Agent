; SMT2 file generated from compliance case automatic
; Case ID: case_79
; Generated at: 2025-10-19T07:23:50.337249
;
; This file can be executed with Z3:
;   z3 case_79.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_appointment_reported_within_7_days Int)
(declare-const agent_authorize_others_to_operate Bool)
(declare-const agent_coerce_or_induce_unfair_contract Bool)
(declare-const agent_commission_paid_to_non_actual_solicitor Bool)
(declare-const agent_conceal_important_contract_info Bool)
(declare-const agent_conflict_of_interest Bool)
(declare-const agent_criminal_conviction Bool)
(declare-const agent_damage_insurance_image Bool)
(declare-const agent_fail_confirm_consumer_suitability Bool)
(declare-const agent_fail_fill_solicitation_report Bool)
(declare-const agent_fail_license_revocation_within_deadline Bool)
(declare-const agent_fail_report_to_trade_association Bool)
(declare-const agent_false_advertising_or_promotion Bool)
(declare-const agent_false_financial_report Bool)
(declare-const agent_false_license_application Bool)
(declare-const agent_hire_unqualified_personnel Bool)
(declare-const agent_illegal_commission_or_payment Bool)
(declare-const agent_illegal_insurance_payment Bool)
(declare-const agent_improper_inducement_to_cancel_or_loan Bool)
(declare-const agent_induce_contract_termination_or_loan Bool)
(declare-const agent_license_revoked_after_resignation Bool)
(declare-const agent_license_used_by_others Bool)
(declare-const agent_misuse_of_premium_or_claim Bool)
(declare-const agent_other_violations Bool)
(declare-const agent_outside_scope_operations Bool)
(declare-const agent_prohibited_behavior_compliance Bool)
(declare-const agent_report_filing_compliance Bool)
(declare-const agent_resignation_reported_within_15_days Int)
(declare-const agent_sell_unapproved_foreign_policy_discount Bool)
(declare-const agent_spread_false_information Bool)
(declare-const agent_transfer_documents_to_unauthorized Bool)
(declare-const agent_unapproved_insurance_business Bool)
(declare-const agent_unapproved_insurance_operations Bool)
(declare-const agent_unauthorized_business_suspension_or_termination Bool)
(declare-const agent_use_unapproved_advertising Bool)
(declare-const annual_revenue Real)
(declare-const article_163_5_complied Bool)
(declare-const article_165_1_complied Bool)
(declare-const assist_violate_formal_condition Bool)
(declare-const audit_committee_approval_ratio Real)
(declare-const audit_committee_established Bool)
(declare-const audit_system_established Bool)
(declare-const audit_system_executed Bool)
(declare-const board_of_directors_approved Bool)
(declare-const board_of_directors_resolution Bool)
(declare-const business_management_rule_complied Bool)
(declare-const compensation_system_established Bool)
(declare-const compensation_system_executed Bool)
(declare-const consumer_suitability_confirmed Bool)
(declare-const consumer_suitability_confirmed_flag Bool)
(declare-const financial_management_rule_complied Bool)
(declare-const internal_control_approved Bool)
(declare-const internal_control_audit_committee_approved Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_established_timing Real)
(declare-const internal_control_established_within_next_year Bool)
(declare-const internal_control_executed Bool)
(declare-const is_public_company Bool)
(declare-const management_rule_compliance Bool)
(declare-const penalty Bool)
(declare-const serious_violation Bool)
(declare-const solicitation_handling_system_established Bool)
(declare-const solicitation_handling_system_executed Bool)
(declare-const violate_advertising_rule Bool)
(declare-const violate_consumer_info_rule Bool)
(declare-const violate_disclosure_method_rule Bool)
(declare-const violate_disclosure_rule Bool)
(declare-const violate_suitability_consideration_rule Bool)
(declare-const violation_advertising Bool)
(declare-const violation_compensation_system Bool)
(declare-const violation_consumer_info Bool)
(declare-const violation_disclosure Bool)
(declare-const violation_formal_condition Bool)
(declare-const violation_serious Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:internal_control_compliance] 建立且確實執行內部控制、稽核制度、招攬處理制度及程序
(assert (= internal_control_compliance
   (and internal_control_established
        internal_control_executed
        audit_system_established
        audit_system_executed
        solicitation_handling_system_established
        solicitation_handling_system_executed)))

; [insurance:management_rule_compliance] 遵守財務或業務管理相關管理規則及相關規定
(assert (= management_rule_compliance
   (and financial_management_rule_complied
        business_management_rule_complied
        article_165_1_complied
        article_163_5_complied)))

; [finance_consumer:violation_advertising] 違反廣告、業務招攬、營業促銷活動方式或內容規定
(assert (= violation_advertising violate_advertising_rule))

; [finance_consumer:violation_consumer_info] 違反未充分瞭解金融消費者資料及適合度規定
(assert (= violation_consumer_info
   (or violate_consumer_info_rule violate_suitability_consideration_rule)))

; [finance_consumer:violation_disclosure] 違反未充分說明金融商品、服務、契約重要內容或揭露風險規定
(assert (= violation_disclosure
   (or violate_disclosure_method_rule violate_disclosure_rule)))

; [finance_consumer:violation_compensation_system] 違反酬金制度訂定或執行規定
(assert (= violation_compensation_system
   (or (not compensation_system_established) (not compensation_system_executed))))

; [finance_consumer:violation_formal_condition] 協助金融服務業未符合形式條件者
(assert (= violation_formal_condition assist_violate_formal_condition))

; [finance_consumer:serious_violation] 金融服務業違反規定且情節重大
(assert (= serious_violation
   (and (or violation_compensation_system
            violation_advertising
            violation_consumer_info
            violation_disclosure
            violation_formal_condition)
        violation_serious)))

; [insurance:internal_control_established_and_approved] 內部控制、稽核制度與招攬處理制度及程序經董（理）事會通過
(assert (= internal_control_approved
   (and internal_control_established
        audit_system_established
        solicitation_handling_system_established
        board_of_directors_approved)))

; [insurance:internal_control_audit_committee_approval] 設置審計委員會者，內部控制、稽核制度與招攬處理制度及程序經審計委員會同意
(assert (= internal_control_audit_committee_approved
   (or (not audit_committee_established)
       (and (<= (/ 1.0 2.0) audit_committee_approval_ratio)
            board_of_directors_resolution))))

; [insurance:internal_control_established_timing] 公開發行公司或營業收入達2億者，次年內建立內部控制、稽核制度與招攬處理制度及程序
(assert (let ((a!1 (or (not (or is_public_company (<= 200000000.0 annual_revenue)))
               internal_control_established_within_next_year)))
  (= internal_control_established_timing (ite a!1 1.0 0.0))))

; [insurance:agent_report_filing_compliance] 代理人離職及任用報備符合規定
(assert (= agent_report_filing_compliance
   (and (= agent_resignation_reported_within_15_days 1)
        agent_license_revoked_after_resignation
        (= agent_appointment_reported_within_7_days 1))))

; [insurance:agent_prohibited_behavior_compliance] 代理人及相關人員無禁止行為
(assert (= agent_prohibited_behavior_compliance
   (and (not agent_false_license_application)
        (not agent_unapproved_insurance_business)
        (not agent_unapproved_insurance_operations)
        (not agent_conceal_important_contract_info)
        (not agent_coerce_or_induce_unfair_contract)
        (not agent_false_advertising_or_promotion)
        (not agent_improper_inducement_to_cancel_or_loan)
        (not agent_misuse_of_premium_or_claim)
        (not agent_license_used_by_others)
        (not agent_criminal_conviction)
        (not agent_outside_scope_operations)
        (not agent_illegal_commission_or_payment)
        (not agent_illegal_insurance_payment)
        (not agent_spread_false_information)
        (not agent_authorize_others_to_operate)
        (not agent_transfer_documents_to_unauthorized)
        (not agent_hire_unqualified_personnel)
        (not agent_fail_license_revocation_within_deadline)
        (not agent_unauthorized_business_suspension_or_termination)
        (not agent_fail_report_to_trade_association)
        (not agent_use_unapproved_advertising)
        (not agent_commission_paid_to_non_actual_solicitor)
        (not agent_fail_confirm_consumer_suitability)
        (not agent_sell_unapproved_foreign_policy_discount)
        (not agent_false_financial_report)
        (not agent_conflict_of_interest)
        (not agent_induce_contract_termination_or_loan)
        (not agent_fail_fill_solicitation_report)
        (not agent_other_violations)
        (not agent_damage_insurance_image))))

; [insurance:consumer_suitability_confirmed] 確認金融消費者對保險商品之適合度
(assert (= consumer_suitability_confirmed consumer_suitability_confirmed_flag))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反內部控制、稽核制度、招攬處理制度或程序，或違反管理規則，或金融消費者保護法相關規定，或代理人禁止行為時處罰
(assert (= penalty
   (or (not management_rule_compliance)
       violation_compensation_system
       violation_advertising
       (not internal_control_compliance)
       (not agent_prohibited_behavior_compliance)
       violation_consumer_info
       violation_disclosure
       violation_formal_condition)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= audit_system_established false))
(assert (= audit_system_executed false))
(assert (= solicitation_handling_system_established false))
(assert (= solicitation_handling_system_executed false))
(assert (= internal_control_compliance false))
(assert (= financial_management_rule_complied false))
(assert (= business_management_rule_complied false))
(assert (= article_165_1_complied false))
(assert (= article_163_5_complied false))
(assert (= management_rule_compliance false))
(assert (= violate_advertising_rule true))
(assert (= violation_advertising true))
(assert (= violate_consumer_info_rule true))
(assert (= violate_suitability_consideration_rule true))
(assert (= violation_consumer_info true))
(assert (= violate_disclosure_rule false))
(assert (= violate_disclosure_method_rule false))
(assert (= violation_disclosure false))
(assert (= compensation_system_established true))
(assert (= compensation_system_executed true))
(assert (= violation_compensation_system false))
(assert (= assist_violate_formal_condition false))
(assert (= violation_formal_condition false))
(assert (= agent_false_license_application false))
(assert (= agent_unapproved_insurance_business false))
(assert (= agent_unapproved_insurance_operations false))
(assert (= agent_conceal_important_contract_info false))
(assert (= agent_coerce_or_induce_unfair_contract false))
(assert (= agent_false_advertising_or_promotion false))
(assert (= agent_improper_inducement_to_cancel_or_loan false))
(assert (= agent_misuse_of_premium_or_claim false))
(assert (= agent_license_used_by_others false))
(assert (= agent_criminal_conviction false))
(assert (= agent_outside_scope_operations false))
(assert (= agent_illegal_commission_or_payment false))
(assert (= agent_illegal_insurance_payment false))
(assert (= agent_spread_false_information false))
(assert (= agent_authorize_others_to_operate false))
(assert (= agent_transfer_documents_to_unauthorized false))
(assert (= agent_hire_unqualified_personnel false))
(assert (= agent_fail_license_revocation_within_deadline false))
(assert (= agent_unauthorized_business_suspension_or_termination false))
(assert (= agent_fail_report_to_trade_association false))
(assert (= agent_use_unapproved_advertising true))
(assert (= agent_commission_paid_to_non_actual_solicitor false))
(assert (= agent_fail_confirm_consumer_suitability true))
(assert (= agent_sell_unapproved_foreign_policy_discount false))
(assert (= agent_false_financial_report false))
(assert (= agent_conflict_of_interest false))
(assert (= agent_induce_contract_termination_or_loan false))
(assert (= agent_fail_fill_solicitation_report false))
(assert (= agent_other_violations false))
(assert (= agent_damage_insurance_image false))
(assert (= agent_appointment_reported_within_7_days 7))
(assert (= agent_resignation_reported_within_15_days 7))
(assert (= agent_license_revoked_after_resignation true))
(assert (= agent_report_filing_compliance true))
(assert (= agent_prohibited_behavior_compliance false))
(assert (= consumer_suitability_confirmed_flag false))
(assert (= consumer_suitability_confirmed false))
(assert (= penalty true))
(assert (= serious_violation true))
(assert (= violation_serious true))
(assert (= is_public_company false))
(assert (= annual_revenue 0.0))
(assert (= internal_control_established_within_next_year false))
(assert (= internal_control_approved false))
(assert (= internal_control_audit_committee_approved false))
(assert (= audit_committee_established false))
(assert (= audit_committee_approval_ratio 0.0))
(assert (= board_of_directors_approved false))
(assert (= board_of_directors_resolution false))
(assert (= internal_control_established_timing 0.0))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 16
; Total variables: 75
; Total facts: 75
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

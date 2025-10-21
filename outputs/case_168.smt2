; SMT2 file generated from compliance case automatic
; Case ID: case_168
; Generated at: 2025-10-21T21:35:44.673632
;
; This file can be executed with Z3:
;   z3 case_168.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const IF Bool)
(declare-const agent_type Bool)
(declare-const approved_by_authority Bool)
(declare-const assist_create_formal_appearance Bool)
(declare-const audit_system_established Bool)
(declare-const audit_system_implemented Bool)
(declare-const bank_has_permission Bool)
(declare-const bank_operate_as_agent Bool)
(declare-const bank_operate_as_broker Bool)
(declare-const bank_permission_for_agent_or_broker Bool)
(declare-const broker_duty_of_care_and_fidelity Bool)
(declare-const broker_exercise_due_care Bool)
(declare-const broker_fulfill_fiduciary_duty Bool)
(declare-const broker_report_and_fee_disclosure Bool)
(declare-const client_meets_conditions Bool)
(declare-const compensation_principles_approved_by_authority Bool)
(declare-const compensation_principles_drafted_by_association Bool)
(declare-const compensation_system_approved_by_board Bool)
(declare-const compensation_system_considers_customer_interest Bool)
(declare-const compensation_system_considers_only_performance Bool)
(declare-const compensation_system_considers_risks Bool)
(declare-const compensation_system_established Bool)
(declare-const compensation_system_established_and_approved Bool)
(declare-const compensation_system_fair_and_risk_considered Bool)
(declare-const compensation_system_principles_approved Bool)
(declare-const compliance_advertising_rules Bool)
(declare-const compliance_disclosure_rules Bool)
(declare-const compliance_suitability_rules Bool)
(declare-const compliance_with_management_rules Bool)
(declare-const fee_charged Bool)
(declare-const fee_standard_disclosed Bool)
(declare-const fixed_office_and_accounting Bool)
(declare-const guarantee_deposit_amount Real)
(declare-const guarantee_insurance Bool)
(declare-const has_agent_license Bool)
(declare-const has_broker_license Bool)
(declare-const has_certain_scale Bool)
(declare-const has_dedicated_accounting_books Bool)
(declare-const has_fixed_office Bool)
(declare-const has_notary_license Bool)
(declare-const insurance_category Bool)
(declare-const insurance_type Bool)
(declare-const insurance_type_classification Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_implemented Bool)
(declare-const internal_control_required Bool)
(declare-const is_public_company Bool)
(declare-const liability_insurance Bool)
(declare-const license_and_guarantee_required Bool)
(declare-const license_issued Bool)
(declare-const management_rules_complied Bool)
(declare-const minimum_guarantee_deposit Real)
(declare-const penalty Bool)
(declare-const relevant_insurance_purchased Bool)
(declare-const relevant_insurance_type_correct Bool)
(declare-const single_license_only Bool)
(declare-const solicitation_handling_system_established Bool)
(declare-const solicitation_handling_system_implemented Bool)
(declare-const violation_167_2 Bool)
(declare-const violation_167_3 Bool)
(declare-const violation_30_1 Bool)
(declare-const violation_30_1_formal Bool)
(declare-const violation_30_1_major Bool)
(declare-const violation_severe Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:license_and_guarantee_required] 保險代理人、經紀人、公證人須經主管機關許可，繳存保證金並投保相關保險，領有執業證照後始得經營或執行業務
(assert (= license_and_guarantee_required
   (and approved_by_authority
        (>= guarantee_deposit_amount minimum_guarantee_deposit)
        relevant_insurance_purchased
        license_issued)))

; [insurance:relevant_insurance_type_correct] 保險代理人、公證人投保責任保險；保險經紀人投保責任保險及保證保險
(assert (= relevant_insurance_type_correct
   (and agent_type (= insurance_type liability_insurance))))

; [insurance:single_license_only] 兼有保險代理人、經紀人、公證人資格者僅得擇一申領執業證照
(assert (= single_license_only
   (>= 1
       (+ (ite has_agent_license 1 0)
          (ite has_broker_license 1 0)
          (ite has_notary_license 1 0)))))

; [insurance:fixed_office_and_accounting] 保險代理人、經紀人、公證人應有固定業務處所，並專設帳簿記載業務收支
(assert (= fixed_office_and_accounting
   (and has_fixed_office has_dedicated_accounting_books)))

; [insurance:internal_control_required] 保險代理人公司、經紀人公司為公開發行公司或具一定規模者，應建立內部控制、稽核制度與招攬處理制度及程序
(assert (= internal_control_required
   (or (not (or is_public_company has_certain_scale))
       (and internal_control_established
            audit_system_established
            solicitation_handling_system_established))))

; [insurance:internal_control_executed] 保險代理人公司、經紀人公司應確實執行內部控制、稽核制度與招攬處理制度及程序
(assert (= internal_control_executed
   (or (not (or is_public_company has_certain_scale))
       (and internal_control_implemented
            audit_system_implemented
            solicitation_handling_system_implemented))))

; [insurance:compliance_with_management_rules] 遵守主管機關定之管理規則，包括資格取得、申請許可條件、程序、文件、董事監察人經理人資格、解任事由、分支機構條件、財務與業務管理、教育訓練、廢止許可及其他事項
(assert (= compliance_with_management_rules management_rules_complied))

; [insurance:broker_duty_of_care_and_fidelity] 保險經紀人應以善良管理人注意義務為被保險人洽訂保險契約或提供服務，並負忠實義務
(assert (= broker_duty_of_care_and_fidelity
   (and broker_exercise_due_care broker_fulfill_fiduciary_duty)))

; [insurance:broker_provide_written_report_and_disclose_fee] 保險經紀人於主管機關指定範圍內洽訂保險契約前，應主動提供書面分析報告，向要保人或被保險人收取報酬者，應明確告知報酬收取標準
(assert (= broker_report_and_fee_disclosure
   (and written_analysis_report_provided
        (or (not fee_charged) fee_standard_disclosed))))

; [insurance:bank_permission_for_agent_or_broker] 銀行得經主管機關許可擇一兼營保險代理人或保險經紀人業務，並分別準用相關規定
(assert (= bank_permission_for_agent_or_broker
   (or (not bank_has_permission) bank_operate_as_broker bank_operate_as_agent)))

; [insurance:violation_penalty_167_2] 違反保險法第163條第四項管理規則財務或業務管理規定、第163條第七項規定，或違反第165條第一項或第163條第五項準用規定者，應限期改正或處罰鍰，情節重大者廢止許可並註銷執業證照
(assert (= violation_167_2
   (or (not internal_control_required)
       (not license_and_guarantee_required)
       (not internal_control_executed)
       (not fixed_office_and_accounting)
       (not compliance_with_management_rules))))

; [insurance:violation_penalty_167_3] 違反第165條第三項或第163條第五項準用規定，未建立或未確實執行內部控制、稽核制度、招攬處理制度或程序者，應限期改正或處罰鍰
(assert (= violation_167_3
   (or (not internal_control_implemented)
       (not solicitation_handling_system_implemented)
       (not audit_system_established)
       (not audit_system_implemented)
       (not solicitation_handling_system_established)
       (not internal_control_established))))

; [financial:compensation_system_established_and_approved] 金融服務業應訂定業務人員酬金制度並提報董（理）事會通過
(assert (= compensation_system_established_and_approved
   (and compensation_system_established compensation_system_approved_by_board)))

; [financial:compensation_system_fair_and_risk_considered] 酬金制度應衡平考量客戶權益及風險，不得僅考量業績目標達成情形
(assert (= compensation_system_fair_and_risk_considered
   (and compensation_system_considers_customer_interest
        compensation_system_considers_risks
        (not compensation_system_considers_only_performance))))

; [financial:compensation_system_principles_approved] 酬金制度應遵行原則由同業公會擬訂或主管機關指定公會擬訂，報主管機關核定
(assert (= compensation_system_principles_approved
   (and compensation_principles_drafted_by_association
        compensation_principles_approved_by_authority)))

; [financial:violation_penalty_30_1] 金融服務業違反廣告、招攬、促銷、適合度說明、酬金制度等規定者處罰鍰
(assert (= violation_30_1
   (or (not compliance_disclosure_rules)
       (not compliance_suitability_rules)
       (not compensation_system_established_and_approved)
       (not compensation_system_fair_and_risk_considered)
       (not compliance_advertising_rules)
       (not compensation_system_principles_approved))))

; [financial:violation_penalty_30_1_major] 金融服務業違反前項情形且情節重大者，主管機關得加重處罰
(assert (= violation_30_1_major (and violation_30_1 violation_severe)))

; [financial:violation_penalty_30_1_formal] 金融服務業對未符合條件者協助創造形式上外觀條件者處罰
(assert (= violation_30_1_formal
   (and (not client_meets_conditions) assist_create_formal_appearance)))

; [insurance:insurance_type_classification] 保險分類：財產保險與人身保險
(assert (and (or (not insurance_type_classification) insurance_category)
     (or (not insurance_category) insurance_type_classification)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反保險法及金融消費者保護法相關規定時處罰
(assert (= penalty
   (or violation_167_2 violation_167_3 violation_30_1 violation_30_1_formal)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= approved_by_authority true))
(assert (= guarantee_deposit_amount 500000))
(assert (= minimum_guarantee_deposit 500000))
(assert (= relevant_insurance_purchased true))
(assert (= license_issued true))
(assert (= has_broker_license true))
(assert (= has_agent_license false))
(assert (= has_notary_license false))
(assert (= internal_control_required true))
(assert (= internal_control_established false))
(assert (= internal_control_implemented false))
(assert (= audit_system_established false))
(assert (= audit_system_implemented false))
(assert (= solicitation_handling_system_established false))
(assert (= solicitation_handling_system_implemented false))
(assert (= compliance_with_management_rules false))
(assert (= compensation_system_established false))
(assert (= compensation_system_approved_by_board false))
(assert (= compensation_principles_drafted_by_association false))
(assert (= compensation_principles_approved_by_authority false))
(assert (= compensation_system_considers_customer_interest false))
(assert (= compensation_system_considers_risks false))
(assert (= compensation_system_considers_only_performance true))
(assert (= compliance_advertising_rules true))
(assert (= compliance_suitability_rules true))
(assert (= compliance_disclosure_rules true))
(assert (= broker_exercise_due_care true))
(assert (= broker_fulfill_fiduciary_duty true))
(assert (= written_analysis_report_provided true))
(assert (= fee_charged false))
(assert (= fee_standard_disclosed false))
(assert (= has_fixed_office true))
(assert (= has_dedicated_accounting_books true))
(assert (= bank_has_permission false))
(assert (= bank_operate_as_agent false))
(assert (= bank_operate_as_broker false))
(assert (= management_rules_complied false))
(assert (= violation_167_2 true))
(assert (= violation_167_3 true))
(assert (= violation_30_1 true))
(assert (= violation_30_1_formal false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 21
; Total variables: 66
; Total facts: 42
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

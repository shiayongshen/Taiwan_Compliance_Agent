; SMT2 file generated from compliance case automatic
; Case ID: case_103
; Generated at: 2025-10-21T01:41:15.079692
;
; This file can be executed with Z3:
;   z3 case_103.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accounting_and_business_policies_defined Bool)
(declare-const annual_income_repatriated_to_parent Bool)
(declare-const audit_plan_and_findings_reported_to_insurer Bool)
(declare-const audit_reports_reviewed_and_followed_up Bool)
(declare-const board_approval_ratio Real)
(declare-const board_approval_ratio_loan_approval Real)
(declare-const board_attendance_ratio Real)
(declare-const board_attendance_ratio_loan_approval Real)
(declare-const board_report_data_not_false Bool)
(declare-const board_reported_according_to_regulations Bool)
(declare-const board_risk_management_committee_established Bool)
(declare-const business_scope_limited_to_real_estate_related Bool)
(declare-const business_strategy_and_risk_management_policies_defined Bool)
(declare-const capital_fund Real)
(declare-const capital_to_risk_ratio_latest Real)
(declare-const chief_risk_officer_appointed Bool)
(declare-const compliance_with_laws_and_timely_reporting Bool)
(declare-const disclosure_in_annual_financial_report Bool)
(declare-const disclosure_on_website Bool)
(declare-const effective_communication_between_insurer_and_business Bool)
(declare-const foreign_real_estate_investment_board_approval Bool)
(declare-const foreign_real_estate_investment_board_report_filing Bool)
(declare-const foreign_real_estate_investment_compliance Bool)
(declare-const foreign_real_estate_investment_disclosure Bool)
(declare-const foreign_real_estate_investment_internal_control Bool)
(declare-const foreign_real_estate_investment_loan_conditions_compliance Bool)
(declare-const foreign_real_estate_investment_report_to_authority Bool)
(declare-const foreign_real_estate_investment_responsible_person Bool)
(declare-const foreign_real_estate_investment_risk_control Bool)
(declare-const foreign_real_estate_investment_total Real)
(declare-const foreign_real_estate_investment_valuation_and_management Bool)
(declare-const foreign_real_estate_legal_use_and_benefit Bool)
(declare-const foreign_real_estate_meets_local_economic_return Bool)
(declare-const foreign_real_estate_rental_rate Real)
(declare-const funds_used_only_for_specified_purposes Bool)
(declare-const independent_financial_and_business_information_system_established Bool)
(declare-const internal_audit_unit_established_and_supervised Bool)
(declare-const internal_audit_unit_reviews_and_follows_up Bool)
(declare-const internal_control_special_purpose_real_estate Bool)
(declare-const internal_risk_management_department_established Bool)
(declare-const investment_evaluation_report_submitted Bool)
(declare-const investment_structure_change_reported_within_7_days Bool)
(declare-const legal_standard Bool)
(declare-const loan_conditions_not_better_than_local Bool)
(declare-const loan_total_to_related_parties Real)
(declare-const loan_total_to_specific_purpose_investment Real)
(declare-const major_financial_or_business_events_reported_within_7_days Bool)
(declare-const no_external_borrowing_except_specified Bool)
(declare-const organization_control_structure_established Bool)
(declare-const owner_equity_total Real)
(declare-const penalty Bool)
(declare-const property_management_by_international_agency Bool)
(declare-const quarterly_management_reports_obtained_and_reviewed Bool)
(declare-const real_estate_investment_compliance Bool)
(declare-const real_estate_investment_immediate_use_and_income Bool)
(declare-const real_estate_investment_legal_valuation Bool)
(declare-const real_estate_investment_total_excluding_self_use Real)
(declare-const responsible_person_assigned Bool)
(declare-const risk_level_control_mechanism_established Bool)
(declare-const risk_monitoring_measures_established Bool)
(declare-const self_use_real_estate_total Real)
(declare-const social_housing_only_rental Bool)
(declare-const special_purpose_real_estate_investment_business_compliance Bool)
(declare-const supervision_and_management_of_major_financial_and_business_matters Bool)
(declare-const valuation_by_qualified_international_valuation_agency Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:real_estate_investment_compliance] 不動產投資符合即時利用且有收益，且投資總額及自用不動產限額符合規定
(assert (let ((a!1 (or social_housing_only_rental
               (and real_estate_investment_immediate_use_and_income
                    (<= real_estate_investment_total_excluding_self_use
                        (* 30.0 capital_fund))
                    (<= self_use_real_estate_total owner_equity_total)))))
  (= real_estate_investment_compliance
     (and real_estate_investment_legal_valuation a!1))))

; [insurance:foreign_real_estate_investment_compliance] 國外及大陸地區不動產投資符合合法利用且產生效益，並符合資本比率及投資限額規定
(assert (let ((a!1 (and (not (or (<= (/ 5.0 4.0) capital_to_risk_ratio_latest)
                         (<= (/ 3.0 2.0) capital_to_risk_ratio_latest)))
                (<= foreign_real_estate_investment_total capital_fund)
                (<= foreign_real_estate_investment_total
                    (* 10.0 owner_equity_total)))))
(let ((a!2 (or a!1
               (and (<= (/ 5.0 4.0) capital_to_risk_ratio_latest)
                    (not (<= (/ 3.0 2.0) capital_to_risk_ratio_latest))
                    (<= foreign_real_estate_investment_total
                        (* (/ 5.0 2.0) capital_fund))
                    (<= foreign_real_estate_investment_total
                        (* 40.0 owner_equity_total)))
               (and (<= (/ 3.0 2.0) capital_to_risk_ratio_latest)
                    (<= foreign_real_estate_investment_total
                        (* 3.0 capital_fund))
                    (<= foreign_real_estate_investment_total
                        (* 40.0 owner_equity_total))))))
  (= foreign_real_estate_investment_compliance
     (and foreign_real_estate_legal_use_and_benefit
          (>= capital_to_risk_ratio_latest (ite legal_standard 1.0 0.0))
          a!2
          (<= 60.0 foreign_real_estate_rental_rate)
          foreign_real_estate_meets_local_economic_return)))))

; [insurance:foreign_real_estate_investment_internal_control] 國外及大陸地區不動產投資設有董事會風險管理委員會及風險管理部門與風控長
(assert (= foreign_real_estate_investment_internal_control
   (and board_risk_management_committee_established
        internal_risk_management_department_established
        chief_risk_officer_appointed)))

; [insurance:foreign_real_estate_investment_board_approval] 國外及大陸地區不動產投資經董事會三分之二以上出席及出席董事二分之一以上同意
(assert (= foreign_real_estate_investment_board_approval
   (and (<= (/ 6667.0 100.0) board_attendance_ratio)
        (<= 50.0 board_approval_ratio))))

; [insurance:foreign_real_estate_investment_disclosure] 國外及大陸地區不動產投資資訊依規定於資訊公開網頁及年度財務報告揭露
(assert (= foreign_real_estate_investment_disclosure
   (and disclosure_on_website disclosure_in_annual_financial_report)))

; [insurance:foreign_real_estate_investment_valuation_and_management] 國外及大陸地區不動產投資經合格鑑價機構評價，委託國際性物業管理機構管理
(assert (= foreign_real_estate_investment_valuation_and_management
   (and valuation_by_qualified_international_valuation_agency
        property_management_by_international_agency)))

; [insurance:foreign_real_estate_investment_risk_control] 國外及大陸地區不動產投資設有風險監控管理措施及分級控管機制
(assert (= foreign_real_estate_investment_risk_control
   (and risk_monitoring_measures_established
        risk_level_control_mechanism_established)))

; [insurance:foreign_real_estate_investment_responsible_person] 國外及大陸地區不動產投資指派具相關經驗或專業訓練人員負責並提出投資評估報告
(assert (= foreign_real_estate_investment_responsible_person
   (and responsible_person_assigned investment_evaluation_report_submitted)))

; [insurance:foreign_real_estate_investment_report_to_authority] 國外及大陸地區不動產投資變動及重大事項於七日內向主管機關陳報
(assert (= foreign_real_estate_investment_report_to_authority
   (and investment_structure_change_reported_within_7_days
        major_financial_or_business_events_reported_within_7_days)))

; [insurance:foreign_real_estate_investment_loan_conditions_compliance] 貸款方式取得國外及大陸地區不動產符合貸款條件及董事會同意規定
(assert (= foreign_real_estate_investment_loan_conditions_compliance
   (and (<= loan_total_to_specific_purpose_investment
            (* 10.0 owner_equity_total))
        (<= loan_total_to_related_parties (* 40.0 owner_equity_total))
        loan_conditions_not_better_than_local
        (<= (/ 6667.0 100.0) board_attendance_ratio_loan_approval)
        (<= 75.0 board_approval_ratio_loan_approval))))

; [insurance:foreign_real_estate_investment_special_purpose_business_compliance] 特定目的不動產投資事業符合業務範圍、借款限制及資金用途規定
(assert (= special_purpose_real_estate_investment_business_compliance
   (and business_scope_limited_to_real_estate_related
        no_external_borrowing_except_specified
        funds_used_only_for_specified_purposes
        annual_income_repatriated_to_parent)))

; [insurance:foreign_real_estate_investment_internal_control_special_purpose] 保險業對特定目的不動產投資事業訂定內部控制制度並督促建立
(assert (= internal_control_special_purpose_real_estate
   (and organization_control_structure_established
        business_strategy_and_risk_management_policies_defined
        accounting_and_business_policies_defined
        supervision_and_management_of_major_financial_and_business_matters
        independent_financial_and_business_information_system_established
        effective_communication_between_insurer_and_business
        quarterly_management_reports_obtained_and_reviewed
        compliance_with_laws_and_timely_reporting
        internal_audit_unit_established_and_supervised
        audit_reports_reviewed_and_followed_up
        audit_plan_and_findings_reported_to_insurer
        internal_audit_unit_reviews_and_follows_up)))

; [insurance:foreign_real_estate_investment_board_report_filing] 未依規定提報董事會或提報資料虛偽不實者，二年內不得依規定辦理投資
(assert (not (= (or board_reported_according_to_regulations board_report_data_not_false)
        foreign_real_estate_investment_board_report_filing)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反不動產投資相關規定時處罰
(assert (= penalty
   (or (not foreign_real_estate_investment_internal_control)
       (not foreign_real_estate_investment_board_report_filing)
       (not real_estate_investment_compliance)
       (not foreign_real_estate_investment_risk_control)
       (not internal_control_special_purpose_real_estate)
       (not foreign_real_estate_investment_loan_conditions_compliance)
       (not foreign_real_estate_investment_compliance)
       (not foreign_real_estate_investment_disclosure)
       (not foreign_real_estate_investment_responsible_person)
       (not foreign_real_estate_investment_report_to_authority)
       (not special_purpose_real_estate_investment_business_compliance)
       (not foreign_real_estate_investment_board_approval)
       (not foreign_real_estate_investment_valuation_and_management))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= real_estate_investment_legal_valuation true))
(assert (= real_estate_investment_immediate_use_and_income false))
(assert (= real_estate_investment_total_excluding_self_use 1000000000))
(assert (= capital_fund 500000000))
(assert (= self_use_real_estate_total 200000000))
(assert (= owner_equity_total 400000000))
(assert (= real_estate_investment_compliance false))
(assert (= social_housing_only_rental false))
(assert (= foreign_real_estate_investment_compliance true))
(assert (= foreign_real_estate_investment_internal_control true))
(assert (= foreign_real_estate_investment_board_approval true))
(assert (= foreign_real_estate_investment_disclosure true))
(assert (= foreign_real_estate_investment_valuation_and_management true))
(assert (= foreign_real_estate_investment_risk_control true))
(assert (= foreign_real_estate_investment_responsible_person true))
(assert (= foreign_real_estate_investment_report_to_authority true))
(assert (= foreign_real_estate_investment_loan_conditions_compliance true))
(assert (= special_purpose_real_estate_investment_business_compliance true))
(assert (= internal_control_special_purpose_real_estate true))
(assert (= foreign_real_estate_investment_board_report_filing true))
(assert (= board_risk_management_committee_established true))
(assert (= internal_risk_management_department_established true))
(assert (= chief_risk_officer_appointed true))
(assert (= board_attendance_ratio 80.0))
(assert (= board_approval_ratio 70.0))
(assert (= board_attendance_ratio_loan_approval 70.0))
(assert (= board_approval_ratio_loan_approval 80.0))
(assert (= board_reported_according_to_regulations true))
(assert (= board_report_data_not_false true))
(assert (= disclosure_on_website true))
(assert (= disclosure_in_annual_financial_report true))
(assert (= valuation_by_qualified_international_valuation_agency true))
(assert (= property_management_by_international_agency true))
(assert (= risk_monitoring_measures_established true))
(assert (= risk_level_control_mechanism_established true))
(assert (= responsible_person_assigned true))
(assert (= investment_evaluation_report_submitted true))
(assert (= investment_structure_change_reported_within_7_days true))
(assert (= major_financial_or_business_events_reported_within_7_days true))
(assert (= loan_total_to_specific_purpose_investment 100000000))
(assert (= loan_total_to_related_parties 100000000))
(assert (= loan_conditions_not_better_than_local true))
(assert (= business_scope_limited_to_real_estate_related true))
(assert (= no_external_borrowing_except_specified true))
(assert (= funds_used_only_for_specified_purposes true))
(assert (= annual_income_repatriated_to_parent true))
(assert (= organization_control_structure_established true))
(assert (= business_strategy_and_risk_management_policies_defined true))
(assert (= accounting_and_business_policies_defined true))
(assert (= compliance_with_laws_and_timely_reporting true))
(assert (= independent_financial_and_business_information_system_established true))
(assert (= internal_audit_unit_established_and_supervised true))
(assert (= audit_reports_reviewed_and_followed_up true))
(assert (= audit_plan_and_findings_reported_to_insurer true))
(assert (= internal_audit_unit_reviews_and_follows_up true))
(assert (= quarterly_management_reports_obtained_and_reviewed true))
(assert (= legal_standard true))
(assert (= foreign_real_estate_legal_use_and_benefit true))
(assert (= foreign_real_estate_meets_local_economic_return true))
(assert (= foreign_real_estate_rental_rate 80.0))
(assert (= capital_to_risk_ratio_latest 200.0))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 65
; Total facts: 61
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

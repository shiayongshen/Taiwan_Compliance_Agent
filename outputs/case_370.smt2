; SMT2 file generated from compliance case automatic
; Case ID: case_370
; Generated at: 2025-10-21T08:15:11.629104
;
; This file can be executed with Z3:
;   z3 case_370.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const actuarial_reports_fair_and_true Bool)
(declare-const actuarial_staff_and_external_reviewer_approved Bool)
(declare-const actuarial_staff_assigned Bool)
(declare-const actuarial_staff_hired Bool)
(declare-const appoint_person_as_manager Bool)
(declare-const business_year_end Int)
(declare-const corporate_bonds_per_company_amount Real)
(declare-const corporate_bonds_per_company_equity_percentage Real)
(declare-const exercise_voting_rights_on_director_or_supervisor_election Bool)
(declare-const external_actuarial_review_assigned Bool)
(declare-const external_actuarial_reviewer_hired Bool)
(declare-const external_review_report_false_or_omitted Bool)
(declare-const external_reviewer_approved_by_board Bool)
(declare-const financial_bonds_amount Real)
(declare-const government_bonds_amount Real)
(declare-const insurance_funds Real)
(declare-const insurance_or_representative_is_director_or_supervisor Bool)
(declare-const internal_control_and_handling_penalty Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const investment_limit_compliance Bool)
(declare-const investment_prohibited_conditions Bool)
(declare-const investment_trust_funds_per_fund_percentage Real)
(declare-const investment_trust_funds_total_amount Real)
(declare-const is_responsible_person_business Bool)
(declare-const is_second_degree_relative Bool)
(declare-const is_self Bool)
(declare-const is_spouse Bool)
(declare-const loan_limit_complied Bool)
(declare-const other_transaction_limit_complied Bool)
(declare-const participate_in_management_by_agreement_or_authorization Bool)
(declare-const penalty Bool)
(declare-const related_party_loan_limit_compliance Bool)
(declare-const related_person_classification Int)
(declare-const reported_to_authority Bool)
(declare-const reserve_calculated_by_insurance_type Bool)
(declare-const reserve_calculation_recorded Bool)
(declare-const reserve_recorded_in_special_ledger Bool)
(declare-const securitized_products_and_others_amount Real)
(declare-const serve_as_trust_supervisor_of_securitized_products Bool)
(declare-const signing_actuary_approved_by_board Bool)
(declare-const signing_actuary_assigned Bool)
(declare-const signing_report_false_or_omitted Bool)
(declare-const stocks_per_company_amount Real)
(declare-const stocks_per_company_percentage Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:reserve_calculation_recorded] 保險業於營業年度屆滿時，應分別保險種類計算並記載各種準備金
(assert (= reserve_calculation_recorded
   (and (= business_year_end 1)
        reserve_calculated_by_insurance_type
        reserve_recorded_in_special_ledger)))

; [insurance:internal_control_established] 保險業建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [insurance:internal_handling_established] 保險業建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [insurance:related_party_loan_limit_compliance] 保險業對同一人、同一關係人或同一關係企業放款或其他交易符合主管機關限制
(assert (= related_party_loan_limit_compliance
   (and loan_limit_complied other_transaction_limit_complied)))

; [insurance:related_person_classification] 同一關係人分類（本人=1，配偶=2，二親等血親=3，負責人之事業=4，非關係人=0）
(assert (let ((a!1 (ite is_self
                1
                (ite is_spouse
                     2
                     (ite is_second_degree_relative
                          3
                          (ite is_responsible_person_business 4 0))))))
  (= related_person_classification a!1)))

; [insurance:investment_limit_compliance] 保險業投資各類有價證券及總額符合主管機關規定百分比限制
(assert (= investment_limit_compliance
   (and (<= government_bonds_amount insurance_funds)
        (<= financial_bonds_amount (* (/ 7.0 20.0) insurance_funds))
        (<= stocks_per_company_amount (* (/ 1.0 20.0) insurance_funds))
        (>= 10.0 stocks_per_company_percentage)
        (<= corporate_bonds_per_company_amount (* (/ 1.0 20.0) insurance_funds))
        (>= 10.0 corporate_bonds_per_company_equity_percentage)
        (<= investment_trust_funds_total_amount
            (* (/ 1.0 10.0) insurance_funds))
        (>= 10.0 investment_trust_funds_per_fund_percentage)
        (<= securitized_products_and_others_amount
            (* (/ 1.0 10.0) insurance_funds))
        (<= (+ stocks_per_company_amount corporate_bonds_per_company_amount)
            (* (/ 7.0 20.0) insurance_funds)))))

; [insurance:investment_prohibited_conditions] 保險業依規定投資不得有擔任董事、監察人、行使表決權、指派經理人、擔任信託監察人或參與經營等情事
(assert (not (= (or insurance_or_representative_is_director_or_supervisor
            participate_in_management_by_agreement_or_authorization
            appoint_person_as_manager
            serve_as_trust_supervisor_of_securitized_products
            exercise_voting_rights_on_director_or_supervisor_election)
        investment_prohibited_conditions)))

; [insurance:actuarial_staff_assigned] 保險業聘用精算人員並指派簽證精算人員，負責費率釐訂及準備金核算簽證
(assert (= actuarial_staff_assigned
   (and actuarial_staff_hired signing_actuary_assigned)))

; [insurance:external_actuarial_review_assigned] 保險業聘請外部複核精算人員，負責主管機關指定之精算簽證報告複核
(assert (= external_actuarial_review_assigned external_actuarial_reviewer_hired))

; [insurance:actuarial_staff_and_external_reviewer_approved] 簽證精算人員指派及外部複核精算人員聘請經董（理）事會同意並報主管機關備查
(assert (= actuarial_staff_and_external_reviewer_approved
   (and signing_actuary_approved_by_board
        external_reviewer_approved_by_board
        reported_to_authority)))

; [insurance:actuarial_reports_fair_and_true] 簽證報告及複核報告內容不得有虛偽、隱匿、遺漏或錯誤
(assert (= actuarial_reports_fair_and_true
   (and (not signing_report_false_or_omitted)
        (not external_review_report_false_or_omitted))))

; [insurance:internal_control_and_handling_penalty] 違反內部控制及稽核制度或內部處理制度規定處罰
(assert (= internal_control_and_handling_penalty
   (or (not internal_control_established)
       (not internal_control_executed)
       (not internal_handling_established)
       (not internal_handling_executed))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反內部控制、稽核制度或內部處理制度規定時處罰
(assert (= penalty
   (or (not internal_control_established)
       (not internal_control_executed)
       (not internal_handling_established)
       (not internal_handling_executed))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= business_year_end 1))
(assert (= reserve_calculated_by_insurance_type false))
(assert (= reserve_recorded_in_special_ledger false))
(assert (= internal_control_system_established false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= loan_limit_complied false))
(assert (= other_transaction_limit_complied false))
(assert (= insurance_or_representative_is_director_or_supervisor false))
(assert (= exercise_voting_rights_on_director_or_supervisor_election false))
(assert (= appoint_person_as_manager false))
(assert (= serve_as_trust_supervisor_of_securitized_products false))
(assert (= participate_in_management_by_agreement_or_authorization false))
(assert (= actuarial_staff_hired false))
(assert (= signing_actuary_assigned false))
(assert (= actuarial_staff_assigned false))
(assert (= external_actuarial_reviewer_hired false))
(assert (= external_actuarial_review_assigned false))
(assert (= signing_actuary_approved_by_board false))
(assert (= external_reviewer_approved_by_board false))
(assert (= reported_to_authority false))
(assert (= actuarial_staff_and_external_reviewer_approved false))
(assert (= signing_report_false_or_omitted true))
(assert (= external_review_report_false_or_omitted true))
(assert (= actuarial_reports_fair_and_true false))
(assert (= investment_limit_compliance false))
(assert (= government_bonds_amount 0))
(assert (= financial_bonds_amount 0))
(assert (= stocks_per_company_amount 0))
(assert (= stocks_per_company_percentage 0))
(assert (= corporate_bonds_per_company_amount 0))
(assert (= corporate_bonds_per_company_equity_percentage 0))
(assert (= investment_trust_funds_total_amount 0))
(assert (= investment_trust_funds_per_fund_percentage 0))
(assert (= securitized_products_and_others_amount 0))
(assert (= related_party_loan_limit_compliance false))
(assert (= internal_control_and_handling_penalty true))
(assert (= penalty true))
(assert (= related_person_classification 0))
(assert (= is_self false))
(assert (= is_spouse false))
(assert (= is_second_degree_relative false))
(assert (= is_responsible_person_business false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 49
; Total facts: 46
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

; SMT2 file generated from compliance case automatic
; Case ID: case_370
; Generated at: 2025-10-19T14:15:46.252197
;
; This file can be executed with Z3:
;   z3 case_370.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const actuarial_report_false_or_omitted Bool)
(declare-const actuarial_reports_fair_and_true Bool)
(declare-const actuarial_staff_assigned Bool)
(declare-const actuarial_staff_hired Bool)
(declare-const company_owner_equity Real)
(declare-const company_total_shares Int)
(declare-const corporate_bonds_per_company_amount Real)
(declare-const external_review_actuary_hired Bool)
(declare-const external_review_actuary_hired_flag Bool)
(declare-const external_review_report_fair Bool)
(declare-const financial_bonds_amount Real)
(declare-const fund_investment_per_fund Real)
(declare-const fund_investment_total Real)
(declare-const fund_total_shares Int)
(declare-const government_bonds_amount Real)
(declare-const insurance_funds Real)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const investment_prohibited_acts_absent Bool)
(declare-const investment_securities_limit_complied Bool)
(declare-const no_agreement_to_participate_management Bool)
(declare-const no_board_director_appointment Bool)
(declare-const no_manager_appointment Bool)
(declare-const no_trust_supervisor_appointment Bool)
(declare-const no_voting_right_exercise Bool)
(declare-const penalty Bool)
(declare-const related_party_loan_limit_complied Bool)
(declare-const related_party_loan_limit_respected Bool)
(declare-const reserve_calculation_done Bool)
(declare-const reserve_calculation_recorded Bool)
(declare-const securitized_products_total Real)
(declare-const signing_actuary_assigned Bool)
(declare-const signing_actuary_report_fair Bool)
(declare-const stocks_per_company_amount Real)
(declare-const violation_144_145 Bool)
(declare-const violation_148_3_internal_control Bool)
(declare-const violation_148_3_internal_handling Bool)
(declare-const violation_actuarial_reports Bool)
(declare-const violation_actuarial_staff_assignment Bool)
(declare-const violation_investment_limits Bool)
(declare-const violation_investment_prohibited_acts Bool)
(declare-const violation_related_party_loan_limit Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:reserve_calculation_recorded] 保險業於營業年度屆滿時，應分別保險種類計算並記載各種準備金
(assert (= reserve_calculation_recorded reserve_calculation_done))

; [insurance:internal_control_established] 保險業建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [insurance:internal_handling_established] 保險業建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [insurance:related_party_loan_limit_complied] 保險業對同一人、同一關係人或同一關係企業放款或其他交易符合主管機關限制
(assert (= related_party_loan_limit_complied related_party_loan_limit_respected))

; [insurance:investment_securities_limit_complied] 保險業投資有價證券符合各項百分比限制
(assert (let ((a!1 (and (<= (/ government_bonds_amount insurance_funds) 1.0)
                (<= (/ financial_bonds_amount insurance_funds) (/ 7.0 20.0))
                (<= (/ stocks_per_company_amount insurance_funds) (/ 1.0 20.0))
                (<= (/ stocks_per_company_amount (to_real company_total_shares))
                    (/ 1.0 10.0))
                (<= (/ corporate_bonds_per_company_amount insurance_funds)
                    (/ 1.0 20.0))
                (<= (/ corporate_bonds_per_company_amount company_owner_equity)
                    (/ 1.0 10.0))
                (<= (/ fund_investment_total insurance_funds) (/ 1.0 10.0))
                (<= (/ fund_investment_per_fund (to_real fund_total_shares))
                    (/ 1.0 10.0))
                (<= (/ securitized_products_total insurance_funds) (/ 1.0 10.0))
                (<= (/ (+ stocks_per_company_amount
                          corporate_bonds_per_company_amount)
                       insurance_funds)
                    (/ 7.0 20.0)))))
  (= investment_securities_limit_complied a!1)))

; [insurance:investment_prohibited_acts_absent] 保險業依規定投資不得有擔任董事、監察人、行使表決權、指派經理人、擔任信託監察人或與第三人約定參與經營等情事
(assert (= investment_prohibited_acts_absent
   (and no_board_director_appointment
        no_voting_right_exercise
        no_manager_appointment
        no_trust_supervisor_appointment
        no_agreement_to_participate_management)))

; [insurance:actuarial_staff_assigned] 保險業聘用精算人員並指派簽證精算人員
(assert (= actuarial_staff_assigned
   (and actuarial_staff_hired signing_actuary_assigned)))

; [insurance:external_review_actuary_hired] 保險業聘請外部複核精算人員
(assert (= external_review_actuary_hired external_review_actuary_hired_flag))

; [insurance:actuarial_reports_fair_and_true] 簽證精算人員及外部複核精算人員簽證報告及複核報告內容公正且無虛偽錯誤
(assert (= actuarial_reports_fair_and_true
   (and signing_actuary_report_fair
        external_review_report_fair
        (not actuarial_report_false_or_omitted))))

; [insurance:internal_control_executed] 保險業內部控制及稽核制度確實執行
(assert (= internal_control_executed internal_control_system_executed))

; [insurance:internal_handling_executed] 保險業內部處理制度及程序確實執行
(assert (= internal_handling_executed internal_handling_system_executed))

; [insurance:violation_144_145] 違反保險法第144條第一項至第四項或第145條規定
(assert (= violation_144_145
   (or (not actuarial_staff_assigned)
       (not actuarial_reports_fair_and_true)
       (not reserve_calculation_recorded)
       (not external_review_actuary_hired))))

; [insurance:violation_148_3_internal_control] 違反保險法第148-3條第一項規定未建立或未執行內部控制及稽核制度
(assert (= violation_148_3_internal_control
   (or (not internal_control_established) (not internal_control_executed))))

; [insurance:violation_148_3_internal_handling] 違反保險法第148-3條第二項規定未建立或未執行內部處理制度或程序
(assert (= violation_148_3_internal_handling
   (or (not internal_handling_established) (not internal_handling_executed))))

; [insurance:violation_investment_limits] 違反保險法第146-1條投資資產百分比限制規定
(assert (not (= investment_securities_limit_complied violation_investment_limits)))

; [insurance:violation_investment_prohibited_acts] 違反保險法第146-1條投資禁止行為規定
(assert (not (= investment_prohibited_acts_absent violation_investment_prohibited_acts)))

; [insurance:violation_related_party_loan_limit] 違反保險法第146-7條同一人、同一關係人或同一關係企業放款或其他交易限制
(assert (not (= related_party_loan_limit_complied violation_related_party_loan_limit)))

; [insurance:violation_actuarial_staff_assignment] 違反保險法第144條簽證精算人員指派及外部複核精算人員聘請規定
(assert (= violation_actuarial_staff_assignment
   (or (not actuarial_staff_assigned) (not external_review_actuary_hired))))

; [insurance:violation_actuarial_reports] 違反保險法第144條簽證報告及複核報告內容有虛偽、隱匿、遺漏或錯誤
(assert (not (= actuarial_reports_fair_and_true violation_actuarial_reports)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反相關保險法規定時處罰
(assert (= penalty
   (or violation_148_3_internal_handling
       violation_actuarial_staff_assignment
       violation_148_3_internal_control
       violation_investment_prohibited_acts
       violation_actuarial_reports
       violation_related_party_loan_limit
       violation_investment_limits
       violation_144_145)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= reserve_calculation_done false))
(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))
(assert (= related_party_loan_limit_respected false))
(assert (= investment_securities_limit_complied true))
(assert (= investment_prohibited_acts_absent true))
(assert (= no_board_director_appointment true))
(assert (= no_voting_right_exercise true))
(assert (= no_manager_appointment true))
(assert (= no_trust_supervisor_appointment true))
(assert (= no_agreement_to_participate_management true))
(assert (= actuarial_staff_hired true))
(assert (= signing_actuary_assigned true))
(assert (= external_review_actuary_hired_flag true))
(assert (= external_review_report_fair true))
(assert (= actuarial_report_false_or_omitted false))
(assert (= actuarial_reports_fair_and_true false))
(assert (= actuarial_staff_assigned false))
(assert (= company_owner_equity 0.0))
(assert (= company_total_shares 0))
(assert (= corporate_bonds_per_company_amount 0.0))
(assert (= external_review_actuary_hired false))
(assert (= financial_bonds_amount 0.0))
(assert (= fund_investment_per_fund 0.0))
(assert (= fund_investment_total 0.0))
(assert (= fund_total_shares 0))
(assert (= government_bonds_amount 0.0))
(assert (= insurance_funds 0.0))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= penalty false))
(assert (= related_party_loan_limit_complied false))
(assert (= reserve_calculation_recorded false))
(assert (= securitized_products_total 0.0))
(assert (= signing_actuary_report_fair false))
(assert (= stocks_per_company_amount 0.0))
(assert (= violation_144_145 false))
(assert (= violation_148_3_internal_control false))
(assert (= violation_148_3_internal_handling false))
(assert (= violation_actuarial_reports false))
(assert (= violation_actuarial_staff_assignment false))
(assert (= violation_investment_limits false))
(assert (= violation_investment_prohibited_acts false))
(assert (= violation_related_party_loan_limit false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 21
; Total variables: 48
; Total facts: 48
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

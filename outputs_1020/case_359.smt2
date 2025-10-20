; SMT2 file generated from compliance case automatic
; Case ID: case_359
; Generated at: 2025-10-19T14:00:52.112656
;
; This file can be executed with Z3:
;   z3 case_359.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const acted_as_proxy_solicitor Bool)
(declare-const adjustment_made_within_deadline Bool)
(declare-const bank_excluded_shares_for_calculation Bool)
(declare-const bank_loan_and_other_transaction_amount Real)
(declare-const bank_regulatory_limit Real)
(declare-const bank_same_person_definition Bool)
(declare-const bank_same_person_loan_limit Real)
(declare-const bank_same_person_related_person_definition Bool)
(declare-const board_approval_ratio Real)
(declare-const board_attendance_ratio Real)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_increase_completed Bool)
(declare-const capital_insufficient_measures_executed Bool)
(declare-const capital_level Int)
(declare-const capital_significantly_insufficient_measures_executed Bool)
(declare-const dismiss_director_or_supervisor Bool)
(declare-const dismiss_director_supervisor_registration Bool)
(declare-const engaged_in_illegal_loan_guarantee Bool)
(declare-const engaged_in_prohibited_equity_exchange Bool)
(declare-const financial_business_improvement_plan_completed Bool)
(declare-const financial_business_improvement_plan_submitted Bool)
(declare-const financial_deterioration_condition Bool)
(declare-const financial_or_business_condition_worsened Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_completed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const insurance_capital Real)
(declare-const insurance_excluded_shares_for_calculation Bool)
(declare-const insurance_same_person_definition Bool)
(declare-const insurance_same_person_related_person_definition Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_violation Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_violation Bool)
(declare-const investment_and_loan_limit Real)
(declare-const investment_and_pledged_loan_amount Real)
(declare-const issuer_equity Real)
(declare-const legal_person_related_person Bool)
(declare-const level_2_measures_executed Bool)
(declare-const level_3_measures_executed Bool)
(declare-const level_4_measures_executed Bool)
(declare-const limit_business_or_capital_use Bool)
(declare-const loan_amount Real)
(declare-const loan_and_other_transaction_amount Real)
(declare-const loan_conditions_better_than_others Bool)
(declare-const loan_guarantee_board_approval Bool)
(declare-const loan_guarantee_board_approval_violation Bool)
(declare-const loan_guarantee_compliance Bool)
(declare-const loan_guarantee_limit_per_unit Real)
(declare-const loan_guarantee_sufficient_collateral Bool)
(declare-const loan_limit_compliance Bool)
(declare-const loan_limit_violation Bool)
(declare-const loan_total_limit Real)
(declare-const meets_qualification_requirements Bool)
(declare-const merger_completed Bool)
(declare-const natural_person_related_person Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const no_violation_of_conflict_restrictions Bool)
(declare-const notify_authority_to_cancel_registration Bool)
(declare-const order_capital_increase Bool)
(declare-const order_dismiss_manager_or_staff Bool)
(declare-const order_stop_sale_or_limit_products Bool)
(declare-const other_necessary_measures Bool)
(declare-const penalty Bool)
(declare-const prohibited_acts_penalty Bool)
(declare-const prohibited_shareholder_rights_exchange Bool)
(declare-const proxy_solicitor_prohibition Bool)
(declare-const regulatory_limit Real)
(declare-const regulatory_threshold Real)
(declare-const responsible_person_conflict_adjusted Bool)
(declare-const responsible_person_dismissed Bool)
(declare-const responsible_person_qualification Bool)
(declare-const revoke_meeting_resolution Bool)
(declare-const risk_of_harming_insured_interest Bool)
(declare-const same_legal_person Bool)
(declare-const same_natural_person Bool)
(declare-const same_person_loan_limit Real)
(declare-const shareholder_meeting_vote_documented Bool)
(declare-const shares_from_collateral_acquisition_under_4_years Bool)
(declare-const shares_from_inheritance_under_2_years Bool)
(declare-const shares_from_underwriting_period Bool)
(declare-const single_loan_amount Real)
(declare-const sufficient_collateral_provided Bool)
(declare-const supervisory_action_executed Bool)
(declare-const supervisory_action_required Bool)
(declare-const supervisory_action_taken Bool)
(declare-const supervisory_measures Bool)
(declare-const total_loan_amount Real)
(declare-const unable_to_fulfill_contract Bool)
(declare-const unable_to_pay_debt Bool)
(declare-const violated_loan_or_transaction_limit_or_procedure Bool)
(declare-const violation_of_conflict_restrictions Bool)
(declare-const vote_evaluation_prepared Bool)
(declare-const vote_record_reported_to_board Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:responsible_person_qualification] 保險業負責人具備資格條件
(assert (= responsible_person_qualification meets_qualification_requirements))

; [insurance:responsible_person_conflict_adjusted] 保險業負責人兼職限制及利益衝突已調整
(assert (= responsible_person_conflict_adjusted
   (or no_violation_of_conflict_restrictions
       (and violation_of_conflict_restrictions adjustment_made_within_deadline))))

; [insurance:responsible_person_dismissed] 保險業負責人因資格不符或未調整而被解任
(assert (= responsible_person_dismissed
   (or (not responsible_person_qualification)
       (and violation_of_conflict_restrictions
            (not adjustment_made_within_deadline)))))

; [insurance:loan_guarantee_limit_per_unit] 單一放款金額不得超過資金百分之五
(assert (= loan_guarantee_limit_per_unit
   (ite (<= (/ single_loan_amount insurance_capital) (/ 1.0 20.0)) 1.0 0.0)))

; [insurance:loan_total_limit] 放款總額不得超過資金百分之三十五
(assert (= loan_total_limit
   (ite (<= (/ total_loan_amount insurance_capital) (/ 7.0 20.0)) 1.0 0.0)))

; [insurance:loan_guarantee_sufficient_collateral] 對負責人、職員或主要股東之擔保放款有十足擔保且條件不優於其他同類放款
(assert (= loan_guarantee_sufficient_collateral
   (and sufficient_collateral_provided (not loan_conditions_better_than_others))))

; [insurance:loan_guarantee_board_approval] 擔保放款達規定金額以上經董事會三分之二出席及四分之三同意
(assert (= loan_guarantee_board_approval
   (or (not (>= loan_amount regulatory_threshold))
       (and (<= (/ 6666667.0 10000000.0) board_attendance_ratio)
            (<= (/ 3.0 4.0) board_approval_ratio)))))

; [insurance:loan_guarantee_compliance] 擔保放款符合擔保條件及董事會決議
(assert (= loan_guarantee_compliance
   (and loan_guarantee_sufficient_collateral loan_guarantee_board_approval)))

; [insurance:investment_and_loan_limit] 合併計算投資及質押放款不得超過資金百分之十及公司業主權益百分之十
(assert (let ((a!1 (ite (and (<= (/ investment_and_pledged_loan_amount
                            insurance_capital)
                         (/ 1.0 10.0))
                     (<= (/ investment_and_pledged_loan_amount issuer_equity)
                         (/ 1.0 10.0)))
                1.0
                0.0)))
  (= investment_and_loan_limit a!1)))

; [insurance:same_person_loan_limit] 同一人、同一關係人或同一關係企業放款及交易限制
(assert (= same_person_loan_limit
   (ite (<= loan_and_other_transaction_amount regulatory_limit) 1.0 0.0)))

; [insurance:prohibited_shareholder_rights_exchange] 不得以信託、委任或其他方式進行股權交換或利益輸送
(assert (not (= engaged_in_prohibited_equity_exchange
        prohibited_shareholder_rights_exchange)))

; [insurance:shareholder_meeting_vote_documented] 出席股東會前應作成表決權評估分析說明，會後提報董事會
(assert (= shareholder_meeting_vote_documented
   (and vote_evaluation_prepared vote_record_reported_to_board)))

; [insurance:proxy_solicitor_prohibition] 不得擔任被投資公司委託書徵求人或委託他人擔任
(assert (not (= acted_as_proxy_solicitor proxy_solicitor_prohibition)))

; [insurance:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [insurance:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [insurance:supervisory_measures] 主管機關對違反法令或有礙健全經營之保險業可採取之處分措施
(assert (= supervisory_measures
   (or order_capital_increase
       order_stop_sale_or_limit_products
       limit_business_or_capital_use
       revoke_meeting_resolution
       other_necessary_measures
       dismiss_director_or_supervisor
       order_dismiss_manager_or_staff)))

; [insurance:dismiss_director_supervisor_registration] 解除董（理）事、監察人職務並通知主管機關廢止登記
(assert (= dismiss_director_supervisor_registration
   (and dismiss_director_or_supervisor notify_authority_to_cancel_registration)))

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未分類）
(assert (let ((a!1 (ite (and (<= 150.0 capital_adequacy_ratio)
                     (not (<= 200.0 capital_adequacy_ratio)))
                2
                (ite (<= 200.0 capital_adequacy_ratio) 1 0))))
(let ((a!2 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio))
                     (<= 0.0 net_worth_ratio)
                     (not (<= 2.0 net_worth_ratio)))
                3
                a!1)))
(let ((a!3 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:capital_insufficient_measures_executed] 資本嚴重不足等級4採取對應措施
(assert (= capital_insufficient_measures_executed level_4_measures_executed))

; [insurance:capital_significantly_insufficient_measures_executed] 資本顯著不足等級3採取對應措施
(assert (= capital_significantly_insufficient_measures_executed
   level_3_measures_executed))

; [insurance:capital_insufficient_measures_executed] 資本不足等級2採取對應措施
(assert (= capital_insufficient_measures_executed level_2_measures_executed))

; [insurance:financial_business_improvement_plan_submitted] 保險業提出財務或業務改善計畫並經核定
(assert (= financial_business_improvement_plan_submitted
   (and improvement_plan_submitted improvement_plan_approved)))

; [insurance:financial_business_improvement_plan_completed] 保險業或負責人依主管機關規定期限完成增資、改善計畫或合併
(assert (= financial_business_improvement_plan_completed
   (or capital_increase_completed improvement_plan_completed merger_completed)))

; [insurance:financial_deterioration_condition] 財務或業務狀況顯著惡化且不能支付債務或有損及被保險人權益之虞
(assert (= financial_deterioration_condition
   (and financial_or_business_condition_worsened
        (or unable_to_fulfill_contract
            risk_of_harming_insured_interest
            unable_to_pay_debt))))

; [insurance:supervisory_action_required] 主管機關得為監管、接管、勒令停業清理或命令解散之處分
(assert (let ((a!1 (or (and (= 4 capital_level)
                    (not financial_business_improvement_plan_completed))
               (and (not (= 4 capital_level)) financial_deterioration_condition))))
  (= supervisory_action_required a!1)))

; [insurance:supervisory_action_taken] 主管機關已對保險業為監管、接管、勒令停業清理或命令解散之處分
(assert (= supervisory_action_taken supervisory_action_executed))

; [insurance:prohibited_acts_penalty] 違反放款無十足擔保或條件優於其他同類放款者之刑事責任
(assert (= prohibited_acts_penalty engaged_in_illegal_loan_guarantee))

; [insurance:loan_guarantee_board_approval_violation] 擔保放款未經董事會三分之二出席及四分之三同意或違反放款限額規定
(assert (let ((a!1 (or (not loan_limit_compliance)
               (not (and (<= (/ 6666667.0 10000000.0) board_attendance_ratio)
                         (<= (/ 3.0 4.0) board_approval_ratio))))))
  (= loan_guarantee_board_approval_violation a!1)))

; [insurance:loan_limit_violation] 違反放款或其他交易限額及決議程序規定
(assert (= loan_limit_violation violated_loan_or_transaction_limit_or_procedure))

; [insurance:internal_control_violation] 未建立或未執行內部控制及稽核制度
(assert (not (= internal_control_established internal_control_violation)))

; [insurance:internal_handling_violation] 未建立或未執行內部處理制度及程序
(assert (not (= internal_handling_established internal_handling_violation)))

; [bank:same_person_loan_limit] 銀行就同一人、同一關係人或同一關係企業授信或其他交易限制
(assert (= bank_same_person_loan_limit
   (ite (<= bank_loan_and_other_transaction_amount bank_regulatory_limit)
        1.0
        0.0)))

; [bank:same_person_definition] 銀行法同一人定義
(assert (= bank_same_person_definition (or same_legal_person same_natural_person)))

; [bank:same_person_related_person_definition] 銀行法同一關係人定義
(assert (= bank_same_person_related_person_definition
   (or legal_person_related_person natural_person_related_person)))

; [bank:excluded_shares_for_calculation] 計算同一人或同一關係人持股時排除特定情形股份
(assert (= bank_excluded_shares_for_calculation
   (and (not shares_from_underwriting_period)
        (not shares_from_collateral_acquisition_under_4_years)
        (not shares_from_inheritance_under_2_years))))

; [insurance:same_person_definition] 保險法同一人定義
(assert (= insurance_same_person_definition (or same_legal_person same_natural_person)))

; [insurance:same_person_related_person_definition] 保險法同一關係人定義
(assert (= insurance_same_person_related_person_definition
   (or legal_person_related_person natural_person_related_person)))

; [insurance:excluded_shares_for_calculation] 計算同一人或同一關係人持股時排除特定情形股份
(assert (= insurance_excluded_shares_for_calculation
   (and (not shares_from_underwriting_period)
        (not shares_from_collateral_acquisition_under_4_years)
        (not shares_from_inheritance_under_2_years))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反保險業負責人資格、兼職限制、利益衝突調整、放款擔保條件、董事會決議、放款限額、內部控制、內部處理制度及其他法令規定時處罰
(assert (= penalty
   (or (and (= 4 capital_level)
            (not financial_business_improvement_plan_completed))
       (not capital_significantly_insufficient_measures_executed)
       (not internal_handling_established)
       (not (= loan_total_limit 1.0))
       (and supervisory_action_required (not supervisory_action_taken))
       (not financial_business_improvement_plan_submitted)
       loan_guarantee_board_approval_violation
       (not (= same_person_loan_limit 1.0))
       (not prohibited_shareholder_rights_exchange)
       (not proxy_solicitor_prohibition)
       (not loan_guarantee_compliance)
       responsible_person_dismissed
       (not (= loan_guarantee_limit_per_unit 1.0))
       prohibited_acts_penalty
       loan_limit_violation
       (not capital_insufficient_measures_executed)
       (not internal_control_established)
       (not (= investment_and_loan_limit 1.0))
       (not shareholder_meeting_vote_documented))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= meets_qualification_requirements false))
(assert (= violation_of_conflict_restrictions true))
(assert (= adjustment_made_within_deadline false))
(assert (= responsible_person_qualification false))
(assert (= responsible_person_conflict_adjusted false))
(assert (= responsible_person_dismissed true))
(assert (= vote_evaluation_prepared false))
(assert (= vote_record_reported_to_board false))
(assert (= shareholder_meeting_vote_documented false))
(assert (= acted_as_proxy_solicitor false))
(assert (= proxy_solicitor_prohibition true))
(assert (= internal_control_system_established false))
(assert (= internal_control_established false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_established false))
(assert (= internal_control_violation true))
(assert (= internal_handling_violation true))
(assert (= engaged_in_prohibited_equity_exchange false))
(assert (= prohibited_shareholder_rights_exchange true))
(assert (= engaged_in_illegal_loan_guarantee false))
(assert (= prohibited_acts_penalty false))
(assert (= loan_guarantee_sufficient_collateral true))
(assert (= loan_conditions_better_than_others false))
(assert (= loan_guarantee_board_approval true))
(assert (= loan_guarantee_compliance true))
(assert (= loan_limit_compliance true))
(assert (= loan_guarantee_board_approval_violation false))
(assert (= violated_loan_or_transaction_limit_or_procedure false))
(assert (= loan_limit_violation false))
(assert (= loan_guarantee_limit_per_unit 5.0))
(assert (= loan_total_limit 35.0))
(assert (= investment_and_pledged_loan_amount 0.0))
(assert (= insurance_capital 1000000000.0))
(assert (= issuer_equity 1000000000.0))
(assert (= investment_and_loan_limit 10.0))
(assert (= loan_and_other_transaction_amount 0.0))
(assert (= regulatory_limit 0.0))
(assert (= same_natural_person false))
(assert (= same_legal_person false))
(assert (= insurance_same_person_definition false))
(assert (= natural_person_related_person false))
(assert (= legal_person_related_person false))
(assert (= insurance_same_person_related_person_definition false))
(assert (= insurance_excluded_shares_for_calculation true))
(assert (= shares_from_underwriting_period false))
(assert (= shares_from_collateral_acquisition_under_4_years false))
(assert (= shares_from_inheritance_under_2_years false))
(assert (= financial_or_business_condition_worsened false))
(assert (= unable_to_pay_debt false))
(assert (= unable_to_fulfill_contract false))
(assert (= risk_of_harming_insured_interest false))
(assert (= financial_deterioration_condition false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_approved false))
(assert (= financial_business_improvement_plan_submitted false))
(assert (= improvement_plan_completed false))
(assert (= capital_increase_completed false))
(assert (= merger_completed false))
(assert (= financial_business_improvement_plan_completed false))
(assert (= capital_level 1))
(assert (= level_2_measures_executed false))
(assert (= level_3_measures_executed false))
(assert (= level_4_measures_executed false))
(assert (= capital_insufficient_measures_executed false))
(assert (= capital_significantly_insufficient_measures_executed false))
(assert (= limit_business_or_capital_use false))
(assert (= order_stop_sale_or_limit_products false))
(assert (= order_capital_increase false))
(assert (= order_dismiss_manager_or_staff false))
(assert (= revoke_meeting_resolution false))
(assert (= dismiss_director_or_supervisor false))
(assert (= notify_authority_to_cancel_registration false))
(assert (= dismiss_director_supervisor_registration false))
(assert (= other_necessary_measures false))
(assert (= supervisory_measures true))
(assert (= supervisory_action_required false))
(assert (= supervisory_action_executed false))
(assert (= supervisory_action_taken false))
(assert (= penalty true))
(assert (= board_attendance_ratio 100.0))
(assert (= board_approval_ratio 100.0))
(assert (= single_loan_amount 0.0))
(assert (= total_loan_amount 0.0))
(assert (= loan_amount 0.0))
(assert (= bank_excluded_shares_for_calculation false))
(assert (= bank_loan_and_other_transaction_amount 0.0))
(assert (= bank_regulatory_limit 0.0))
(assert (= bank_same_person_definition false))
(assert (= bank_same_person_loan_limit 0.0))
(assert (= bank_same_person_related_person_definition false))
(assert (= capital_adequacy_ratio 0.0))
(assert (= net_worth 0.0))
(assert (= net_worth_ratio 0.0))
(assert (= no_violation_of_conflict_restrictions false))
(assert (= regulatory_threshold 0.0))
(assert (= same_person_loan_limit 0.0))
(assert (= sufficient_collateral_provided false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 40
; Total variables: 97
; Total facts: 97
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

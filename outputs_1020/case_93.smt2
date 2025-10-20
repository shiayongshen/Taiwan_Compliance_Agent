; SMT2 file generated from compliance case automatic
; Case ID: case_93
; Generated at: 2025-10-19T07:53:40.684528
;
; This file can be executed with Z3:
;   z3 case_93.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const capital_level_2_measures_executed Bool)
(declare-const capital_level_3_measures_completed Bool)
(declare-const capital_level_3_measures_executed Bool)
(declare-const capital_level_4_measures_completed Bool)
(declare-const capital_level_4_measures_executed Bool)
(declare-const capital_owner_equity_investment_limit Real)
(declare-const financial_or_business_condition_deteriorated Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const investment_compliance_conditions Bool)
(declare-const investment_conditions_compliant Bool)
(declare-const investment_conditions_prohibited_roles Bool)
(declare-const investment_fourth_item Bool)
(declare-const investment_securities_limit_35_percent Bool)
(declare-const investment_third_item Bool)
(declare-const investor_or_representative_agreement_participation Bool)
(declare-const investor_or_representative_director Bool)
(declare-const investor_or_representative_manager_appointment Bool)
(declare-const investor_or_representative_supervisor Bool)
(declare-const investor_or_representative_trust_supervisor Bool)
(declare-const investor_or_representative_voting_rights Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const owner_equity Real)
(declare-const penalty Bool)
(declare-const prohibited_actions_without_supervisor_consent Bool)
(declare-const real_estate_immediate_use_and_income Bool)
(declare-const real_estate_immediate_use_and_income_flag Bool)
(declare-const real_estate_investment_compliance Bool)
(declare-const real_estate_investment_internal_procedure_compliant Bool)
(declare-const real_estate_investment_limit Real)
(declare-const real_estate_valuation_done Bool)
(declare-const real_estate_valuation_required Bool)
(declare-const self_use_real_estate_investment Bool)
(declare-const social_housing_for_rent_only Bool)
(declare-const supervisor_consent_contract_commitment Bool)
(declare-const supervisor_consent_other_major_financial Bool)
(declare-const supervisor_consent_payment_exceed_limit Bool)
(declare-const supervisory_measures_applicable Bool)
(declare-const total_funds Real)
(declare-const total_real_estate_investment Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:real_estate_investment_limit] 不動產投資總額除自用不動產外不得超過資金30%，自用不動產不得超過業主權益總額
(assert (let ((a!1 (<= (+ total_real_estate_investment
                  (* (- 1.0) (ite self_use_real_estate_investment 1.0 0.0)))
               (* 30.0 total_funds))))
(let ((a!2 (ite (and a!1
                     (>= owner_equity
                         (ite self_use_real_estate_investment 1.0 0.0)))
                1.0
                0.0)))
  (= real_estate_investment_limit a!2))))

; [insurance:real_estate_immediate_use_and_income] 不動產投資以即時利用並有收益者為限，住宅法社會住宅租賃除外
(assert (= real_estate_immediate_use_and_income
   (or social_housing_for_rent_only real_estate_immediate_use_and_income_flag)))

; [insurance:real_estate_valuation_required] 不動產取得及處分應經合法鑑價機構評價
(assert (= real_estate_valuation_required real_estate_valuation_done))

; [insurance:real_estate_investment_compliance] 不動產投資符合條件限制、即時利用並有收益認定基準及處理原則
(assert (= real_estate_investment_compliance
   real_estate_investment_internal_procedure_compliant))

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
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
(let ((a!3 (ite (or (not (<= 50.0 capital_adequacy_ratio))
                    (not (<= 0.0 net_worth)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:capital_level_4_measures_executed] 資本嚴重不足等級措施已執行
(assert (= capital_level_4_measures_executed capital_level_4_measures_completed))

; [insurance:capital_level_3_measures_executed] 資本顯著不足等級措施已執行
(assert (= capital_level_3_measures_executed capital_level_3_measures_completed))

; [insurance:capital_level_2_measures_executed] 資本不足等級措施已執行
(assert (= capital_level_2_measures_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:supervisory_measures_applicable] 主管機關得對資本嚴重不足且未完成改善計畫者為接管、勒令停業清理或解散處分
(assert (= supervisory_measures_applicable
   (or (and (= 3 capital_level) (not capital_level_3_measures_executed))
       financial_or_business_condition_deteriorated
       (and (= 4 capital_level) (not capital_level_4_measures_executed))
       (and (= 2 capital_level) (not capital_level_2_measures_executed)))))

; [insurance:prohibited_actions_without_supervisor_consent] 監管處分期間未經監管人同意不得超限支付款項、締結契約或其他重大財務事項
(assert (= prohibited_actions_without_supervisor_consent
   (and (not supervisor_consent_payment_exceed_limit)
        (not supervisor_consent_contract_commitment)
        (not supervisor_consent_other_major_financial))))

; [insurance:investment_securities_limit_35_percent] 第三款及第四款投資總額不得超過資金35%
(assert (let ((a!1 (<= (+ (to_real (ite investment_third_item 1 0))
                  (to_real (ite investment_fourth_item 1 0)))
               (* 35.0 total_funds))))
  (= investment_securities_limit_35_percent a!1)))

; [insurance:investment_conditions_prohibited_roles] 投資不得以保險業或代表人擔任被投資公司董事、監察人、行使表決權、指派經理人等角色
(assert (= investment_conditions_prohibited_roles
   (and (not investor_or_representative_director)
        (not investor_or_representative_supervisor)
        (not investor_or_representative_voting_rights)
        (not investor_or_representative_manager_appointment)
        (not investor_or_representative_trust_supervisor)
        (not investor_or_representative_agreement_participation))))

; [insurance:investment_compliance_conditions] 投資符合主管機關定之條件、範圍、內容及規範
(assert (= investment_compliance_conditions investment_conditions_compliant))

; [insurance:capital_owner_equity_investment_limit] 自用不動產投資總額不得超過業主權益總額
(assert (= capital_owner_equity_investment_limit
   (ite (>= owner_equity (ite self_use_real_estate_investment 1.0 0.0)) 1.0 0.0)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：違反不動產投資限制、鑑價、即時利用及收益認定、投資條件限制或資本不足且未執行改善措施時處罰
(assert (let ((a!1 (or (not investment_conditions_prohibited_roles)
               (not real_estate_immediate_use_and_income)
               (not real_estate_investment_compliance)
               (not investment_securities_limit_35_percent)
               (not real_estate_valuation_required)
               (not investment_compliance_conditions)
               (not (= real_estate_investment_limit 1.0))
               (and (or (= 4 capital_level)
                        (= 3 capital_level)
                        (= 2 capital_level))
                    (not capital_level_4_measures_executed)
                    (not capital_level_3_measures_executed)
                    (not capital_level_2_measures_executed)))))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= real_estate_immediate_use_and_income_flag false))
(assert (= real_estate_immediate_use_and_income false))
(assert (= real_estate_investment_internal_procedure_compliant false))
(assert (= real_estate_investment_compliance false))
(assert (= capital_level 1))
(assert (= capital_adequacy_ratio 200.0))
(assert (= net_worth_ratio 2.0))
(assert (= net_worth 1.0))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= capital_level_2_measures_executed false))
(assert (= capital_level_3_measures_completed false))
(assert (= capital_level_3_measures_executed false))
(assert (= capital_level_4_measures_completed false))
(assert (= capital_level_4_measures_executed false))
(assert (= investment_conditions_compliant true))
(assert (= investment_compliance_conditions true))
(assert (= investment_conditions_prohibited_roles true))
(assert (= investment_securities_limit_35_percent true))
(assert (= investment_third_item true))
(assert (= investment_fourth_item true))
(assert (= investor_or_representative_director false))
(assert (= investor_or_representative_supervisor false))
(assert (= investor_or_representative_voting_rights false))
(assert (= investor_or_representative_manager_appointment false))
(assert (= investor_or_representative_trust_supervisor false))
(assert (= investor_or_representative_agreement_participation false))
(assert (= real_estate_valuation_done true))
(assert (= real_estate_valuation_required true))
(assert (= self_use_real_estate_investment true))
(assert (= capital_owner_equity_investment_limit 100.0))
(assert (= total_real_estate_investment 30.0))
(assert (= total_funds 100.0))
(assert (= owner_equity 100.0))
(assert (= financial_or_business_condition_deteriorated false))
(assert (= prohibited_actions_without_supervisor_consent true))
(assert (= supervisor_consent_payment_exceed_limit false))
(assert (= supervisor_consent_contract_commitment false))
(assert (= supervisor_consent_other_major_financial false))
(assert (= social_housing_for_rent_only false))
(assert (= penalty true))
(assert (= supervisory_measures_applicable false))
(assert (= real_estate_investment_limit 0.0))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 16
; Total variables: 43
; Total facts: 43
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

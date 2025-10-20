; SMT2 file generated from compliance case automatic
; Case ID: case_403
; Generated at: 2025-10-19T14:57:28.405604
;
; This file can be executed with Z3:
;   z3 case_403.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const authority_threshold Real)
(declare-const board_approval_ratio Real)
(declare-const board_attendance_ratio Real)
(declare-const capital_fund Real)
(declare-const combined_investment_limit Real)
(declare-const company_owner_equity Real)
(declare-const internal_control_established Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_system_established Bool)
(declare-const investment_in_securities Real)
(declare-const loan_guaranteed_by_bank_or_authority Bool)
(declare-const loan_secured_by_approved_securities Bool)
(declare-const loan_secured_by_company_securities Bool)
(declare-const loan_secured_by_life_insurance_policy Bool)
(declare-const loan_secured_by_movable_or_immovable Bool)
(declare-const loan_type_limit Real)
(declare-const other_similar_loans_conditions Bool)
(declare-const owner_equity Real)
(declare-const penalty Bool)
(declare-const real_estate_has_income Bool)
(declare-const real_estate_immediate_use Bool)
(declare-const real_estate_investment_limit Real)
(declare-const real_estate_use_and_income Bool)
(declare-const real_estate_valuation_done Bool)
(declare-const real_estate_valuation_required Bool)
(declare-const related_party_loan_amount Real)
(declare-const related_party_loan_approval Bool)
(declare-const related_party_loan_conditions Bool)
(declare-const related_party_loan_fully_secured Bool)
(declare-const related_party_loan_guarantee Bool)
(declare-const self_use_real_estate_investment Real)
(declare-const single_loan_amount Real)
(declare-const single_loan_amount_limit Real)
(declare-const social_housing_only_for_rent Bool)
(declare-const total_loan_amount Real)
(declare-const total_loan_amount_limit Real)
(declare-const total_real_estate_investment Real)
(declare-const violation_penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:real_estate_investment_limit] 不動產投資總額除自用不動產外不得超過資金30%，自用不動產不得超過業主權益總額
(assert (let ((a!1 (and (<= (+ total_real_estate_investment
                       (* (- 1.0) self_use_real_estate_investment))
                    (* 30.0 capital_fund))
                (<= self_use_real_estate_investment owner_equity))))
  (= real_estate_investment_limit (ite a!1 1.0 0.0))))

; [insurance:real_estate_use_and_income] 不動產投資以即時利用並有收益者為限，住宅法興辦社會住宅且僅供租賃者除外
(assert (= real_estate_use_and_income
   (or social_housing_only_for_rent
       (and real_estate_immediate_use real_estate_has_income))))

; [insurance:real_estate_valuation_required] 不動產取得及處分應經合法不動產鑑價機構評價
(assert (= real_estate_valuation_required real_estate_valuation_done))

; [insurance:loan_type_limit] 放款限銀行或主管機關認可信用保證機構保證、以動產不動產擔保、有價證券質押、人壽保險單質押
(assert (= loan_type_limit
   (ite (or loan_secured_by_life_insurance_policy
            loan_secured_by_movable_or_immovable
            loan_guaranteed_by_bank_or_authority
            loan_secured_by_approved_securities)
        1.0
        0.0)))

; [insurance:single_loan_amount_limit] 每一單位放款金額不得超過資金5%
(assert (= single_loan_amount_limit
   (ite (<= single_loan_amount (* 5.0 capital_fund)) 1.0 0.0)))

; [insurance:total_loan_amount_limit] 放款總額不得超過資金35%
(assert (= total_loan_amount_limit
   (ite (<= total_loan_amount (* 35.0 capital_fund)) 1.0 0.0)))

; [insurance:related_party_loan_guarantee] 對負責人、職員、主要股東及其利害關係人擔保放款應有十足擔保且條件不得優於其他同類放款
(assert (let ((a!1 (and related_party_loan_fully_secured
                (not (and related_party_loan_conditions
                          (not other_similar_loans_conditions))))))
  (= related_party_loan_guarantee a!1)))

; [insurance:related_party_loan_approval] 利害關係人擔保放款達主管機關規定金額以上，須董事會三分之二以上出席及四分之三以上同意
(assert (= related_party_loan_approval
   (or (not (>= related_party_loan_amount authority_threshold))
       (and (<= (/ 6666667.0 10000000.0) board_attendance_ratio)
            (<= (/ 3.0 4.0) board_approval_ratio)))))

; [insurance:combined_investment_limit] 有價證券投資與以該公司有價證券為質放款合併計算不得超過資金10%及該公司業主權益10%
(assert (let ((a!1 (and (<= (+ investment_in_securities
                       (ite loan_secured_by_company_securities 1.0 0.0))
                    (* 10.0 capital_fund))
                (<= (+ investment_in_securities
                       (ite loan_secured_by_company_securities 1.0 0.0))
                    (* 10.0 company_owner_equity)))))
  (= combined_investment_limit (ite a!1 1.0 0.0))))

; [insurance:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [insurance:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [insurance:violation_penalty] 違反資金運用相關規定處罰
(assert (= violation_penalty
   (or (not (= real_estate_investment_limit 1.0))
       (not (= loan_type_limit 1.0))
       (not related_party_loan_approval)
       (not (= combined_investment_limit 1.0))
       (not (= single_loan_amount_limit 1.0))
       (not real_estate_valuation_required)
       (not internal_control_established)
       (not real_estate_use_and_income)
       (not related_party_loan_guarantee)
       (not (= total_loan_amount_limit 1.0))
       (not internal_handling_established))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反資金運用相關規定時處罰
(assert (= penalty violation_penalty))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= authority_threshold 100.0))
(assert (= board_attendance_ratio (/ 1.0 2.0)))
(assert (= board_approval_ratio (/ 1.0 2.0)))
(assert (= capital_fund 1000000000.0))
(assert (= total_real_estate_investment 500000000.0))
(assert (= self_use_real_estate_investment 100000000.0))
(assert (= owner_equity 200000000.0))
(assert (= social_housing_only_for_rent false))
(assert (= real_estate_immediate_use false))
(assert (= real_estate_has_income false))
(assert (= real_estate_valuation_done false))
(assert (= investment_in_securities 50000000.0))
(assert (= loan_guaranteed_by_bank_or_authority false))
(assert (= loan_secured_by_movable_or_immovable false))
(assert (= loan_secured_by_approved_securities false))
(assert (= loan_secured_by_life_insurance_policy false))
(assert (= single_loan_amount 60000000.0))
(assert (= total_loan_amount 400000000.0))
(assert (= related_party_loan_fully_secured false))
(assert (= related_party_loan_conditions true))
(assert (= other_similar_loans_conditions true))
(assert (= related_party_loan_amount 150000000.0))
(assert (= company_owner_equity 200000000.0))
(assert (= loan_secured_by_company_securities true))
(assert (= internal_control_system_established false))
(assert (= internal_handling_system_established false))
(assert (= combined_investment_limit 0.0))
(assert (= internal_control_established false))
(assert (= internal_handling_established false))
(assert (= loan_type_limit 0.0))
(assert (= penalty false))
(assert (= real_estate_investment_limit 0.0))
(assert (= real_estate_use_and_income false))
(assert (= real_estate_valuation_required false))
(assert (= related_party_loan_approval false))
(assert (= related_party_loan_guarantee false))
(assert (= single_loan_amount_limit 0.0))
(assert (= total_loan_amount_limit 0.0))
(assert (= violation_penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 39
; Total facts: 39
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

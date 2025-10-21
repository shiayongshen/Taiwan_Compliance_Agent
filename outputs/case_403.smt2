; SMT2 file generated from compliance case automatic
; Case ID: case_403
; Generated at: 2025-10-21T22:31:37.371941
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
(declare-const combined_investment_and_loan_limit Real)
(declare-const company_owner_equity Real)
(declare-const internal_control_and_audit_established Bool)
(declare-const internal_control_and_audit_system_established Bool)
(declare-const internal_handling_system_and_procedure_established Bool)
(declare-const internal_handling_system_established Bool)
(declare-const investment_in_company_securities Real)
(declare-const loan_guaranteed_by_bank_or_authority Bool)
(declare-const loan_secured_by_approved_securities Bool)
(declare-const loan_secured_by_company_securities Bool)
(declare-const loan_secured_by_life_insurance_policy Bool)
(declare-const loan_secured_by_movable_or_immovable Bool)
(declare-const loan_type_limit Real)
(declare-const owner_equity Real)
(declare-const penalty Bool)
(declare-const real_estate_immediate_use_and_income Real)
(declare-const real_estate_investment_limit Real)
(declare-const real_estate_use_and_income Real)
(declare-const real_estate_valuation_done Bool)
(declare-const real_estate_valuation_required Bool)
(declare-const related_party_loan_amount Real)
(declare-const related_party_loan_approval Bool)
(declare-const related_party_loan_condition_not_better Bool)
(declare-const related_party_loan_full_guarantee Bool)
(declare-const related_party_loan_guarantee_condition Bool)
(declare-const self_use_real_estate_investment Real)
(declare-const single_loan_amount Real)
(declare-const single_loan_amount_limit Real)
(declare-const social_housing_only_rental Bool)
(declare-const total_loan_amount Real)
(declare-const total_loan_amount_limit Real)
(declare-const total_real_estate_investment Real)

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
   (ite (or social_housing_only_rental
            (= real_estate_immediate_use_and_income 1.0))
        1.0
        0.0)))

; [insurance:real_estate_valuation_required] 不動產取得及處分應經合法不動產鑑價機構評價
(assert (= real_estate_valuation_required real_estate_valuation_done))

; [insurance:loan_type_limit] 放款類型限銀行或主管機關認可信用保證、動產不動產擔保、有價證券質押、人壽保險單質押
(assert (= loan_type_limit
   (ite (or loan_secured_by_life_insurance_policy
            loan_guaranteed_by_bank_or_authority
            loan_secured_by_approved_securities
            loan_secured_by_movable_or_immovable)
        1.0
        0.0)))

; [insurance:single_loan_amount_limit] 每一單位放款金額不得超過資金5%
(assert (= single_loan_amount_limit
   (ite (<= single_loan_amount (* 5.0 capital_fund)) 1.0 0.0)))

; [insurance:total_loan_amount_limit] 放款總額不得超過資金35%
(assert (= total_loan_amount_limit
   (ite (<= total_loan_amount (* 35.0 capital_fund)) 1.0 0.0)))

; [insurance:related_party_loan_guarantee_condition] 對負責人、職員、主要股東及利害關係人擔保放款應有十足擔保且條件不得優於其他同類放款
(assert (= related_party_loan_guarantee_condition
   (and related_party_loan_full_guarantee
        related_party_loan_condition_not_better)))

; [insurance:related_party_loan_approval] 利害關係人放款達主管機關規定金額以上須經三分之二以上董事出席及四分之三以上同意
(assert (= related_party_loan_approval
   (or (not (>= related_party_loan_amount authority_threshold))
       (and (<= (/ 6666667.0 10000000.0) board_attendance_ratio)
            (<= (/ 3.0 4.0) board_approval_ratio)))))

; [insurance:combined_investment_and_loan_limit] 同一公司有價證券投資與以該公司有價證券為質放款合計不得超過資金10%及該公司業主權益10%
(assert (let ((a!1 (and (<= (+ investment_in_company_securities
                       (ite loan_secured_by_company_securities 1.0 0.0))
                    (* 10.0 capital_fund))
                (<= (+ investment_in_company_securities
                       (ite loan_secured_by_company_securities 1.0 0.0))
                    (* 10.0 company_owner_equity)))))
  (= combined_investment_and_loan_limit (ite a!1 1.0 0.0))))

; [insurance:internal_control_and_audit_established] 建立內部控制及稽核制度
(assert (= internal_control_and_audit_established
   internal_control_and_audit_system_established))

; [insurance:internal_handling_system_established] 建立資產品質評估、準備金提存、逾期放款、催收款清理、呆帳轉銷及保單招攬核保理賠等內部處理制度及程序
(assert (= internal_handling_system_established
   internal_handling_system_and_procedure_established))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：違反不動產投資限制、放款限制、利害關係人擔保放款條件、內部控制及內部處理制度規定時處罰
(assert (= penalty
   (or (not internal_handling_system_established)
       (not related_party_loan_guarantee_condition)
       (not internal_control_and_audit_established)
       (not real_estate_valuation_required)
       (not (= real_estate_use_and_income 1.0))
       (not (= combined_investment_and_loan_limit 1.0))
       (not related_party_loan_approval)
       (not (= total_loan_amount_limit 1.0))
       (not (= loan_type_limit 1.0))
       (not (= real_estate_investment_limit 1.0))
       (not (= single_loan_amount_limit 1.0)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= authority_threshold 10.0))
(assert (= board_approval_ratio (/ 7.0 10.0)))
(assert (= board_attendance_ratio (/ 3.0 5.0)))
(assert (= capital_fund 1000000000))
(assert (= company_owner_equity 500000000))
(assert (= investment_in_company_securities 60000000))
(assert (= loan_guaranteed_by_bank_or_authority false))
(assert (= loan_secured_by_approved_securities false))
(assert (= loan_secured_by_company_securities false))
(assert (= loan_secured_by_life_insurance_policy false))
(assert (= loan_secured_by_movable_or_immovable false))
(assert (= loan_type_limit 0))
(assert (= owner_equity 500000000))
(assert (= real_estate_immediate_use_and_income 0))
(assert (= real_estate_investment_limit 0))
(assert (= real_estate_use_and_income 0))
(assert (= real_estate_valuation_done false))
(assert (= real_estate_valuation_required false))
(assert (= related_party_loan_amount 20000000))
(assert (= related_party_loan_approval false))
(assert (= related_party_loan_condition_not_better false))
(assert (= related_party_loan_full_guarantee false))
(assert (= related_party_loan_guarantee_condition false))
(assert (= self_use_real_estate_investment 300000000))
(assert (= single_loan_amount 60000000))
(assert (= single_loan_amount_limit 0))
(assert (= social_housing_only_rental false))
(assert (= total_loan_amount 400000000))
(assert (= total_loan_amount_limit 0))
(assert (= total_real_estate_investment 400000000))
(assert (= internal_control_and_audit_system_established false))
(assert (= internal_control_and_audit_established false))
(assert (= internal_handling_system_and_procedure_established false))
(assert (= internal_handling_system_established false))
(assert (= combined_investment_and_loan_limit 0))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 36
; Total facts: 35
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

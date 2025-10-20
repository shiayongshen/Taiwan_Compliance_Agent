; SMT2 file generated from compliance case automatic
; Case ID: case_460
; Generated at: 2025-10-19T16:28:47.655798
;
; This file can be executed with Z3:
;   z3 case_460.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const authority_threshold Real)
(declare-const board_approval Bool)
(declare-const board_attendance Int)
(declare-const board_total Int)
(declare-const business_license_obtained Bool)
(declare-const business_start_permit Bool)
(declare-const capital_fund Real)
(declare-const combined_investment_limit Real)
(declare-const deposit_guarantee Bool)
(declare-const full_collateral_for_related_party_loan Bool)
(declare-const internal_control_and_audit_established Bool)
(declare-const internal_control_and_audit_system_established Bool)
(declare-const internal_handling_system_and_procedures_established Bool)
(declare-const internal_handling_system_established Bool)
(declare-const investment_in_securities Real)
(declare-const issuer_owner_equity Real)
(declare-const loan_conditions_not_better_than_others Bool)
(declare-const loan_guaranteed_by_bank_or_authority Bool)
(declare-const loan_secured_by_approved_securities Bool)
(declare-const loan_secured_by_issuer_securities Bool)
(declare-const loan_secured_by_life_insurance_policy Bool)
(declare-const loan_secured_by_movable_or_immovable Bool)
(declare-const loan_types_limit Int)
(declare-const owner_equity Real)
(declare-const penalty Bool)
(declare-const permit_obtained Bool)
(declare-const real_estate_has_income Bool)
(declare-const real_estate_in_use Bool)
(declare-const real_estate_invested Real)
(declare-const real_estate_investment_limit Real)
(declare-const real_estate_use_and_income Bool)
(declare-const registered_according_law Bool)
(declare-const related_party_loan_amount Real)
(declare-const related_party_loan_conditions Bool)
(declare-const self_use_real_estate_investment Bool)
(declare-const single_loan_amount Real)
(declare-const single_loan_amount_limit Real)
(declare-const social_housing_rental_only Bool)
(declare-const total_loan_amount Real)
(declare-const total_loan_amount_limit Real)
(declare-const total_real_estate_investment Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:business_start_permit] 保險業非經主管機關許可、依法設立登記、繳存保證金及領得營業執照後，始得開始營業
(assert (= business_start_permit
   (and permit_obtained
        registered_according_law
        deposit_guarantee
        business_license_obtained)))

; [insurance:real_estate_investment_limit] 保險業不動產投資總額除自用不動產外不得超過資金30%，自用不動產不得超過業主權益總額
(assert (let ((a!1 (<= (+ total_real_estate_investment
                  (* (- 1.0) (ite self_use_real_estate_investment 1.0 0.0)))
               (* 30.0 capital_fund))))
(let ((a!2 (ite (and a!1
                     (>= owner_equity
                         (ite self_use_real_estate_investment 1.0 0.0)))
                1.0
                0.0)))
  (= real_estate_investment_limit a!2))))

; [insurance:real_estate_use_and_income] 保險業投資不動產須即時利用並有收益，住宅法興辦社會住宅且僅供租賃者除外
(assert (= real_estate_use_and_income
   (or social_housing_rental_only
       (and (= real_estate_invested 1.0)
            real_estate_in_use
            real_estate_has_income))))

; [insurance:loan_types_limit] 保險業辦理放款限銀行或主管機關認可信用保證機構保證、以動產不動產擔保、有價證券質押、人壽保險單質押
(assert (= loan_types_limit
   (ite (or loan_secured_by_life_insurance_policy
            loan_guaranteed_by_bank_or_authority
            loan_secured_by_movable_or_immovable
            loan_secured_by_approved_securities)
        1
        0)))

; [insurance:single_loan_amount_limit] 每一單位放款金額不得超過資金5%
(assert (= single_loan_amount_limit
   (ite (<= single_loan_amount (* 5.0 capital_fund)) 1.0 0.0)))

; [insurance:total_loan_amount_limit] 放款總額不得超過資金35%
(assert (= total_loan_amount_limit
   (ite (<= total_loan_amount (* 35.0 capital_fund)) 1.0 0.0)))

; [insurance:related_party_loan_conditions] 對負責人、職員、主要股東或利害關係人擔保放款應有十足擔保且條件不得優於其他同類放款，達一定金額須董事會同意
(assert (let ((a!1 (and (>= (to_real board_attendance)
                    (* (/ 6667.0 10000.0) (to_real board_total)))
                (<= (* (/ 3.0 4.0) (to_real board_attendance))
                    (ite board_approval 1.0 0.0)))))
(let ((a!2 (and full_collateral_for_related_party_loan
                loan_conditions_not_better_than_others
                (or (not (>= related_party_loan_amount authority_threshold))
                    a!1))))
  (= related_party_loan_conditions a!2))))

; [insurance:combined_investment_limit] 有價證券投資與以該公司發行有價證券為質之放款合併計算不得超過資金10%及該公司業主權益10%
(assert (let ((a!1 (and (<= (+ investment_in_securities
                       (ite loan_secured_by_issuer_securities 1.0 0.0))
                    (* 10.0 capital_fund))
                (<= (+ investment_in_securities
                       (ite loan_secured_by_issuer_securities 1.0 0.0))
                    (* 10.0 issuer_owner_equity)))))
  (= combined_investment_limit (ite a!1 1.0 0.0))))

; [insurance:internal_control_and_audit_established] 保險業應建立內部控制及稽核制度
(assert (= internal_control_and_audit_established
   internal_control_and_audit_system_established))

; [insurance:internal_handling_system_established] 保險業應建立資產品質評估、準備金提存、逾期放款、催收款清理、呆帳轉銷及保單招攬核保理賠之內部處理制度及程序
(assert (= internal_handling_system_established
   internal_handling_system_and_procedures_established))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：未依規定取得許可、未依法設立登記、未繳存保證金、未領得營業執照、超過不動產投資限制、放款超限、未建立內部控制或內部處理制度時處罰
(assert (= penalty
   (or (not (= combined_investment_limit 1.0))
       (not (= total_loan_amount_limit 1.0))
       (not (= real_estate_investment_limit 1.0))
       (not (= single_loan_amount_limit 1.0))
       (not related_party_loan_conditions)
       (not business_start_permit)
       (not internal_control_and_audit_established)
       (not real_estate_use_and_income)
       (not internal_handling_system_established)
       (not (= loan_types_limit 1)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= permit_obtained true))
(assert (= registered_according_law true))
(assert (= deposit_guarantee true))
(assert (= business_license_obtained true))
(assert (= total_real_estate_investment 0.0))
(assert (= self_use_real_estate_investment false))
(assert (= capital_fund 100000000.0))
(assert (= owner_equity 100000000.0))
(assert (= real_estate_invested 0.0))
(assert (= real_estate_in_use false))
(assert (= real_estate_has_income false))
(assert (= social_housing_rental_only false))
(assert (= loan_guaranteed_by_bank_or_authority true))
(assert (= loan_secured_by_movable_or_immovable true))
(assert (= loan_secured_by_approved_securities true))
(assert (= loan_secured_by_life_insurance_policy true))
(assert (= single_loan_amount 0.0))
(assert (= total_loan_amount 0.0))
(assert (= related_party_loan_amount 0.0))
(assert (= authority_threshold 0.0))
(assert (= board_attendance 0))
(assert (= board_total 0))
(assert (= board_approval false))
(assert (= full_collateral_for_related_party_loan true))
(assert (= loan_conditions_not_better_than_others true))
(assert (= investment_in_securities 0.0))
(assert (= loan_secured_by_issuer_securities false))
(assert (= issuer_owner_equity 0.0))
(assert (= internal_control_and_audit_system_established false))
(assert (= internal_control_and_audit_established false))
(assert (= internal_handling_system_and_procedures_established false))
(assert (= internal_handling_system_established false))
(assert (= business_start_permit false))
(assert (= combined_investment_limit 0.0))
(assert (= loan_types_limit 0))
(assert (= penalty false))
(assert (= real_estate_investment_limit 0.0))
(assert (= real_estate_use_and_income false))
(assert (= related_party_loan_conditions false))
(assert (= single_loan_amount_limit 0.0))
(assert (= total_loan_amount_limit 0.0))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 12
; Total variables: 41
; Total facts: 41
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

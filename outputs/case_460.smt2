; SMT2 file generated from compliance case automatic
; Case ID: case_460
; Generated at: 2025-10-21T10:19:11.484035
;
; This file can be executed with Z3:
;   z3 case_460.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const authority_specified_amount Real)
(declare-const board_meeting_approval_ratio Real)
(declare-const board_meeting_attendance_ratio Real)
(declare-const business_license_obtained Bool)
(declare-const business_start_permit Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_fund Real)
(declare-const capital_level Int)
(declare-const combined_investment_and_loan_limit Real)
(declare-const company_owner_equity Real)
(declare-const deposit_guarantee Bool)
(declare-const foreign_business_license_obtained Bool)
(declare-const foreign_business_start_permit Bool)
(declare-const foreign_deposit_guarantee Bool)
(declare-const foreign_permit_granted Bool)
(declare-const foreign_registered_according_law Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const improvement_plan_submitted_and_executed Bool)
(declare-const internal_control_and_audit_established Bool)
(declare-const internal_handling_procedures_established Bool)
(declare-const investment_in_company_securities Real)
(declare-const loan_guaranteed_by_bank_or_authority Bool)
(declare-const loan_secured_by_approved_securities Bool)
(declare-const loan_secured_by_company_securities Bool)
(declare-const loan_secured_by_life_insurance_policy Bool)
(declare-const loan_secured_by_movable_or_immovable Bool)
(declare-const loan_types_limit Real)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const other_similar_loans_conditions Bool)
(declare-const owner_equity Real)
(declare-const penalty Bool)
(declare-const permit_granted Bool)
(declare-const real_estate_investment_excluding_self_use Real)
(declare-const real_estate_investment_limit Real)
(declare-const real_estate_investment_use_and_income Bool)
(declare-const registered_according_law Bool)
(declare-const related_party_loan_amount Real)
(declare-const related_party_loan_conditions Bool)
(declare-const related_party_loan_fully_secured Bool)
(declare-const self_use_real_estate_investment Real)
(declare-const single_loan_amount Real)
(declare-const single_loan_amount_limit Real)
(declare-const social_housing_rental Bool)
(declare-const total_loan_amount Real)
(declare-const total_loan_amount_limit Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:business_start_permit] 保險業非經主管機關許可、依法設立登記、繳存保證金及領得營業執照後，始得開始營業
(assert (= business_start_permit
   (and permit_granted
        registered_according_law
        deposit_guarantee
        business_license_obtained)))

; [insurance:foreign_business_start_permit] 外國保險業非經主管機關許可、依法設立登記、繳存保證金及領得營業執照後，始得開始營業
(assert (= foreign_business_start_permit
   (and foreign_permit_granted
        foreign_registered_according_law
        foreign_deposit_guarantee
        foreign_business_license_obtained)))

; [insurance:real_estate_investment_limit] 保險業不動產投資總額除自用不動產外不得超過資金30%，自用不動產總額不得超過業主權益總額
(assert (let ((a!1 (ite (and (<= real_estate_investment_excluding_self_use
                         (* (/ 3.0 10.0) capital_fund))
                     (<= self_use_real_estate_investment owner_equity))
                1.0
                0.0)))
  (= real_estate_investment_limit a!1)))

; [insurance:real_estate_investment_use_and_income] 保險業不動產投資以即時利用並有收益者為限（住宅法社會住宅租賃除外）
(assert (= real_estate_investment_use_and_income
   (or social_housing_rental real_estate_investment_use_and_income)))

; [insurance:loan_types_limit] 保險業辦理放款限銀行或主管機關認可信用保證機構保證、以動產不動產擔保、有價證券質押、人壽保險單質押
(assert (= loan_types_limit
   (ite (or loan_guaranteed_by_bank_or_authority
            loan_secured_by_movable_or_immovable
            loan_secured_by_life_insurance_policy
            loan_secured_by_approved_securities)
        1.0
        0.0)))

; [insurance:single_loan_amount_limit] 每一單位放款金額不得超過資金5%
(assert (= single_loan_amount_limit
   (ite (<= single_loan_amount (* (/ 1.0 20.0) capital_fund)) 1.0 0.0)))

; [insurance:total_loan_amount_limit] 放款總額不得超過資金35%
(assert (= total_loan_amount_limit
   (ite (<= total_loan_amount (* (/ 7.0 20.0) capital_fund)) 1.0 0.0)))

; [insurance:related_party_loan_conditions] 對負責人、職員、主要股東或利害關係人擔保放款應有十足擔保且條件不得優於其他同類放款，達一定金額須董事會同意
(assert (let ((a!1 (and related_party_loan_fully_secured
                (not (and related_party_loan_conditions
                          (not other_similar_loans_conditions)))
                (or (not (>= related_party_loan_amount
                             authority_specified_amount))
                    (and (<= (/ 6666667.0 10000000.0)
                             board_meeting_attendance_ratio)
                         (<= (/ 3.0 4.0) board_meeting_approval_ratio))))))
  (= related_party_loan_conditions a!1)))

; [insurance:combined_investment_and_loan_limit] 有價證券投資與以該公司發行有價證券為質之放款合併計算不得超過資金10%及該公司業主權益10%
(assert (let ((a!1 (and (<= (+ investment_in_company_securities
                       (ite loan_secured_by_company_securities 1.0 0.0))
                    (* (/ 1.0 10.0) capital_fund))
                (<= (+ investment_in_company_securities
                       (ite loan_secured_by_company_securities 1.0 0.0))
                    (* (/ 1.0 10.0) company_owner_equity)))))
  (= combined_investment_and_loan_limit (ite a!1 1.0 0.0))))

; [insurance:internal_control_and_audit_established] 保險業應建立內部控制及稽核制度
(assert true)

; [insurance:internal_handling_procedures_established] 保險業應建立資產品質評估、準備金提存、逾期放款、催收款清理、呆帳轉銷及保單招攬核保理賠之內部處理制度及程序
(assert true)

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
(let ((a!3 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:improvement_plan_submitted_and_executed] 改善計畫已提交且執行
(assert (= improvement_plan_submitted_and_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：未依規定取得許可開始營業或資本嚴重不足且未完成改善計畫時處罰
(assert (= penalty
   (or (not business_start_permit)
       (and (= 4 capital_level) (not improvement_plan_submitted_and_executed)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= permit_granted true))
(assert (= registered_according_law true))
(assert (= deposit_guarantee true))
(assert (= business_license_obtained true))
(assert (= business_start_permit true))
(assert (= capital_adequacy_ratio 40.0))
(assert (= net_worth -1000000))
(assert (= net_worth_ratio -10.0))
(assert (= capital_fund 10000000))
(assert (= improvement_plan_submitted true))
(assert (= improvement_plan_executed false))
(assert (= improvement_plan_submitted_and_executed false))
(assert (= internal_control_and_audit_established false))
(assert (= internal_handling_procedures_established false))
(assert (= real_estate_investment_excluding_self_use 4000000))
(assert (= self_use_real_estate_investment 9000000))
(assert (= owner_equity 8000000))
(assert (= related_party_loan_fully_secured false))
(assert (= related_party_loan_conditions false))
(assert (= related_party_loan_amount 2000000))
(assert (= authority_specified_amount 1000000))
(assert (= board_meeting_attendance_ratio (/ 1.0 2.0)))
(assert (= board_meeting_approval_ratio (/ 3.0 5.0)))
(assert (= loan_guaranteed_by_bank_or_authority false))
(assert (= loan_secured_by_movable_or_immovable false))
(assert (= loan_secured_by_approved_securities false))
(assert (= loan_secured_by_life_insurance_policy false))
(assert (= loan_secured_by_company_securities false))
(assert (= investment_in_company_securities 2000000))
(assert (= company_owner_equity 10000000))
(assert (= single_loan_amount 600000))
(assert (= total_loan_amount 4000000))
(assert (= social_housing_rental false))
(assert (= real_estate_investment_use_and_income false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 47
; Total facts: 34
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

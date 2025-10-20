; SMT2 file generated from compliance case automatic
; Case ID: case_448
; Generated at: 2025-10-19T16:16:39.803530
;
; This file can be executed with Z3:
;   z3 case_448.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const board_approval_majority_met Bool)
(declare-const board_approval_quorum_met Bool)
(declare-const capital_increase_plan_approved Bool)
(declare-const capital_increase_plan_executed Bool)
(declare-const capital_increase_plan_implementation Bool)
(declare-const capital_increase_plan_violation Bool)
(declare-const capital_increase_plan_violation_penalty Bool)
(declare-const capital_to_risk_capital_ratio Real)
(declare-const complete_evaluation_report_provided Bool)
(declare-const funds Real)
(declare-const information_disclosed_on_website Bool)
(declare-const non_related_party_real_estate_conditions_met Bool)
(declare-const non_related_party_real_estate_single_limit_capital_ratio_met Bool)
(declare-const non_related_party_real_estate_single_limit_capital_ratio_not_met_equity_negative Bool)
(declare-const non_related_party_real_estate_single_limit_capital_ratio_not_met_equity_positive Bool)
(declare-const non_related_party_real_estate_total_limit_capital_ratio_met Bool)
(declare-const non_related_party_real_estate_total_limit_capital_ratio_not_met_equity_negative Bool)
(declare-const non_related_party_real_estate_total_limit_capital_ratio_not_met_equity_positive Bool)
(declare-const obtained_by_public_tender Bool)
(declare-const other_transaction_limit_government_exclusion Bool)
(declare-const other_transaction_limit_pre_announcement Bool)
(declare-const penalty Bool)
(declare-const policyholder_equity Real)
(declare-const previous_limit_amount Real)
(declare-const real_estate_immediately_income_generating Bool)
(declare-const real_estate_transaction_procedure_compliant Bool)
(declare-const single_transaction_amount Real)
(declare-const single_transaction_limit_2billion Bool)
(declare-const single_transaction_limit_fixed_limit Bool)
(declare-const single_transaction_limit_government Bool)
(declare-const single_transaction_limit_percentage Real)
(declare-const statutory_standard Real)
(declare-const total_transaction_amount Real)
(declare-const total_transaction_limit_fixed_limit Bool)
(declare-const total_transaction_limit_percentage Real)
(declare-const transaction_before_announcement Bool)
(declare-const transaction_counterparty_is_government Bool)
(declare-const written_opinions_from_directors_and_supervisors Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:other_transaction_limit_government_exclusion] 交易對象為政府機關、公立學校、公營事業者時，交易總餘額不計入限額
(assert (= other_transaction_limit_government_exclusion
   transaction_counterparty_is_government))

; [insurance:single_transaction_limit_percentage] 單一交易金額不得超過業主權益之35%
(assert (= single_transaction_limit_percentage
   (ite (<= single_transaction_amount (* (/ 7.0 20.0) policyholder_equity))
        1.0
        0.0)))

; [insurance:total_transaction_limit_percentage] 交易總餘額不得超過業主權益之70%
(assert (= total_transaction_limit_percentage
   (ite (<= total_transaction_amount (* (/ 7.0 10.0) policyholder_equity))
        1.0
        0.0)))

; [insurance:single_transaction_limit_fixed_limit] 單一交易金額未達新臺幣1億元者，得以新臺幣1億元為最高限額
(assert (= single_transaction_limit_fixed_limit
   (or (>= 100000000.0 single_transaction_amount)
       (<= 100000000.0 single_transaction_amount))))

; [insurance:total_transaction_limit_fixed_limit] 交易總餘額不得逾新臺幣2億元
(assert (= total_transaction_limit_fixed_limit
   (>= 200000000.0 total_transaction_amount)))

; [insurance:single_transaction_limit_government] 政府機關、公立學校、公營事業者單一交易金額不得超過業主權益
(assert (= single_transaction_limit_government
   (or (not transaction_counterparty_is_government)
       (<= single_transaction_amount policyholder_equity))))

; [insurance:single_transaction_limit_2billion] 依前款計算之單一交易金額未達新臺幣2億元者，得以新臺幣2億元為最高限額
(assert (= single_transaction_limit_2billion
   (or (<= 200000000.0 single_transaction_amount)
       (>= 200000000.0 single_transaction_amount))))

; [insurance:other_transaction_limit_pre_announcement] 本辦法發布前之其他交易案件，交易總餘額逾限額者不得再增加交易
(assert (= other_transaction_limit_pre_announcement
   (or (not transaction_before_announcement)
       (<= total_transaction_amount previous_limit_amount))))

; [insurance:non_related_party_real_estate_single_limit_capital_ratio_met] 自有資本與風險資本比率達法定標準，單一交易金額不得超過資金1.5%
(assert (= non_related_party_real_estate_single_limit_capital_ratio_met
   (or (not (>= capital_to_risk_capital_ratio statutory_standard))
       (<= single_transaction_amount (* (/ 3.0 200.0) funds)))))

; [insurance:non_related_party_real_estate_total_limit_capital_ratio_met] 自有資本與風險資本比率達法定標準，交易總餘額不得超過資金3%
(assert (= non_related_party_real_estate_total_limit_capital_ratio_met
   (or (not (>= capital_to_risk_capital_ratio statutory_standard))
       (<= total_transaction_amount (* (/ 3.0 100.0) funds)))))

; [insurance:non_related_party_real_estate_single_limit_capital_ratio_not_met_equity_positive] 自有資本與風險資本比率未達法定標準且業主權益正數，經核准後單一交易金額不得超過資金1%
(assert (= non_related_party_real_estate_single_limit_capital_ratio_not_met_equity_positive
   (and (not (<= statutory_standard capital_to_risk_capital_ratio))
        (not (<= policyholder_equity 0.0))
        capital_increase_plan_approved
        (<= single_transaction_amount (* (/ 1.0 100.0) funds)))))

; [insurance:non_related_party_real_estate_total_limit_capital_ratio_not_met_equity_positive] 自有資本與風險資本比率未達法定標準且業主權益正數，經核准後交易總餘額不得超過資金2%
(assert (= non_related_party_real_estate_total_limit_capital_ratio_not_met_equity_positive
   (and (not (<= statutory_standard capital_to_risk_capital_ratio))
        (not (<= policyholder_equity 0.0))
        capital_increase_plan_approved
        (<= total_transaction_amount (* (/ 1.0 50.0) funds)))))

; [insurance:non_related_party_real_estate_single_limit_capital_ratio_not_met_equity_negative] 自有資本與風險資本比率未達法定標準且業主權益負數，經核准後單一交易金額不得超過資金1%與5億元孰低
(assert (let ((a!1 (and (not (<= statutory_standard capital_to_risk_capital_ratio))
                (>= 0.0 policyholder_equity)
                capital_increase_plan_approved
                (<= single_transaction_amount
                    (ite (<= funds 500000000000.0)
                         (* (/ 1.0 100.0) funds)
                         5000000000.0)))))
  (= non_related_party_real_estate_single_limit_capital_ratio_not_met_equity_negative
     a!1)))

; [insurance:non_related_party_real_estate_total_limit_capital_ratio_not_met_equity_negative] 自有資本與風險資本比率未達法定標準且業主權益負數，經核准後交易總餘額不得超過資金2%與10億元孰低
(assert (let ((a!1 (and (not (<= statutory_standard capital_to_risk_capital_ratio))
                (>= 0.0 policyholder_equity)
                capital_increase_plan_approved
                (<= total_transaction_amount
                    (ite (<= funds 500000000000.0)
                         (* (/ 1.0 50.0) funds)
                         10000000000.0)))))
  (= non_related_party_real_estate_total_limit_capital_ratio_not_met_equity_negative
     a!1)))

; [insurance:non_related_party_real_estate_conditions_met] 不動產交易符合公開招標、程序及資訊揭露等條件
(assert (= non_related_party_real_estate_conditions_met
   (and obtained_by_public_tender
        real_estate_immediately_income_generating
        real_estate_transaction_procedure_compliant
        information_disclosed_on_website
        board_approval_quorum_met
        board_approval_majority_met
        complete_evaluation_report_provided
        written_opinions_from_directors_and_supervisors)))

; [insurance:capital_increase_plan_implementation] 核准增資改善計畫已確實辦理
(assert (= capital_increase_plan_implementation capital_increase_plan_executed))

; [insurance:capital_increase_plan_violation] 未依計畫確實辦理增資
(assert (not (= capital_increase_plan_implementation capital_increase_plan_violation)))

; [insurance:capital_increase_plan_violation_penalty] 未依計畫確實辦理增資者，主管機關得廢止核准或為其他處置
(assert (= capital_increase_plan_violation_penalty
   (and capital_increase_plan_approved capital_increase_plan_violation)))

; [meta:penalty_default_false] 預設不處罰
(assert (not (and (not non_related_party_real_estate_single_limit_capital_ratio_not_met_equity_positive)
          (not non_related_party_real_estate_single_limit_capital_ratio_not_met_equity_negative)
          (not non_related_party_real_estate_total_limit_capital_ratio_not_met_equity_positive)
          (not non_related_party_real_estate_total_limit_capital_ratio_not_met_equity_negative)
          (not capital_increase_plan_violation_penalty)
          other_transaction_limit_government_exclusion
          (= single_transaction_limit_percentage 1.0)
          (= total_transaction_limit_percentage 1.0)
          single_transaction_limit_fixed_limit
          total_transaction_limit_fixed_limit
          single_transaction_limit_government
          single_transaction_limit_2billion
          other_transaction_limit_pre_announcement)))

; [meta:penalty_conditions] 處罰條件：違反交易限額規定或未依核准增資計畫辦理者處罰
(assert (let ((a!1 (not (and (not (<= statutory_standard capital_to_risk_capital_ratio))
                     (not (<= policyholder_equity 0.0))
                     capital_increase_plan_approved)))
      (a!2 (not (and (not (<= statutory_standard capital_to_risk_capital_ratio))
                     (>= 0.0 policyholder_equity)
                     capital_increase_plan_approved))))
(let ((a!3 (or (not (and (or non_related_party_real_estate_single_limit_capital_ratio_not_met_equity_positive
                             a!1)
                         (or non_related_party_real_estate_single_limit_capital_ratio_not_met_equity_negative
                             a!2)
                         (not non_related_party_real_estate_single_limit_capital_ratio_not_met_equity_positive)
                         (not non_related_party_real_estate_single_limit_capital_ratio_not_met_equity_negative)
                         non_related_party_real_estate_total_limit_capital_ratio_met
                         (or non_related_party_real_estate_total_limit_capital_ratio_not_met_equity_negative
                             non_related_party_real_estate_total_limit_capital_ratio_not_met_equity_positive)
                         non_related_party_real_estate_conditions_met))
               capital_increase_plan_violation_penalty
               (not (and other_transaction_limit_government_exclusion
                         (= single_transaction_limit_percentage 1.0)
                         (= total_transaction_limit_percentage 1.0)
                         single_transaction_limit_fixed_limit
                         total_transaction_limit_fixed_limit
                         single_transaction_limit_government
                         single_transaction_limit_2billion
                         other_transaction_limit_pre_announcement)))))
  (= penalty a!3))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= transaction_counterparty_is_government false))
(assert (= single_transaction_amount 150000000.0))
(assert (= total_transaction_amount 150000000.0))
(assert (= policyholder_equity 100000000.0))
(assert (= capital_to_risk_capital_ratio 100.0))
(assert (= statutory_standard 100.0))
(assert (= capital_increase_plan_approved false))
(assert (= capital_increase_plan_executed false))
(assert (= board_approval_majority_met false))
(assert (= board_approval_quorum_met false))
(assert (= complete_evaluation_report_provided false))
(assert (= information_disclosed_on_website false))
(assert (= obtained_by_public_tender false))
(assert (= real_estate_immediately_income_generating false))
(assert (= real_estate_transaction_procedure_compliant false))
(assert (= written_opinions_from_directors_and_supervisors false))
(assert (= other_transaction_limit_government_exclusion false))
(assert (= other_transaction_limit_pre_announcement false))
(assert (= previous_limit_amount 0.0))
(assert (= single_transaction_limit_2billion false))
(assert (= single_transaction_limit_fixed_limit false))
(assert (= single_transaction_limit_government false))
(assert (= total_transaction_limit_fixed_limit false))
(assert (= single_transaction_limit_percentage 0.0))
(assert (= total_transaction_limit_percentage 0.0))
(assert (= non_related_party_real_estate_conditions_met false))
(assert (= non_related_party_real_estate_single_limit_capital_ratio_met false))
(assert (= non_related_party_real_estate_single_limit_capital_ratio_not_met_equity_positive false))
(assert (= non_related_party_real_estate_single_limit_capital_ratio_not_met_equity_negative false))
(assert (= non_related_party_real_estate_total_limit_capital_ratio_met false))
(assert (= non_related_party_real_estate_total_limit_capital_ratio_not_met_equity_positive false))
(assert (= non_related_party_real_estate_total_limit_capital_ratio_not_met_equity_negative false))
(assert (= capital_increase_plan_implementation false))
(assert (= capital_increase_plan_violation false))
(assert (= capital_increase_plan_violation_penalty false))
(assert (= transaction_before_announcement false))
(assert (= funds 0.0))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 20
; Total variables: 38
; Total facts: 38
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

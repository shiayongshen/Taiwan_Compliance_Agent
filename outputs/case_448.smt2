; SMT2 file generated from compliance case automatic
; Case ID: case_448
; Generated at: 2025-10-21T22:46:25.086044
;
; This file can be executed with Z3:
;   z3 case_448.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const approved_by_authority Bool)
(declare-const asset_transaction_procedure_compliant Bool)
(declare-const board_approval_majority_met Bool)
(declare-const board_approval_quorum_met Bool)
(declare-const capital_increase_plan_executed Bool)
(declare-const capital_to_risk_capital_ratio Real)
(declare-const contract_has_termination_and_exemption_clause Bool)
(declare-const counted_in_total_amount Bool)
(declare-const evaluation_report_provided Bool)
(declare-const funds Real)
(declare-const government_transaction_exclusion Bool)
(declare-const government_transaction_single_limit Real)
(declare-const government_transaction_single_limit_min_2b Real)
(declare-const information_disclosed_on_website Bool)
(declare-const no_additional_transaction Bool)
(declare-const non_related_real_estate_conditions_low_capital_negative_equity Bool)
(declare-const non_related_real_estate_conditions_low_capital_positive_equity Bool)
(declare-const non_related_real_estate_contract_clause Bool)
(declare-const non_related_real_estate_single_limit_high_capital Real)
(declare-const non_related_real_estate_single_limit_low_capital_negative_equity Real)
(declare-const non_related_real_estate_single_limit_low_capital_positive_equity Real)
(declare-const non_related_real_estate_total_limit_high_capital Real)
(declare-const non_related_real_estate_total_limit_low_capital_negative_equity Real)
(declare-const non_related_real_estate_total_limit_low_capital_positive_equity Real)
(declare-const other_transaction_limit_single Real)
(declare-const other_transaction_limit_single_min_1b Real)
(declare-const other_transaction_limit_total Real)
(declare-const other_transaction_limit_total_max_2b Real)
(declare-const owner_equity Real)
(declare-const penalty Bool)
(declare-const prior_limit_amount Real)
(declare-const prior_other_transaction_limit Real)
(declare-const prior_total_transaction_amount Real)
(declare-const public_tender_or_auction Bool)
(declare-const single_real_estate_transaction_amount Real)
(declare-const single_transaction_amount Real)
(declare-const statutory_standard Real)
(declare-const total_real_estate_transaction_amount Real)
(declare-const total_transaction_amount Real)
(declare-const transaction_counterparty_is_government Bool)
(declare-const written_opinions_from_directors_and_supervisors Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:other_transaction_limit_single] 非政府機關單一交易金額不得超過業主權益35%
(assert (let ((a!1 (ite (or transaction_counterparty_is_government
                    (<= single_transaction_amount (* (/ 7.0 20.0) owner_equity)))
                1.0
                0.0)))
  (= other_transaction_limit_single a!1)))

; [insurance:other_transaction_limit_total] 非政府機關交易總餘額不得超過業主權益70%
(assert (let ((a!1 (ite (or transaction_counterparty_is_government
                    (<= total_transaction_amount (* (/ 7.0 10.0) owner_equity)))
                1.0
                0.0)))
  (= other_transaction_limit_total a!1)))

; [insurance:other_transaction_limit_single_min_1b] 單一交易金額未達1億元時，得以1億元為最高限額
(assert (= other_transaction_limit_single_min_1b
   (ite (or (<= 100000000.0 single_transaction_amount)
            (>= 100000000.0 single_transaction_amount))
        1.0
        0.0)))

; [insurance:other_transaction_limit_total_max_2b] 交易總餘額不得逾2億元
(assert (= other_transaction_limit_total_max_2b
   (ite (or (<= 100000000.0 single_transaction_amount)
            (>= 200000000.0 total_transaction_amount))
        1.0
        0.0)))

; [insurance:government_transaction_exclusion] 政府機關、公立學校、公營事業交易不計入交易總餘額
(assert (= government_transaction_exclusion
   (or (not counted_in_total_amount)
       (not transaction_counterparty_is_government))))

; [insurance:government_transaction_single_limit] 政府機關單一交易金額不得超過業主權益
(assert (= government_transaction_single_limit
   (ite (or (not transaction_counterparty_is_government)
            (<= single_transaction_amount owner_equity))
        1.0
        0.0)))

; [insurance:government_transaction_single_limit_min_2b] 政府機關單一交易金額未達2億元時，得以2億元為最高限額
(assert (= government_transaction_single_limit_min_2b
   (ite (or (>= 200000000.0 single_transaction_amount)
            (<= 200000000.0 single_transaction_amount)
            (not transaction_counterparty_is_government))
        1.0
        0.0)))

; [insurance:prior_other_transaction_limit] 本辦法發布前其他交易案件交易總餘額逾限額者不得再增加交易
(assert (= prior_other_transaction_limit
   (ite (or (<= prior_total_transaction_amount prior_limit_amount)
            no_additional_transaction)
        1.0
        0.0)))

; [insurance:non_related_party_real_estate_single_limit_high_capital] 自有資本與風險資本比率達法定標準以上，非利害關係人不動產單一交易金額不得超過資金1.5%
(assert (let ((a!1 (ite (or (not (>= capital_to_risk_capital_ratio statutory_standard))
                    (<= single_real_estate_transaction_amount
                        (* (/ 3.0 200.0) funds)))
                1.0
                0.0)))
  (= non_related_real_estate_single_limit_high_capital a!1)))

; [insurance:non_related_party_real_estate_total_limit_high_capital] 自有資本與風險資本比率達法定標準以上，非利害關係人不動產交易總餘額不得超過資金3%
(assert (let ((a!1 (ite (or (not (>= capital_to_risk_capital_ratio statutory_standard))
                    (<= total_real_estate_transaction_amount
                        (* (/ 3.0 100.0) funds)))
                1.0
                0.0)))
  (= non_related_real_estate_total_limit_high_capital a!1)))

; [insurance:non_related_party_real_estate_single_limit_low_capital_positive_equity] 自有資本與風險資本比率未達法定標準且業主權益正數，經核准後單一交易金額不得超過資金1%
(assert (let ((a!1 (not (and (not (<= statutory_standard capital_to_risk_capital_ratio))
                     (not (<= owner_equity 0.0))
                     approved_by_authority))))
(let ((a!2 (ite (or a!1
                    (<= single_real_estate_transaction_amount
                        (* (/ 1.0 100.0) funds)))
                1.0
                0.0)))
  (= non_related_real_estate_single_limit_low_capital_positive_equity a!2))))

; [insurance:non_related_party_real_estate_total_limit_low_capital_positive_equity] 自有資本與風險資本比率未達法定標準且業主權益正數，經核准後交易總餘額不得超過資金2%
(assert (let ((a!1 (not (and (not (<= statutory_standard capital_to_risk_capital_ratio))
                     (not (<= owner_equity 0.0))
                     approved_by_authority))))
(let ((a!2 (ite (or a!1
                    (<= total_real_estate_transaction_amount
                        (* (/ 1.0 50.0) funds)))
                1.0
                0.0)))
  (= non_related_real_estate_total_limit_low_capital_positive_equity a!2))))

; [insurance:non_related_party_real_estate_conditions_low_capital_positive_equity] 自有資本與風險資本比率未達法定標準且業主權益正數，符合公開招標、交易程序及資訊揭露等條件
(assert (= non_related_real_estate_conditions_low_capital_positive_equity
   (and public_tender_or_auction
        asset_transaction_procedure_compliant
        information_disclosed_on_website
        board_approval_quorum_met
        board_approval_majority_met
        evaluation_report_provided
        written_opinions_from_directors_and_supervisors)))

; [insurance:non_related_party_real_estate_single_limit_low_capital_negative_equity] 自有資本與風險資本比率未達法定標準且業主權益負數，經核准後單一交易金額不得超過資金1%與5億元孰低
(assert (let ((a!1 (not (and (not (<= statutory_standard capital_to_risk_capital_ratio))
                     (>= 0.0 owner_equity)
                     approved_by_authority))))
(let ((a!2 (or a!1
               (<= single_real_estate_transaction_amount
                   (ite (<= funds 500000000000.0)
                        (* (/ 1.0 100.0) funds)
                        5000000000.0)))))
  (= non_related_real_estate_single_limit_low_capital_negative_equity
     (ite a!2 1.0 0.0)))))

; [insurance:non_related_party_real_estate_total_limit_low_capital_negative_equity] 自有資本與風險資本比率未達法定標準且業主權益負數，經核准後交易總餘額不得超過資金2%與10億元孰低
(assert (let ((a!1 (not (and (not (<= statutory_standard capital_to_risk_capital_ratio))
                     (>= 0.0 owner_equity)
                     approved_by_authority))))
(let ((a!2 (or a!1
               (<= total_real_estate_transaction_amount
                   (ite (<= funds 500000000000.0)
                        (* (/ 1.0 50.0) funds)
                        10000000000.0)))))
  (= non_related_real_estate_total_limit_low_capital_negative_equity
     (ite a!2 1.0 0.0)))))

; [insurance:non_related_party_real_estate_conditions_low_capital_negative_equity] 自有資本與風險資本比率未達法定標準且業主權益負數，符合公開招標、交易程序及資訊揭露等條件
(assert (= non_related_real_estate_conditions_low_capital_negative_equity
   (and public_tender_or_auction
        asset_transaction_procedure_compliant
        information_disclosed_on_website
        board_approval_quorum_met
        board_approval_majority_met
        evaluation_report_provided
        written_opinions_from_directors_and_supervisors)))

; [insurance:non_related_party_real_estate_contract_clause] 未依規定增資者應於不動產投資合約訂定終止合約及免責條款
(assert (= non_related_real_estate_contract_clause
   (or capital_increase_plan_executed
       contract_has_termination_and_exemption_clause)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反非政府機關交易限額或政府機關交易限額或不動產交易限額或未依規定訂定合約條款時處罰
(assert (let ((a!1 (or (not (<= single_transaction_amount (* (/ 7.0 20.0) owner_equity)))
               (not (<= total_transaction_amount (* (/ 7.0 10.0) owner_equity)))
               (and (not (<= 100000000.0 single_transaction_amount))
                    (not (<= single_transaction_amount 100000000.0)))
               (and (not (<= 100000000.0 single_transaction_amount))
                    (not (<= total_transaction_amount 200000000.0)))))
      (a!2 (or (not (<= single_real_estate_transaction_amount
                        (* (/ 3.0 200.0) funds)))
               (not (<= total_real_estate_transaction_amount
                        (* (/ 3.0 100.0) funds)))))
      (a!3 (or (not (<= single_real_estate_transaction_amount
                        (* (/ 1.0 100.0) funds)))
               (not (<= total_real_estate_transaction_amount
                        (* (/ 1.0 50.0) funds)))))
      (a!4 (not (<= single_real_estate_transaction_amount
                    (ite (<= funds 500000000000.0)
                         (* (/ 1.0 100.0) funds)
                         5000000000.0))))
      (a!5 (not (<= total_real_estate_transaction_amount
                    (ite (<= funds 500000000000.0)
                         (* (/ 1.0 50.0) funds)
                         10000000000.0))))
      (a!6 (or (not (<= single_transaction_amount owner_equity))
               (and (not (<= 200000000.0 single_transaction_amount))
                    (not (<= single_transaction_amount 200000000.0))))))
(let ((a!7 (or (and (not transaction_counterparty_is_government) a!1)
               (not contract_has_termination_and_exemption_clause)
               (and (>= capital_to_risk_capital_ratio statutory_standard) a!2)
               (and (not (<= statutory_standard capital_to_risk_capital_ratio))
                    (not (<= owner_equity 0.0))
                    approved_by_authority
                    a!3)
               (and (not (<= statutory_standard capital_to_risk_capital_ratio))
                    (>= 0.0 owner_equity)
                    approved_by_authority
                    (or a!4 a!5))
               (and transaction_counterparty_is_government a!6))))
  (= penalty a!7))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= transaction_counterparty_is_government false))
(assert (= single_transaction_amount 400000000))
(assert (= total_transaction_amount 500000000))
(assert (= owner_equity 1000000000))
(assert (= capital_to_risk_capital_ratio 200))
(assert (= statutory_standard 150))
(assert (= funds 10000000000))
(assert (= approved_by_authority false))
(assert (= public_tender_or_auction false))
(assert (= asset_transaction_procedure_compliant false))
(assert (= information_disclosed_on_website false))
(assert (= board_approval_quorum_met false))
(assert (= board_approval_majority_met false))
(assert (= evaluation_report_provided false))
(assert (= written_opinions_from_directors_and_supervisors false))
(assert (= capital_increase_plan_executed false))
(assert (= contract_has_termination_and_exemption_clause false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 19
; Total variables: 41
; Total facts: 18
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

; SMT2 file generated from compliance case automatic
; Case ID: case_141
; Generated at: 2025-10-21T21:27:36.831479
;
; This file can be executed with Z3:
;   z3 case_141.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const adjustment_deadline Int)
(declare-const agent_application Bool)
(declare-const agent_capital_adjusted Bool)
(declare-const agent_capital_adjustment_required Bool)
(declare-const agent_capital_cash_only Bool)
(declare-const agent_capital_paid_in_cash Bool)
(declare-const agent_min_capital Real)
(declare-const broker_application_insurance Bool)
(declare-const broker_application_reinsurance Bool)
(declare-const broker_capital_adjusted Bool)
(declare-const broker_capital_adjustment_required Bool)
(declare-const broker_capital_cash_only Bool)
(declare-const broker_capital_paid_in_cash Bool)
(declare-const broker_min_capital Real)
(declare-const capital_adjustment_due_date Int)
(declare-const compliance_163_4_financial_or_business Bool)
(declare-const compliance_163_5_applied_165_1 Bool)
(declare-const compliance_163_7 Bool)
(declare-const compliance_165_1 Bool)
(declare-const current_date Int)
(declare-const license_issue_date Int)
(declare-const penalty Bool)
(declare-const share_or_capital_transfer_date Int)
(declare-const share_or_capital_transfer_due_to_inheritance Bool)
(declare-const share_or_capital_transfer_ratio Real)
(declare-const violation_167_2 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_min_capital_requirement] 代理人公司最低實收資本額依時期及申請類型規定
(assert (let ((a!1 (ite (and (<= 20140624 current_date)
                     (not (<= 20170303 current_date))
                     agent_application)
                5000000.0
                0.0)))
  (= agent_min_capital
     (ite (and (<= 20170303 current_date) agent_application) 10000000.0 a!1))))

; [insurance:agent_capital_adjustment_required] 代理人公司已領執照且需依規定完成資本額調整
(assert (let ((a!1 (or (and (not (<= 20140624 license_issue_date))
                    (>= 20180624 adjustment_deadline)
                    (not agent_capital_adjusted))
               (and (not (<= 20170303 license_issue_date))
                    (<= 20170303 current_date)
                    (<= (/ 1.0 2.0) share_or_capital_transfer_ratio)
                    (not share_or_capital_transfer_due_to_inheritance)
                    (<= capital_adjustment_due_date
                        (+ 183 share_or_capital_transfer_date))
                    (not agent_capital_adjusted)))))
  (= agent_capital_adjustment_required a!1)))

; [insurance:agent_capital_cash_only] 代理人公司發起人及股東出資以現金為限
(assert (= agent_capital_cash_only agent_capital_paid_in_cash))

; [insurance:broker_min_capital_requirement] 經紀人公司最低實收資本額依時期及申請類型規定
(assert (let ((a!1 (or (and (<= 20140624 current_date)
                    (not (<= 20170303 current_date))
                    broker_application_insurance
                    broker_application_reinsurance)
               (and (<= 20140624 current_date)
                    (not (<= 20170303 current_date))
                    broker_application_reinsurance
                    (not broker_application_insurance)))))
(let ((a!2 (ite (and (<= 20140624 current_date)
                     (not (<= 20170303 current_date))
                     broker_application_insurance
                     (not broker_application_reinsurance))
                5000000.0
                (ite a!1 10000000.0 0.0))))
(let ((a!3 (ite (or (and (<= 20170303 current_date)
                         broker_application_insurance
                         (not broker_application_reinsurance))
                    (and (<= 20170303 current_date)
                         broker_application_reinsurance
                         (not broker_application_insurance)))
                20000000.0
                (ite (and (<= 20170303 current_date)
                          broker_application_insurance
                          broker_application_reinsurance)
                     30000000.0
                     a!2))))
  (= broker_min_capital a!3)))))

; [insurance:broker_capital_adjustment_required] 經紀人公司已領執照且需依規定完成資本額調整
(assert (let ((a!1 (or (and (not (<= 20140624 license_issue_date))
                    (>= 20180624 adjustment_deadline)
                    (not broker_capital_adjusted))
               (and (not (<= 20170303 license_issue_date))
                    (<= 20170303 current_date)
                    (<= (/ 1.0 2.0) share_or_capital_transfer_ratio)
                    (not share_or_capital_transfer_due_to_inheritance)
                    (<= capital_adjustment_due_date
                        (+ 183 share_or_capital_transfer_date))
                    (not broker_capital_adjusted)))))
  (= broker_capital_adjustment_required a!1)))

; [insurance:broker_capital_cash_only] 經紀人公司發起人及股東出資以現金為限
(assert (= broker_capital_cash_only broker_capital_paid_in_cash))

; [insurance:violation_167_2] 違反保險法第167-2條規定
(assert (= violation_167_2
   (or (not compliance_163_4_financial_or_business)
       (not compliance_163_5_applied_165_1)
       (not compliance_163_7)
       (not compliance_165_1))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反保險法第167-2條規定時處罰
(assert (= penalty violation_167_2))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= current_date 20190624))
(assert (= license_issue_date 20180101))
(assert (= adjustment_deadline 0))
(assert (= agent_application true))
(assert (= agent_capital_adjusted false))
(assert (= agent_capital_paid_in_cash true))
(assert (= agent_capital_cash_only true))
(assert (= share_or_capital_transfer_ratio 0.0))
(assert (= share_or_capital_transfer_due_to_inheritance false))
(assert (= share_or_capital_transfer_date 0))
(assert (= capital_adjustment_due_date 0))
(assert (= compliance_163_4_financial_or_business false))
(assert (= compliance_163_7 true))
(assert (= compliance_165_1 true))
(assert (= compliance_163_5_applied_165_1 true))
(assert (= violation_167_2 true))
(assert (= agent_capital_adjustment_required true))
(assert (= penalty true))
(assert (= broker_application_insurance false))
(assert (= broker_application_reinsurance false))
(assert (= broker_capital_adjusted false))
(assert (= broker_capital_adjustment_required false))
(assert (= broker_capital_paid_in_cash false))
(assert (= broker_capital_cash_only false))
(assert (= agent_min_capital 5000000.0))
(assert (= broker_min_capital 0.0))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 9
; Total variables: 26
; Total facts: 26
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

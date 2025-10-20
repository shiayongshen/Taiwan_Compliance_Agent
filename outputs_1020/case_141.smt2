; SMT2 file generated from compliance case automatic
; Case ID: case_141
; Generated at: 2025-10-19T09:05:21.255278
;
; This file can be executed with Z3:
;   z3 case_141.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_capital_adjustment_due_to_transfer Real)
(declare-const agent_capital_adjustment_required Real)
(declare-const agent_capital_adjustment_required_final Real)
(declare-const agent_capital_cash_only Real)
(declare-const agent_capital_paid_in_cash Real)
(declare-const agent_company_apply Bool)
(declare-const agent_company_has_license Bool)
(declare-const agent_min_capital Real)
(declare-const agent_transfer_due_to_inheritance Bool)
(declare-const agent_transfer_ratio Real)
(declare-const broker_apply_insurance Bool)
(declare-const broker_apply_reinsurance Bool)
(declare-const broker_capital_adjustment_due_to_transfer Real)
(declare-const broker_capital_adjustment_required Real)
(declare-const broker_capital_adjustment_required_final Real)
(declare-const broker_capital_cash_only Real)
(declare-const broker_capital_paid_in_cash Real)
(declare-const broker_company_has_license Bool)
(declare-const broker_days_since_transfer Int)
(declare-const broker_license_issue_date Int)
(declare-const broker_min_capital Real)
(declare-const broker_transfer_due_to_inheritance Bool)
(declare-const broker_transfer_ratio Real)
(declare-const current_date Int)
(declare-const days_since_transfer Int)
(declare-const license_issue_date Int)
(declare-const penalty Bool)
(declare-const violate_finance_or_business_rule_163_4 Bool)
(declare-const violate_rule_163_7 Bool)
(declare-const violate_rule_165_1_or_163_5 Bool)
(declare-const violation_penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:agent_min_capital_requirement] 代理人公司最低實收資本額依時期及申請類型規定
(assert (let ((a!1 (ite (and (<= 20140624 current_date)
                     (not (<= 20170303 current_date))
                     agent_company_apply)
                5000000.0
                0.0)))
  (= agent_min_capital
     (ite (and (<= 20170303 current_date) agent_company_apply) 10000000.0 a!1))))

; [insurance:agent_capital_adjustment_required] 代理人公司已領有執業證照且需於期限內完成資本額調整
(assert (let ((a!1 (or (and (not (<= 20140624 license_issue_date))
                    (>= 20180624 current_date))
               (and (<= 20140624 license_issue_date)
                    (not (<= 20170303 license_issue_date))
                    (>= 20180624 current_date)))))
  (= agent_capital_adjustment_required
     (ite (and agent_company_has_license a!1) 1.0 0.0))))

; [insurance:agent_capital_adjustment_due_to_transfer] 代理人公司股權或資本總額移轉累計達50%以上且非繼承，須於股權交割日或出資轉讓日次日起6個月內完成資本額調整
(assert (= agent_capital_adjustment_due_to_transfer
   (ite (and (<= 50.0 agent_transfer_ratio)
             (not agent_transfer_due_to_inheritance)
             (>= 180 days_since_transfer))
        1.0
        0.0)))

; [insurance:agent_capital_adjustment_required_final] 代理人公司需完成資本額調整（含執照持有者期限內調整及股權移轉調整）
(assert (= agent_capital_adjustment_required_final
   (ite (or (= agent_capital_adjustment_required 1.0)
            (= agent_capital_adjustment_due_to_transfer 1.0))
        1.0
        0.0)))

; [insurance:agent_capital_paid_in_cash] 代理人公司發起人及股東出資以現金為限
(assert (= agent_capital_paid_in_cash (ite (= agent_capital_cash_only 1.0) 1.0 0.0)))

; [insurance:broker_min_capital_requirement] 經紀人公司最低實收資本額依時期及申請類型規定
(assert (let ((a!1 (or (and (<= 20140624 current_date)
                    (not (<= 20170303 current_date))
                    (not broker_apply_insurance)
                    broker_apply_reinsurance)
               (and (<= 20140624 current_date)
                    (not (<= 20170303 current_date))
                    broker_apply_insurance
                    broker_apply_reinsurance))))
(let ((a!2 (ite (and (<= 20140624 current_date)
                     (not (<= 20170303 current_date))
                     broker_apply_insurance
                     (not broker_apply_reinsurance))
                5000000.0
                (ite a!1 10000000.0 0.0))))
(let ((a!3 (ite (or (and (<= 20170303 current_date)
                         broker_apply_insurance
                         (not broker_apply_reinsurance))
                    (and (<= 20170303 current_date)
                         (not broker_apply_insurance)
                         broker_apply_reinsurance))
                20000000.0
                (ite (and (<= 20170303 current_date)
                          broker_apply_insurance
                          broker_apply_reinsurance)
                     30000000.0
                     a!2))))
  (= broker_min_capital a!3)))))

; [insurance:broker_capital_adjustment_required] 經紀人公司已領有執業證照且需於期限內完成資本額調整
(assert (let ((a!1 (or (and (not (<= 20140624 broker_license_issue_date))
                    (>= 20180624 current_date))
               (and (<= 20140624 broker_license_issue_date)
                    (not (<= 20170303 broker_license_issue_date))
                    (>= 20180624 current_date)))))
  (= broker_capital_adjustment_required
     (ite (and broker_company_has_license a!1) 1.0 0.0))))

; [insurance:broker_capital_adjustment_due_to_transfer] 經紀人公司股權或資本總額移轉累計達50%以上且非繼承，須於股權交割日或出資轉讓日次日起6個月內完成資本額調整
(assert (= broker_capital_adjustment_due_to_transfer
   (ite (and (<= 50.0 broker_transfer_ratio)
             (not broker_transfer_due_to_inheritance)
             (>= 180 broker_days_since_transfer))
        1.0
        0.0)))

; [insurance:broker_capital_adjustment_required_final] 經紀人公司需完成資本額調整（含執照持有者期限內調整及股權移轉調整）
(assert (= broker_capital_adjustment_required_final
   (ite (or (= broker_capital_adjustment_due_to_transfer 1.0)
            (= broker_capital_adjustment_required 1.0))
        1.0
        0.0)))

; [insurance:broker_capital_paid_in_cash] 經紀人公司發起人及股東出資以現金為限
(assert (= broker_capital_paid_in_cash (ite (= broker_capital_cash_only 1.0) 1.0 0.0)))

; [insurance:violation_penalty] 違反相關管理規則財務或業務管理規定，應處罰
(assert (= violation_penalty
   (or violate_finance_or_business_rule_163_4
       violate_rule_163_7
       violate_rule_165_1_or_163_5)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反相關管理規則財務或業務管理規定時處罰
(assert (= penalty violation_penalty))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= current_date 20190811))
(assert (= agent_company_apply true))
(assert (= agent_company_has_license true))
(assert (= license_issue_date 20140623))
(assert (= agent_capital_adjustment_required 1.0))
(assert (= agent_capital_adjustment_due_to_transfer 0.0))
(assert (= agent_capital_adjustment_required_final 1.0))
(assert (= agent_min_capital 5000000.0))
(assert (= agent_capital_cash_only 0.0))
(assert (= agent_capital_paid_in_cash 0.0))
(assert (= agent_transfer_ratio 0.0))
(assert (= agent_transfer_due_to_inheritance false))
(assert (= days_since_transfer 0))
(assert (= violate_finance_or_business_rule_163_4 true))
(assert (= violate_rule_163_7 false))
(assert (= violate_rule_165_1_or_163_5 false))
(assert (= violation_penalty true))
(assert (= penalty true))
(assert (= broker_apply_insurance false))
(assert (= broker_apply_reinsurance false))
(assert (= broker_company_has_license false))
(assert (= broker_license_issue_date 0))
(assert (= broker_capital_adjustment_required 0.0))
(assert (= broker_capital_adjustment_due_to_transfer 0.0))
(assert (= broker_capital_adjustment_required_final 0.0))
(assert (= broker_min_capital 0.0))
(assert (= broker_capital_cash_only 0.0))
(assert (= broker_capital_paid_in_cash 0.0))
(assert (= broker_transfer_ratio 0.0))
(assert (= broker_transfer_due_to_inheritance false))
(assert (= broker_days_since_transfer 0))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 31
; Total facts: 31
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

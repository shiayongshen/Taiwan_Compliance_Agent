; SMT2 file generated from compliance case automatic
; Case ID: case_142
; Generated at: 2025-10-21T02:55:27.432986
;
; This file can be executed with Z3:
;   z3 case_142.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_capital_adjustment_after_transfer_met Bool)
(declare-const agent_capital_adjustment_deadline_met Bool)
(declare-const agent_capital_paid_in_cash Real)
(declare-const agent_capital_requirement Real)
(declare-const agent_paid_in_capital Real)
(declare-const application_date Int)
(declare-const business_type Int)
(declare-const capital_adjustment_after_transfer_met Bool)
(declare-const capital_adjustment_date Int)
(declare-const capital_adjustment_deadline_met Bool)
(declare-const capital_adjustment_within_6_months Bool)
(declare-const capital_paid_in_cash Real)
(declare-const capital_paid_in_cash_flag Bool)
(declare-const capital_requirement Real)
(declare-const license_issue_date Int)
(declare-const paid_in_capital Real)
(declare-const penalty Bool)
(declare-const share_or_capital_transfer_ratio Real)
(declare-const transfer_due_to_inheritance Bool)
(declare-const transfer_due_to_inheritance_or_share Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance_broker:capital_requirement] 經紀人公司最低實收資本額依申請業務及時期規定
(assert (let ((a!1 (or (and (not (<= 20170303 application_date)) (= 2 business_type))
               (and (not (<= 20170303 application_date)) (= 3 business_type))))
      (a!2 (ite (or (and (<= 20170303 application_date) (= 1 business_type))
                    (and (<= 20170303 application_date) (= 2 business_type)))
                20000000
                (ite (and (<= 20170303 application_date) (= 3 business_type))
                     30000000
                     0))))
(let ((a!3 (ite (and (not (<= 20170303 application_date)) (= 1 business_type))
                5000000
                (ite a!1 10000000 a!2))))
  (= capital_requirement (to_real a!3)))))

; [insurance_broker:capital_adjustment_deadline_met] 經紀人公司於規定期限內完成資本額調整
(assert (= capital_adjustment_deadline_met
   (or (<= 20180624 capital_adjustment_date)
       (not (<= 20140624 license_issue_date)))))

; [insurance_broker:capital_adjustment_after_transfer_met] 經紀人公司股權或資本總額移轉達50%以上後六個月內完成資本額調整（繼承除外）
(assert (= capital_adjustment_after_transfer_met
   (or (not (<= 50.0 share_or_capital_transfer_ratio))
       (and (<= 50.0 share_or_capital_transfer_ratio)
            capital_adjustment_within_6_months
            (not transfer_due_to_inheritance)))))

; [insurance_broker:capital_paid_in_cash] 經紀人公司發起人及股東出資以現金為限
(assert (= capital_paid_in_cash (ite capital_paid_in_cash_flag 1.0 0.0)))

; [insurance_agent:capital_requirement] 代理人公司最低實收資本額依申請業務及時期規定
(assert (= agent_capital_requirement
   (to_real (ite (<= 20170303 application_date) 10000000 5000000))))

; [insurance_agent:capital_adjustment_deadline_met] 代理人公司於規定期限內完成資本額調整
(assert (= agent_capital_adjustment_deadline_met
   (or (not (<= 20140624 license_issue_date))
       (<= 20180624 capital_adjustment_date))))

; [insurance_agent:capital_adjustment_after_transfer_met] 代理人公司股權或資本總額移轉達50%以上後六個月內完成資本額調整（繼承除外）
(assert (= agent_capital_adjustment_after_transfer_met
   (or (not (<= 50.0 share_or_capital_transfer_ratio))
       (and (<= 50.0 share_or_capital_transfer_ratio)
            capital_adjustment_within_6_months
            (not transfer_due_to_inheritance_or_share)))))

; [insurance_agent:capital_paid_in_cash] 代理人公司發起人及股東出資以現金為限
(assert (= agent_capital_paid_in_cash (ite capital_paid_in_cash_flag 1.0 0.0)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反資本額規定或未依規定完成資本調整或出資非現金時處罰
(assert (= penalty
   (or (not capital_adjustment_deadline_met)
       (not agent_capital_adjustment_after_transfer_met)
       (not (= agent_capital_paid_in_cash 1.0))
       (not capital_adjustment_after_transfer_met)
       (not (= capital_paid_in_cash 1.0))
       (not (<= capital_requirement paid_in_capital))
       (not agent_capital_adjustment_deadline_met)
       (not (<= agent_capital_requirement agent_paid_in_capital)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= application_date 20180623))
(assert (= business_type 1))
(assert (= capital_adjustment_date 20180623))
(assert (= license_issue_date 20180701))
(assert (= paid_in_capital 4000000))
(assert (= capital_requirement 5000000))
(assert (= capital_adjustment_deadline_met false))
(assert (= capital_adjustment_after_transfer_met true))
(assert (= capital_paid_in_cash_flag true))
(assert (= capital_paid_in_cash 100))
(assert (= share_or_capital_transfer_ratio 0))
(assert (= transfer_due_to_inheritance false))
(assert (= capital_adjustment_within_6_months true))
(assert (= penalty true))
(assert (= agent_capital_requirement 0))
(assert (= agent_paid_in_capital 0))
(assert (= agent_capital_adjustment_deadline_met true))
(assert (= agent_capital_adjustment_after_transfer_met true))
(assert (= agent_capital_paid_in_cash 100))
(assert (= transfer_due_to_inheritance_or_share false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 10
; Total variables: 20
; Total facts: 20
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

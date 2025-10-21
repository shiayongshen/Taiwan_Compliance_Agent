; SMT2 file generated from compliance case automatic
; Case ID: case_128
; Generated at: 2025-10-21T02:30:26.189902
;
; This file can be executed with Z3:
;   z3 case_128.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const appropriate_action_taken Bool)
(declare-const approval_required Bool)
(declare-const audit_documentation_established_and_updated Bool)
(declare-const audit_engagement_approved Bool)
(declare-const audit_error Bool)
(declare-const audit_follow_regulations Bool)
(declare-const auditor_took_appropriate_action Bool)
(declare-const documentation_updated Bool)
(declare-const error_penalty_level Int)
(declare-const error_severity Int)
(declare-const evidence_sufficient Bool)
(declare-const financial_report_available Bool)
(declare-const financial_report_placed_at_company_and_branches Bool)
(declare-const follow_rules Bool)
(declare-const governance_unit_informed Bool)
(declare-const management_informed_and_action_taken Bool)
(declare-const management_informed_of_modifications Bool)
(declare-const necessary_steps_taken Bool)
(declare-const penalty Bool)
(declare-const sufficient_and_appropriate_evidence_obtained Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [audit:approval_required] 會計師辦理查核簽證須經主管機關核准
(assert (= approval_required audit_engagement_approved))

; [audit:follow_rules] 會計師辦理查核簽證應依主管機關規定之查核簽證規則辦理
(assert (= follow_rules audit_follow_regulations))

; [audit:financial_report_available] 第三十六條第一項財務報告應備置於公司及分支機構供查閱或抄錄
(assert (= financial_report_available financial_report_placed_at_company_and_branches))

; [audit:evidence_sufficient] 會計師應依審計準則500號獲取足夠與適切之查核證據
(assert (= evidence_sufficient sufficient_and_appropriate_evidence_obtained))

; [audit:documentation_updated] 會計師應設置並持續更新查核相關檔案
(assert (= documentation_updated audit_documentation_established_and_updated))

; [audit:management_informed_and_action_taken] 管理階層及治理單位已被告知財務報表須修改且採取必要步驟
(assert (= management_informed_and_action_taken
   (and management_informed_of_modifications
        governance_unit_informed
        necessary_steps_taken)))

; [audit:appropriate_action_taken] 查核人員採取適當行動避免財務報表使用者信賴原查核報告
(assert (= appropriate_action_taken auditor_took_appropriate_action))

; [audit:error_penalty_level] 會計師查核簽證錯誤或疏漏處分等級（1=警告, 2=停止辦理2年內簽證, 3=撤銷核准）
(assert (let ((a!1 (ite (and audit_error (= 2 error_severity))
                2
                (ite (and audit_error (= 3 error_severity)) 3 0))))
(let ((a!2 (ite audit_error
                (ite (and audit_error (= 1 error_severity)) 1 a!1)
                0)))
  (= error_penalty_level a!2))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反查核簽證核准、規則遵循、財報備置、查核證據、檔案更新或錯誤處分時處罰
(assert (let ((a!1 (or (not financial_report_available)
               (not documentation_updated)
               (and audit_error (not (<= error_penalty_level 0)))
               (not approval_required)
               (not follow_rules)
               (not evidence_sufficient))))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= audit_engagement_approved true))
(assert (= approval_required true))
(assert (= audit_follow_regulations false))
(assert (= follow_rules false))
(assert (= financial_report_placed_at_company_and_branches true))
(assert (= financial_report_available true))
(assert (= sufficient_and_appropriate_evidence_obtained false))
(assert (= evidence_sufficient false))
(assert (= audit_documentation_established_and_updated false))
(assert (= documentation_updated false))
(assert (= audit_error true))
(assert (= error_severity 2))
(assert (= error_penalty_level 2))
(assert (= management_informed_of_modifications false))
(assert (= governance_unit_informed false))
(assert (= necessary_steps_taken false))
(assert (= management_informed_and_action_taken false))
(assert (= auditor_took_appropriate_action false))
(assert (= appropriate_action_taken false))
(assert (= penalty true))

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

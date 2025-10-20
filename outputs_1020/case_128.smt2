; SMT2 file generated from compliance case automatic
; Case ID: case_128
; Generated at: 2025-10-19T08:44:34.381807
;
; This file can be executed with Z3:
;   z3 case_128.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const approval_required Bool)
(declare-const audit_documentation_established_and_updated Bool)
(declare-const audit_engagement_approved Bool)
(declare-const audit_error Bool)
(declare-const audit_evidence_sufficient_and_appropriate Bool)
(declare-const audit_followed_regulations Bool)
(declare-const auditor_action_taken Bool)
(declare-const auditor_took_appropriate_actions Bool)
(declare-const documentation_updated Bool)
(declare-const error_penalty_level Int)
(declare-const financial_report_available Bool)
(declare-const financial_report_placed_at_company_and_branches Bool)
(declare-const follow_rules Bool)
(declare-const governance_informed_of_modifications Bool)
(declare-const management_and_governance_took_necessary_actions Bool)
(declare-const management_informed_and_action_taken Bool)
(declare-const management_informed_of_modifications Bool)
(declare-const penalty Bool)
(declare-const penalty_revoke Bool)
(declare-const penalty_suspend Bool)
(declare-const penalty_warning Bool)
(declare-const sufficient_evidence_obtained Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [audit:approval_required] 會計師辦理查核簽證須經主管機關核准
(assert (= approval_required audit_engagement_approved))

; [audit:follow_rules] 會計師辦理查核簽證應依主管機關查核簽證規則辦理
(assert (= follow_rules audit_followed_regulations))

; [audit:financial_report_available] 財務報告應備置於公司及分支機構供股東及債權人查閱或抄錄
(assert (= financial_report_available financial_report_placed_at_company_and_branches))

; [audit:sufficient_evidence] 會計師應依審計準則500號獲取足夠與適切之查核證據
(assert (= sufficient_evidence_obtained audit_evidence_sufficient_and_appropriate))

; [audit:documentation_updated] 會計師應設置並持續更新查核相關檔案
(assert (= documentation_updated audit_documentation_established_and_updated))

; [audit:management_informed_and_action_taken] 管理階層及治理單位已被告知財務報表須修改且採取必要行動
(assert (= management_informed_and_action_taken
   (and management_informed_of_modifications
        governance_informed_of_modifications
        management_and_governance_took_necessary_actions)))

; [audit:auditor_action_taken] 查核人員已採取適當行動避免財務報表使用者信賴原查核報告
(assert (= auditor_action_taken auditor_took_appropriate_actions))

; [audit:error_penalty_level] 會計師查核簽證錯誤或疏漏處分等級（0=無錯誤,1=警告,2=停止簽證,3=撤銷核准）
(assert (let ((a!1 (ite (and audit_error penalty_warning)
                1
                (ite (and audit_error penalty_suspend)
                     2
                     (ite (and audit_error penalty_revoke) 3 0)))))
  (= error_penalty_level (ite audit_error a!1 0))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反核准、規則遵守、查核證據、檔案更新、錯誤處分等規定時處罰
(assert (let ((a!1 (or (not sufficient_evidence_obtained)
               (not approval_required)
               (not follow_rules)
               (not documentation_updated)
               (and audit_error (not (<= error_penalty_level 0))))))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= approval_required true))
(assert (= audit_engagement_approved true))
(assert (= audit_error true))
(assert (= penalty_warning false))
(assert (= penalty_suspend true))
(assert (= penalty_revoke false))
(assert (= audit_followed_regulations false))
(assert (= audit_evidence_sufficient_and_appropriate false))
(assert (= audit_documentation_established_and_updated false))
(assert (= auditor_took_appropriate_actions false))
(assert (= documentation_updated false))
(assert (= management_informed_of_modifications false))
(assert (= governance_informed_of_modifications false))
(assert (= management_and_governance_took_necessary_actions false))
(assert (= auditor_action_taken false))
(assert (= financial_report_placed_at_company_and_branches false))
(assert (= financial_report_available false))
(assert (= follow_rules false))
(assert (= penalty true))
(assert (= error_penalty_level 2))
(assert (= management_informed_and_action_taken false))
(assert (= sufficient_evidence_obtained false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 10
; Total variables: 22
; Total facts: 22
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

; SMT2 file generated from compliance case automatic
; Case ID: case_114
; Generated at: 2025-10-21T02:00:42.118104
;
; This file can be executed with Z3:
;   z3 case_114.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const annual_report_submission Bool)
(declare-const business_scope Bool)
(declare-const company_type Bool)
(declare-const company_type_restriction Bool)
(declare-const contract_terms_compliance Bool)
(declare-const contract_terms_exclude_prohibited_items Bool)
(declare-const contract_terms_include_mandatory_items Bool)
(declare-const days_after_board_approval_to_submission Int)
(declare-const exclusive_4_1_2 Bool)
(declare-const exclusive_business_requirement Bool)
(declare-const financial_report_audited_or_approved Bool)
(declare-const has_permission_to_concurrent_business Bool)
(declare-const penalty Bool)
(declare-const report_announced_publicly Bool)
(declare-const report_preparation_days_after_fiscal_year_end Int)
(declare-const report_submitted_to_authority Bool)
(declare-const standard_template_level Int)
(declare-const stock_company Bool)
(declare-const user_rights_protection_level Int)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [epayment:company_type_restriction] 電子支付機構必須為股份有限公司
(assert (= company_type_restriction (= company_type stock_company)))

; [epayment:exclusive_business_requirement] 非經主管機關許可兼營者，應專營第四條第一項及第二項各款業務
(assert (= exclusive_business_requirement
   (or has_permission_to_concurrent_business (= business_scope exclusive_4_1_2))))

; [epayment:contract_terms_compliance] 專營電子支付機構訂定業務定型化契約條款應符合主管機關公告範本內容
(assert (= contract_terms_compliance
   (and contract_terms_include_mandatory_items
        contract_terms_exclude_prohibited_items
        (>= user_rights_protection_level standard_template_level))))

; [epayment:annual_report_submission] 專營電子支付機構應於會計年度終了四個月內編製營業報告書及財務報告，並於董事會通過翌日起15日內申報公告
(assert (= annual_report_submission
   (and (>= 120 report_preparation_days_after_fiscal_year_end)
        financial_report_audited_or_approved
        (>= 15 days_after_board_approval_to_submission)
        report_submitted_to_authority
        report_announced_publicly)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反公司型態、專營業務、契約條款或報告申報規定時處罰
(assert (= penalty
   (or (not contract_terms_compliance)
       (not exclusive_business_requirement)
       (not annual_report_submission)
       (not company_type_restriction))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= company_type false))
(assert (= stock_company false))
(assert (= has_permission_to_concurrent_business false))
(assert (= business_scope false))
(assert (= exclusive_4_1_2 false))
(assert (= contract_terms_include_mandatory_items false))
(assert (= contract_terms_exclude_prohibited_items false))
(assert (= user_rights_protection_level 0))
(assert (= standard_template_level 1))
(assert (= financial_report_audited_or_approved false))
(assert (= report_preparation_days_after_fiscal_year_end 121))
(assert (= days_after_board_approval_to_submission 16))
(assert (= report_submitted_to_authority false))
(assert (= report_announced_publicly false))
(assert (= annual_report_submission false))
(assert (= company_type_restriction false))
(assert (= exclusive_business_requirement false))
(assert (= contract_terms_compliance false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 6
; Total variables: 19
; Total facts: 19
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

; SMT2 file generated from compliance case automatic
; Case ID: case_110
; Generated at: 2025-10-19T08:17:52.078124
;
; This file can be executed with Z3:
;   z3 case_110.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const applicant_email_obtained Bool)
(declare-const applicant_mobile_phone_obtained Bool)
(declare-const applicant_other_contact_obtained Bool)
(declare-const compliance_all Bool)
(declare-const contact_info_obtained Bool)
(declare-const contact_info_provided_to_insurer Bool)
(declare-const disclose_and_document Bool)
(declare-const document_retention_compliance Bool)
(declare-const document_retention_period_years Int)
(declare-const documents_retained Bool)
(declare-const documents_saved Bool)
(declare-const fee_records_saved Bool)
(declare-const include_protection_for_senior_consumers Bool)
(declare-const information_disclosed Bool)
(declare-const insured_email_obtained Bool)
(declare-const insured_mobile_phone_obtained Bool)
(declare-const insured_other_contact_obtained Bool)
(declare-const internal_operation_compliance Bool)
(declare-const internal_operation_rules_established Bool)
(declare-const internal_operation_rules_executed Bool)
(declare-const penalty Bool)
(declare-const procedure_compliant Bool)
(declare-const professional_explanation_done Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance_agent:disclose_and_document] 個人執業代理人、代理人公司及銀行應善盡說明義務並留存相關文件
(assert (= disclose_and_document
   (and professional_explanation_done
        information_disclosed
        procedure_compliant
        documents_retained)))

; [insurance_agent:contact_info_obtained] 電子保單出單時取得要保人及被保險人聯絡方式並提供保險人
(assert (= contact_info_obtained
   (and (or insured_other_contact_obtained
            insured_mobile_phone_obtained
            insured_email_obtained)
        (or applicant_mobile_phone_obtained
            applicant_other_contact_obtained
            applicant_email_obtained)
        contact_info_provided_to_insurer)))

; [insurance_agent:internal_operation_compliance] 代理人公司及銀行依法令及主管機關規定訂定並落實內部作業規範
(assert (= internal_operation_compliance
   (and internal_operation_rules_established
        internal_operation_rules_executed
        include_protection_for_senior_consumers)))

; [insurance_agent:document_retention_compliance] 保存招攬、收費、簽單、批改、理賠及契約終止文件副本及收費紀錄，期限至少五年
(assert (= document_retention_compliance
   (and documents_saved
        fee_records_saved
        (<= 5 document_retention_period_years))))

; [insurance_agent:compliance_all] 代理人相關規定均符合
(assert (= compliance_all
   (and disclose_and_document
        contact_info_obtained
        internal_operation_compliance
        document_retention_compliance)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反代理人管理規則相關規定時處罰
(assert (not (= compliance_all penalty)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= professional_explanation_done false))
(assert (= information_disclosed false))
(assert (= procedure_compliant false))
(assert (= documents_retained false))
(assert (= documents_saved false))
(assert (= fee_records_saved false))
(assert (= document_retention_period_years 0))
(assert (= internal_operation_rules_established false))
(assert (= internal_operation_rules_executed false))
(assert (= include_protection_for_senior_consumers false))
(assert (= applicant_mobile_phone_obtained false))
(assert (= applicant_email_obtained false))
(assert (= applicant_other_contact_obtained false))
(assert (= insured_mobile_phone_obtained false))
(assert (= insured_email_obtained false))
(assert (= insured_other_contact_obtained false))
(assert (= contact_info_provided_to_insurer false))
(assert (= compliance_all false))
(assert (= contact_info_obtained false))
(assert (= disclose_and_document false))
(assert (= document_retention_compliance false))
(assert (= internal_operation_compliance false))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 7
; Total variables: 23
; Total facts: 23
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

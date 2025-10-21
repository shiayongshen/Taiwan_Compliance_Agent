; SMT2 file generated from compliance case automatic
; Case ID: case_110
; Generated at: 2025-10-21T01:55:35.966048
;
; This file can be executed with Z3:
;   z3 case_110.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_document_preservation Bool)
(declare-const agent_document_retention Bool)
(declare-const agent_duty_of_care Bool)
(declare-const agent_exercise_duty_of_care Bool)
(declare-const agent_fee_collection_record_preservation Bool)
(declare-const agent_follow_laws Bool)
(declare-const agent_follow_laws_and_document_retention Bool)
(declare-const agent_fully_disclose_information Bool)
(declare-const agent_internal_operation_specification Bool)
(declare-const agent_obtain_contact_info_for_e_policy Bool)
(declare-const agent_provide_professional_explanation Bool)
(declare-const compliance_163_4_financial_business Bool)
(declare-const compliance_163_7 Bool)
(declare-const compliance_165_1_and_163_5 Bool)
(declare-const compliance_financial_business_management Bool)
(declare-const contact_info_provided_to_insurer Bool)
(declare-const document_preservation_period_years Int)
(declare-const document_preservation_scope_complete Bool)
(declare-const e_policy_issued Bool)
(declare-const fee_collection_proof_saved Bool)
(declare-const fee_collection_record_saved Bool)
(declare-const insured_email_obtained Bool)
(declare-const insured_mobile_phone_obtained Bool)
(declare-const insured_other_approved_contact_obtained Bool)
(declare-const internal_operation_specification_established Bool)
(declare-const internal_operation_specification_executed Bool)
(declare-const internal_operation_specification_include_elderly_protection Bool)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:compliance_financial_business_management] 遵守保險法第163條第4項及第7項及第165條第1項相關財務或業務管理規定
(assert (= compliance_financial_business_management
   (and compliance_163_4_financial_business
        compliance_163_7
        compliance_165_1_and_163_5)))

; [insurance:agent_duty_of_care] 代理人盡善良管理人注意義務，充分說明及揭露保險商品重要內容與權利義務
(assert (= agent_duty_of_care
   (and agent_exercise_duty_of_care
        agent_provide_professional_explanation
        agent_fully_disclose_information)))

; [insurance:agent_follow_laws_and_document_retention] 代理人遵循相關法令規定並留存文件備查
(assert (= agent_follow_laws_and_document_retention
   (and agent_follow_laws agent_document_retention)))

; [insurance:agent_obtain_contact_info_for_e_policy] 電子保單出單時取得要保人及被保險人有效聯絡方式並提供保險人
(assert (= agent_obtain_contact_info_for_e_policy
   (and e_policy_issued
        (or insured_email_obtained
            insured_other_approved_contact_obtained
            insured_mobile_phone_obtained)
        contact_info_provided_to_insurer)))

; [insurance:agent_internal_operation_specification] 代理人公司及銀行依法令及主管機關規定訂定並落實內部作業規範
(assert (= agent_internal_operation_specification
   (and internal_operation_specification_established
        internal_operation_specification_executed
        internal_operation_specification_include_elderly_protection)))

; [insurance:agent_document_preservation] 代理人保存招攬、收費、簽單、批改、理賠及契約終止等文件副本
(assert (= agent_document_preservation
   (and document_preservation_scope_complete
        (<= 5 document_preservation_period_years))))

; [insurance:agent_fee_collection_record_preservation] 代理人保存收費紀錄及收取保險費證明文件
(assert (= agent_fee_collection_record_preservation
   (and fee_collection_record_saved fee_collection_proof_saved)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反財務或業務管理規定、代理人義務、內部作業規範或文件保存規定時處罰
(assert (= penalty
   (or (not agent_duty_of_care)
       (not agent_fee_collection_record_preservation)
       (not agent_internal_operation_specification)
       (not agent_obtain_contact_info_for_e_policy)
       (not compliance_financial_business_management)
       (not agent_follow_laws_and_document_retention)
       (not agent_document_preservation))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= agent_document_preservation false))
(assert (= agent_document_retention false))
(assert (= agent_duty_of_care false))
(assert (= agent_exercise_duty_of_care false))
(assert (= agent_fee_collection_record_preservation true))
(assert (= agent_follow_laws false))
(assert (= agent_follow_laws_and_document_retention false))
(assert (= agent_fully_disclose_information false))
(assert (= agent_internal_operation_specification false))
(assert (= agent_obtain_contact_info_for_e_policy true))
(assert (= agent_provide_professional_explanation false))
(assert (= compliance_163_4_financial_business false))
(assert (= compliance_163_7 false))
(assert (= compliance_165_1_and_163_5 false))
(assert (= compliance_financial_business_management false))
(assert (= contact_info_provided_to_insurer true))
(assert (= document_preservation_period_years 3))
(assert (= document_preservation_scope_complete false))
(assert (= e_policy_issued true))
(assert (= fee_collection_proof_saved true))
(assert (= fee_collection_record_saved true))
(assert (= insured_email_obtained false))
(assert (= insured_mobile_phone_obtained false))
(assert (= insured_other_approved_contact_obtained false))
(assert (= internal_operation_specification_established false))
(assert (= internal_operation_specification_executed false))
(assert (= internal_operation_specification_include_elderly_protection false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 9
; Total variables: 28
; Total facts: 28
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

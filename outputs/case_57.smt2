; SMT2 file generated from compliance case automatic
; Case ID: case_57
; Generated at: 2025-10-21T00:21:21.233933
;
; This file can be executed with Z3:
;   z3 case_57.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const approved_by_authority Bool)
(declare-const business_approval_required Bool)
(declare-const business_license_application_timely Bool)
(declare-const business_operation_approved Bool)
(declare-const business_operation_permitted Bool)
(declare-const business_types_approved Bool)
(declare-const client_evaluation_done Bool)
(declare-const client_evaluation_performed Bool)
(declare-const compensation_requested Bool)
(declare-const complies_company_law_article_16_1 Bool)
(declare-const contract_client_termination_right_included Bool)
(declare-const contract_confidentiality_clause_included Bool)
(declare-const contract_dispute_resolution_included Bool)
(declare-const contract_effective_date_and_duration_included Bool)
(declare-const contract_fee_and_payment_included Bool)
(declare-const contract_mandatory_items_compliant Bool)
(declare-const contract_modification_and_termination_included Bool)
(declare-const contract_no_client_fund_receipt Bool)
(declare-const contract_no_profit_loss_sharing Bool)
(declare-const contract_non_disclosure_clause_included Bool)
(declare-const contract_other_regulated_items_included Bool)
(declare-const contract_party_names_included Bool)
(declare-const contract_refund_ratio_and_method_included Bool)
(declare-const contract_rights_obligations_included Bool)
(declare-const contract_service_method_included Bool)
(declare-const contract_service_scope_included Bool)
(declare-const contract_signed Bool)
(declare-const contract_termination_compensation_limit_compliant Bool)
(declare-const damages_or_penalty_requested Bool)
(declare-const does_not_meet_qualification Bool)
(declare-const endorses_notes Bool)
(declare-const extension_applied_and_approved Bool)
(declare-const fund_loaned_to_others Bool)
(declare-const fund_usage_approved_investment_trust_fund Bool)
(declare-const fund_usage_compliant Bool)
(declare-const fund_usage_domestic_bank_deposit Bool)
(declare-const fund_usage_government_bonds Bool)
(declare-const fund_usage_other_approved Bool)
(declare-const fund_usage_treasury_bills_or_commercial_papers Bool)
(declare-const fund_used_for_non_operating_real_estate Bool)
(declare-const fund_used_for_other_purposes Bool)
(declare-const guarantee_and_collateral_compliant Bool)
(declare-const has_disqualifying_condition Bool)
(declare-const joined_trade_association Bool)
(declare-const membership_compliant Bool)
(declare-const penalty Bool)
(declare-const personnel_full_time Bool)
(declare-const personnel_registered_before_duty Bool)
(declare-const personnel_registration_compliant Bool)
(declare-const personnel_registration_valid Bool)
(declare-const prohibited_fund_usage Bool)
(declare-const provides_collateral_for_others Bool)
(declare-const provides_guarantee Bool)
(declare-const registration_days_since_permit Int)
(declare-const stop_operation_applied Bool)
(declare-const stop_operation_approved Bool)
(declare-const stop_operation_approved_and_within_limit Bool)
(declare-const stop_operation_duration_months Int)
(declare-const stop_operation_no_approval_penalty Bool)
(declare-const violates_regulations Bool)
(declare-const written_contract_signed Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities_investment_advisory:business_approval_required] 證券投資顧問事業經營業務種類應報請主管機關核准
(assert (= business_approval_required business_types_approved))

; [securities_investment_advisory:business_operation_permitted] 證券投資顧問事業不得經營未經主管機關核准之業務
(assert (= business_operation_permitted business_operation_approved))

; [securities_investment_advisory:stop_operation_approval] 證券投資顧問事業申請停業應經本會核准且停業期間不得超過一年
(assert (= stop_operation_approved_and_within_limit
   (and stop_operation_applied
        stop_operation_approved
        (>= 12 stop_operation_duration_months))))

; [securities_investment_advisory:stop_operation_no_approval_penalty] 未依規定申請停業且自行停業連續三個月以上者不得執行業務
(assert (not (= (and stop_operation_applied stop_operation_approved)
        stop_operation_no_approval_penalty)))

; [securities_investment_advisory:fund_usage_compliance] 資金運用符合規定用途
(assert (= fund_usage_compliant
   (or fund_usage_approved_investment_trust_fund
       fund_usage_treasury_bills_or_commercial_papers
       fund_usage_other_approved
       fund_usage_government_bonds
       fund_usage_domestic_bank_deposit)))

; [securities_investment_advisory:prohibited_fund_usage] 資金不得貸與他人、購置非營業用不動產或移作他項用途
(assert (not (= (or fund_loaned_to_others
            fund_used_for_non_operating_real_estate
            fund_used_for_other_purposes)
        prohibited_fund_usage)))

; [securities_investment_advisory:guarantee_and_collateral_restriction] 不得為保證、票據背書或提供財產供他人設定擔保，除非符合公司法及本會核准
(assert (= guarantee_and_collateral_compliant
   (or (not (or provides_collateral_for_others
                provides_guarantee
                endorses_notes))
       (and complies_company_law_article_16_1 approved_by_authority))))

; [securities_investment_advisory:personnel_registration_required] 總經理、部門主管、分支機構經理人及業務人員應專任且執行前須登錄
(assert (= personnel_registration_compliant
   (and personnel_full_time personnel_registered_before_duty)))

; [securities_investment_advisory:personnel_registration_valid] 有不符合資格條件或違反規定者不得登錄或應撤銷登錄
(assert (not (= (or has_disqualifying_condition
            violates_regulations
            does_not_meet_qualification)
        personnel_registration_valid)))

; [securities_investment_advisory:business_license_application_timely] 證券投資顧問事業應於許可日起六個月內完成公司設立登記並申請營業執照
(assert (= business_license_application_timely
   (or (>= 180 registration_days_since_permit) extension_applied_and_approved)))

; [securities_investment_advisory:membership_required] 證券投資顧問事業非加入同業公會不得開業
(assert (= membership_compliant joined_trade_association))

; [securities_investment_advisory:client_evaluation_required] 接受客戶委任應充分知悉並評估客戶投資知識、經驗、財務狀況及風險承受度
(assert (= client_evaluation_done client_evaluation_performed))

; [securities_investment_advisory:written_contract_required] 提供分析意見或推介建議時應訂定書面證券投資顧問契約
(assert (= written_contract_signed contract_signed))

; [securities_investment_advisory:contract_mandatory_items_compliant] 證券投資顧問契約應載明法定事項
(assert (= contract_mandatory_items_compliant
   (and contract_party_names_included
        contract_rights_obligations_included
        contract_service_scope_included
        contract_service_method_included
        contract_fee_and_payment_included
        contract_confidentiality_clause_included
        contract_non_disclosure_clause_included
        contract_no_client_fund_receipt
        contract_no_profit_loss_sharing
        contract_modification_and_termination_included
        contract_effective_date_and_duration_included
        contract_client_termination_right_included
        contract_refund_ratio_and_method_included
        contract_dispute_resolution_included
        contract_other_regulated_items_included)))

; [securities_investment_advisory:contract_termination_compensation_limit] 契約終止時得請求終止前所提供服務之相當報酬，但不得請求損害賠償或違約金
(assert (= contract_termination_compensation_limit_compliant
   (and compensation_requested (not damages_or_penalty_requested))))

; [securities_investment_advisory:penalty_default_false] 預設不處罰
(assert (not penalty))

; [securities_investment_advisory:penalty_conditions] 處罰條件：違反經營未經核准業務、未依規定申請停業、未於期限內申請營業執照、未加入同業公會、未專任或未登錄人員、契約不符規定等情形
(assert (let ((a!1 (or (not business_operation_permitted)
               (not fund_usage_compliant)
               (not client_evaluation_done)
               (not guarantee_and_collateral_compliant)
               (not personnel_registration_compliant)
               (not personnel_registration_valid)
               (not business_license_application_timely)
               (not contract_mandatory_items_compliant)
               (and (not stop_operation_approved_and_within_limit)
                    (not (<= stop_operation_duration_months 3)))
               (not contract_termination_compensation_limit_compliant)
               (not prohibited_fund_usage)
               (not written_contract_signed)
               (not membership_compliant))))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= business_types_approved false))
(assert (= business_approval_required true))
(assert (= business_operation_approved false))
(assert (= business_operation_permitted false))
(assert (= fund_loaned_to_others true))
(assert (= fund_usage_domestic_bank_deposit false))
(assert (= fund_usage_government_bonds false))
(assert (= fund_usage_treasury_bills_or_commercial_papers false))
(assert (= fund_usage_approved_investment_trust_fund false))
(assert (= fund_usage_other_approved false))
(assert (= prohibited_fund_usage true))
(assert (= personnel_full_time false))
(assert (= personnel_registered_before_duty false))
(assert (= personnel_registration_compliant false))
(assert (= violates_regulations true))
(assert (= personnel_registration_valid false))
(assert (= stop_operation_applied false))
(assert (= stop_operation_approved false))
(assert (= stop_operation_approved_and_within_limit false))
(assert (= stop_operation_duration_months 0))
(assert (= membership_compliant true))
(assert (= joined_trade_association true))
(assert (= written_contract_signed true))
(assert (= contract_mandatory_items_compliant true))
(assert (= contract_termination_compensation_limit_compliant true))
(assert (= compensation_requested true))
(assert (= damages_or_penalty_requested false))
(assert (= guarantee_and_collateral_compliant true))
(assert (= approved_by_authority false))
(assert (= client_evaluation_performed true))
(assert (= client_evaluation_done true))
(assert (= registration_days_since_permit 7))
(assert (= extension_applied_and_approved false))
(assert (= provides_guarantee false))
(assert (= endorses_notes false))
(assert (= provides_collateral_for_others false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 17
; Total variables: 61
; Total facts: 36
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

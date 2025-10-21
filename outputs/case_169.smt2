; SMT2 file generated from compliance case automatic
; Case ID: case_169
; Generated at: 2025-10-21T03:47:34.993028
;
; This file can be executed with Z3:
;   z3 case_169.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const annual_report_submitted Bool)
(declare-const audit_report_submitted_within_1_month_after_quarter Bool)
(declare-const board_approval_obtained Bool)
(declare-const business_report_prepared_within_4_months Bool)
(declare-const contract_renewal_reported Bool)
(declare-const contract_renewed_or_new_signed_before_2_months_expiry Bool)
(declare-const contract_terms_compliance Bool)
(declare-const contract_terms_meet_minimum_requirements Bool)
(declare-const financial_report_audited_and_signed Bool)
(declare-const foreign_cooperation_approved_by_authority Bool)
(declare-const funds_fully_guaranteed_by_bank Bool)
(declare-const funds_fully_trusted Bool)
(declare-const funds_trust_or_guarantee_compliance Bool)
(declare-const illegal_foreign_cooperation Bool)
(declare-const illegal_foreign_cooperation_penalty_applicable Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_system_established Bool)
(declare-const penalty Bool)
(declare-const performance_guarantee_amount_sufficient Bool)
(declare-const performance_guarantee_contract_compliance Bool)
(declare-const performance_guarantee_contract_signed_with_bank Bool)
(declare-const quarterly_audit_conducted Bool)
(declare-const quarterly_audit_report_submitted Bool)
(declare-const registration_and_payment_restriction Bool)
(declare-const renewal_reported_to_authority Bool)
(declare-const report_submitted_within_15_days_after_board_approval Bool)
(declare-const trust_contract_compliance Bool)
(declare-const trust_contract_meets_regulations Bool)
(declare-const trust_contract_missing_mandatory_items Bool)
(declare-const trust_contract_valid Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [e_payment:contract_terms_compliance] 電子支付機構業務定型化契約條款內容不得低於主管機關範本
(assert (= contract_terms_compliance contract_terms_meet_minimum_requirements))

; [e_payment:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [e_payment:annual_report_submitted] 會計年度終了四個月內編製營業報告書及財務報告並於董事會通過翌日起15日內申報公告
(assert (= annual_report_submitted
   (and business_report_prepared_within_4_months
        financial_report_audited_and_signed
        board_approval_obtained
        report_submitted_within_15_days_after_board_approval)))

; [e_payment:illegal_foreign_cooperation] 未經主管機關核准與境外機構合作或協助其於我國境內從事業務
(assert (not (= foreign_cooperation_approved_by_authority illegal_foreign_cooperation)))

; [e_payment:illegal_foreign_cooperation_penalty_applicable] 違反非法境外合作規定，法人及其代表人應受罰
(assert (= illegal_foreign_cooperation_penalty_applicable illegal_foreign_cooperation))

; [e_payment:funds_trust_or_guarantee_compliance] 儲值款項扣除準備金餘額及代理收付款項應全部交付信託或取得銀行十足履約保證
(assert (= funds_trust_or_guarantee_compliance
   (or funds_fully_guaranteed_by_bank funds_fully_trusted)))

; [e_payment:quarterly_audit_report_submitted] 委託會計師每季查核並於季終了後一個月內報主管機關備查
(assert (= quarterly_audit_report_submitted
   (and quarterly_audit_conducted
        audit_report_submitted_within_1_month_after_quarter)))

; [e_payment:trust_contract_compliance] 信託契約應記載及不得記載事項符合主管機關公告規定
(assert (= trust_contract_compliance trust_contract_meets_regulations))

; [e_payment:trust_contract_valid] 信託契約未違反主管機關公告之應記載及不得記載事項
(assert (= trust_contract_valid
   (and trust_contract_compliance (not trust_contract_missing_mandatory_items))))

; [e_payment:performance_guarantee_contract_compliance] 履約保證契約由銀行承擔履約保證責任且足額
(assert (= performance_guarantee_contract_compliance
   (and performance_guarantee_contract_signed_with_bank
        performance_guarantee_amount_sufficient)))

; [e_payment:contract_renewal_reported] 信託契約或履約保證契約到期前二個月完成續約或新訂並函報主管機關備查
(assert (= contract_renewal_reported
   (and contract_renewed_or_new_signed_before_2_months_expiry
        renewal_reported_to_authority)))

; [e_payment:registration_and_payment_restriction] 未依規定辦理信託或履約保證者，不得受理新使用者註冊、簽訂特約機構及收受新增支付款項
(assert (not (= (and funds_trust_or_guarantee_compliance contract_renewal_reported)
        registration_and_payment_restriction)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反非法境外合作或未建立內部控制制度或未依規定辦理信託或履約保證或未完成契約續約報備時處罰
(assert (= penalty
   (or (not internal_control_established)
       illegal_foreign_cooperation
       (not contract_renewal_reported)
       (not funds_trust_or_guarantee_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_established false))
(assert (= contract_terms_meet_minimum_requirements true))
(assert (= contract_terms_compliance true))
(assert (= foreign_cooperation_approved_by_authority true))
(assert (= illegal_foreign_cooperation false))
(assert (= illegal_foreign_cooperation_penalty_applicable false))
(assert (= funds_fully_trusted false))
(assert (= funds_fully_guaranteed_by_bank false))
(assert (= funds_trust_or_guarantee_compliance false))
(assert (= contract_renewed_or_new_signed_before_2_months_expiry true))
(assert (= renewal_reported_to_authority true))
(assert (= contract_renewal_reported true))
(assert (= business_report_prepared_within_4_months true))
(assert (= financial_report_audited_and_signed true))
(assert (= board_approval_obtained true))
(assert (= report_submitted_within_15_days_after_board_approval true))
(assert (= annual_report_submitted true))
(assert (= quarterly_audit_conducted true))
(assert (= audit_report_submitted_within_1_month_after_quarter true))
(assert (= quarterly_audit_report_submitted true))
(assert (= trust_contract_meets_regulations true))
(assert (= trust_contract_compliance true))
(assert (= trust_contract_missing_mandatory_items false))
(assert (= trust_contract_valid true))
(assert (= performance_guarantee_contract_signed_with_bank true))
(assert (= performance_guarantee_amount_sufficient true))
(assert (= performance_guarantee_contract_compliance true))
(assert (= penalty true))
(assert (= registration_and_payment_restriction true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 30
; Total facts: 30
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

; SMT2 file generated from compliance case automatic
; Case ID: case_467
; Generated at: 2025-10-21T10:25:49.976611
;
; This file can be executed with Z3:
;   z3 case_467.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const approval_document_attached Bool)
(declare-const branch_investment_amount Real)
(declare-const compliance_credit_and_transaction_limit Bool)
(declare-const compliance_fund_usage_and_risk_management Bool)
(declare-const compliance_inspection Bool)
(declare-const credit_and_transaction_limit_complied Bool)
(declare-const fund_usage_and_risk_management_complied Bool)
(declare-const head_office_investment_amount Real)
(declare-const invested_related_company_securities Real)
(declare-const invested_stock Real)
(declare-const investment_according_to_approval Bool)
(declare-const investment_approval_document_attached Bool)
(declare-const investment_limit_amount Real)
(declare-const investment_limit_total Real)
(declare-const investment_prohibited_related_company_securities Bool)
(declare-const investment_prohibited_stock Bool)
(declare-const no_document_concealment Bool)
(declare-const no_document_destruction Bool)
(declare-const no_inspection_evasion Bool)
(declare-const no_inspection_obstruction Bool)
(declare-const no_inspection_refusal Bool)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [int_finance:investment_prohibited_stock] 國際金融業務分行不得投資股票
(assert (= investment_prohibited_stock (= invested_stock 0.0)))

; [int_finance:investment_prohibited_related_company_securities] 國際金融業務分行不得投資於所屬銀行負責人擔任董事、監察人或經理人之公司所發行、承兌或保證之有價證券
(assert (= investment_prohibited_related_company_securities
   (= invested_related_company_securities 0.0)))

; [int_finance:investment_limit_total] 國際金融業務分行投資有價證券與所屬銀行投資有價證券金額合計不得超過金管會對總行規定之限額
(assert (= investment_limit_total
   (ite (<= (+ branch_investment_amount head_office_investment_amount)
            investment_limit_amount)
        1.0
        0.0)))

; [int_finance:investment_approval_document_attached] 國際金融業務分行應檢附經董（理）事會或總行授權同意之外幣有價證券種類、總投資限額及對同一發行人投資限額文件，並依核准內容辦理
(assert (= investment_approval_document_attached
   (and approval_document_attached investment_according_to_approval)))

; [int_finance:compliance_credit_and_transaction_limit] 遵守同一人或同一關係人授信及其他交易限制
(assert (= compliance_credit_and_transaction_limit
   credit_and_transaction_limit_complied))

; [int_finance:compliance_inspection] 主管機關檢查時未隱匿、毀損文件，且未規避、妨礙、拒絕檢查
(assert (= compliance_inspection
   (and no_document_concealment
        no_document_destruction
        no_inspection_evasion
        no_inspection_obstruction
        no_inspection_refusal)))

; [int_finance:compliance_fund_usage_and_risk_management] 遵守主管機關資金運用範圍中投資外幣有價證券之種類及限額規定
(assert (= compliance_fund_usage_and_risk_management
   fund_usage_and_risk_management_complied))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反授信及交易限制、檢查規定或資金運用管理辦法時處罰
(assert (= penalty
   (or (not compliance_fund_usage_and_risk_management)
       (not compliance_inspection)
       (not compliance_credit_and_transaction_limit))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= approval_document_attached false))
(assert (= investment_according_to_approval false))
(assert (= branch_investment_amount 120000000))
(assert (= head_office_investment_amount 50000000))
(assert (= investment_limit_amount 150000000))
(assert (= invested_stock 1000000))
(assert (= invested_related_company_securities 2000000))
(assert (= credit_and_transaction_limit_complied true))
(assert (= fund_usage_and_risk_management_complied false))
(assert (= no_document_concealment true))
(assert (= no_document_destruction true))
(assert (= no_inspection_evasion true))
(assert (= no_inspection_obstruction true))
(assert (= no_inspection_refusal true))
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
; Total variables: 22
; Total facts: 15
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

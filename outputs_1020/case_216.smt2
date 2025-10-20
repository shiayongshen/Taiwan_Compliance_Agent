; SMT2 file generated from compliance case automatic
; Case ID: case_216
; Generated at: 2025-10-19T10:42:20.402995
;
; This file can be executed with Z3:
;   z3 case_216.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const approval_document_submitted Bool)
(declare-const board_approval_obtained Bool)
(declare-const branch_investment_amount Real)
(declare-const compliance_credit_and_transaction_limit Bool)
(declare-const compliance_inspection Bool)
(declare-const compliance_investment_limit Bool)
(declare-const credit_and_transaction_limit_complied Bool)
(declare-const head_office_investment_amount Real)
(declare-const invested_in_related_company_securities Bool)
(declare-const invested_in_stock Bool)
(declare-const investment_according_to_approval Bool)
(declare-const investment_approval_required Bool)
(declare-const investment_limit_amount Real)
(declare-const investment_limit_complied Bool)
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
(assert (not (= invested_in_stock investment_prohibited_stock)))

; [int_finance:investment_prohibited_related_company_securities] 國際金融業務分行不得投資於所屬銀行負責人擔任董事、監察人或經理人之公司所發行、承兌或保證之有價證券
(assert (not (= invested_in_related_company_securities
        investment_prohibited_related_company_securities)))

; [int_finance:investment_limit_total] 國際金融業務分行投資有價證券與所屬銀行投資有價證券金額合計不得超過金管會對總行規定之限額
(assert (= investment_limit_total
   (ite (<= (+ branch_investment_amount head_office_investment_amount)
            investment_limit_amount)
        1.0
        0.0)))

; [int_finance:investment_approval_required] 國際金融業務分行投資有價證券須經董（理）事會或總行授權同意並向金管會申請核准，且依核准內容辦理
(assert (= investment_approval_required
   (and board_approval_obtained
        approval_document_submitted
        investment_according_to_approval)))

; [int_finance:compliance_credit_and_transaction_limit] 遵守同一人或同一關係人授信及其他交易限制
(assert (= compliance_credit_and_transaction_limit
   credit_and_transaction_limit_complied))

; [int_finance:compliance_inspection] 主管機關檢查或委託機構檢查時，不得隱匿、毀損文件或規避、妨礙、拒絕檢查
(assert (= compliance_inspection
   (and no_document_concealment
        no_document_destruction
        no_inspection_evasion
        no_inspection_obstruction
        no_inspection_refusal)))

; [int_finance:compliance_investment_limit] 遵守主管機關對資金運用中投資外幣有價證券種類及限額規定
(assert (= compliance_investment_limit investment_limit_complied))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反授信及交易限制、檢查規定或投資限額規定時處罰
(assert (= penalty
   (or (not investment_prohibited_related_company_securities)
       (not compliance_credit_and_transaction_limit)
       (not investment_approval_required)
       (not (= investment_limit_total 1.0))
       (not compliance_investment_limit)
       (not investment_prohibited_stock)
       (not compliance_inspection))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= invested_in_stock false))
(assert (= investment_prohibited_stock true))
(assert (= invested_in_related_company_securities false))
(assert (= investment_prohibited_related_company_securities true))
(assert (= branch_investment_amount 100000000.0))
(assert (= head_office_investment_amount 0.0))
(assert (= investment_limit_amount 50000000.0))
(assert (= investment_limit_complied false))
(assert (= investment_limit_total 0.0))
(assert (= board_approval_obtained true))
(assert (= approval_document_submitted true))
(assert (= investment_according_to_approval false))
(assert (= investment_approval_required false))
(assert (= credit_and_transaction_limit_complied true))
(assert (= compliance_credit_and_transaction_limit true))
(assert (= no_document_concealment true))
(assert (= no_document_destruction true))
(assert (= no_inspection_evasion true))
(assert (= no_inspection_obstruction true))
(assert (= no_inspection_refusal true))
(assert (= compliance_inspection true))
(assert (= compliance_investment_limit false))
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
; Total variables: 23
; Total facts: 23
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

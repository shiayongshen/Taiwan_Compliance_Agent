; SMT2 file generated from compliance case automatic
; Case ID: case_216
; Generated at: 2025-10-21T21:59:09.920535
;
; This file can be executed with Z3:
;   z3 case_216.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const approval_document_submitted Bool)
(declare-const branch_investment_amount Real)
(declare-const compliance_credit_and_transaction_limit Bool)
(declare-const compliance_inspection Bool)
(declare-const compliance_investment_limit Bool)
(declare-const credit_and_transaction_limit_complied Bool)
(declare-const head_office_investment_amount Real)
(declare-const invested_related_securities Real)
(declare-const invested_stock Real)
(declare-const investment_according_to_approval Bool)
(declare-const investment_approval_document Bool)
(declare-const investment_limit_amount Real)
(declare-const investment_limit_complied Bool)
(declare-const investment_limit_total Real)
(declare-const investment_prohibited_related_securities Bool)
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

; [int_finance:investment_prohibited_related_securities] 國際金融業務分行不得投資於所屬銀行負責人擔任董事、監察人或經理人之公司所發行、承兌或保證之有價證券
(assert (= investment_prohibited_related_securities (= invested_related_securities 0.0)))

; [int_finance:investment_limit_total] 國際金融業務分行投資有價證券與所屬銀行投資有價證券金額合計不得超過金管會對總行規定之限額
(assert (= investment_limit_total
   (ite (<= (+ branch_investment_amount head_office_investment_amount)
            investment_limit_amount)
        1.0
        0.0)))

; [int_finance:investment_approval_document] 國際金融業務分行應檢附董事會或授權單位同意文件，申請核准外幣有價證券種類、總投資限額及對同一發行人投資限額，並依核准內容辦理
(assert (= investment_approval_document
   (and approval_document_submitted investment_according_to_approval)))

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

; [int_finance:compliance_investment_limit] 遵守主管機關對資金運用中投資外幣有價證券種類及限額規定
(assert (= compliance_investment_limit investment_limit_complied))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反授信及交易限制、檢查規定或投資限額規定時處罰
(assert (= penalty
   (or (not compliance_investment_limit)
       (not compliance_inspection)
       (not investment_prohibited_stock)
       (not investment_approval_document)
       (not compliance_credit_and_transaction_limit)
       (not (= investment_limit_total 1.0))
       (not investment_prohibited_related_securities))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= approval_document_submitted true))
(assert (= branch_investment_amount 1500000000))
(assert (= head_office_investment_amount 1000000000))
(assert (= investment_limit_amount 2000000000))
(assert (= investment_according_to_approval false))
(assert (= investment_limit_complied false))
(assert (= invested_stock 0))
(assert (= invested_related_securities 0))
(assert (= credit_and_transaction_limit_complied true))
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

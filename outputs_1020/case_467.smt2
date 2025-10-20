; SMT2 file generated from compliance case automatic
; Case ID: case_467
; Generated at: 2025-10-19T16:41:46.203481
;
; This file can be executed with Z3:
;   z3 case_467.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const approval_document_submitted Bool)
(declare-const board_approval_obtained Bool)
(declare-const branch_invest_amount Real)
(declare-const credit_and_transaction_limit_compliance Bool)
(declare-const credit_transaction_limit_followed Bool)
(declare-const foreign_currency_securities_investment_limit Real)
(declare-const foreign_currency_securities_limit_followed Bool)
(declare-const head_office_invest_amount Real)
(declare-const inspection_cooperated Bool)
(declare-const inspection_cooperation Bool)
(declare-const invest_related_person_securities Bool)
(declare-const invest_stock Bool)
(declare-const investment_approval_required Bool)
(declare-const investment_limit Real)
(declare-const investment_limit_total Real)
(declare-const investment_prohibited_related_securities Bool)
(declare-const investment_prohibited_stock Bool)
(declare-const investment_within_approved_scope Bool)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [int_finance:investment_prohibited_stock] 國際金融業務分行不得投資股票
(assert (not (= invest_stock investment_prohibited_stock)))

; [int_finance:investment_prohibited_related_securities] 國際金融業務分行不得投資於所屬銀行負責人擔任董事、監察人或經理人之公司所發行、承兌或保證之有價證券
(assert (not (= invest_related_person_securities
        investment_prohibited_related_securities)))

; [int_finance:investment_limit_total] 國際金融業務分行投資有價證券與所屬銀行投資有價證券金額合計不得超過金管會對總行規定之限額
(assert (= investment_limit_total
   (ite (<= (+ branch_invest_amount head_office_invest_amount) investment_limit)
        1.0
        0.0)))

; [int_finance:investment_approval_required] 國際金融業務分行投資有價證券須經董（理）事會或總行授權同意並向金管會申請核准，且依核准內容辦理
(assert (= investment_approval_required
   (and board_approval_obtained
        approval_document_submitted
        investment_within_approved_scope)))

; [int_finance:credit_and_transaction_limit_compliance] 遵守同一人或同一關係人授信及其他交易限制
(assert (= credit_and_transaction_limit_compliance credit_transaction_limit_followed))

; [int_finance:inspection_cooperation] 配合主管機關或委託機構檢查，不隱匿、毀損文件，不規避、妨礙、拒絕檢查
(assert (= inspection_cooperation inspection_cooperated))

; [int_finance:foreign_currency_securities_investment_limit] 遵守主管機關對資金運用中投資外幣有價證券種類及限額規定
(assert (= foreign_currency_securities_investment_limit
   (ite foreign_currency_securities_limit_followed 1.0 0.0)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反授信及交易限制、檢查規定或外幣有價證券投資限額規定時處罰
(assert (= penalty
   (or (not credit_and_transaction_limit_compliance)
       (not inspection_cooperation)
       (not (= foreign_currency_securities_investment_limit 1.0)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= approval_document_submitted false))
(assert (= board_approval_obtained false))
(assert (= branch_invest_amount 1000000.0))
(assert (= credit_transaction_limit_followed true))
(assert (= foreign_currency_securities_limit_followed false))
(assert (= head_office_invest_amount 0.0))
(assert (= inspection_cooperated true))
(assert (= invest_related_person_securities false))
(assert (= invest_stock false))
(assert (= investment_within_approved_scope false))
(assert (= investment_limit 1000000.0))
(assert (= penalty true))
(assert (= credit_and_transaction_limit_compliance false))
(assert (= foreign_currency_securities_investment_limit 0.0))
(assert (= inspection_cooperation false))
(assert (= investment_approval_required false))
(assert (= investment_limit_total 0.0))
(assert (= investment_prohibited_related_securities false))
(assert (= investment_prohibited_stock false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 9
; Total variables: 19
; Total facts: 19
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

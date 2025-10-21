; SMT2 file generated from compliance case automatic
; Case ID: case_474
; Generated at: 2025-10-21T10:29:55.689084
;
; This file can be executed with Z3:
;   z3 case_474.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const declaration_compliance Bool)
(declare-const declaration_falsehood_suspected Bool)
(declare-const declaration_made Bool)
(declare-const declaration_required Bool)
(declare-const declaration_submitted Bool)
(declare-const declaration_truthful Bool)
(declare-const foreign_exchange_deposited Real)
(declare-const foreign_exchange_sold Real)
(declare-const forex_amount_ntd Real)
(declare-const penalty Bool)
(declare-const query_received Bool)
(declare-const query_response_ok Bool)
(declare-const query_response_truthful Bool)
(declare-const sale_or_deposit_compliance Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [forex:declaration_required] 新臺幣五十萬元以上等值外匯收支或交易須申報
(assert (= declaration_required (<= 500000.0 forex_amount_ntd)))

; [forex:declaration_made] 依規定申報
(assert (= declaration_made (or declaration_submitted (not declaration_required))))

; [forex:declaration_truthful] 申報內容無不實
(assert (not (= declaration_falsehood_suspected declaration_truthful)))

; [forex:query_response_ok] 受查詢者據實說明
(assert (= query_response_ok (or (not query_received) query_response_truthful)))

; [forex:declaration_compliance] 申報義務合規
(assert (= declaration_compliance
   (and declaration_made declaration_truthful query_response_ok)))

; [forex:sale_or_deposit_compliance] 外匯結售或存入中央銀行或指定銀行
(assert (= sale_or_deposit_compliance
   (or (= foreign_exchange_sold 1.0) (= foreign_exchange_deposited 1.0))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反申報義務或查詢說明義務，或違反外匯結售或存入規定時處罰
(assert (let ((a!1 (or (and query_received (not query_response_truthful))
               (and declaration_required
                    (or declaration_falsehood_suspected
                        (not declaration_submitted)))
               (not sale_or_deposit_compliance))))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= forex_amount_ntd 1000000))
(assert (= declaration_required true))
(assert (= declaration_submitted true))
(assert (= declaration_falsehood_suspected true))
(assert (= query_received true))
(assert (= query_response_truthful true))
(assert (= foreign_exchange_sold 1000000))
(assert (= foreign_exchange_deposited 0))
(assert (= query_response_ok true))
(assert (= declaration_made true))
(assert (= declaration_truthful false))
(assert (= sale_or_deposit_compliance true))
(assert (= declaration_compliance false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 8
; Total variables: 14
; Total facts: 14
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

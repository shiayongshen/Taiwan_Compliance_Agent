; SMT2 file generated from compliance case automatic
; Case ID: case_471
; Generated at: 2025-10-21T10:28:22.351159
;
; This file can be executed with Z3:
;   z3 case_471.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const compliance_6_1 Bool)
(declare-const declaration_made Bool)
(declare-const declaration_required Bool)
(declare-const declaration_submitted Bool)
(declare-const declaration_suspected_false Bool)
(declare-const declaration_truthful Bool)
(declare-const foreign_exchange_deposited Real)
(declare-const foreign_exchange_sold Real)
(declare-const forex_amount_ntd_equivalent Real)
(declare-const penalty Bool)
(declare-const query_received Bool)
(declare-const query_responded Bool)
(declare-const query_responded_truthfully Bool)
(declare-const query_response_ok Bool)
(declare-const violation_6_1 Bool)
(declare-const violation_7 Bool)
(declare-const violation_query_response Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [forex:declaration_required] 新臺幣五十萬元以上等值外匯收支或交易須申報
(assert (= declaration_required (<= 500000.0 forex_amount_ntd_equivalent)))

; [forex:declaration_made] 依規定申報
(assert (= declaration_made (or (not declaration_required) declaration_submitted)))

; [forex:declaration_truthful] 申報事項無不實之虞
(assert (not (= declaration_suspected_false declaration_truthful)))

; [forex:query_response_ok] 受查詢者據實說明
(assert (= query_response_ok (or query_responded_truthfully (not query_received))))

; [forex:compliance_6_1] 符合第6-1條申報及說明義務
(assert (= compliance_6_1 (and declaration_made declaration_truthful query_response_ok)))

; [forex:violation_6_1] 違反第6-1條申報義務（故意不申報或申報不實）
(assert (= violation_6_1
   (and declaration_required
        (or (not declaration_submitted) declaration_suspected_false))))

; [forex:violation_query_response] 受查詢未於限期內提出說明或為虛偽說明
(assert (= violation_query_response
   (and query_received
        (or (not query_responded) (not query_responded_truthfully)))))

; [forex:violation_7] 違反第7條規定，不結售或不存入外匯
(assert (= violation_7
   (or (not (= foreign_exchange_sold 1.0))
       (not (= foreign_exchange_deposited 1.0)))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反申報義務或查詢說明義務或違反外匯結售存入規定時處罰
(assert (= penalty (or violation_7 violation_query_response violation_6_1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= forex_amount_ntd_equivalent 1000000))
(assert (= declaration_required true))
(assert (= declaration_submitted true))
(assert (= declaration_suspected_false true))
(assert (= foreign_exchange_sold 1000000))
(assert (= foreign_exchange_deposited 1000000))
(assert (= query_received true))
(assert (= query_responded true))
(assert (= query_responded_truthfully true))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 10
; Total variables: 17
; Total facts: 10
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

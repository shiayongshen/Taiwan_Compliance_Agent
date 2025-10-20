; SMT2 file generated from compliance case automatic
; Case ID: case_24
; Generated at: 2025-10-19T05:39:57.566193
;
; This file can be executed with Z3:
;   z3 case_24.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const appointed_directors_count Int)
(declare-const correction_flag Bool)
(declare-const correction_ordered Bool)
(declare-const disposal_requirement_met Bool)
(declare-const fhc_name_use_flag Bool)
(declare-const fhc_name_use_prohibited Bool)
(declare-const has_violation Bool)
(declare-const held_capital_amount Real)
(declare-const held_voting_shares Int)
(declare-const mandatory_dissolution Bool)
(declare-const notify_moe_flag Bool)
(declare-const notify_moe_on_dismissal Bool)
(declare-const penalty Bool)
(declare-const penalty_action Int)
(declare-const penalty_action_1 Int)
(declare-const penalty_action_2 Int)
(declare-const penalty_action_3 Int)
(declare-const penalty_action_4 Int)
(declare-const penalty_action_5 Int)
(declare-const penalty_action_6 Int)
(declare-const penalty_action_7 Int)
(declare-const total_capital_amount Real)
(declare-const total_issued_voting_shares Int)
(declare-const violation_flag Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:has_violation] 金融控股公司有違反法令、章程或有礙健全經營之虞
(assert (= has_violation violation_flag))

; [fhc:correction_ordered] 主管機關已予以糾正並限期改善
(assert (= correction_ordered correction_flag))

; [fhc:penalty_action_case] 主管機關依情節輕重可採取之處分類型
(assert (let ((a!1 (ite (= penalty_action_5 1)
                5
                (ite (= penalty_action_6 1) 6 (ite (= penalty_action_7 1) 7 0)))))
(let ((a!2 (ite (= penalty_action_2 1)
                2
                (ite (= penalty_action_3 1)
                     3
                     (ite (= penalty_action_4 1) 4 a!1)))))
  (= penalty_action (ite (= penalty_action_1 1) 1 a!2)))))

; [fhc:notify_moe_on_dismissal] 依第四款解除董事、監察人職務時，主管機關通知經濟部廢止登記
(assert (= notify_moe_on_dismissal (and (= penalty_action_4 1) notify_moe_flag)))

; [fhc:disposal_requirement_after_license_revocation] 廢止許可後，金融控股公司須於期限內處分子公司股份及董事人數至不符規定
(assert (let ((a!1 (and (= penalty_action_6 1)
                (<= (to_real (div held_voting_shares total_issued_voting_shares))
                    (/ 1.0 4.0))
                (<= (/ held_capital_amount total_capital_amount) (/ 1.0 4.0))
                (>= 0 appointed_directors_count))))
  (= disposal_requirement_met a!1)))

; [fhc:prohibition_of_fhc_name_use_after_revocation] 廢止許可後，禁止使用金融控股公司名稱及辦理公司變更登記
(assert (= fhc_name_use_prohibited (and (= penalty_action_6 1) fhc_name_use_flag)))

; [fhc:mandatory_dissolution_if_disposal_not_completed] 未於期限內完成處分者，應進行解散及清算
(assert (= mandatory_dissolution
   (and (= penalty_action_6 1) (not disposal_requirement_met))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：有違反且未依規定完成處分或未停止使用名稱等情況時處罰
(assert (= penalty
   (or (and has_violation (not correction_ordered))
       (and (= penalty_action_6 1) (not disposal_requirement_met))
       (and (= penalty_action_6 1) (not fhc_name_use_prohibited)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_flag true))
(assert (= has_violation true))
(assert (= correction_flag true))
(assert (= correction_ordered true))
(assert (= penalty_action_4 true))
(assert (= penalty_action 4))
(assert (= notify_moe_flag true))
(assert (= notify_moe_on_dismissal true))
(assert (= penalty true))
(assert (= penalty_action_1 0))
(assert (= penalty_action_2 0))
(assert (= penalty_action_3 0))
(assert (= penalty_action_5 0))
(assert (= penalty_action_6 0))
(assert (= penalty_action_7 0))
(assert (= appointed_directors_count 0))
(assert (= held_voting_shares 0))
(assert (= total_issued_voting_shares 0))
(assert (= held_capital_amount 0.0))
(assert (= total_capital_amount 0.0))
(assert (= disposal_requirement_met false))
(assert (= fhc_name_use_flag false))
(assert (= fhc_name_use_prohibited false))
(assert (= mandatory_dissolution false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 9
; Total variables: 24
; Total facts: 24
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

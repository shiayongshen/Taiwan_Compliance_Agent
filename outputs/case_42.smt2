; SMT2 file generated from compliance case automatic
; Case ID: case_42
; Generated at: 2025-10-20T23:52:02.058811
;
; This file can be executed with Z3:
;   z3 case_42.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const approval_granted Bool)
(declare-const disposal_completed Bool)
(declare-const disposal_ordered Bool)
(declare-const establishment_applied Bool)
(declare-const establishment_required Bool)
(declare-const penalty Bool)
(declare-const pledge_exception_active Bool)
(declare-const pledge_set Bool)
(declare-const qualified_condition_met Bool)
(declare-const reporting_and_announcement_compliance Bool)
(declare-const shareholding_accumulated_change_percentage Real)
(declare-const shareholding_approval_not_obtained Bool)
(declare-const shareholding_approval_obtained Bool)
(declare-const shareholding_approval_required Bool)
(declare-const shareholding_declaration_conversion Bool)
(declare-const shareholding_declaration_post_establishment Bool)
(declare-const shareholding_declaration_post_establishment_accum_change Real)
(declare-const shareholding_declaration_pre_2008 Bool)
(declare-const shareholding_declaration_required Bool)
(declare-const shareholding_excess_disposal_not_done Bool)
(declare-const shareholding_excess_disposal_ordered Bool)
(declare-const shareholding_excess_no_voting_right Bool)
(declare-const shareholding_increased Bool)
(declare-const shareholding_no_increase_if_not_qualified Bool)
(declare-const shareholding_percentage Real)
(declare-const shareholding_percentage_conversion Real)
(declare-const shareholding_percentage_post_establishment Real)
(declare-const shareholding_percentage_pre_2008 Real)
(declare-const shareholding_pledge_prohibited Bool)
(declare-const violation_1 Bool)
(declare-const violation_2 Bool)
(declare-const violation_3 Bool)
(declare-const violation_4 Bool)
(declare-const violation_5 Bool)
(declare-const violation_6 Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:shareholding_declaration_conversion] 金融機構轉換為金融控股公司時，同一人或同一關係人持股超過10%應申報
(assert (not (= (<= shareholding_percentage_conversion 10.0)
        shareholding_declaration_conversion)))

; [fhc:shareholding_declaration_post_establishment] 金融控股公司設立後，同一人或同一關係人持股超過5%應10日內申報
(assert (not (= (<= shareholding_percentage_post_establishment 5.0)
        shareholding_declaration_post_establishment)))

; [fhc:shareholding_declaration_post_establishment_accum_change] 持股超過5%後累積增減逾1%應申報
(assert (= shareholding_declaration_post_establishment_accum_change
   (ite (<= shareholding_accumulated_change_percentage 1.0) 0.0 1.0)))

; [fhc:shareholding_approval_required] 金融控股公司設立後，同一人或同一關係人持股超過10%、25%、50%應事先申請核准
(assert (= shareholding_approval_required
   (or (not (<= shareholding_percentage_post_establishment 50.0))
       (not (<= shareholding_percentage_post_establishment 25.0))
       (not (<= shareholding_percentage_post_establishment 10.0)))))

; [fhc:shareholding_pledge_prohibited] 同一人或同一關係人持股超過10%不得設定質權予子公司，例外於轉換前質權存續期間不適用
(assert (= shareholding_pledge_prohibited
   (and (not (<= shareholding_percentage 10.0)) (not pledge_exception_active))))

; [fhc:shareholding_no_increase_if_not_qualified] 不符適格條件者得繼續持有但不得增加持股
(assert (= shareholding_no_increase_if_not_qualified
   (or qualified_condition_met (not shareholding_increased))))

; [fhc:shareholding_declaration_pre_2008] 修正施行前持股超過5%未超過10%者，應於六個月內申報
(assert (= shareholding_declaration_pre_2008
   (and (not (<= shareholding_percentage_pre_2008 5.0))
        (>= 10.0 shareholding_percentage_pre_2008))))

; [fhc:shareholding_declaration_required] 申報義務成立條件
(assert (= shareholding_declaration_required
   (or (not (<= shareholding_declaration_post_establishment_accum_change 0.0))
       shareholding_declaration_post_establishment
       shareholding_declaration_pre_2008
       shareholding_declaration_conversion)))

; [fhc:shareholding_approval_obtained] 持股超過10%、25%、50%已取得主管機關核准
(assert (= shareholding_approval_obtained
   (or approval_granted (not shareholding_approval_required))))

; [fhc:shareholding_approval_not_obtained] 持股超過10%、25%、50%未取得主管機關核准
(assert (= shareholding_approval_not_obtained
   (and shareholding_approval_required (not approval_granted))))

; [fhc:shareholding_excess_no_voting_right] 未依規定申報或未經核准持股超過部分無表決權
(assert (let ((a!1 (or shareholding_approval_not_obtained
               (and (not shareholding_declaration_required)
                    (not (<= shareholding_percentage 0.0))))))
  (= shareholding_excess_no_voting_right a!1)))

; [fhc:shareholding_excess_disposal_ordered] 主管機關命限期處分超過部分
(assert (= shareholding_excess_disposal_ordered disposal_ordered))

; [fhc:shareholding_excess_disposal_not_done] 未依主管機關期限處分超過部分
(assert (= shareholding_excess_disposal_not_done
   (and disposal_ordered (not disposal_completed))))

; [fhc:penalty_violation_1] 違反第六條第一項規定，未申請設立金融控股公司
(assert (= violation_1 (and establishment_required (not establishment_applied))))

; [fhc:penalty_violation_2] 違反第十六條第三項規定，未經主管機關核准而持有股份
(assert (= violation_2 shareholding_approval_not_obtained))

; [fhc:penalty_violation_3] 違反第十六條第一、二、九項規定未申報，或違反第十六條第七項但書規定增加持股
(assert (= violation_3
   (or (not shareholding_declaration_required)
       (and shareholding_increased (not qualified_condition_met)))))

; [fhc:penalty_violation_4] 違反第十六條第十項規定，未依主管機關期限處分
(assert (= violation_4 shareholding_excess_disposal_not_done))

; [fhc:penalty_violation_5] 違反主管機關依第十六條第五項所定辦法中有關申報或公告之規定
(assert (not (= reporting_and_announcement_compliance violation_5)))

; [fhc:penalty_violation_6] 違反第十六條第六項規定，為質權之設定
(assert (= violation_6 pledge_set))

; [fhc:penalty_conditions] 處罰條件：違反任一規定時處罰
(assert (= penalty
   (or violation_1 violation_2 violation_3 violation_4 violation_5 violation_6)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= shareholding_percentage (/ 923.0 100.0)))
(assert (= shareholding_percentage_post_establishment (/ 923.0 100.0)))
(assert (= shareholding_declaration_post_establishment false))
(assert (= disposal_ordered true))
(assert (= disposal_completed false))
(assert (= approval_granted false))
(assert (= shareholding_approval_required false))
(assert (= shareholding_approval_not_obtained false))
(assert (= shareholding_excess_disposal_not_done true))
(assert (= shareholding_excess_disposal_ordered true))
(assert (= shareholding_declaration_required false))
(assert (= shareholding_increased false))
(assert (= qualified_condition_met false))
(assert (= pledge_exception_active false))
(assert (= pledge_set false))
(assert (= reporting_and_announcement_compliance false))
(assert (= violation_4 true))
(assert (= penalty true))
(assert (= establishment_required false))
(assert (= establishment_applied false))
(assert (= shareholding_accumulated_change_percentage 0.0))
(assert (= shareholding_declaration_post_establishment_accum_change 0.0))
(assert (= shareholding_declaration_pre_2008 false))
(assert (= shareholding_declaration_conversion false))
(assert (= shareholding_percentage_conversion 0.0))
(assert (= shareholding_percentage_pre_2008 0.0))
(assert (= shareholding_no_increase_if_not_qualified true))
(assert (= violation_1 false))
(assert (= violation_2 false))
(assert (= violation_3 false))
(assert (= violation_5 true))
(assert (= violation_6 false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 21
; Total variables: 35
; Total facts: 32
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

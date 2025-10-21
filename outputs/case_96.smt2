; SMT2 file generated from compliance case automatic
; Case ID: case_96
; Generated at: 2025-10-21T01:33:03.376752
;
; This file can be executed with Z3:
;   z3 case_96.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const penalty Bool)
(declare-const pledge_acquired_before_conversion Bool)
(declare-const pledge_to_subsidiary Bool)
(declare-const pledge_within_original_term Bool)
(declare-const qualified_condition_met Bool)
(declare-const shareholding_accumulated_change_percentage Real)
(declare-const shareholding_approval_10_percent Bool)
(declare-const shareholding_approval_25_percent Bool)
(declare-const shareholding_approval_50_percent Bool)
(declare-const shareholding_approval_required Bool)
(declare-const shareholding_approved Bool)
(declare-const shareholding_compliance Bool)
(declare-const shareholding_declaration_conversion Bool)
(declare-const shareholding_declaration_post_establishment Bool)
(declare-const shareholding_declaration_post_establishment_accumulated_change Bool)
(declare-const shareholding_declaration_pre_2008 Bool)
(declare-const shareholding_declaration_required Bool)
(declare-const shareholding_declared Bool)
(declare-const shareholding_increased Bool)
(declare-const shareholding_no_increase_if_not_qualified Bool)
(declare-const shareholding_percentage_conversion Real)
(declare-const shareholding_percentage_post_establishment Real)
(declare-const shareholding_percentage_pre_2008 Real)
(declare-const shareholding_pledge_prohibition Bool)
(declare-const shareholding_violation_increase_not_allowed Bool)
(declare-const shareholding_violation_no_declaration Bool)
(declare-const shareholding_violation_pledge_prohibited Bool)
(declare-const shareholding_violation_unapproved Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:shareholding_declaration_conversion] 金融機構轉換為金融控股公司時，同一人或同一關係人持股超過10%應申報
(assert (= shareholding_declaration_conversion
   (<= 10.0 shareholding_percentage_conversion)))

; [fhc:shareholding_declaration_post_establishment] 金融控股公司設立後，同一人或同一關係人持股超過5%應10日內申報
(assert (= shareholding_declaration_post_establishment
   (<= 5.0 shareholding_percentage_post_establishment)))

; [fhc:shareholding_declaration_post_establishment_accumulated_change] 持股超過5%後累積增減逾1%應申報
(assert (= shareholding_declaration_post_establishment_accumulated_change
   (<= 1.0 shareholding_accumulated_change_percentage)))

; [fhc:shareholding_approval_10_percent] 持股超過10%應事先申請核准
(assert (not (= (<= shareholding_percentage_post_establishment 10.0)
        shareholding_approval_10_percent)))

; [fhc:shareholding_approval_25_percent] 持股超過25%應事先申請核准
(assert (not (= (<= shareholding_percentage_post_establishment 25.0)
        shareholding_approval_25_percent)))

; [fhc:shareholding_approval_50_percent] 持股超過50%應事先申請核准
(assert (not (= (<= shareholding_percentage_post_establishment 50.0)
        shareholding_approval_50_percent)))

; [fhc:shareholding_pledge_prohibition] 持股超過10%不得設定質權予子公司，除轉換前原質權存續期限內
(assert (= shareholding_pledge_prohibition
   (or (not pledge_to_subsidiary)
       (and pledge_acquired_before_conversion pledge_within_original_term)
       (not (<= 10.0 shareholding_percentage_post_establishment)))))

; [fhc:shareholding_no_increase_if_not_qualified] 不符適格條件者得繼續持有但不得增加持股
(assert (= shareholding_no_increase_if_not_qualified
   (or qualified_condition_met
       (and (not shareholding_increased)
            (<= 0.0 shareholding_percentage_post_establishment)))))

; [fhc:shareholding_declaration_pre_2008] 2008年前持股5%-10%者，修正施行日起6個月內申報
(assert (= shareholding_declaration_pre_2008
   (and (<= 5.0 shareholding_percentage_pre_2008)
        (not (<= 10.0 shareholding_percentage_pre_2008)))))

; [fhc:shareholding_declaration_required] 申報義務成立條件
(assert (= shareholding_declaration_required
   (or shareholding_declaration_conversion
       shareholding_declaration_post_establishment
       shareholding_declaration_post_establishment_accumulated_change
       shareholding_declaration_pre_2008)))

; [fhc:shareholding_approval_required] 持股超過10%、25%、50%任一門檻應事先申請核准
(assert (= shareholding_approval_required
   (or shareholding_approval_10_percent
       shareholding_approval_25_percent
       shareholding_approval_50_percent)))

; [fhc:shareholding_compliance] 申報及核准合規條件
(assert (= shareholding_compliance
   (and shareholding_declaration_required
        shareholding_declared
        shareholding_approval_required
        shareholding_approved
        shareholding_pledge_prohibition
        shareholding_no_increase_if_not_qualified)))

; [fhc:shareholding_violation_unapproved] 未經核准持有股份違規
(assert (= shareholding_violation_unapproved
   (and (not shareholding_approved) shareholding_approval_required)))

; [fhc:shareholding_violation_no_declaration] 未依規定申報違規
(assert (= shareholding_violation_no_declaration
   (and shareholding_declaration_required (not shareholding_declared))))

; [fhc:shareholding_violation_increase_not_allowed] 不符適格條件卻增加持股違規
(assert (= shareholding_violation_increase_not_allowed
   (and (not qualified_condition_met) shareholding_increased)))

; [fhc:shareholding_violation_pledge_prohibited] 違反質權設定禁止規定
(assert (= shareholding_violation_pledge_prohibited
   (and pledge_to_subsidiary
        (not (and pledge_acquired_before_conversion pledge_within_original_term))
        (<= 10.0 shareholding_percentage_post_establishment))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反申報、核准、持股增加及質權設定規定時處罰
(assert (= penalty
   (or shareholding_violation_unapproved
       shareholding_violation_increase_not_allowed
       shareholding_violation_pledge_prohibited
       shareholding_violation_no_declaration)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= shareholding_percentage_post_establishment 6.0))
(assert (= shareholding_declaration_post_establishment true))
(assert (= shareholding_declared false))
(assert (= shareholding_approved false))
(assert (= shareholding_approval_required true))
(assert (= shareholding_violation_no_declaration true))
(assert (= shareholding_violation_unapproved true))
(assert (= shareholding_increased false))
(assert (= qualified_condition_met false))
(assert (= pledge_to_subsidiary false))
(assert (= pledge_acquired_before_conversion false))
(assert (= pledge_within_original_term false))
(assert (= shareholding_accumulated_change_percentage 0.0))
(assert (= shareholding_declaration_conversion false))
(assert (= shareholding_declaration_post_establishment_accumulated_change false))
(assert (= shareholding_declaration_pre_2008 false))
(assert (= shareholding_approval_10_percent false))
(assert (= shareholding_approval_25_percent false))
(assert (= shareholding_approval_50_percent false))
(assert (= shareholding_no_increase_if_not_qualified true))
(assert (= shareholding_pledge_prohibition true))
(assert (= shareholding_violation_increase_not_allowed false))
(assert (= shareholding_violation_pledge_prohibited false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 18
; Total variables: 28
; Total facts: 24
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

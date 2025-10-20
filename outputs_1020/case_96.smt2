; SMT2 file generated from compliance case automatic
; Case ID: case_96
; Generated at: 2025-10-19T07:57:48.989925
;
; This file can be executed with Z3:
;   z3 case_96.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const is_conversion_period_pledge Bool)
(declare-const penalty Bool)
(declare-const pledge_to_subsidiary Bool)
(declare-const pledge_validity_remaining_days Int)
(declare-const qualified_condition_met Bool)
(declare-const shareholding_approval_required Bool)
(declare-const shareholding_approval_thresholds Real)
(declare-const shareholding_change_percentage Real)
(declare-const shareholding_compliance Bool)
(declare-const shareholding_declaration_conversion Bool)
(declare-const shareholding_declaration_post_establishment Bool)
(declare-const shareholding_declaration_post_establishment_change Bool)
(declare-const shareholding_declaration_pre_2008 Bool)
(declare-const shareholding_declaration_required Bool)
(declare-const shareholding_increase_prohibited_if_not_qualified Bool)
(declare-const shareholding_increased Bool)
(declare-const shareholding_no_increase_if_not_qualified Bool)
(declare-const shareholding_percentage_conversion Real)
(declare-const shareholding_percentage_post_establishment Real)
(declare-const shareholding_percentage_pre_2008 Real)
(declare-const shareholding_pledge_prohibited Bool)
(declare-const shareholding_pledge_prohibition Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:shareholding_declaration_conversion] 金融機構轉換為金融控股公司時，同一人或同一關係人持股超過10%應申報
(assert (= shareholding_declaration_conversion
   (<= 10.0 shareholding_percentage_conversion)))

; [fhc:shareholding_declaration_post_establishment] 金融控股公司設立後，同一人或同一關係人持股超過5%應10日內申報
(assert (= shareholding_declaration_post_establishment
   (<= 5.0 shareholding_percentage_post_establishment)))

; [fhc:shareholding_declaration_post_establishment_change] 持股超過5%後累積增減逾1%應申報
(assert (= shareholding_declaration_post_establishment_change
   (<= 1.0 shareholding_change_percentage)))

; [fhc:shareholding_approval_thresholds] 金融控股公司設立後，同一人或同一關係人持股超過10%、25%、50%應事先申請核准
(assert (= shareholding_approval_thresholds
   (ite (or (<= 50.0 shareholding_percentage_post_establishment)
            (<= 25.0 shareholding_percentage_post_establishment)
            (<= 10.0 shareholding_percentage_post_establishment))
        1.0
        0.0)))

; [fhc:shareholding_pledge_prohibition] 同一人或同一關係人持股超過10%不得將股票設定質權予子公司，例外為轉換前質權存續期限內
(assert (= shareholding_pledge_prohibition
   (or (not pledge_to_subsidiary)
       (and is_conversion_period_pledge (>= 0 pledge_validity_remaining_days))
       (not (<= 10.0 shareholding_percentage_post_establishment)))))

; [fhc:shareholding_no_increase_if_not_qualified] 同一人或同一關係人不符適格條件得繼續持有但不得增加持股
(assert (= shareholding_no_increase_if_not_qualified
   (or qualified_condition_met (not shareholding_increased))))

; [fhc:shareholding_declaration_pre_2008] 修正施行前持股超過5%未超過10%者，應於六個月內申報
(assert (= shareholding_declaration_pre_2008
   (and (<= 5.0 shareholding_percentage_pre_2008)
        (not (<= 10.0 shareholding_percentage_pre_2008)))))

; [fhc:shareholding_declaration_required] 申報義務成立條件
(assert (= shareholding_declaration_required
   (or shareholding_declaration_conversion
       shareholding_declaration_post_establishment
       shareholding_declaration_post_establishment_change
       shareholding_declaration_pre_2008)))

; [fhc:shareholding_approval_required] 持股超過10%、25%、50%須申請核准
(assert (= (ite shareholding_approval_required 1.0 0.0)
   shareholding_approval_thresholds))

; [fhc:shareholding_pledge_prohibited] 持股超過10%不得設定質權
(assert (= shareholding_pledge_prohibited shareholding_pledge_prohibition))

; [fhc:shareholding_increase_prohibited_if_not_qualified] 不符適格條件不得增加持股
(assert (= shareholding_increase_prohibited_if_not_qualified
   shareholding_no_increase_if_not_qualified))

; [fhc:shareholding_compliance] 持股符合申報、核准、質權及不增加持股規定
(assert (= shareholding_compliance
   (and shareholding_declaration_required
        shareholding_approval_required
        shareholding_pledge_prohibited
        shareholding_increase_prohibited_if_not_qualified)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未依申報、核准、質權及持股增加規定者處罰
(assert (= penalty
   (or (not shareholding_approval_required)
       (not shareholding_declaration_required)
       (not shareholding_increase_prohibited_if_not_qualified)
       (not shareholding_pledge_prohibited))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= shareholding_percentage_post_establishment 6.0))
(assert (= shareholding_declaration_post_establishment false))
(assert (= shareholding_declaration_conversion false))
(assert (= shareholding_declaration_post_establishment_change false))
(assert (= shareholding_declaration_pre_2008 false))
(assert (= shareholding_approval_required false))
(assert (= shareholding_pledge_prohibition true))
(assert (= pledge_to_subsidiary false))
(assert (= is_conversion_period_pledge false))
(assert (= pledge_validity_remaining_days 0))
(assert (= qualified_condition_met false))
(assert (= shareholding_increased false))
(assert (= penalty false))
(assert (= shareholding_approval_thresholds 0.0))
(assert (= shareholding_change_percentage 0.0))
(assert (= shareholding_compliance false))
(assert (= shareholding_declaration_required false))
(assert (= shareholding_increase_prohibited_if_not_qualified false))
(assert (= shareholding_no_increase_if_not_qualified false))
(assert (= shareholding_percentage_conversion 0.0))
(assert (= shareholding_percentage_pre_2008 0.0))
(assert (= shareholding_pledge_prohibited false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 22
; Total facts: 22
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

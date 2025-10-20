; SMT2 file generated from compliance case automatic
; Case ID: case_379
; Generated at: 2025-10-19T14:26:57.380418
;
; This file can be executed with Z3:
;   z3 case_379.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accumulated_shareholding_change_percent Real)
(declare-const approval_deemed_after_15_business_days Bool)
(declare-const approval_opposed Bool)
(declare-const business_days_since_application Int)
(declare-const days_since_2008_revision Int)
(declare-const days_since_shareholding_over_5_percent Int)
(declare-const declaration_made_after_establishment Bool)
(declare-const declaration_made_at_conversion Bool)
(declare-const declaration_made_for_accumulated_change Bool)
(declare-const declaration_made_pre_2008 Bool)
(declare-const illegal_pledge_set Bool)
(declare-const illegal_shareholding_disposed_within_deadline Bool)
(declare-const original_pledge_expiry_days Int)
(declare-const penalty Bool)
(declare-const pledge_acquired_before_conversion Bool)
(declare-const pledge_to_subsidiary Bool)
(declare-const pre_2008_5_to_10_percent_declaration Bool)
(declare-const prior_approval_10_percent Bool)
(declare-const prior_approval_25_percent Bool)
(declare-const prior_approval_50_percent Bool)
(declare-const prior_approval_obtained Bool)
(declare-const qualification_conditions_met Bool)
(declare-const shareholding_accumulated_change_over_1_percent_declaration Bool)
(declare-const shareholding_declaration_compliance Bool)
(declare-const shareholding_disposal_compliance Bool)
(declare-const shareholding_increase_percent Real)
(declare-const shareholding_over_10_percent_declaration_at_conversion Bool)
(declare-const shareholding_over_10_percent_pledge_restriction Bool)
(declare-const shareholding_over_5_percent_declaration_after_establishment Bool)
(declare-const shareholding_over_thresholds_prior_approval Bool)
(declare-const shareholding_percent Real)
(declare-const shareholding_percent_after_establishment Real)
(declare-const shareholding_percent_at_conversion Real)
(declare-const shareholding_percent_before_2008 Real)
(declare-const shareholding_pledge_compliance Bool)
(declare-const shareholding_qualification_noncompliance_no_increase Bool)
(declare-const shareholding_trust_inclusion Bool)
(declare-const trust_and_agreement_included_in_related_person Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:shareholding_over_10_percent_declaration_at_conversion] 金融機構轉換為金融控股公司時，同一人或同一關係人持股超過10%應申報
(assert (= shareholding_over_10_percent_declaration_at_conversion
   (or declaration_made_at_conversion
       (<= shareholding_percent_at_conversion 10.0))))

; [fhc:shareholding_over_5_percent_declaration_after_establishment] 金融控股公司設立後，同一人或同一關係人持股超過5%應10日內申報
(assert (= shareholding_over_5_percent_declaration_after_establishment
   (or (<= shareholding_percent_after_establishment 5.0)
       (>= 10 days_since_shareholding_over_5_percent))))

; [fhc:shareholding_accumulated_change_over_1_percent_declaration] 持股超過5%後累積增減逾1%應申報
(assert (let ((a!1 (not (and (not (<= shareholding_percent_after_establishment 5.0))
                     (not (<= accumulated_shareholding_change_percent 1.0))))))
  (= shareholding_accumulated_change_over_1_percent_declaration
     (or a!1 declaration_made_for_accumulated_change))))

; [fhc:shareholding_over_thresholds_prior_approval] 持股超過10%、25%、50%應事先申請核准
(assert (let ((a!1 (not (and (<= 10.0 shareholding_percent)
                     (not (<= 25.0 shareholding_percent))))))
(let ((a!2 (or (<= shareholding_percent 50.0)
               prior_approval_50_percent
               prior_approval_25_percent
               (not (and (<= 25.0 shareholding_percent)
                         (>= 50.0 shareholding_percent)))
               prior_approval_10_percent
               a!1)))
  (= shareholding_over_thresholds_prior_approval a!2))))

; [fhc:shareholding_trust_inclusion] 第三人以信託等方式持股應併入同一關係人範圍
(assert (= shareholding_trust_inclusion trust_and_agreement_included_in_related_person))

; [fhc:shareholding_over_10_percent_pledge_restriction] 持股超過10%不得設定質權予子公司，例外於轉換前原質權存續期限內
(assert (= shareholding_over_10_percent_pledge_restriction
   (or (<= shareholding_percent 10.0)
       (and pledge_to_subsidiary
            pledge_acquired_before_conversion
            (>= 0 original_pledge_expiry_days))
       (not pledge_to_subsidiary))))

; [fhc:shareholding_qualification_noncompliance_no_increase] 不符適格條件者得繼續持有但不得增加持股
(assert (= shareholding_qualification_noncompliance_no_increase
   (or qualification_conditions_met (>= 0.0 shareholding_increase_percent))))

; [fhc:approval_deemed_after_15_business_days] 主管機關15營業日內未反對視為核准
(assert (= approval_deemed_after_15_business_days
   (or (not approval_opposed) (not (<= 15 business_days_since_application)))))

; [fhc:pre_2008_5_to_10_percent_declaration] 2008年修正前持股5%至10%者應於6個月內申報
(assert (let ((a!1 (or (not (and (<= 5.0 shareholding_percent_before_2008)
                         (>= 10.0 shareholding_percent_before_2008)))
               (>= 180 days_since_2008_revision))))
  (= pre_2008_5_to_10_percent_declaration a!1)))

; [fhc:shareholding_declaration_compliance] 依第二項、第九項規定申報且依第三項規定核准持股
(assert (= shareholding_declaration_compliance
   (and declaration_made_after_establishment
        declaration_made_pre_2008
        prior_approval_obtained)))

; [fhc:shareholding_pledge_compliance] 未違反持股質權設定限制
(assert (not (= illegal_pledge_set shareholding_pledge_compliance)))

; [fhc:shareholding_disposal_compliance] 違規持股超過部分已依主管機關限期處分
(assert (= shareholding_disposal_compliance
   illegal_shareholding_disposed_within_deadline))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反申請核准、申報、持股質權限制或限期處分規定時處罰
(assert (let ((a!1 (or (not prior_approval_obtained)
               (not shareholding_disposal_compliance)
               (and (not qualification_conditions_met)
                    (not (<= shareholding_increase_percent 0.0)))
               (not declaration_made_after_establishment)
               (not declaration_made_pre_2008)
               (not shareholding_pledge_compliance))))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= shareholding_percent_after_establishment (/ 51.0 10.0)))
(assert (= days_since_shareholding_over_5_percent 11))
(assert (= declaration_made_after_establishment false))
(assert (= shareholding_percent (/ 51.0 10.0)))
(assert (= prior_approval_obtained true))
(assert (= shareholding_pledge_compliance true))
(assert (= illegal_pledge_set false))
(assert (= illegal_shareholding_disposed_within_deadline true))
(assert (= qualification_conditions_met true))
(assert (= shareholding_increase_percent 0.0))
(assert (= declaration_made_pre_2008 true))
(assert (= declaration_made_at_conversion true))
(assert (= shareholding_over_10_percent_declaration_at_conversion true))
(assert (= shareholding_over_5_percent_declaration_after_establishment false))
(assert (= shareholding_disposal_compliance true))
(assert (= shareholding_over_thresholds_prior_approval true))
(assert (= prior_approval_10_percent false))
(assert (= prior_approval_25_percent false))
(assert (= prior_approval_50_percent false))
(assert (= accumulated_shareholding_change_percent 0.0))
(assert (= declaration_made_for_accumulated_change true))
(assert (= shareholding_accumulated_change_over_1_percent_declaration true))
(assert (= pledge_to_subsidiary false))
(assert (= pledge_acquired_before_conversion false))
(assert (= original_pledge_expiry_days 0))
(assert (= trust_and_agreement_included_in_related_person true))
(assert (= shareholding_trust_inclusion true))
(assert (= approval_opposed false))
(assert (= business_days_since_application 7))
(assert (= approval_deemed_after_15_business_days false))
(assert (= days_since_2008_revision 7))
(assert (= pre_2008_5_to_10_percent_declaration true))
(assert (= penalty true))
(assert (= shareholding_declaration_compliance false))
(assert (= shareholding_over_10_percent_pledge_restriction false))
(assert (= shareholding_percent_at_conversion 0.0))
(assert (= shareholding_percent_before_2008 0.0))
(assert (= shareholding_qualification_noncompliance_no_increase false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 14
; Total variables: 38
; Total facts: 38
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

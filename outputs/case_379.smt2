; SMT2 file generated from compliance case automatic
; Case ID: case_379
; Generated at: 2025-10-21T22:29:49.123438
;
; This file can be executed with Z3:
;   z3 case_379.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const approval_10_percent Real)
(declare-const approval_25_percent Real)
(declare-const approval_50_percent Real)
(declare-const approval_deemed_after_15_business_days Bool)
(declare-const approval_granted Bool)
(declare-const approval_qualification_and_documents Bool)
(declare-const approval_rejected Bool)
(declare-const business_days_since_application Int)
(declare-const compliance_with_approval_requirements Bool)
(declare-const days_since_2008_revision Int)
(declare-const days_since_shareholding_over_5_percent Int)
(declare-const days_to_dispose_exceeding_shares Int)
(declare-const declaration_made Bool)
(declare-const declaration_made_article_16_1 Bool)
(declare-const declaration_made_article_16_2 Bool)
(declare-const declaration_made_article_16_9 Bool)
(declare-const declaration_made_at_conversion Bool)
(declare-const declaration_made_for_change Bool)
(declare-const disposition_deadline Int)
(declare-const disposition_within_deadline Bool)
(declare-const holding_without_qualification_no_increase Bool)
(declare-const is_before_conversion Bool)
(declare-const meets_qualification_conditions Bool)
(declare-const original_pledge_valid Bool)
(declare-const penalty Bool)
(declare-const pledge_to_subsidiary Bool)
(declare-const pre_2008_5_to_10_percent_declaration Bool)
(declare-const related_persons_inclusive Bool)
(declare-const shareholding_change_over_1_percent_declaration Bool)
(declare-const shareholding_change_percent Real)
(declare-const shareholding_exceeding_without_declaration_or_approval Bool)
(declare-const shareholding_over_10_percent_declaration_at_conversion Bool)
(declare-const shareholding_over_10_percent_pledge_restriction Bool)
(declare-const shareholding_over_5_percent_declaration_after_establishment Bool)
(declare-const shareholding_over_thresholds_prior_approval Bool)
(declare-const shareholding_percent Real)
(declare-const shareholding_percent_after_establishment Real)
(declare-const shareholding_percent_at_conversion Real)
(declare-const shareholding_percent_before_2008 Real)
(declare-const shareholding_percent_change Real)
(declare-const third_party_trust_included_in_related_persons Bool)
(declare-const violation_article_16_1_2_9 Bool)
(declare-const violation_article_16_7_exception Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:shareholding_over_10_percent_declaration_at_conversion] 金融機構轉換為金融控股公司時，同一人或同一關係人持股超過10%應申報
(assert (= shareholding_over_10_percent_declaration_at_conversion
   (or (<= shareholding_percent_at_conversion 10.0)
       declaration_made_at_conversion)))

; [fhc:shareholding_over_5_percent_declaration_after_establishment] 金融控股公司設立後，同一人或同一關係人持股超過5%應10日內申報
(assert (= shareholding_over_5_percent_declaration_after_establishment
   (or (<= shareholding_percent_after_establishment 5.0)
       (>= 10 days_since_shareholding_over_5_percent))))

; [fhc:shareholding_change_over_1_percent_declaration] 持股超過5%後累積增減逾1%應申報
(assert (let ((a!1 (not (and (not (<= shareholding_percent_after_establishment 5.0))
                     (not (<= shareholding_change_percent 1.0))))))
  (= shareholding_change_over_1_percent_declaration
     (or a!1 declaration_made_for_change))))

; [fhc:shareholding_over_thresholds_prior_approval] 持股超過10%、25%、50%應事先申請核准
(assert (let ((a!1 (or (and (not (<= shareholding_percent 10.0))
                    (= approval_10_percent 1.0))
               (and (not (<= shareholding_percent 25.0))
                    (= approval_25_percent 1.0))
               (and (not (<= shareholding_percent 50.0))
                    (= approval_50_percent 1.0)))))
  (= shareholding_over_thresholds_prior_approval a!1)))

; [fhc:related_persons_inclusive] 第三人以信託、委任等方式持股應併入同一關係人範圍
(assert (= related_persons_inclusive third_party_trust_included_in_related_persons))

; [fhc:approval_qualification_and_documents] 申請核准應具備適格條件及檢附書件等由主管機關定之
(assert (= approval_qualification_and_documents compliance_with_approval_requirements))

; [fhc:shareholding_over_10_percent_pledge_restriction] 持股超過10%不得將股票設定質權予子公司，例外於轉換前原質權存續期限內不適用
(assert (= shareholding_over_10_percent_pledge_restriction
   (or (not pledge_to_subsidiary)
       (and is_before_conversion original_pledge_valid)
       (<= shareholding_percent 10.0))))

; [fhc:holding_without_qualification_no_increase] 不符適格條件者得繼續持有但不得增加持股
(assert (= holding_without_qualification_no_increase
   (or meets_qualification_conditions (<= shareholding_percent_change 0.0))))

; [fhc:approval_deemed_after_15_business_days] 主管機關15營業日內未反對視為核准
(assert (= approval_deemed_after_15_business_days
   (or (not approval_rejected) (not (<= 15 business_days_since_application)))))

; [fhc:pre_2008_5_to_10_percent_declaration] 修正施行前持股超過5%未超過10%者，應於6個月內申報
(assert (let ((a!1 (not (and (not (<= shareholding_percent_before_2008 5.0))
                     (>= 10.0 shareholding_percent_before_2008)))))
  (= pre_2008_5_to_10_percent_declaration
     (or a!1 (>= 180 days_since_2008_revision)))))

; [fhc:shareholding_exceeding_without_declaration_or_approval] 未依規定申報或未經核准持股超過部分無表決權且須限期處分
(assert (let ((a!1 (or (and (not (<= shareholding_percent 10.0)) (not approval_granted))
               (and (not (<= shareholding_percent 10.0)) (not declaration_made)))))
  (= shareholding_exceeding_without_declaration_or_approval a!1)))

; [fhc:disposition_within_deadline] 違規持股超過部分須依主管機關期限處分
(assert (= disposition_within_deadline
   (or (not shareholding_exceeding_without_declaration_or_approval)
       (<= days_to_dispose_exceeding_shares disposition_deadline))))

; [fhc:violation_article_16_1_2_9] 違反第16條第1、2、9項規定未申報或違反第16條第7項但書規定增加持股
(assert (let ((a!1 (or (not declaration_made_article_16_1)
               (not declaration_made_article_16_2)
               (not declaration_made_article_16_9)
               (and violation_article_16_7_exception
                    (not (<= shareholding_percent_change 0.0))))))
  (= violation_article_16_1_2_9 a!1)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反第16條相關申報、核准、持股限制及處分規定時處罰
(assert (let ((a!1 (or (not approval_qualification_and_documents)
               (and (not holding_without_qualification_no_increase)
                    (not (<= shareholding_percent_change 0.0)))
               (not approval_deemed_after_15_business_days)
               (not pre_2008_5_to_10_percent_declaration)
               (not shareholding_over_5_percent_declaration_after_establishment)
               (not shareholding_over_10_percent_declaration_at_conversion)
               violation_article_16_1_2_9
               (not disposition_within_deadline)
               (not shareholding_change_over_1_percent_declaration)
               (not shareholding_over_10_percent_pledge_restriction)
               (not shareholding_over_thresholds_prior_approval))))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= shareholding_percent_after_establishment 6.0))
(assert (= days_since_shareholding_over_5_percent 15))
(assert (= declaration_made_article_16_2 false))
(assert (= declaration_made false))
(assert (= penalty true))
(assert (= approval_granted false))
(assert (= approval_qualification_and_documents true))
(assert (= shareholding_percent 6.0))
(assert (= shareholding_over_5_percent_declaration_after_establishment false))
(assert (= violation_article_16_1_2_9 true))
(assert (= disposition_deadline 7))
(assert (= days_to_dispose_exceeding_shares 7))
(assert (= disposition_within_deadline true))
(assert (= shareholding_exceeding_without_declaration_or_approval true))
(assert (= business_days_since_application 0))
(assert (= approval_deemed_after_15_business_days false))
(assert (= declaration_made_article_16_1 true))
(assert (= declaration_made_article_16_9 true))
(assert (= shareholding_change_percent 0.0))
(assert (= declaration_made_for_change true))
(assert (= shareholding_change_over_1_percent_declaration true))
(assert (= approval_10_percent 0))
(assert (= approval_25_percent 0))
(assert (= approval_50_percent 0))
(assert (= approval_rejected false))
(assert (= meets_qualification_conditions true))
(assert (= holding_without_qualification_no_increase true))
(assert (= is_before_conversion false))
(assert (= original_pledge_valid false))
(assert (= pledge_to_subsidiary false))
(assert (= shareholding_over_10_percent_declaration_at_conversion true))
(assert (= declaration_made_at_conversion true))
(assert (= shareholding_percent_at_conversion 0))
(assert (= shareholding_percent_before_2008 0))
(assert (= days_since_2008_revision 0))
(assert (= pre_2008_5_to_10_percent_declaration true))
(assert (= third_party_trust_included_in_related_persons true))
(assert (= related_persons_inclusive true))
(assert (= violation_article_16_7_exception false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 43
; Total facts: 39
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

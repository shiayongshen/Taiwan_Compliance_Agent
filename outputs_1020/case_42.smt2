; SMT2 file generated from compliance case automatic
; Case ID: case_42
; Generated at: 2025-10-19T06:22:40.040282
;
; This file can be executed with Z3:
;   z3 case_42.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const approval_deemed_if_no_objection Bool)
(declare-const approval_status Bool)
(declare-const authority_objection Bool)
(declare-const original_pledge_valid Bool)
(declare-const penalty Bool)
(declare-const penalty_order_complied Bool)
(declare-const penalty_order_issued Bool)
(declare-const pledge_obtained_before_conversion Bool)
(declare-const qualified_condition_met Bool)
(declare-const share_pledge_prohibition Bool)
(declare-const shareholding_accumulated_change_percentage Real)
(declare-const shareholding_approval_obtained Bool)
(declare-const shareholding_approval_required Bool)
(declare-const shareholding_declaration_conversion Bool)
(declare-const shareholding_declaration_post_establishment Bool)
(declare-const shareholding_declaration_post_establishment_accumulated_change Real)
(declare-const shareholding_declaration_pre_2008 Bool)
(declare-const shareholding_declaration_required Bool)
(declare-const shareholding_declared Bool)
(declare-const shareholding_increase_prohibited_if_not_qualified Bool)
(declare-const shareholding_no_increase_if_not_qualified Bool)
(declare-const shareholding_percentage Real)
(declare-const shareholding_percentage_change Real)
(declare-const shareholding_percentage_conversion Real)
(declare-const shareholding_percentage_post_establishment Real)
(declare-const shareholding_percentage_pre_2008 Real)
(declare-const shareholding_pledge_exception Bool)
(declare-const shareholding_pledge_prohibited Bool)
(declare-const shareholding_trust_included Bool)
(declare-const stock_pledged_to_subsidiary Bool)
(declare-const trust_or_agreement_included Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:shareholding_declaration_conversion] 金融機構轉換為金融控股公司時，同一人或同一關係人持股超過10%應申報
(assert (not (= (<= shareholding_percentage_conversion 10.0)
        shareholding_declaration_conversion)))

; [fhc:shareholding_declaration_post_establishment] 金融控股公司設立後，同一人或同一關係人持股超過5%應10日內申報
(assert (not (= (<= shareholding_percentage_post_establishment 5.0)
        shareholding_declaration_post_establishment)))

; [fhc:shareholding_declaration_post_establishment_accumulated_change] 持股超過5%後累積增減逾1%應申報
(assert (= shareholding_declaration_post_establishment_accumulated_change
   (ite (<= shareholding_accumulated_change_percentage 1.0) 0.0 1.0)))

; [fhc:shareholding_approval_required] 金融控股公司設立後，同一人或同一關係人持股超過10%、25%、50%應事先申請核准
(assert (= shareholding_approval_required
   (or (not (<= shareholding_percentage_post_establishment 50.0))
       (not (<= shareholding_percentage_post_establishment 25.0))
       (not (<= shareholding_percentage_post_establishment 10.0)))))

; [fhc:shareholding_trust_included] 第三人以信託、委任等方式持股應併入同一關係人範圍
(assert (= shareholding_trust_included trust_or_agreement_included))

; [fhc:share_pledge_prohibition] 同一人或同一關係人持股超過10%不得將股票設定質權予子公司，例外於轉換前原質權存續期限內不適用
(assert (= share_pledge_prohibition
   (or (and pledge_obtained_before_conversion original_pledge_valid)
       (<= shareholding_percentage 10.0)
       (not stock_pledged_to_subsidiary))))

; [fhc:shareholding_no_increase_if_not_qualified] 同一人或同一關係人不符適格條件得繼續持股但不得增加持股
(assert (= shareholding_no_increase_if_not_qualified
   (or qualified_condition_met (<= shareholding_percentage_change 0.0))))

; [fhc:approval_deemed_if_no_objection] 主管機關15營業日內未反對視為核准
(assert (= approval_deemed_if_no_objection (or authority_objection approval_status)))

; [fhc:shareholding_declaration_pre_2008] 2008年前修正施行前，持股超過5%未超過10%者，應於6個月內申報
(assert (= shareholding_declaration_pre_2008
   (and (not (<= shareholding_percentage_pre_2008 5.0))
        (>= 10.0 shareholding_percentage_pre_2008))))

; [fhc:shareholding_declaration_required] 應依規定申報持股
(assert (= shareholding_declaration_required
   (or (= shareholding_declaration_post_establishment_accumulated_change 1.0)
       shareholding_declaration_conversion
       shareholding_declaration_pre_2008
       shareholding_declaration_post_establishment)))

; [fhc:shareholding_approval_obtained] 持股超過10%、25%、50%已取得主管機關核准
(assert (= shareholding_approval_obtained
   (or (not shareholding_approval_required) approval_status)))

; [fhc:shareholding_pledge_prohibited] 持股超過10%不得設定質權予子公司
(assert (= shareholding_pledge_prohibited
   (or (<= shareholding_percentage 10.0) (not stock_pledged_to_subsidiary))))

; [fhc:shareholding_pledge_exception] 轉換前取得股票之質權在原質權存續期限內不適用質權禁止
(assert (= shareholding_pledge_exception
   (and pledge_obtained_before_conversion original_pledge_valid)))

; [fhc:shareholding_increase_prohibited_if_not_qualified] 不符適格條件者不得增加持股
(assert (= shareholding_increase_prohibited_if_not_qualified
   (or qualified_condition_met (<= shareholding_percentage_change 0.0))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反申報、核准、持股增加及質權設定規定時處罰
(assert (let ((a!1 (or (and shareholding_declaration_required
                    (not shareholding_declared))
               (and (not (<= shareholding_percentage 10.0))
                    stock_pledged_to_subsidiary
                    (not (and pledge_obtained_before_conversion
                              original_pledge_valid)))
               (and penalty_order_issued (not penalty_order_complied))
               (and shareholding_approval_required (not approval_status))
               (and (not qualified_condition_met)
                    (not (<= shareholding_percentage_change 0.0))))))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= shareholding_percentage_post_establishment (/ 923.0 100.0)))
(assert (= shareholding_declaration_post_establishment true))
(assert (= shareholding_declared false))
(assert (= penalty_order_issued true))
(assert (= penalty_order_complied false))
(assert (= penalty true))
(assert (= approval_status false))
(assert (= qualified_condition_met false))
(assert (= shareholding_percentage_change 0.0))
(assert (= stock_pledged_to_subsidiary false))
(assert (= pledge_obtained_before_conversion false))
(assert (= original_pledge_valid false))
(assert (= shareholding_approval_required true))
(assert (= shareholding_approval_obtained false))
(assert (= shareholding_accumulated_change_percentage 0.0))
(assert (= shareholding_declaration_post_establishment_accumulated_change 0.0))
(assert (= shareholding_declaration_conversion false))
(assert (= shareholding_percentage_conversion 0.0))
(assert (= shareholding_declaration_pre_2008 false))
(assert (= shareholding_percentage_pre_2008 0.0))
(assert (= shareholding_no_increase_if_not_qualified true))
(assert (= shareholding_increase_prohibited_if_not_qualified true))
(assert (= shareholding_pledge_prohibited true))
(assert (= shareholding_pledge_exception false))
(assert (= shareholding_trust_included false))
(assert (= trust_or_agreement_included false))
(assert (= authority_objection false))
(assert (= approval_deemed_if_no_objection true))
(assert (= share_pledge_prohibition false))
(assert (= shareholding_declaration_required false))
(assert (= shareholding_percentage 0.0))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 16
; Total variables: 31
; Total facts: 31
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

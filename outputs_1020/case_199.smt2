; SMT2 file generated from compliance case automatic
; Case ID: case_199
; Generated at: 2025-10-19T10:16:56.899336
;
; This file can be executed with Z3:
;   z3 case_199.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accelerated_deterioration_flag Bool)
(declare-const accelerated_deterioration_or_no_improvement Bool)
(declare-const appointed_director_ratio Real)
(declare-const business_scope_restricted Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_adequate Bool)
(declare-const capital_increase_ordered Bool)
(declare-const capital_insufficient Bool)
(declare-const capital_level Int)
(declare-const capital_level_lower_priority Bool)
(declare-const capital_severely_insufficient Bool)
(declare-const capital_significantly_insufficient Bool)
(declare-const capital_usage_limit_compliance Bool)
(declare-const capital_usage_restricted Bool)
(declare-const deposit_limit_approved Bool)
(declare-const deposit_per_financial_institution_ratio Real)
(declare-const derivative_compliance_flag Bool)
(declare-const derivative_transaction_compliance Bool)
(declare-const director_or_supervisor_dismissed_or_suspended Bool)
(declare-const financial_business_deterioration_flag Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_approved_flag Bool)
(declare-const improvement_plan_completed Bool)
(declare-const improvement_plan_overdue Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const independent_director_exists Bool)
(declare-const insurance_product_sales_restricted Bool)
(declare-const insurance_staff_appointed_as_manager Bool)
(declare-const internal_control_and_audit_ok Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const investment_compliance_flag Bool)
(declare-const investment_in_insurance_related_business_compliance Bool)
(declare-const manager_or_staff_dismissed Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const other_necessary_measures_taken Bool)
(declare-const penalty Bool)
(declare-const project_investment_approval_or_post_check Bool)
(declare-const project_investment_approved Bool)
(declare-const project_investment_post_check Bool)
(declare-const public_welfare_investment_compliance Bool)
(declare-const regulatory_action_required Bool)
(declare-const statutory_meeting_resolution_revoked Bool)
(declare-const supervision_restriction_compliance Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 保險業資本等級分類（1=資本適足, 2=資本不足, 3=資本顯著不足, 4=資本嚴重不足, 0=未分類）
(assert (let ((a!1 (ite (and (<= 150.0 capital_adequacy_ratio)
                     (not (<= 200.0 capital_adequacy_ratio)))
                2
                (ite (<= 200.0 capital_adequacy_ratio) 1 0))))
(let ((a!2 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio))
                     (<= 0.0 net_worth_ratio)
                     (not (<= 2.0 net_worth_ratio)))
                3
                a!1)))
(let ((a!3 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:capital_level_lower_priority] 資本等級以較低等級為準（若同時符合多等級）
(assert (let ((a!1 (ite (= 3 capital_level)
                3
                (ite (= 2 capital_level) 2 (ite (= 1 capital_level) 1 0)))))
  (= (ite capital_level_lower_priority 1 0) (ite (= 4 capital_level) 4 a!1))))

; [insurance:capital_severely_insufficient] 資本嚴重不足等級判定
(assert (= capital_severely_insufficient (= 4 capital_level)))

; [insurance:capital_significantly_insufficient] 資本顯著不足等級判定
(assert (= capital_significantly_insufficient (= 3 capital_level)))

; [insurance:capital_insufficient] 資本不足等級判定
(assert (= capital_insufficient (= 2 capital_level)))

; [insurance:capital_adequate] 資本適足等級判定
(assert (= capital_adequate (= 1 capital_level)))

; [insurance:improvement_plan_completed] 增資、財務或業務改善計畫或合併已於主管機關規定期限內完成
(assert (= improvement_plan_completed improvement_plan_submitted))

; [insurance:improvement_plan_overdue] 資本嚴重不足且未於期限完成增資、財務或業務改善計畫或合併
(assert (= improvement_plan_overdue
   (and capital_severely_insufficient (not improvement_plan_completed))))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化，不能支付債務或無法履行契約責任或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration financial_business_deterioration_flag))

; [insurance:improvement_plan_approved] 主管機關核定財務或業務改善計畫
(assert (= improvement_plan_approved improvement_plan_approved_flag))

; [insurance:accelerated_deterioration_or_no_improvement] 損益、淨值加速惡化或經輔導仍未改善
(assert (= accelerated_deterioration_or_no_improvement accelerated_deterioration_flag))

; [insurance:regulatory_action_required] 應為監管、接管、勒令停業清理或命令解散之處分
(assert (= regulatory_action_required
   (or improvement_plan_overdue
       (and financial_or_business_deterioration
            improvement_plan_approved
            accelerated_deterioration_or_no_improvement))))

; [insurance:supervision_restriction_compliance] 保險業未違反主管機關限制營業或資金運用範圍等規定
(assert (= supervision_restriction_compliance
   (and (not business_scope_restricted)
        (not capital_usage_restricted)
        (not insurance_product_sales_restricted)
        (not capital_increase_ordered)
        (not manager_or_staff_dismissed)
        (not statutory_meeting_resolution_revoked)
        (not director_or_supervisor_dismissed_or_suspended)
        other_necessary_measures_taken)))

; [insurance:internal_control_and_audit_ok] 建立並執行內部控制及稽核制度
(assert (= internal_control_and_audit_ok
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_ok] 建立並執行內部處理制度及程序
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [insurance:capital_usage_limit_compliance] 保險業資金運用符合主管機關規定之限額及範圍
(assert (= capital_usage_limit_compliance
   (and (>= 10.0 deposit_per_financial_institution_ratio)
        deposit_limit_approved)))

; [insurance:investment_in_insurance_related_business_compliance] 投資保險相關事業符合主管機關規定
(assert (= investment_in_insurance_related_business_compliance
   investment_compliance_flag))

; [insurance:derivative_transaction_compliance] 從事衍生性商品交易符合主管機關規定
(assert (= derivative_transaction_compliance derivative_compliance_flag))

; [insurance:project_investment_approval_or_post_check] 專案運用及公共及社會福利事業投資申請核准或備供事後查核
(assert (= project_investment_approval_or_post_check
   (or project_investment_approved project_investment_post_check)))

; [insurance:public_welfare_investment_compliance] 公共及社會福利事業投資符合主管機關規定
(assert (= public_welfare_investment_compliance
   (and (>= (/ 6666667.0 10000000.0) appointed_director_ratio)
        (<= 0.0 appointed_director_ratio)
        independent_director_exists
        (not insurance_staff_appointed_as_manager))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反資本嚴重不足未完成改善計畫、財務或業務惡化未改善、未建立或執行內部控制及稽核制度、未建立或執行內部處理制度或程序、資金運用違反限額或規定時處罰
(assert (= penalty
   (or (not capital_usage_limit_compliance)
       (and financial_or_business_deterioration
            improvement_plan_approved
            accelerated_deterioration_or_no_improvement)
       (and capital_severely_insufficient (not improvement_plan_completed))
       (not internal_control_and_audit_ok)
       (not internal_handling_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 50.0))
(assert (= net_worth_ratio 3.0))
(assert (= improvement_plan_submitted true))
(assert (= improvement_plan_completed false))
(assert (= business_scope_restricted false))
(assert (= capital_usage_restricted false))
(assert (= insurance_product_sales_restricted false))
(assert (= capital_increase_ordered false))
(assert (= manager_or_staff_dismissed false))
(assert (= statutory_meeting_resolution_revoked false))
(assert (= director_or_supervisor_dismissed_or_suspended false))
(assert (= other_necessary_measures_taken true))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= deposit_per_financial_institution_ratio 5.0))
(assert (= deposit_limit_approved true))
(assert (= investment_compliance_flag true))
(assert (= derivative_compliance_flag true))
(assert (= project_investment_approved false))
(assert (= project_investment_post_check false))
(assert (= appointed_director_ratio (/ 1.0 2.0)))
(assert (= independent_director_exists true))
(assert (= insurance_staff_appointed_as_manager false))
(assert (= financial_business_deterioration_flag false))
(assert (= financial_or_business_deterioration false))
(assert (= improvement_plan_approved_flag false))
(assert (= improvement_plan_approved false))
(assert (= accelerated_deterioration_flag false))
(assert (= accelerated_deterioration_or_no_improvement false))
(assert (= capital_usage_limit_compliance true))
(assert (= investment_in_insurance_related_business_compliance true))
(assert (= derivative_transaction_compliance true))
(assert (= project_investment_approval_or_post_check false))
(assert (= public_welfare_investment_compliance true))
(assert (= supervision_restriction_compliance true))
(assert (= penalty true))
(assert (= capital_adequate false))
(assert (= capital_insufficient false))
(assert (= capital_level 0))
(assert (= capital_level_lower_priority false))
(assert (= capital_severely_insufficient false))
(assert (= capital_significantly_insufficient false))
(assert (= improvement_plan_overdue false))
(assert (= internal_control_and_audit_ok false))
(assert (= internal_handling_ok false))
(assert (= regulatory_action_required false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 22
; Total variables: 49
; Total facts: 49
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

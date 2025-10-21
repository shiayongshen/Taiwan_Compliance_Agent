; SMT2 file generated from compliance case automatic
; Case ID: case_352
; Generated at: 2025-10-21T22:21:58.081960
;
; This file can be executed with Z3:
;   z3 case_352.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const asset_insufficient_improved Bool)
(declare-const asset_insufficient_improvement_ordered Bool)
(declare-const asset_insufficient_to_cover_liabilities Bool)
(declare-const business_license_duration_ok Bool)
(declare-const business_license_duration_ok_trust Bool)
(declare-const business_operation_duration_years Int)
(declare-const financial_report_approved_by_board Bool)
(declare-const financial_report_audited_by_accountant Bool)
(declare-const financial_report_compliance Bool)
(declare-const financial_report_comply_gaap Bool)
(declare-const financial_report_comply_laws Bool)
(declare-const financial_report_legal_compliance Bool)
(declare-const financial_report_signed_by_executives Bool)
(declare-const financial_report_submission_days Int)
(declare-const financial_report_submitted Bool)
(declare-const financial_report_submitted_on_time Bool)
(declare-const improvement_ordered Bool)
(declare-const improvement_plan_compliance Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_required Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const improvement_plan_submitted_and_executed Bool)
(declare-const legal_compliance Bool)
(declare-const liabilities Real)
(declare-const net_asset_value_below_half_par Bool)
(declare-const net_asset_value_below_par Bool)
(declare-const net_asset_value_per_share Real)
(declare-const net_assets Real)
(declare-const par_value_per_share Real)
(declare-const penalty Bool)
(declare-const restriction_applied Bool)
(declare-const restriction_level Int)
(declare-const restriction_measures_executed Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:financial_report_compliance] 證券投資信託及顧問事業財務、業務報告及相關資料符合法令規定
(assert (= financial_report_compliance
   (and financial_report_submitted financial_report_legal_compliance)))

; [securities:net_asset_value_below_par] 每股淨值低於面額
(assert (not (= (<= par_value_per_share net_asset_value_per_share)
        net_asset_value_below_par)))

; [securities:improvement_plan_required] 每股淨值低於面額且需於一年內改善
(assert (let ((a!1 (and net_asset_value_below_par
                (not (<= (to_real business_operation_duration_years) 1.0)))))
  (= improvement_plan_required a!1)))

; [securities:improvement_plan_submitted_and_executed] 改善計畫已提交且執行
(assert (= improvement_plan_submitted_and_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [securities:improvement_plan_compliance] 每股淨值低於面額者已於一年內改善
(assert (= improvement_plan_compliance
   (or (not improvement_plan_required) improvement_plan_submitted_and_executed)))

; [securities:net_asset_value_below_half_par] 每股淨值低於面額二分之一
(assert (not (= (<= (* (/ 1.0 2.0) par_value_per_share) net_asset_value_per_share)
        net_asset_value_below_half_par)))

; [securities:restriction_level] 證券投資信託事業每股淨值限制等級（1=無限制, 2=限制私募, 3=限制募集及私募）
(assert (let ((a!1 (ite (and (>= net_asset_value_per_share
                         (* (/ 1.0 2.0) par_value_per_share))
                     (not (<= par_value_per_share net_asset_value_per_share)))
                1
                (ite (<= (* (/ 1.0 2.0) par_value_per_share)
                         net_asset_value_per_share)
                     0
                     2))))
  (= restriction_level a!1)))

; [securities:restriction_applied] 限制措施已執行
(assert (= restriction_applied restriction_measures_executed))

; [securities:business_license_duration_ok] 營業執照已滿完整會計年度
(assert (= business_license_duration_ok
   (<= 1.0 (to_real business_operation_duration_years))))

; [securities:business_license_duration_ok_trust] 證券投資信託事業營業執照已滿二個完整會計年度
(assert (= business_license_duration_ok_trust
   (<= 2.0 (to_real business_operation_duration_years))))

; [securities:asset_insufficient_to_cover_liabilities] 資產不足抵償負債
(assert (not (= (<= liabilities net_assets) asset_insufficient_to_cover_liabilities)))

; [securities:asset_insufficient_improvement_ordered] 資產不足抵償負債且已被命令限期改善
(assert (= asset_insufficient_improvement_ordered
   (and asset_insufficient_to_cover_liabilities improvement_ordered)))

; [securities:asset_insufficient_improved] 資產不足抵償負債已改善
(assert (= asset_insufficient_improved
   (and (not asset_insufficient_to_cover_liabilities) improvement_ordered)))

; [securities:financial_report_submitted_on_time] 年度財務報告於三個月內公告並申報
(assert (= financial_report_submitted_on_time
   (and financial_report_approved_by_board
        financial_report_signed_by_executives
        financial_report_audited_by_accountant
        (>= 90 financial_report_submission_days))))

; [securities:legal_compliance] 財務報告依相關法令及一般公認會計原則編製
(assert (= legal_compliance
   (and financial_report_comply_laws financial_report_comply_gaap)))

; [securities:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反財務報告法令規定、未依規定改善或未執行限制措施時處罰
(assert (= penalty
   (or (not financial_report_compliance)
       (and business_license_duration_ok_trust
            net_asset_value_below_half_par
            (not restriction_applied))
       (not financial_report_submitted_on_time)
       (and improvement_plan_required
            (not improvement_plan_submitted_and_executed))
       (and asset_insufficient_improvement_ordered
            (not asset_insufficient_improved)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= net_asset_value_per_share 8.0))
(assert (= par_value_per_share 10.0))
(assert (= net_asset_value_below_par true))
(assert (= improvement_plan_required true))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= improvement_plan_submitted_and_executed false))
(assert (= business_operation_duration_years 2))
(assert (= restriction_measures_executed false))
(assert (= restriction_applied false))
(assert (= financial_report_submitted true))
(assert (= financial_report_legal_compliance true))
(assert (= financial_report_compliance true))
(assert (= financial_report_approved_by_board true))
(assert (= financial_report_signed_by_executives true))
(assert (= financial_report_audited_by_accountant true))
(assert (= financial_report_submission_days 30))
(assert (= legal_compliance true))
(assert (= business_license_duration_ok true))
(assert (= business_license_duration_ok_trust true))
(assert (= asset_insufficient_to_cover_liabilities false))
(assert (= asset_insufficient_improvement_ordered false))
(assert (= asset_insufficient_improved false))
(assert (= improvement_ordered false))
(assert (= net_asset_value_below_half_par false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 17
; Total variables: 33
; Total facts: 26
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

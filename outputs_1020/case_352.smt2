; SMT2 file generated from compliance case automatic
; Case ID: case_352
; Generated at: 2025-10-19T13:50:36.025335
;
; This file can be executed with Z3:
;   z3 case_352.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const asset_insufficient_to_cover_liabilities Bool)
(declare-const business_license_duration_ok Bool)
(declare-const business_license_duration_two_years Bool)
(declare-const business_license_revoked Bool)
(declare-const business_operation_duration_years Int)
(declare-const corporation_fault Bool)
(declare-const financial_report_accurate Bool)
(declare-const financial_report_annual_audited Bool)
(declare-const financial_report_annual_board_approved Bool)
(declare-const financial_report_annual_submission_days_after_year_end Int)
(declare-const financial_report_annual_submitted_on_time Bool)
(declare-const financial_report_annual_supervisor_approved Bool)
(declare-const financial_report_audited Bool)
(declare-const financial_report_compliance Bool)
(declare-const financial_report_submitted Bool)
(declare-const improvement_order_issued Bool)
(declare-const improvement_plan_compliance Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_required Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const improvement_plan_submitted_and_executed Bool)
(declare-const net_asset_value_below_half_par Bool)
(declare-const net_asset_value_below_par Bool)
(declare-const net_asset_value_per_share Real)
(declare-const par_value_per_share Real)
(declare-const penalty Bool)
(declare-const regulator_order_improvement Bool)
(declare-const responsible_person_fault_imputed_to_corporation Bool)
(declare-const responsible_person_fault_intentional Bool)
(declare-const responsible_person_fault_negligent Bool)
(declare-const restriction_on_fund_raising Bool)
(declare-const restriction_on_private_fund_raising Bool)
(declare-const total_assets Real)
(declare-const total_liabilities Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:financial_report_compliance] 證券投資信託及顧問事業財務報告及相關資料符合法令規定
(assert (= financial_report_compliance
   (and financial_report_submitted
        financial_report_accurate
        financial_report_audited)))

; [securities:net_asset_value_below_par] 每股淨值低於面額
(assert (not (= (<= par_value_per_share net_asset_value_per_share)
        net_asset_value_below_par)))

; [securities:net_asset_value_below_half_par] 每股淨值低於面額二分之一
(assert (not (= (<= (* (/ 1.0 2.0) par_value_per_share) net_asset_value_per_share)
        net_asset_value_below_half_par)))

; [securities:improvement_plan_required] 每股淨值低於面額後應於一年內改善
(assert (= improvement_plan_required
   (and net_asset_value_below_par (<= 1 business_operation_duration_years))))

; [securities:improvement_plan_submitted_and_executed] 改善計畫已提交且執行
(assert (= improvement_plan_submitted_and_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [securities:improvement_plan_compliance] 每股淨值低於面額且未改善者限制證券投資分析活動
(assert (= improvement_plan_compliance
   (or (not improvement_plan_submitted_and_executed)
       (not (<= par_value_per_share net_asset_value_per_share)))))

; [securities:asset_insufficient_to_cover_liabilities] 資產不足抵償負債
(assert (not (= (<= total_liabilities total_assets)
        asset_insufficient_to_cover_liabilities)))

; [securities:improvement_order_issued] 本會命令限期改善
(assert (= improvement_order_issued regulator_order_improvement))

; [securities:business_license_duration] 營業執照已滿完整會計年度
(assert (= business_license_duration_ok (<= 1 business_operation_duration_years)))

; [securities:business_license_duration_two_years] 營業執照已滿兩個完整會計年度
(assert (= business_license_duration_two_years (<= 2 business_operation_duration_years)))

; [securities:restriction_on_fund_raising] 限制募集證券投資信託基金
(assert (let ((a!1 (and business_license_duration_two_years
                (not (<= (* (/ 1.0 2.0) par_value_per_share)
                         net_asset_value_per_share)))))
(let ((a!2 (or a!1
               (and business_license_duration_two_years
                    (>= net_asset_value_per_share
                        (* (/ 1.0 2.0) par_value_per_share))
                    (not (<= par_value_per_share net_asset_value_per_share))))))
  (= restriction_on_fund_raising a!2))))

; [securities:restriction_on_private_fund_raising] 限制私募證券投資信託基金
(assert (let ((a!1 (and business_license_duration_two_years
                (not (<= (* (/ 1.0 2.0) par_value_per_share)
                         net_asset_value_per_share)))))
(let ((a!2 (or (and business_license_duration_two_years
                    (>= net_asset_value_per_share
                        (* (/ 1.0 2.0) par_value_per_share))
                    (not improvement_plan_submitted_and_executed))
               a!1)))
  (= restriction_on_private_fund_raising a!2))))

; [securities:business_license_revoked] 屆期未改善且資產不足抵償負債者，本會得廢止營業許可
(assert (= business_license_revoked
   (and asset_insufficient_to_cover_liabilities
        improvement_order_issued
        (not improvement_plan_submitted_and_executed))))

; [securities:financial_report_annual_submitted_on_time] 年度財務報告於會計年度終了後三個月內公告並申報
(assert (= financial_report_annual_submitted_on_time
   (and financial_report_annual_audited
        financial_report_annual_board_approved
        financial_report_annual_supervisor_approved
        (>= 90 financial_report_annual_submission_days_after_year_end))))

; [securities:responsible_person_fault_imputed_to_corporation] 法人負責人、業務人員或受僱人故意過失視為法人故意過失
(assert (= responsible_person_fault_imputed_to_corporation
   (or corporation_fault
       (not (or responsible_person_fault_intentional
                responsible_person_fault_negligent)))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反財務報告規定、未依限改善或未執行改善計畫時處罰
(assert (= penalty
   (or (not financial_report_compliance)
       (and improvement_plan_required
            (not improvement_plan_submitted_and_executed))
       (and asset_insufficient_to_cover_liabilities
            improvement_order_issued
            (not improvement_plan_submitted_and_executed)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= net_asset_value_per_share (/ 9.0 10.0)))
(assert (= par_value_per_share 1.0))
(assert (= net_asset_value_below_par true))
(assert (= net_asset_value_below_half_par false))
(assert (= business_operation_duration_years 2))
(assert (= business_license_duration_ok true))
(assert (= business_license_duration_two_years true))
(assert (= improvement_plan_required true))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= regulator_order_improvement true))
(assert (= improvement_order_issued true))
(assert (= responsible_person_fault_intentional true))
(assert (= responsible_person_fault_negligent false))
(assert (= corporation_fault true))
(assert (= financial_report_submitted true))
(assert (= financial_report_accurate true))
(assert (= financial_report_audited true))
(assert (= financial_report_compliance true))
(assert (= total_assets 1000000.0))
(assert (= total_liabilities 900000.0))
(assert (= asset_insufficient_to_cover_liabilities false))
(assert (= restriction_on_fund_raising false))
(assert (= restriction_on_private_fund_raising true))
(assert (= business_license_revoked false))
(assert (= penalty true))
(assert (= responsible_person_fault_imputed_to_corporation true))
(assert (= improvement_plan_compliance true))
(assert (= improvement_plan_submitted_and_executed false))
(assert (= financial_report_annual_audited true))
(assert (= financial_report_annual_board_approved true))
(assert (= financial_report_annual_supervisor_approved true))
(assert (= financial_report_annual_submission_days_after_year_end 30))
(assert (= financial_report_annual_submitted_on_time true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 17
; Total variables: 34
; Total facts: 34
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

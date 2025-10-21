; SMT2 file generated from compliance case automatic
; Case ID: case_62
; Generated at: 2025-10-21T00:31:28.523801
;
; This file can be executed with Z3:
;   z3 case_62.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const IF Bool)
(declare-const audit_system_established Bool)
(declare-const audit_system_implemented Bool)
(declare-const bank_has_government_permission Bool)
(declare-const bank_operates_as_agent Bool)
(declare-const bank_operates_as_broker Bool)
(declare-const bank_single_insurance_business Bool)
(declare-const broker_duty_of_care_and_faithfulness Bool)
(declare-const broker_exercises_duty_of_care Bool)
(declare-const broker_exercises_faithfulness Bool)
(declare-const broker_must_provide_written_analysis_report Bool)
(declare-const compensation_standard_clearly_informed Bool)
(declare-const fixed_business_place_and_account_book Bool)
(declare-const has_agent_license Bool)
(declare-const has_broker_license Bool)
(declare-const has_certain_scale Bool)
(declare-const has_dedicated_account_book Bool)
(declare-const has_deposit_guarantee Bool)
(declare-const has_fixed_business_place Bool)
(declare-const has_government_license Bool)
(declare-const has_notary_license Bool)
(declare-const has_practice_certificate Bool)
(declare-const has_relevant_insurance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_implemented Bool)
(declare-const internal_control_required Bool)
(declare-const is_publicly_listed Bool)
(declare-const license_and_insurance_compliance Bool)
(declare-const penalty Bool)
(declare-const single_license_only Bool)
(declare-const solicitation_handling_system_established Bool)
(declare-const solicitation_handling_system_implemented Bool)
(declare-const within_government_specified_scope Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:fixed_business_place_and_account_book] 保險代理人、經紀人、公證人應有固定業務處所並專設帳簿記載業務收支
(assert (= fixed_business_place_and_account_book
   (and has_fixed_business_place has_dedicated_account_book)))

; [insurance:single_license_only] 兼有保險代理人、經紀人、公證人資格者僅得擇一申領執業證照
(assert (= single_license_only
   (>= 1
       (+ (ite has_agent_license 1 0)
          (ite has_broker_license 1 0)
          (ite has_notary_license 1 0)))))

; [insurance:internal_control_required] 公開發行或具一定規模之保險代理人公司、經紀人公司應建立內部控制、稽核制度與招攬處理制度及程序
(assert (= internal_control_required
   (or (not (or has_certain_scale is_publicly_listed))
       (and internal_control_established
            audit_system_established
            solicitation_handling_system_established))))

; [insurance:internal_control_executed] 公開發行或具一定規模之保險代理人公司、經紀人公司應確實執行內部控制、稽核制度與招攬處理制度及程序
(assert (= internal_control_executed
   (or (not (or has_certain_scale is_publicly_listed))
       (and internal_control_implemented
            audit_system_implemented
            solicitation_handling_system_implemented))))

; [insurance:license_and_insurance_compliance] 保險代理人、經紀人、公證人應經主管機關許可，繳存保證金並投保相關保險，領有執業證照後始得經營或執行業務
(assert (= license_and_insurance_compliance
   (and has_government_license
        has_deposit_guarantee
        has_relevant_insurance
        has_practice_certificate)))

; [insurance:bank_single_insurance_business] 銀行得經主管機關許可擇一兼營保險代理人或保險經紀人業務，並應分別準用相關規定
(assert (= bank_single_insurance_business
   (or (not bank_has_government_permission)
       bank_operates_as_agent
       bank_operates_as_broker)))

; [insurance:broker_duty_of_care_and_faithfulness] 保險經紀人應以善良管理人注意義務為被保險人洽訂保險契約並負忠實義務
(assert (= broker_duty_of_care_and_faithfulness
   (and broker_exercises_duty_of_care broker_exercises_faithfulness)))

; [insurance:broker_must_provide_written_analysis_report] 保險經紀人於主管機關指定範圍內洽訂保險契約前應主動提供書面分析報告並明確告知報酬收取標準
(assert (= broker_must_provide_written_analysis_report
   (or (not within_government_specified_scope)
       (and written_analysis_report_provided
            compensation_standard_clearly_informed))))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:penalty_conditions] 處罰條件：違反內部控制、稽核制度、招攬處理制度或程序未建立或未確實執行時處罰
(assert (let ((a!1 (or (not audit_system_established)
               (not internal_control_implemented)
               (not internal_control_established)
               (not audit_system_implemented)
               (not solicitation_handling_system_implemented)
               (not solicitation_handling_system_established))))
  (= penalty (or (and is_publicly_listed a!1) (and has_certain_scale a!1)))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= has_fixed_business_place true))
(assert (= has_dedicated_account_book true))
(assert (= fixed_business_place_and_account_book true))
(assert (= has_agent_license true))
(assert (= has_broker_license false))
(assert (= has_notary_license false))
(assert (= single_license_only true))
(assert (= has_government_license true))
(assert (= has_deposit_guarantee true))
(assert (= has_relevant_insurance true))
(assert (= has_practice_certificate true))
(assert (= is_publicly_listed false))
(assert (= has_certain_scale true))
(assert (= internal_control_established false))
(assert (= audit_system_established false))
(assert (= solicitation_handling_system_established false))
(assert (= internal_control_implemented false))
(assert (= audit_system_implemented false))
(assert (= solicitation_handling_system_implemented false))
(assert (= internal_control_required true))
(assert (= internal_control_executed false))
(assert (= license_and_insurance_compliance true))
(assert (= bank_has_government_permission true))
(assert (= bank_operates_as_agent true))
(assert (= bank_operates_as_broker false))
(assert (= bank_single_insurance_business true))
(assert (= broker_exercises_duty_of_care false))
(assert (= broker_exercises_faithfulness false))
(assert (= broker_duty_of_care_and_faithfulness false))
(assert (= within_government_specified_scope false))
(assert (= written_analysis_report_provided false))
(assert (= broker_must_provide_written_analysis_report true))
(assert (= compensation_standard_clearly_informed false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 10
; Total variables: 35
; Total facts: 34
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

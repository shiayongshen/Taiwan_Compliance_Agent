; SMT2 file generated from compliance case automatic
; Case ID: case_82
; Generated at: 2025-10-19T07:28:41.920241
;
; This file can be executed with Z3:
;   z3 case_82.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const annual_revenue Real)
(declare-const audit_committee_approval Bool)
(declare-const audit_committee_approval_count Int)
(declare-const audit_committee_exists Bool)
(declare-const audit_committee_management_included Bool)
(declare-const audit_committee_member_count Int)
(declare-const audit_committee_override Bool)
(declare-const audit_system_established Bool)
(declare-const audit_system_executed_flag Bool)
(declare-const board_approval_count Int)
(declare-const board_approval_internal_control Bool)
(declare-const board_approved_internal_control Bool)
(declare-const board_member_count Int)
(declare-const board_opposition_exists Bool)
(declare-const board_opposition_recorded Bool)
(declare-const board_resolution_passed Bool)
(declare-const board_resolution_recorded Bool)
(declare-const control_activities_and_segregation_of_duties Bool)
(declare-const control_activities_established Bool)
(declare-const control_environment_established Bool)
(declare-const dedicated_account_book Bool)
(declare-const fixed_business_location Bool)
(declare-const has_dedicated_account_book Bool)
(declare-const has_fixed_business_location Bool)
(declare-const has_single_license_only Bool)
(declare-const information_and_communication Bool)
(declare-const information_and_communication_established Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_compliance_overall Bool)
(declare-const internal_control_defined_by_business_nature_and_scale Bool)
(declare-const internal_control_design_and_review Bool)
(declare-const internal_control_elements_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_executed_flag Bool)
(declare-const internal_control_includes_audit_committee_management Bool)
(declare-const internal_control_principles_compliance Bool)
(declare-const internal_control_required Bool)
(declare-const internal_control_reviewed_and_revised Bool)
(declare-const internal_control_violation Bool)
(declare-const is_publicly_listed Bool)
(declare-const management_supervision_and_control_culture Bool)
(declare-const monitoring_activities_established Bool)
(declare-const monitoring_and_correction_of_deficiencies Bool)
(declare-const opposition_recorded_and_sent Bool)
(declare-const penalty Bool)
(declare-const risk_assessment_established Bool)
(declare-const risk_identification_and_assessment Bool)
(declare-const single_license_only Bool)
(declare-const solicitation_handling_system_established Bool)
(declare-const solicitation_handling_system_executed_flag Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:fixed_business_location] 保險代理人、經紀人、公證人應有固定業務處所
(assert (= fixed_business_location has_fixed_business_location))

; [insurance:dedicated_account_book] 保險代理人、經紀人、公證人應專設帳簿記載業務收支
(assert (= dedicated_account_book has_dedicated_account_book))

; [insurance:single_license_only] 兼有保險代理人、經紀人、公證人資格者僅得擇一申領執業證照
(assert (= single_license_only has_single_license_only))

; [insurance:internal_control_required] 公開發行或具一定規模之保險代理人公司、經紀人公司應建立內部控制、稽核制度與招攬處理制度及程序
(assert (let ((a!1 (or (not (or is_publicly_listed (<= 200000000.0 annual_revenue)))
               (and internal_control_established
                    audit_system_established
                    solicitation_handling_system_established))))
  (= internal_control_required a!1)))

; [insurance:internal_control_executed] 公開發行或具一定規模之保險代理人公司、經紀人公司應確實執行內部控制、稽核制度與招攬處理制度及程序
(assert (let ((a!1 (or (not (or is_publicly_listed (<= 200000000.0 annual_revenue)))
               (and internal_control_executed_flag
                    audit_system_executed_flag
                    solicitation_handling_system_executed_flag))))
  (= internal_control_executed a!1)))

; [insurance:internal_control_compliance] 符合內部控制、稽核制度與招攬處理制度及程序建立與執行要求
(assert (= internal_control_compliance
   (and internal_control_required
        internal_control_established
        audit_system_established
        solicitation_handling_system_established
        internal_control_executed_flag
        audit_system_executed_flag
        solicitation_handling_system_executed_flag)))

; [insurance:internal_control_violation] 違反內部控制、稽核制度或招攬處理制度建立或執行規定
(assert (= internal_control_violation
   (or (not audit_system_established)
       (not solicitation_handling_system_established)
       (not internal_control_established)
       (not internal_control_executed_flag)
       (not audit_system_executed_flag)
       (not solicitation_handling_system_executed_flag))))

; [insurance:board_approval_internal_control] 內部控制、稽核制度與招攬處理制度及程序應經董（理）事會通過
(assert (= board_approval_internal_control board_approved_internal_control))

; [insurance:board_opposition_recorded] 董（理）事會有保留或反對意見應記錄並送監察人或審計委員會
(assert (= board_opposition_recorded
   (or (not board_opposition_exists) opposition_recorded_and_sent)))

; [insurance:audit_committee_approval] 設置審計委員會者，內部控制、稽核制度與招攬處理制度及程序應經審計委員會半數以上同意並提董（理）事會決議
(assert (let ((a!1 (and (>= (to_real audit_committee_approval_count)
                    (* (/ 1.0 2.0) (to_real audit_committee_member_count)))
                board_resolution_passed)))
  (= audit_committee_approval (or (not audit_committee_exists) a!1))))

; [insurance:audit_committee_override] 未經審計委員會同意者，得由全體董（理）事三分之二以上同意行之，並記錄決議
(assert (let ((a!1 (and (>= (to_real board_approval_count)
                    (* (/ 2.0 3.0) (to_real board_member_count)))
                board_resolution_recorded)))
(let ((a!2 (or (not (and audit_committee_exists (not audit_committee_approval)))
               a!1)))
  (= audit_committee_override a!2))))

; [insurance:internal_control_design_and_review] 內部控制制度應依業務性質及規模訂定並適時檢討修訂
(assert (= internal_control_design_and_review
   (and internal_control_defined_by_business_nature_and_scale
        internal_control_reviewed_and_revised)))

; [insurance:audit_committee_management_included] 設置審計委員會者，內部控制制度應包括審計委員會議事運作管理
(assert (= audit_committee_management_included
   (or (not audit_committee_exists)
       internal_control_includes_audit_committee_management)))

; [insurance:internal_control_elements_compliance] 年度營業收入達5億元者，內部控制制度應包括五大組成要素
(assert (= internal_control_elements_compliance
   (or (not (<= 500000000.0 annual_revenue))
       (and control_environment_established
            risk_assessment_established
            control_activities_established
            information_and_communication_established
            monitoring_activities_established))))

; [insurance:internal_control_principles_compliance] 年度營業收入未達5億元者，內部控制制度應符合五項原則
(assert (= internal_control_principles_compliance
   (or (<= 500000000.0 annual_revenue)
       (and management_supervision_and_control_culture
            risk_identification_and_assessment
            control_activities_and_segregation_of_duties
            information_and_communication
            monitoring_and_correction_of_deficiencies))))

; [insurance:internal_control_compliance_overall] 已依規定辦理內部控制制度
(assert (let ((a!1 (or (and (<= 500000000.0 annual_revenue)
                    internal_control_elements_compliance)
               (and (not (<= 500000000.0 annual_revenue))
                    internal_control_principles_compliance))))
  (= internal_control_compliance_overall a!1)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反內部控制、稽核制度或招攬處理制度建立或執行規定時處罰
(assert (= penalty
   (or (not internal_control_established)
       (not internal_control_executed_flag)
       (not audit_system_executed_flag)
       (not audit_system_established)
       (not solicitation_handling_system_established)
       (not solicitation_handling_system_executed_flag))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= annual_revenue 1000000000.0))
(assert (= audit_committee_exists true))
(assert (= audit_committee_approval_count 3))
(assert (= audit_committee_member_count 5))
(assert (= audit_committee_management_included true))
(assert (= audit_committee_override false))
(assert (= audit_system_established false))
(assert (= audit_system_executed_flag false))
(assert (= board_approval_count 0))
(assert (= board_approval_internal_control false))
(assert (= board_approved_internal_control false))
(assert (= board_member_count 7))
(assert (= board_opposition_exists false))
(assert (= board_opposition_recorded true))
(assert (= board_resolution_passed false))
(assert (= board_resolution_recorded false))
(assert (= control_activities_and_segregation_of_duties false))
(assert (= control_activities_established false))
(assert (= control_environment_established false))
(assert (= dedicated_account_book false))
(assert (= fixed_business_location true))
(assert (= has_dedicated_account_book false))
(assert (= has_fixed_business_location true))
(assert (= has_single_license_only true))
(assert (= information_and_communication false))
(assert (= information_and_communication_established false))
(assert (= internal_control_compliance false))
(assert (= internal_control_compliance_overall false))
(assert (= internal_control_defined_by_business_nature_and_scale false))
(assert (= internal_control_design_and_review false))
(assert (= internal_control_elements_compliance false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_executed_flag false))
(assert (= internal_control_includes_audit_committee_management true))
(assert (= internal_control_principles_compliance false))
(assert (= internal_control_required true))
(assert (= internal_control_reviewed_and_revised false))
(assert (= internal_control_violation true))
(assert (= is_publicly_listed true))
(assert (= management_supervision_and_control_culture false))
(assert (= monitoring_activities_established false))
(assert (= monitoring_and_correction_of_deficiencies false))
(assert (= opposition_recorded_and_sent true))
(assert (= penalty true))
(assert (= risk_assessment_established false))
(assert (= risk_identification_and_assessment false))
(assert (= single_license_only true))
(assert (= solicitation_handling_system_established false))
(assert (= solicitation_handling_system_executed_flag false))
(assert (= audit_committee_approval false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 18
; Total variables: 51
; Total facts: 51
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

; SMT2 file generated from compliance case automatic
; Case ID: case_240
; Generated at: 2025-10-19T11:09:02.993090
;
; This file can be executed with Z3:
;   z3 case_240.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const appointed_directors_percentage Real)
(declare-const bank_subsidiary Bool)
(declare-const blood_relation_degree Int)
(declare-const capital_percentage Real)
(declare-const chairman_or_general_manager Bool)
(declare-const control_shareholding Bool)
(declare-const correction_flag Bool)
(declare-const correction_ordered Bool)
(declare-const dispose_shares_and_dissolve Bool)
(declare-const dispose_shares_deadline_days Int)
(declare-const dispose_subsidiary_shares Bool)
(declare-const dissolution_and_liquidation Bool)
(declare-const economic_ministry_notified Bool)
(declare-const established_under_fhc_law Bool)
(declare-const fhc_appointed_directors_percentage Real)
(declare-const fhc_min_board_members Int)
(declare-const fhc_shareholding_percentage Real)
(declare-const financial_holding_company Bool)
(declare-const financial_institution Bool)
(declare-const insurance_subsidiary Bool)
(declare-const internal_control_objectives_met Bool)
(declare-const is_bank Bool)
(declare-const is_chairman_or_general_manager Bool)
(declare-const is_insurance_company Bool)
(declare-const is_securities_firm Bool)
(declare-const law_and_regulation_compliance Bool)
(declare-const legal_compliance Bool)
(declare-const major_shareholder Bool)
(declare-const minor_children_shareholding_percentage Real)
(declare-const notify_economic_ministry Bool)
(declare-const operational_effectiveness_and_efficiency Bool)
(declare-const operational_targets_met Bool)
(declare-const other_necessary_measures Bool)
(declare-const penalty Bool)
(declare-const penalty_measures Bool)
(declare-const related_person_corporate Bool)
(declare-const related_person_natural Bool)
(declare-const remove_manager_or_staff Bool)
(declare-const remove_or_suspend_director_supervisor Bool)
(declare-const reporting_reliability_and_timeliness Bool)
(declare-const reporting_targets_met Bool)
(declare-const revoke_license Bool)
(declare-const revoke_meeting_resolution Bool)
(declare-const same_corporate Bool)
(declare-const same_person Bool)
(declare-const securities_subsidiary Bool)
(declare-const shareholding_percentage Real)
(declare-const shares_disposed Bool)
(declare-const spouse Bool)
(declare-const spouse_shareholding_percentage Real)
(declare-const subsidiary Bool)
(declare-const subsidiary_board_members Int)
(declare-const suspend_subsidiary_business Bool)
(declare-const violation_exists Bool)
(declare-const violation_flag Bool)
(declare-const voting_shares_percentage Real)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [fhc:violation_exists] 金融控股公司有違反法令、章程或有礙健全經營之虞
(assert (= violation_exists violation_flag))

; [fhc:correction_ordered] 主管機關已予以糾正並限期改善
(assert (= correction_ordered correction_flag))

; [fhc:penalty_measures] 主管機關依情節輕重採取處分措施
(assert (= penalty_measures
   (or suspend_subsidiary_business
       other_necessary_measures
       revoke_license
       remove_or_suspend_director_supervisor
       dispose_subsidiary_shares
       remove_manager_or_staff
       revoke_meeting_resolution)))

; [fhc:notify_economic_ministry] 解除董事、監察人職務時通知經濟部廢止登記
(assert (= notify_economic_ministry
   (or (not remove_or_suspend_director_supervisor) economic_ministry_notified)))

; [fhc:dispose_shares_and_dissolve] 廢止許可時限期處分股份及董事人數，未完成則解散清算
(assert (= dispose_shares_and_dissolve
   (or (not revoke_license)
       (and (>= 0 dispose_shares_deadline_days)
            shares_disposed
            (<= subsidiary_board_members fhc_min_board_members))
       dissolution_and_liquidation)))

; [fhc:internal_control_objectives_met] 內部控制達成營運效果及效率、報導可靠性及法令遵循目標
(assert (= internal_control_objectives_met
   (and operational_effectiveness_and_efficiency
        reporting_reliability_and_timeliness
        legal_compliance)))

; [fhc:operational_effectiveness_and_efficiency] 營運效果及效率目標達成（含獲利、績效及資產安全）
(assert (= operational_effectiveness_and_efficiency operational_targets_met))

; [fhc:reporting_reliability_and_timeliness] 報導具可靠性、及時性、透明性及符合相關規範
(assert (= reporting_reliability_and_timeliness reporting_targets_met))

; [fhc:legal_compliance] 遵循相關法令規章
(assert (= legal_compliance law_and_regulation_compliance))

; [fhc:control_shareholding_definition] 控制性持股定義
(assert (= control_shareholding
   (or (not (<= voting_shares_percentage 25.0))
       (not (<= appointed_directors_percentage 50.0))
       (not (<= capital_percentage 25.0)))))

; [fhc:financial_holding_company_definition] 金融控股公司定義
(assert (= financial_holding_company
   (and control_shareholding established_under_fhc_law)))

; [fhc:financial_institution_definition] 金融機構定義（銀行、保險公司、證券商）
(assert (= financial_institution (or is_bank is_insurance_company is_securities_firm)))

; [fhc:subsidiary_definition] 子公司定義
(assert (let ((a!1 (or bank_subsidiary
               insurance_subsidiary
               securities_subsidiary
               (and (not (<= fhc_shareholding_percentage 50.0))
                    (not (<= fhc_appointed_directors_percentage 50.0))))))
  (= subsidiary a!1)))

; [fhc:related_person_definition_natural] 同一自然人之關係人定義
(assert (= related_person_natural
   (or is_chairman_or_general_manager
       same_person
       (not (<= shareholding_percentage (/ 3333.0 100.0)))
       spouse
       (>= 2 blood_relation_degree))))

; [fhc:related_person_definition_corporate] 同一法人之關係人定義
(assert (= related_person_corporate
   (or chairman_or_general_manager
       is_chairman_or_general_manager
       (not (<= shareholding_percentage (/ 3333.0 100.0)))
       same_corporate
       (>= 2 blood_relation_degree))))

; [fhc:major_shareholder_definition] 大股東定義
(assert (= major_shareholder
   (or (not (<= shareholding_percentage 5.0))
       (not (<= minor_children_shareholding_percentage 5.0))
       (not (<= spouse_shareholding_percentage 5.0)))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：金融控股公司有違反法令、章程或有礙健全經營之虞且未依主管機關處分時處罰
(assert (= penalty (and violation_exists (not penalty_measures))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_flag true))
(assert (= violation_exists true))
(assert (= correction_flag false))
(assert (= correction_ordered false))
(assert (= remove_or_suspend_director_supervisor true))
(assert (= penalty_measures true))
(assert (= economic_ministry_notified false))
(assert (= revoke_meeting_resolution false))
(assert (= suspend_subsidiary_business false))
(assert (= remove_manager_or_staff false))
(assert (= dispose_subsidiary_shares false))
(assert (= revoke_license false))
(assert (= other_necessary_measures false))
(assert (= internal_control_objectives_met false))
(assert (= operational_targets_met false))
(assert (= operational_effectiveness_and_efficiency false))
(assert (= reporting_targets_met false))
(assert (= reporting_reliability_and_timeliness false))
(assert (= law_and_regulation_compliance false))
(assert (= legal_compliance false))
(assert (= appointed_directors_percentage 0.0))
(assert (= bank_subsidiary false))
(assert (= blood_relation_degree 1000))
(assert (= capital_percentage 0.0))
(assert (= chairman_or_general_manager false))
(assert (= control_shareholding false))
(assert (= dispose_shares_and_dissolve false))
(assert (= dispose_shares_deadline_days 7))
(assert (= dissolution_and_liquidation false))
(assert (= established_under_fhc_law true))
(assert (= fhc_appointed_directors_percentage 0.0))
(assert (= fhc_min_board_members 0))
(assert (= fhc_shareholding_percentage 0.0))
(assert (= financial_holding_company true))
(assert (= financial_institution false))
(assert (= insurance_subsidiary false))
(assert (= is_bank false))
(assert (= is_chairman_or_general_manager true))
(assert (= is_insurance_company false))
(assert (= is_securities_firm false))
(assert (= major_shareholder false))
(assert (= minor_children_shareholding_percentage 0.0))
(assert (= notify_economic_ministry true))
(assert (= penalty false))
(assert (= related_person_corporate false))
(assert (= related_person_natural true))
(assert (= same_corporate false))
(assert (= same_person true))
(assert (= securities_subsidiary false))
(assert (= shareholding_percentage 0.0))
(assert (= shares_disposed false))
(assert (= spouse false))
(assert (= spouse_shareholding_percentage 0.0))
(assert (= subsidiary true))
(assert (= subsidiary_board_members 0))
(assert (= voting_shares_percentage 0.0))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 18
; Total variables: 56
; Total facts: 56
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

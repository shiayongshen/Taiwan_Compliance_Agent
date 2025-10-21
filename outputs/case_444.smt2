; SMT2 file generated from compliance case automatic
; Case ID: case_444
; Generated at: 2025-10-21T10:00:26.070303
;
; This file can be executed with Z3:
;   z3 case_444.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const board_dismissal_registration_cancelled Bool)
(declare-const board_or_supervisor_dismissed_or_suspended Bool)
(declare-const business_license_obtained Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_improvement_completed Bool)
(declare-const capital_increase_ordered Bool)
(declare-const capital_level Int)
(declare-const capital_level_severely_insufficient_and_no_compliance Bool)
(declare-const capital_level_significantly_worsened_and_no_compliance Bool)
(declare-const contract_or_major_commitment_without_approval Bool)
(declare-const delegate_exempt_gov_procurement Bool)
(declare-const deposit_guarantee_paid Bool)
(declare-const financial_or_business_significantly_worsened Bool)
(declare-const foreign_business_license_obtained Bool)
(declare-const foreign_deposit_guarantee_paid Bool)
(declare-const foreign_insurance_legal_operation_permission Bool)
(declare-const foreign_license_permitted Bool)
(declare-const foreign_registration_completed Bool)
(declare-const inspection_rules_applied Bool)
(declare-const legal_operation_permission Bool)
(declare-const license_permitted Bool)
(declare-const major_event_affecting_market_and_no_compliance Bool)
(declare-const manager_or_staff_dismissed Bool)
(declare-const meeting_resolution_revoked Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const other_major_financial_actions_without_approval Bool)
(declare-const other_necessary_measures Bool)
(declare-const payment_exceed_limit_allowed Bool)
(declare-const penalty Bool)
(declare-const registration_cancelled Bool)
(declare-const registration_completed Bool)
(declare-const restriction_on_business_or_funds Bool)
(declare-const stop_sale_or_limit_product Bool)
(declare-const supervision_board_dismissed Bool)
(declare-const supervision_capital_increase_ordered Bool)
(declare-const supervision_deadline_extended_or_plan_resubmitted Bool)
(declare-const supervision_delegate_assigned Bool)
(declare-const supervision_delegate_exempt_gov_procurement Bool)
(declare-const supervision_delegate_others Bool)
(declare-const supervision_inspection_applied Bool)
(declare-const supervision_major_event_extension Bool)
(declare-const supervision_manager_dismissed Bool)
(declare-const supervision_measures_for_other_worsened_cases Bool)
(declare-const supervision_measures_for_severe_cases Bool)
(declare-const supervision_meeting_resolution_revoked Bool)
(declare-const supervision_other_measures Bool)
(declare-const supervision_procedure_defined Bool)
(declare-const supervision_procedure_regulated Bool)
(declare-const supervision_restriction_applied Bool)
(declare-const supervision_restriction_on_actions Bool)
(declare-const supervision_stop_sale_applied Bool)
(declare-const supervision_takeover_exempt_company_law Bool)
(declare-const supervision_takeover_or_shutdown_or_dissolution Bool)
(declare-const takeover_exempt_company_law Bool)
(declare-const takeover_reorganization_petition Bool)
(declare-const takeover_reorganization_petition_filed Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
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

; [insurance:capital_level_severely_insufficient_and_no_compliance] 資本嚴重不足且未依主管機關規定期限完成增資、改善計畫或合併
(assert (= capital_level_severely_insufficient_and_no_compliance
   (and (= 4 capital_level) (not capital_improvement_completed))))

; [insurance:capital_level_significantly_worsened_and_no_compliance] 財務或業務狀況顯著惡化且未改善
(assert (= capital_level_significantly_worsened_and_no_compliance
   (and financial_or_business_significantly_worsened
        (not capital_improvement_completed))))

; [insurance:supervision_restriction_applied] 主管機關對保險業限制營業或資金運用範圍
(assert (= supervision_restriction_applied restriction_on_business_or_funds))

; [insurance:supervision_stop_sale_applied] 主管機關令保險業停售保險商品或限制開辦
(assert (= supervision_stop_sale_applied stop_sale_or_limit_product))

; [insurance:supervision_capital_increase_ordered] 主管機關令保險業增資
(assert (= supervision_capital_increase_ordered capital_increase_ordered))

; [insurance:supervision_manager_dismissed] 主管機關令保險業解除經理人或職員職務
(assert (= supervision_manager_dismissed manager_or_staff_dismissed))

; [insurance:supervision_meeting_resolution_revoked] 主管機關撤銷法定會議之決議
(assert (= supervision_meeting_resolution_revoked meeting_resolution_revoked))

; [insurance:supervision_board_dismissed] 主管機關解除董（理）事、監察人（監事）職務或停止執行職務
(assert (= supervision_board_dismissed board_or_supervisor_dismissed_or_suspended))

; [insurance:supervision_other_measures] 主管機關採取其他必要處置
(assert (= supervision_other_measures other_necessary_measures))

; [insurance:board_dismissal_registration_cancelled] 解除董（理）事、監察人職務時，主管機關通知登記機關廢止登記
(assert (= board_dismissal_registration_cancelled
   (or (not supervision_board_dismissed) registration_cancelled)))

; [insurance:supervision_measures_for_severe_cases] 資本嚴重不足且未完成增資、改善計畫或合併，主管機關應於期限後九十日內為接管、勒令停業清理或解散處分
(assert (= supervision_measures_for_severe_cases
   (or (not capital_level_severely_insufficient_and_no_compliance)
       supervision_takeover_or_shutdown_or_dissolution)))

; [insurance:supervision_measures_for_other_worsened_cases] 財務或業務狀況顯著惡化且未改善，主管機關得依情節輕重為監管、接管、勒令停業清理或解散處分
(assert (= supervision_measures_for_other_worsened_cases
   (or (not capital_level_significantly_worsened_and_no_compliance)
       supervision_takeover_or_shutdown_or_dissolution)))

; [insurance:supervision_major_event_extension] 因重大事件影響金融市場，未於期限完成增資、改善或合併，主管機關得延長期限或要求重新提計畫
(assert (= supervision_major_event_extension
   (or (not major_event_affecting_market_and_no_compliance)
       supervision_deadline_extended_or_plan_resubmitted)))

; [insurance:supervision_delegate_others] 主管機關得委託其他保險業、相關機構或專業人員擔任監管人、接管人、清理人或清算人
(assert (= supervision_delegate_others supervision_delegate_assigned))

; [insurance:supervision_delegate_exempt_gov_procurement] 主管機關委託之相關機構或個人辦理受委託事項時，不適用政府採購法
(assert (= supervision_delegate_exempt_gov_procurement delegate_exempt_gov_procurement))

; [insurance:supervision_takeover_exempt_company_law] 保險業受接管或勒令停業清理時，不適用公司法有關臨時管理人或檢查人規定
(assert (= supervision_takeover_exempt_company_law takeover_exempt_company_law))

; [insurance:takeover_reorganization_petition] 接管人依本法規定聲請重整，得合併審理或裁定
(assert (= takeover_reorganization_petition takeover_reorganization_petition_filed))

; [insurance:supervision_restriction_on_actions] 保險業監管處分時，非經監管人同意不得超限支付款項、締結契約或其他重大財務事項
(assert (= supervision_restriction_on_actions
   (and (not payment_exceed_limit_allowed)
        (not contract_or_major_commitment_without_approval)
        (not other_major_financial_actions_without_approval))))

; [insurance:supervision_inspection_applied] 監管人執行監管職務時，準用檢查規定
(assert (= supervision_inspection_applied inspection_rules_applied))

; [insurance:supervision_procedure_regulated] 主管機關定監管、接管程序及監管人、接管人職權、費用負擔等辦法
(assert (= supervision_procedure_regulated supervision_procedure_defined))

; [insurance:legal_operation_permission] 保險業非經主管機關許可、依法設立登記、繳存保證金及領得營業執照不得開始營業
(assert (= legal_operation_permission
   (and license_permitted
        registration_completed
        deposit_guarantee_paid
        business_license_obtained)))

; [insurance:foreign_insurance_legal_operation_permission] 外國保險業非經主管機關許可、依法設立登記、繳存保證金及領得營業執照不得開始營業
(assert (= foreign_insurance_legal_operation_permission
   (and foreign_license_permitted
        foreign_registration_completed
        foreign_deposit_guarantee_paid
        foreign_business_license_obtained)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：資本嚴重不足且未完成增資、改善計畫或合併，或財務業務顯著惡化且未改善，或未依法取得營業許可開始營業時處罰
(assert (= penalty
   (or capital_level_severely_insufficient_and_no_compliance
       (not legal_operation_permission)
       (not foreign_insurance_legal_operation_permission)
       capital_level_significantly_worsened_and_no_compliance)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 40.0))
(assert (= net_worth 1000000))
(assert (= net_worth_ratio 3.0))
(assert (= capital_improvement_completed false))
(assert (= financial_or_business_significantly_worsened false))
(assert (= license_permitted true))
(assert (= registration_completed true))
(assert (= deposit_guarantee_paid true))
(assert (= business_license_obtained true))
(assert (= foreign_license_permitted true))
(assert (= foreign_registration_completed true))
(assert (= foreign_deposit_guarantee_paid true))
(assert (= foreign_business_license_obtained true))
(assert (= restriction_on_business_or_funds true))
(assert (= stop_sale_or_limit_product true))
(assert (= capital_increase_ordered false))
(assert (= manager_or_staff_dismissed false))
(assert (= meeting_resolution_revoked false))
(assert (= board_or_supervisor_dismissed_or_suspended false))
(assert (= registration_cancelled false))
(assert (= other_necessary_measures false))
(assert (= payment_exceed_limit_allowed false))
(assert (= contract_or_major_commitment_without_approval false))
(assert (= other_major_financial_actions_without_approval false))
(assert (= supervision_delegate_assigned false))
(assert (= delegate_exempt_gov_procurement false))
(assert (= inspection_rules_applied false))
(assert (= supervision_procedure_defined false))
(assert (= supervision_takeover_or_shutdown_or_dissolution false))
(assert (= takeover_exempt_company_law false))
(assert (= takeover_reorganization_petition_filed false))
(assert (= major_event_affecting_market_and_no_compliance false))
(assert (= supervision_deadline_extended_or_plan_resubmitted false))
(assert (= board_dismissal_registration_cancelled false))
(assert (= supervision_board_dismissed false))
(assert (= supervision_manager_dismissed false))
(assert (= supervision_meeting_resolution_revoked false))
(assert (= supervision_other_measures false))
(assert (= supervision_restriction_on_actions true))
(assert (= supervision_restriction_applied true))
(assert (= supervision_stop_sale_applied true))
(assert (= supervision_capital_increase_ordered false))
(assert (= supervision_delegate_others false))
(assert (= supervision_delegate_exempt_gov_procurement false))
(assert (= supervision_inspection_applied false))
(assert (= supervision_procedure_regulated false))
(assert (= capital_level 4))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 25
; Total variables: 57
; Total facts: 47
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

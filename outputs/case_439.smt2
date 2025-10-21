; SMT2 file generated from compliance case automatic
; Case ID: case_439
; Generated at: 2025-10-21T09:52:55.415999
;
; This file can be executed with Z3:
;   z3 case_439.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const accelerated_deterioration_or_no_improvement Bool)
(declare-const accelerated_loss_or_net_worth_deterioration Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_level Int)
(declare-const capital_level_adequate Bool)
(declare-const capital_level_insufficient Bool)
(declare-const capital_level_none Bool)
(declare-const capital_level_severely_insufficient Bool)
(declare-const capital_level_significantly_insufficient Bool)
(declare-const consolidated_reorganization_petition_allowed Bool)
(declare-const consolidated_reorganization_petition_filed Bool)
(declare-const extension_or_resubmission_ordered Bool)
(declare-const financial_or_business_deterioration Bool)
(declare-const government_procurement_law_not_applicable Bool)
(declare-const improvement_after_guidance Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_approved_by_authority Bool)
(declare-const improvement_plan_completed Bool)
(declare-const improvement_plan_overdue Bool)
(declare-const improvement_plan_submitted_and_completed Bool)
(declare-const inspection_provisions_applied Bool)
(declare-const inspection_provisions_apply Bool)
(declare-const major_event_extension_granted Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const not_subject_to_corp_law_temp_manager Bool)
(declare-const not_subject_to_gov_procurement_law Bool)
(declare-const penalty Bool)
(declare-const regulations_issued Bool)
(declare-const regulations_issued_by_authority Bool)
(declare-const reorganization_petition_exception Bool)
(declare-const reorganization_petition_permitted Bool)
(declare-const risk_to_insured_interest Bool)
(declare-const significant_financial_deterioration Bool)
(declare-const stability_fund_cooperated Bool)
(declare-const stability_fund_cooperation Bool)
(declare-const supervisory_consent_for_contract Bool)
(declare-const supervisory_consent_for_other_major_financial Bool)
(declare-const supervisory_consent_for_payment Bool)
(declare-const supervisory_consent_required_for_major_actions Bool)
(declare-const supervisory_measures_executed Bool)
(declare-const supervisory_measures_implemented Bool)
(declare-const supervisory_measures_required Bool)
(declare-const supervisory_personnel_appointed Bool)
(declare-const supervisory_personnel_commissioned Bool)
(declare-const temporary_manager_law_not_applicable Bool)
(declare-const unable_to_fulfill_contract Bool)
(declare-const unable_to_pay_debt Bool)

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
(let ((a!3 (ite (or (not (<= 50.0 capital_adequacy_ratio))
                    (not (<= 0.0 net_worth)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:capital_level_severely_insufficient] 資本等級為嚴重不足
(assert (= capital_level_severely_insufficient (= 4 capital_level)))

; [insurance:capital_level_significantly_insufficient] 資本等級為顯著不足
(assert (= capital_level_significantly_insufficient (= 3 capital_level)))

; [insurance:capital_level_insufficient] 資本等級為不足
(assert (= capital_level_insufficient (= 2 capital_level)))

; [insurance:capital_level_adequate] 資本等級為適足
(assert (= capital_level_adequate (= 1 capital_level)))

; [insurance:capital_level_none] 資本等級為未分類
(assert (= capital_level_none (= 0 capital_level)))

; [insurance:improvement_plan_completed] 增資、財務或業務改善計畫或合併已於主管機關規定期限內完成
(assert (= improvement_plan_completed improvement_plan_submitted_and_completed))

; [insurance:improvement_plan_overdue] 未於主管機關規定期限內完成增資、財務或業務改善計畫或合併
(assert (not (= improvement_plan_completed improvement_plan_overdue)))

; [insurance:financial_or_business_deterioration] 財務或業務狀況顯著惡化，不能支付債務或無法履行契約責任或有損及被保險人權益之虞
(assert (= financial_or_business_deterioration
   (or unable_to_fulfill_contract
       unable_to_pay_debt
       risk_to_insured_interest
       significant_financial_deterioration)))

; [insurance:improvement_plan_approved] 主管機關核定財務或業務改善計畫
(assert (= improvement_plan_approved improvement_plan_approved_by_authority))

; [insurance:accelerated_deterioration_or_no_improvement] 損益、淨值加速惡化或經輔導仍未改善
(assert (= accelerated_deterioration_or_no_improvement
   (or accelerated_loss_or_net_worth_deterioration
       (not improvement_after_guidance))))

; [insurance:supervisory_measures_required] 應為監管、接管、勒令停業清理或命令解散之處分
(assert (= supervisory_measures_required
   (or (and capital_level_severely_insufficient improvement_plan_overdue)
       (and (not capital_level_severely_insufficient)
            financial_or_business_deterioration
            improvement_plan_approved
            accelerated_deterioration_or_no_improvement))))

; [insurance:supervisory_measures_executed] 主管機關已對保險業為監管、接管、勒令停業清理或命令解散之處分
(assert (= supervisory_measures_executed supervisory_measures_implemented))

; [insurance:major_event_extension_granted] 因重大事件影響金融市場，主管機關另定完成期限或重新提具計畫
(assert (= major_event_extension_granted extension_or_resubmission_ordered))

; [insurance:supervisory_personnel_appointed] 主管機關委託其他保險業、相關機構或專業人員擔任監管人、接管人、清理人或清算人
(assert (= supervisory_personnel_appointed supervisory_personnel_commissioned))

; [insurance:stability_fund_cooperation] 安定基金配合辦理第一百四十三條之三安定基金事項
(assert (= stability_fund_cooperation stability_fund_cooperated))

; [insurance:government_procurement_law_not_applicable] 受委託機構或個人辦理事項不適用政府採購法
(assert (= government_procurement_law_not_applicable not_subject_to_gov_procurement_law))

; [insurance:temporary_manager_law_not_applicable] 受接管或勒令停業清理時不適用公司法臨時管理人或檢查人規定
(assert (= temporary_manager_law_not_applicable not_subject_to_corp_law_temp_manager))

; [insurance:reorganization_petition_exception] 依本法規定聲請重整除外，其他重整、破產、和解聲請及強制執行程序停止
(assert (= reorganization_petition_exception reorganization_petition_permitted))

; [insurance:consolidated_reorganization_petition_allowed] 接管人得聲請法院合併審理或裁定重整案件
(assert (= consolidated_reorganization_petition_allowed
   consolidated_reorganization_petition_filed))

; [insurance:supervisory_consent_required_for_major_actions] 監管處分期間非經監管人同意不得為重大財務行為
(assert (= supervisory_consent_required_for_major_actions
   (and supervisory_consent_for_payment
        supervisory_consent_for_contract
        supervisory_consent_for_other_major_financial)))

; [insurance:inspection_provisions_apply] 監管人執行監管職務時準用第一百四十八條檢查規定
(assert (= inspection_provisions_apply inspection_provisions_applied))

; [insurance:regulations_issued_by_authority] 主管機關定監管、接管、停業清理、解散程序及相關事項辦法
(assert (= regulations_issued_by_authority regulations_issued))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：資本嚴重不足且未依規定完成改善計畫，或財務業務顯著惡化且未改善，且未接受監管處分時處罰
(assert (let ((a!1 (and (not supervisory_measures_executed)
                (or (and capital_level_severely_insufficient
                         improvement_plan_overdue)
                    (and (not capital_level_severely_insufficient)
                         financial_or_business_deterioration
                         improvement_plan_approved
                         accelerated_deterioration_or_no_improvement)))))
  (= penalty a!1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 40.0))
(assert (= net_worth -10.0))
(assert (= net_worth_ratio 1.0))
(assert (= capital_level 4))
(assert (= capital_level_severely_insufficient true))
(assert (= improvement_plan_submitted_and_completed false))
(assert (= improvement_plan_overdue true))
(assert (= improvement_plan_approved_by_authority false))
(assert (= improvement_plan_approved false))
(assert (= financial_or_business_deterioration false))
(assert (= accelerated_loss_or_net_worth_deterioration false))
(assert (= improvement_after_guidance false))
(assert (= accelerated_deterioration_or_no_improvement false))
(assert (= supervisory_measures_implemented false))
(assert (= supervisory_measures_executed false))
(assert (= penalty true))
(assert (= extension_or_resubmission_ordered false))
(assert (= supervisory_personnel_commissioned false))
(assert (= supervisory_personnel_appointed false))
(assert (= inspection_provisions_applied false))
(assert (= inspection_provisions_apply false))
(assert (= regulations_issued true))
(assert (= regulations_issued_by_authority true))
(assert (= not_subject_to_corp_law_temp_manager false))
(assert (= not_subject_to_gov_procurement_law false))
(assert (= reorganization_petition_permitted false))
(assert (= reorganization_petition_exception false))
(assert (= consolidated_reorganization_petition_filed false))
(assert (= consolidated_reorganization_petition_allowed false))
(assert (= stability_fund_cooperated false))
(assert (= stability_fund_cooperation false))
(assert (= supervisory_consent_for_payment false))
(assert (= supervisory_consent_for_contract false))
(assert (= supervisory_consent_for_other_major_financial false))
(assert (= supervisory_consent_required_for_major_actions false))
(assert (= unable_to_pay_debt false))
(assert (= unable_to_fulfill_contract false))
(assert (= risk_to_insured_interest false))
(assert (= significant_financial_deterioration false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 25
; Total variables: 48
; Total facts: 39
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

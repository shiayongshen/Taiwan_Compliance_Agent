; SMT2 file generated from compliance case automatic
; Case ID: case_4
; Generated at: 2025-10-20T22:47:37.262094
;
; This file can be executed with Z3:
;   z3 case_4.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const all_prohibited_behaviors_compliance Bool)
(declare-const authorized_behavior_presumption Bool)
(declare-const behavior_within_authorized_scope Bool)
(declare-const business_operated_according_internal_control Bool)
(declare-const business_operated_according_law Bool)
(declare-const confidentiality_compliance Bool)
(declare-const detrimental_trading Bool)
(declare-const duty_of_care Bool)
(declare-const duty_of_loyalty Bool)
(declare-const fiduciary_and_confidentiality_compliance Bool)
(declare-const fiduciary_duty_compliance Bool)
(declare-const good_faith_principle Bool)
(declare-const improper_order_account_transfer Bool)
(declare-const insider_trading_reporting Bool)
(declare-const insider_trading_restriction Bool)
(declare-const internal_control_change_approved Bool)
(declare-const internal_control_change_approved_by_board Bool)
(declare-const internal_control_change_completed_within_deadline Bool)
(declare-const internal_control_change_complied_with_regulator Bool)
(declare-const internal_control_change_recorded Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_operated_according_law Bool)
(declare-const internal_control_system_established Bool)
(declare-const investment_decision_based_on_analysis_report Bool)
(declare-const matched_principal_trading Bool)
(declare-const not_intentional_matched_principal Bool)
(declare-const other_detrimental_behavior Bool)
(declare-const other_related_data_confidential Bool)
(declare-const penalty Bool)
(declare-const personal_data_confidential Bool)
(declare-const personnel_civil_liability_in_specific_business Bool)
(declare-const personnel_prohibited_behavior Bool)
(declare-const personnel_qualification_compliance Bool)
(declare-const personnel_qualification_meets_regulation Bool)
(declare-const profit_loss_sharing_agreement Bool)
(declare-const prohibited_behavior_1 Bool)
(declare-const prohibited_behavior_2 Bool)
(declare-const prohibited_behavior_3 Bool)
(declare-const prohibited_behavior_4 Bool)
(declare-const prohibited_behavior_5 Bool)
(declare-const prohibited_behavior_6 Bool)
(declare-const prohibited_behavior_7 Bool)
(declare-const prohibited_behavior_8 Bool)
(declare-const prohibited_behavior_9 Bool)
(declare-const prohibited_personnel_behavior_and_serious_violation Bool)
(declare-const prohibited_personnel_behavior_compliance Bool)
(declare-const prohibited_related_party_trading Bool)
(declare-const reasonable_explanation_provided Bool)
(declare-const regulator_exemption_for_order_transfer Bool)
(declare-const regulator_exemption_for_performance_fee Bool)
(declare-const regulator_exemption_for_subdelegate Bool)
(declare-const regulator_notified_change Bool)
(declare-const required_reporting_done Bool)
(declare-const serious_violation_affecting_business Bool)
(declare-const serious_violation_penalty Bool)
(declare-const subdelegate_or_assign_contract Bool)
(declare-const trading_through_exchange Bool)
(declare-const transaction_data_confidential Bool)
(declare-const use_client_account_for_own_trading Bool)
(declare-const use_insider_info_for_others Bool)
(declare-const violation_of_law_or_order Bool)
(declare-const violation_penalty_applicable Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:fiduciary_duty_compliance] 證券投資信託及顧問事業等依善良管理人注意義務及忠實義務執行業務
(assert (= fiduciary_duty_compliance
   (and duty_of_care duty_of_loyalty good_faith_principle)))

; [securities:confidentiality_compliance] 保守受益人或客戶個人資料及交易資料秘密
(assert (= confidentiality_compliance
   (and personal_data_confidential
        transaction_data_confidential
        other_related_data_confidential)))

; [securities:fiduciary_and_confidentiality_compliance] 善良管理人義務及保密義務均符合
(assert (= fiduciary_and_confidentiality_compliance
   (and fiduciary_duty_compliance confidentiality_compliance)))

; [securities:prohibited_behavior_1] 不得利用職務資訊為自己或客戶以外之人交易有價證券
(assert (not (= use_insider_info_for_others prohibited_behavior_1)))

; [securities:prohibited_behavior_2] 不得從事損害客戶權益之有價證券交易
(assert (not (= detrimental_trading prohibited_behavior_2)))

; [securities:prohibited_behavior_3] 不得與客戶約定收益共享或損失分擔（主管機關另有規定者除外）
(assert (= prohibited_behavior_3
   (or regulator_exemption_for_performance_fee
       (not profit_loss_sharing_agreement))))

; [securities:prohibited_behavior_4] 不得與自己資金或其他客戶資產為相對委託交易（非故意發生者除外）
(assert (= prohibited_behavior_4
   (or (not matched_principal_trading)
       (and trading_through_exchange not_intentional_matched_principal))))

; [securities:prohibited_behavior_5] 不得利用客戶帳戶為自己或他人買賣有價證券
(assert (not (= use_client_account_for_own_trading prohibited_behavior_5)))

; [securities:prohibited_behavior_6] 不得將全權委託投資契約全部或部分複委任或轉讓他人（主管機關另有規定者除外）
(assert (= prohibited_behavior_6
   (or regulator_exemption_for_subdelegate (not subdelegate_or_assign_contract))))

; [securities:prohibited_behavior_7] 不得無正當理由將已成交買賣委託帳戶轉換（主管機關另有規定者除外）
(assert (= prohibited_behavior_7
   (or regulator_exemption_for_order_transfer
       (not improper_order_account_transfer))))

; [securities:prohibited_behavior_8] 投資決策應依投資分析報告，合理解釋者不違反
(assert (= prohibited_behavior_8
   (or investment_decision_based_on_analysis_report
       reasonable_explanation_provided)))

; [securities:prohibited_behavior_9] 不得有其他影響事業經營或客戶權益之行為
(assert (not (= other_detrimental_behavior prohibited_behavior_9)))

; [securities:all_prohibited_behaviors_compliance] 所有禁止行為均未違反
(assert (= all_prohibited_behaviors_compliance
   (and prohibited_behavior_1
        prohibited_behavior_2
        prohibited_behavior_3
        prohibited_behavior_4
        prohibited_behavior_5
        prohibited_behavior_6
        prohibited_behavior_7
        prohibited_behavior_8
        prohibited_behavior_9)))

; [securities:personnel_qualification_compliance] 人員資格條件、行為規範、訓練、登記期限及程序符合主管機關規定
(assert (= personnel_qualification_compliance personnel_qualification_meets_regulation))

; [securities:prohibited_personnel_behavior_compliance] 負責人、業務人員及受僱人不得為法令或契約禁止之行為
(assert (not (= personnel_prohibited_behavior prohibited_personnel_behavior_compliance)))

; [securities:authorized_behavior_presumption] 負責人、業務人員及受僱人從事特定業務行為涉及民事責任者，推定為授權範圍內行為
(assert (= authorized_behavior_presumption
   (or (not personnel_civil_liability_in_specific_business)
       behavior_within_authorized_scope)))

; [securities:violation_penalty_applicable] 違反本法或命令者，主管機關得依情節輕重處分
(assert (= violation_penalty_applicable violation_of_law_or_order))

; [securities:serious_violation_penalty] 董事、監察人、經理人或受僱人違反法令影響業務正常執行，主管機關得停止執行或解除職務
(assert (= serious_violation_penalty serious_violation_affecting_business))

; [securities:prohibited_personnel_behavior_and_serious_violation] 負責人、監察人、經理人或受僱人違反法令且影響業務正常執行
(assert (= prohibited_personnel_behavior_and_serious_violation
   (and personnel_prohibited_behavior serious_violation_affecting_business)))

; [securities:insider_trading_restriction] 負責人等及其關係人不得從事特定公司股票及衍生商品交易
(assert (not (= prohibited_related_party_trading insider_trading_restriction)))

; [securities:insider_trading_reporting] 負責人等及其關係人應申報特定公司股票及衍生商品交易情形
(assert (= insider_trading_reporting required_reporting_done))

; [securities:internal_control_established] 證券投資信託事業建立內部控制制度
(assert (= internal_control_established internal_control_system_established))

; [securities:internal_control_operated_according_law] 業務經營依內部控制制度及法令章程執行
(assert (= internal_control_operated_according_law
   (and business_operated_according_law
        business_operated_according_internal_control)))

; [securities:internal_control_change_approved] 內部控制制度訂定或變更經董事會同意並留存備查
(assert (= internal_control_change_approved
   (and internal_control_change_approved_by_board
        internal_control_change_recorded)))

; [securities:internal_control_change_complied_with_regulator] 內部控制制度變更依本會通知限期內完成
(assert (= internal_control_change_complied_with_regulator
   (or internal_control_change_completed_within_deadline
       (not regulator_notified_change))))

; [securities:internal_control_compliance] 內部控制制度符合訂定、變更及執行要求
(assert (= internal_control_compliance
   (and internal_control_established
        internal_control_operated_according_law
        internal_control_change_approved
        internal_control_change_complied_with_regulator)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反善良管理人義務、保密義務、禁止行為、人員資格、內部控制或其他法令規定時處罰
(assert (= penalty
   (or (not fiduciary_duty_compliance)
       violation_penalty_applicable
       (not internal_control_compliance)
       (not all_prohibited_behaviors_compliance)
       (not personnel_qualification_compliance)
       (not confidentiality_compliance)
       (not prohibited_personnel_behavior_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= duty_of_care false))
(assert (= duty_of_loyalty false))
(assert (= good_faith_principle false))
(assert (= personal_data_confidential true))
(assert (= transaction_data_confidential true))
(assert (= other_related_data_confidential true))
(assert (= use_insider_info_for_others true))
(assert (= detrimental_trading true))
(assert (= profit_loss_sharing_agreement false))
(assert (= regulator_exemption_for_performance_fee false))
(assert (= matched_principal_trading false))
(assert (= trading_through_exchange true))
(assert (= not_intentional_matched_principal true))
(assert (= use_client_account_for_own_trading true))
(assert (= subdelegate_or_assign_contract false))
(assert (= regulator_exemption_for_subdelegate false))
(assert (= improper_order_account_transfer false))
(assert (= regulator_exemption_for_order_transfer false))
(assert (= investment_decision_based_on_analysis_report false))
(assert (= reasonable_explanation_provided false))
(assert (= other_detrimental_behavior true))
(assert (= personnel_qualification_meets_regulation true))
(assert (= personnel_prohibited_behavior true))
(assert (= internal_control_system_established false))
(assert (= business_operated_according_law false))
(assert (= business_operated_according_internal_control false))
(assert (= internal_control_change_approved_by_board false))
(assert (= internal_control_change_recorded false))
(assert (= regulator_notified_change false))
(assert (= internal_control_change_completed_within_deadline false))
(assert (= required_reporting_done false))
(assert (= personnel_civil_liability_in_specific_business false))
(assert (= behavior_within_authorized_scope false))
(assert (= violation_of_law_or_order true))
(assert (= serious_violation_affecting_business true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 28
; Total variables: 63
; Total facts: 35
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

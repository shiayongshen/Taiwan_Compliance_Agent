; SMT2 file generated from compliance case automatic
; Case ID: case_64
; Generated at: 2025-10-21T00:34:59.086716
;
; This file can be executed with Z3:
;   z3 case_64.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const IF Bool)
(declare-const academic_research_public_interest Bool)
(declare-const appropriate_security_measures Bool)
(declare-const article_165_3_violation Bool)
(declare-const article_19_violation Bool)
(declare-const article_20_violation Bool)
(declare-const article_47_violation Bool)
(declare-const article_6_1_compliance Bool)
(declare-const audit_system_established Bool)
(declare-const audit_system_executed Bool)
(declare-const benefit_subject Bool)
(declare-const collection_purpose_valid Bool)
(declare-const contract_relation Bool)
(declare-const data_anonymized Bool)
(declare-const fixed_office_and_account_book_ok Bool)
(declare-const has_certain_scale Bool)
(declare-const has_dedicated_account_book Bool)
(declare-const has_fixed_office Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_executed_ok Bool)
(declare-const internal_control_required_ok Bool)
(declare-const international_transfer_restriction_compliance Bool)
(declare-const is_agent Bool)
(declare-const is_broker Bool)
(declare-const is_first_marketing Bool)
(declare-const is_non_public_agency Bool)
(declare-const is_notary Bool)
(declare-const is_publicly_listed Bool)
(declare-const legal_provision Bool)
(declare-const legal_provision_for_use_outside_purpose Bool)
(declare-const marketing_first_notice_ok Bool)
(declare-const marketing_refusal_handling_ok Bool)
(declare-const marketing_refusal_received Bool)
(declare-const marketing_stopped Bool)
(declare-const necessary_for_public_interest Bool)
(declare-const necessary_for_public_interest_use Bool)
(declare-const no_harm_to_subject_rights Bool)
(declare-const paid_required_fee Bool)
(declare-const penalty Bool)
(declare-const prevent_life_or_property_danger Bool)
(declare-const prevent_major_harm_to_others Bool)
(declare-const processing_prohibition_compliance Bool)
(declare-const processing_prohibition_notified Bool)
(declare-const processing_stopped_or_deleted Bool)
(declare-const provided_rejection_method Bool)
(declare-const public_agency_or_academic Bool)
(declare-const publicly_disclosed_data Bool)
(declare-const single_license_only_ok Bool)
(declare-const solicitation_handling_system_established Bool)
(declare-const solicitation_handling_system_executed Bool)
(declare-const subject_consent Bool)
(declare-const subject_consent_for_use Bool)
(declare-const subject_prohibits_processing Bool)
(declare-const use_within_collection_purpose Bool)
(declare-const use_within_purpose_ok Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:fixed_office_and_account_book] 保險代理人、經紀人、公證人應有固定業務處所並專設帳簿記載業務收支
(assert (= fixed_office_and_account_book_ok
   (and has_fixed_office has_dedicated_account_book)))

; [insurance:single_license_only] 兼有保險代理人、經紀人、公證人資格者僅得擇一申領執業證照
(assert (= single_license_only_ok
   (>= 1 (+ (ite is_agent 1 0) (ite is_broker 1 0) (ite is_notary 1 0)))))

; [insurance:internal_control_required] 保險代理人公司、經紀人公司為公開發行公司或具一定規模者，應建立內部控制、稽核制度與招攬處理制度及程序
(assert (= internal_control_required_ok
   (or (not (or is_publicly_listed has_certain_scale))
       (and internal_control_established
            audit_system_established
            solicitation_handling_system_established))))

; [insurance:internal_control_executed] 保險代理人公司、經紀人公司應確實執行內部控制、稽核制度與招攬處理制度及程序
(assert (= internal_control_executed_ok
   (or (not (or is_publicly_listed has_certain_scale))
       (and internal_control_executed
            audit_system_executed
            solicitation_handling_system_executed))))

; [insurance:internal_control_compliance] 符合內部控制建立及執行規定
(assert (= internal_control_compliance
   (and internal_control_required_ok internal_control_executed_ok)))

; [insurance:article_165_3_violation] 違反保險法第165條第三項規定未建立或未確實執行內部控制、稽核制度、招攬處理制度或程序
(assert (= article_165_3_violation
   (or (not audit_system_established)
       (not internal_control_executed)
       (not solicitation_handling_system_established)
       (not internal_control_established)
       (not solicitation_handling_system_executed)
       (not audit_system_executed))))

; [personal_data:collection_purpose_valid] 非公務機關蒐集或處理個人資料應有特定目的且符合第19條規定之一
(assert (= collection_purpose_valid
   (or (not subject_prohibits_processing)
       subject_consent
       (and contract_relation appropriate_security_measures)
       legal_provision
       publicly_disclosed_data
       (and academic_research_public_interest data_anonymized)
       necessary_for_public_interest
       no_harm_to_subject_rights)))

; [personal_data:processing_prohibition_compliance] 蒐集或處理者知悉或經當事人通知禁止處理或利用時，應刪除、停止處理或利用該個人資料
(assert (= processing_prohibition_compliance
   (or (not processing_prohibition_notified) processing_stopped_or_deleted)))

; [personal_data:use_within_purpose] 非公務機關利用個人資料應於蒐集特定目的必要範圍內
(assert (= use_within_purpose_ok
   (or (and public_agency_or_academic data_anonymized)
       legal_provision_for_use_outside_purpose
       benefit_subject
       subject_consent_for_use
       prevent_major_harm_to_others
       prevent_life_or_property_danger
       (not is_non_public_agency)
       use_within_collection_purpose
       necessary_for_public_interest_use)))

; [personal_data:marketing_refusal_handling] 非公務機關行銷時，當事人表示拒絕接受行銷時應停止利用其個人資料行銷
(assert (= marketing_refusal_handling_ok
   (or (not (and is_non_public_agency marketing_refusal_received))
       marketing_stopped)))

; [personal_data:marketing_first_notice] 非公務機關首次行銷時應提供拒絕接受行銷方式並支付所需費用
(assert (= marketing_first_notice_ok
   (or (not (and is_non_public_agency is_first_marketing))
       (and provided_rejection_method paid_required_fee))))

; [personal_data:article_19_violation] 違反個人資料保護法第19條規定
(assert (not (= collection_purpose_valid article_19_violation)))

; [personal_data:article_20_violation] 違反個人資料保護法第20條第一項規定
(assert (not (= use_within_purpose_ok article_20_violation)))

; [personal_data:article_47_violation] 違反個人資料保護法第47條規定
(assert (= article_47_violation
   (or (not international_transfer_restriction_compliance)
       (not article_6_1_compliance)
       article_19_violation
       article_20_violation)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反保險法第165條第三項或個人資料保護法相關規定時處罰
(assert (= penalty
   (or article_165_3_violation
       article_19_violation
       article_20_violation
       article_47_violation)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= is_agent true))
(assert (= internal_control_established false))
(assert (= audit_system_established false))
(assert (= solicitation_handling_system_established false))
(assert (= internal_control_executed false))
(assert (= audit_system_executed false))
(assert (= solicitation_handling_system_executed false))
(assert (= article_165_3_violation true))
(assert (= subject_consent false))
(assert (= use_within_collection_purpose false))
(assert (= use_within_purpose_ok false))
(assert (= collection_purpose_valid false))
(assert (= article_19_violation true))
(assert (= article_20_violation true))
(assert (= article_6_1_compliance false))
(assert (= article_47_violation true))
(assert (= is_non_public_agency true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 16
; Total variables: 57
; Total facts: 17
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

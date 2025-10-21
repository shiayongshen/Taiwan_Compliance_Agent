; SMT2 file generated from compliance case automatic
; Case ID: case_427
; Generated at: 2025-10-21T09:23:53.740696
;
; This file can be executed with Z3:
;   z3 case_427.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const agent_rules_complied Bool)
(declare-const approved_by_authority Bool)
(declare-const authority_suspension_or_revocation Bool)
(declare-const bank_approved_by_authority Bool)
(declare-const bank_business_compliance Bool)
(declare-const bank_is_agent Bool)
(declare-const bank_is_broker Bool)
(declare-const bank_permission_ok Bool)
(declare-const broker_duties_ok Bool)
(declare-const broker_exercise_due_care Bool)
(declare-const broker_fee_disclosed Bool)
(declare-const broker_fulfill_fiduciary_duty Bool)
(declare-const broker_provide_written_report Bool)
(declare-const broker_report_and_fee_ok Bool)
(declare-const broker_rules_complied Bool)
(declare-const business_allowed Bool)
(declare-const compliance_all Bool)
(declare-const guarantee_and_insurance_ok Bool)
(declare-const guarantee_deposit_paid Bool)
(declare-const has_license Bool)
(declare-const illegal_non_insurance_business Bool)
(declare-const illegal_operation Bool)
(declare-const insurance_type Int)
(declare-const is_agent Bool)
(declare-const is_broker Bool)
(declare-const is_notary Bool)
(declare-const license_required Bool)
(declare-const not_authorized_insurance_business Bool)
(declare-const penalty Bool)
(declare-const related_insurance_purchased Bool)
(declare-const related_insurance_type_ok Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:license_required] 保險代理人、經紀人、公證人須經主管機關許可並領有執業證照
(assert (= license_required (and approved_by_authority has_license)))

; [insurance:guarantee_deposit_and_insurance] 須繳存保證金並投保相關保險
(assert (= guarantee_and_insurance_ok
   (and guarantee_deposit_paid related_insurance_purchased)))

; [insurance:related_insurance_type] 相關保險種類依身份區分
(assert (let ((a!1 (or (and is_notary (= 1 insurance_type))
               (and is_broker (or (= 1 insurance_type) (= 2 insurance_type)))
               (and is_agent (= 1 insurance_type)))))
  (= related_insurance_type_ok a!1)))

; [insurance:business_allowed] 領有執業證照且符合保證金及保險要求始得經營或執行業務
(assert (= business_allowed (and license_required guarantee_and_insurance_ok)))

; [insurance:bank_permission_for_agent_or_broker] 銀行得經主管機關許可擇一兼營保險代理人或保險經紀人業務
(assert (= bank_permission_ok
   (and bank_approved_by_authority (or bank_is_agent bank_is_broker))))

; [insurance:bank_business_compliance] 銀行兼營保險代理人或經紀人業務應分別準用相關規定
(assert (= bank_business_compliance
   (and (or agent_rules_complied (not bank_is_agent))
        (or broker_rules_complied (not bank_is_broker)))))

; [insurance:broker_duties] 保險經紀人應以善良管理人注意義務及忠實義務為被保險人洽訂保險契約或提供服務
(assert (= broker_duties_ok
   (and broker_exercise_due_care broker_fulfill_fiduciary_duty)))

; [insurance:broker_report_and_fee_disclosure] 保險經紀人於主管機關指定範圍內應主動提供書面分析報告並明確告知報酬標準
(assert (= broker_report_and_fee_ok
   (and broker_provide_written_report broker_fee_disclosed)))

; [insurance:compliance_all] 保險代理人、經紀人、公證人合規條件
(assert (= compliance_all (and business_allowed related_insurance_type_ok)))

; [insurance:illegal_operation] 未領有執業證照而經營或執行保險代理人、經紀人、公證人業務
(assert (= illegal_operation (and (not has_license) (or is_agent is_broker is_notary))))

; [insurance:illegal_non_insurance_business] 為非本法之保險業或外國保險業代理、經紀或招攬保險業務
(assert (= illegal_non_insurance_business not_authorized_insurance_business))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反未領執照經營、非法代理經紀招攬或主管機關停止廢止許可情形
(assert (= penalty
   (or authority_suspension_or_revocation
       illegal_non_insurance_business
       illegal_operation)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= approved_by_authority false))
(assert (= has_license false))
(assert (= is_agent true))
(assert (= is_broker false))
(assert (= is_notary false))
(assert (= license_required true))
(assert (= not_authorized_insurance_business false))
(assert (= illegal_operation true))
(assert (= illegal_non_insurance_business false))
(assert (= authority_suspension_or_revocation false))
(assert (= agent_rules_complied false))
(assert (= broker_rules_complied false))
(assert (= broker_duties_ok false))
(assert (= broker_exercise_due_care false))
(assert (= broker_fulfill_fiduciary_duty false))
(assert (= broker_report_and_fee_ok false))
(assert (= broker_provide_written_report false))
(assert (= broker_fee_disclosed false))
(assert (= business_allowed false))
(assert (= guarantee_deposit_paid false))
(assert (= related_insurance_purchased false))
(assert (= guarantee_and_insurance_ok false))
(assert (= related_insurance_type_ok false))
(assert (= compliance_all false))
(assert (= insurance_type 1))
(assert (= bank_approved_by_authority false))
(assert (= bank_is_agent false))
(assert (= bank_is_broker false))
(assert (= bank_permission_ok false))
(assert (= bank_business_compliance false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 13
; Total variables: 31
; Total facts: 30
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

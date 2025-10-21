; SMT2 file generated from compliance case automatic
; Case ID: case_143
; Generated at: 2025-10-21T02:56:58.854642
;
; This file can be executed with Z3:
;   z3 case_143.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const application_date Int)
(declare-const broker_company_shareholding_ratio Real)
(declare-const business_type Int)
(declare-const capital_adjustment_after_share_transfer_met Bool)
(declare-const capital_adjustment_date Int)
(declare-const capital_adjustment_deadline_met Bool)
(declare-const capital_compliance Bool)
(declare-const capital_requirement_compliance Bool)
(declare-const compliance_business_management Bool)
(declare-const compliance_financial_management Bool)
(declare-const compliance_with_65_plus_protection Bool)
(declare-const compliance_with_management_rules Bool)
(declare-const contact_email_provided Bool)
(declare-const contact_info_provided_to_insurer Bool)
(declare-const contact_other_approved_method_provided Bool)
(declare-const contact_phone_provided Bool)
(declare-const days_since_share_transfer Int)
(declare-const disclosure_made Bool)
(declare-const document_retention Bool)
(declare-const documents_retained Bool)
(declare-const duty_of_care Bool)
(declare-const duty_of_care_and_loyalty Bool)
(declare-const duty_of_loyalty Bool)
(declare-const electronic_policy_contact_info_provided Bool)
(declare-const fee_charged Bool)
(declare-const fee_disclosure_provided Bool)
(declare-const guarantee_deposit Real)
(declare-const guarantee_deposit_minimum Real)
(declare-const insurance_company_shareholding_ratio Real)
(declare-const insurance_purchased Bool)
(declare-const internal_operation_compliance Bool)
(declare-const internal_operation_rules_established Bool)
(declare-const internal_operation_rules_executed Bool)
(declare-const is_inheritance Bool)
(declare-const license_and_permit_valid Bool)
(declare-const license_held Bool)
(declare-const license_issue_date Int)
(declare-const min_capital_requirement Real)
(declare-const paid_in_capital Real)
(declare-const penalty Bool)
(declare-const permit_obtained Bool)
(declare-const policy_issued_electronically Bool)
(declare-const pre_contract_disclosure Bool)
(declare-const share_transfer_date Int)
(declare-const share_transfer_ratio Real)
(declare-const shareholding_disclosure Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance_broker:min_capital_requirement] 經紀人公司最低實收資本額要求依申請業務類型及時期
(assert (let ((a!1 (or (and (not (<= 1100303 application_date)) (= 2 business_type))
               (and (not (<= 1100303 application_date)) (= 3 business_type))))
      (a!2 (ite (or (and (<= 1100303 application_date) (= 1 business_type))
                    (and (<= 1100303 application_date) (= 2 business_type)))
                20000000.0
                (ite (and (<= 1100303 application_date) (= 3 business_type))
                     30000000.0
                     0.0))))
(let ((a!3 (ite (and (not (<= 1100303 application_date)) (= 1 business_type))
                5000000.0
                (ite a!1 10000000.0 a!2))))
  (= min_capital_requirement a!3))))

; [insurance_broker:capital_adjustment_deadline_met] 已於規定期限內完成資本額調整
(assert (= capital_adjustment_deadline_met
   (or (not (<= 1030624 license_issue_date))
       (<= 1080624 capital_adjustment_date))))

; [insurance_broker:capital_adjustment_after_share_transfer_met] 股權或資本總額移轉達50%以上後六個月內完成資本額調整（股東繼承除外）
(assert (= capital_adjustment_after_share_transfer_met
   (or (not (<= 50.0 share_transfer_ratio))
       (and (<= 50.0 share_transfer_ratio)
            (>= 180 days_since_share_transfer)
            (not is_inheritance)
            (>= capital_adjustment_date share_transfer_date)))))

; [insurance_broker:capital_requirement_compliance] 實收資本額符合最低要求
(assert (= capital_requirement_compliance (>= paid_in_capital min_capital_requirement)))

; [insurance_broker:capital_compliance] 資本額調整符合規定
(assert (= capital_compliance
   (and capital_requirement_compliance
        capital_adjustment_deadline_met
        capital_adjustment_after_share_transfer_met)))

; [insurance_broker:license_and_permit_valid] 保險代理人、經紀人、公證人已取得主管機關許可並領有執業證照
(assert (= license_and_permit_valid
   (and permit_obtained
        license_held
        (>= guarantee_deposit guarantee_deposit_minimum)
        insurance_purchased)))

; [insurance_broker:internal_operation_compliance] 經紀人公司及銀行依法令及主管機關規定訂定內部作業規範並落實執行
(assert (= internal_operation_compliance
   (and internal_operation_rules_established
        internal_operation_rules_executed
        compliance_with_65_plus_protection)))

; [insurance_broker:duty_of_care_and_loyalty] 個人執業經紀人、經紀人公司及銀行盡善良管理人注意義務及忠實義務
(assert (= duty_of_care_and_loyalty (and duty_of_care duty_of_loyalty)))

; [insurance_broker:document_retention] 個人執業經紀人、經紀人公司及銀行留存文件備查
(assert (= document_retention documents_retained))

; [insurance_broker:electronic_policy_contact_info_provided] 電子保單出單時取得並提供要保人及被保險人聯絡方式
(assert (= electronic_policy_contact_info_provided
   (and policy_issued_electronically
        (or contact_email_provided
            contact_other_approved_method_provided
            contact_phone_provided)
        contact_info_provided_to_insurer)))

; [insurance_broker:pre_contract_disclosure] 經紀人於洽訂保險契約前提供書面分析報告及報酬收取標準告知
(assert (= pre_contract_disclosure
   (and written_analysis_report_provided
        (or (not fee_charged) fee_disclosure_provided))))

; [insurance_broker:shareholding_disclosure] 經紀人於洽訂保險契約前揭露單一保險公司與經紀人公司或銀行持股超過10%資訊
(assert (let ((a!1 (not (or (not (<= broker_company_shareholding_ratio 10.0))
                    (not (<= insurance_company_shareholding_ratio 10.0))))))
  (= shareholding_disclosure (or a!1 disclosure_made))))

; [insurance_broker:compliance_with_management_rules] 遵守保險法第163條及第167-2條管理規則財務及業務管理相關規定
(assert (= compliance_with_management_rules
   (and compliance_financial_management compliance_business_management)))

; [insurance_broker:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance_broker:penalty_conditions] 處罰條件：違反管理規則財務或業務管理規定或未依規定調整資本額時處罰
(assert (= penalty (or (not compliance_with_management_rules) (not capital_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= application_date 1080623))
(assert (= business_type 1))
(assert (= paid_in_capital 4000000))
(assert (= capital_adjustment_date 1080601))
(assert (= capital_adjustment_deadline_met false))
(assert (= share_transfer_ratio 0))
(assert (= days_since_share_transfer 0))
(assert (= is_inheritance false))
(assert (= license_issue_date 1040101))
(assert (= permit_obtained true))
(assert (= license_held true))
(assert (= guarantee_deposit 10))
(assert (= guarantee_deposit_minimum 10))
(assert (= insurance_purchased true))
(assert (= internal_operation_rules_established true))
(assert (= internal_operation_rules_executed true))
(assert (= compliance_with_65_plus_protection true))
(assert (= compliance_financial_management true))
(assert (= compliance_business_management true))
(assert (= contact_email_provided true))
(assert (= contact_info_provided_to_insurer true))
(assert (= contact_other_approved_method_provided false))
(assert (= contact_phone_provided false))
(assert (= policy_issued_electronically true))
(assert (= written_analysis_report_provided true))
(assert (= fee_charged false))
(assert (= fee_disclosure_provided false))
(assert (= documents_retained true))
(assert (= duty_of_care true))
(assert (= duty_of_loyalty true))
(assert (= disclosure_made true))
(assert (= broker_company_shareholding_ratio 0))
(assert (= insurance_company_shareholding_ratio 0))
(assert (= share_transfer_date 0))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 47
; Total facts: 34
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

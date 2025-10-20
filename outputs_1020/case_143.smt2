; SMT2 file generated from compliance case automatic
; Case ID: case_143
; Generated at: 2025-10-19T09:08:22.404848
;
; This file can be executed with Z3:
;   z3 case_143.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const basic_info_understood Bool)
(declare-const broker_shareholding_in_insurer Bool)
(declare-const business_type_insurance_broker Bool)
(declare-const business_type_reinsurance_broker Bool)
(declare-const capital_adjustment_completed Bool)
(declare-const capital_adjustment_completed_after_transfer Bool)
(declare-const capital_adjustment_date Int)
(declare-const capital_adjustment_within_6_months Bool)
(declare-const capital_compliance Bool)
(declare-const capital_contribution_cash_only Bool)
(declare-const capital_requirement_met Bool)
(declare-const cash_contribution_only Bool)
(declare-const contact_info_collected Bool)
(declare-const contact_info_provided_to_insurer Bool)
(declare-const current_date Int)
(declare-const disclosure_made_before_contract Bool)
(declare-const disclosure_of_contact_info Bool)
(declare-const document_retention Bool)
(declare-const documents_retained Bool)
(declare-const duty_of_care Bool)
(declare-const duty_of_care_and_loyalty Bool)
(declare-const duty_of_loyalty Bool)
(declare-const electronic_policy_issued Bool)
(declare-const guarantee_deposit_paid Bool)
(declare-const insurance_purchased Bool)
(declare-const insurer_shareholding_in_broker Bool)
(declare-const internal_operation_compliance Bool)
(declare-const internal_operation_rules_established Bool)
(declare-const internal_operation_rules_executed Bool)
(declare-const license_and_permit_valid Bool)
(declare-const license_issue_date Int)
(declare-const license_issued Bool)
(declare-const needs_and_risks_assessed Bool)
(declare-const paid_in_capital Real)
(declare-const penalty Bool)
(declare-const penalty_applicable Bool)
(declare-const permit_obtained Bool)
(declare-const pre_contract_understanding_and_report Bool)
(declare-const remuneration_disclosed Bool)
(declare-const share_or_capital_transfer_ratio Real)
(declare-const shareholding_disclosure Bool)
(declare-const transfer_due_to_inheritance Bool)
(declare-const violate_article_163_4 Bool)
(declare-const violate_article_163_7 Bool)
(declare-const violate_article_165_1_or_163_5 Bool)
(declare-const violation_of_management_rules Bool)
(declare-const written_analysis_report_provided Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance_broker:capital_requirement] 經紀人公司最低實收資本額要求依業務類型及時期
(assert (let ((a!1 (or (and (<= 20210303 current_date) (<= 20000000.0 paid_in_capital))
               (and (not (<= 20210303 current_date))
                    (<= 5000000.0 paid_in_capital))))
      (a!2 (or (and (<= 20210303 current_date) (<= 20000000.0 paid_in_capital))
               (and (not (<= 20210303 current_date))
                    (<= 10000000.0 paid_in_capital))))
      (a!3 (or (and (not (<= 20210303 current_date))
                    (<= 10000000.0 paid_in_capital))
               (and (<= 20210303 current_date) (<= 30000000.0 paid_in_capital)))))
  (= capital_requirement_met
     (or (and business_type_insurance_broker a!1)
         (and business_type_reinsurance_broker a!2)
         (and business_type_insurance_broker
              business_type_reinsurance_broker
              a!3)))))

; [insurance_broker:capital_adjustment_completed] 已於規定期限完成資本額調整
(assert (= capital_adjustment_completed
   (or (not (<= 20140624 license_issue_date))
       (<= 20180624 capital_adjustment_date))))

; [insurance_broker:capital_adjustment_completed_after_transfer] 股權或資本總額移轉達50%以上後六個月內完成資本額調整（繼承除外）
(assert (= capital_adjustment_completed_after_transfer
   (or (not (<= 50.0 share_or_capital_transfer_ratio))
       (and (<= 50.0 share_or_capital_transfer_ratio)
            (not transfer_due_to_inheritance)
            capital_adjustment_within_6_months))))

; [insurance_broker:capital_compliance] 資本額符合規定（含調整完成）
(assert (= capital_compliance
   (and capital_requirement_met
        capital_adjustment_completed
        capital_adjustment_completed_after_transfer)))

; [insurance_broker:cash_contribution_only] 發起人及股東出資以現金為限
(assert (= cash_contribution_only capital_contribution_cash_only))

; [insurance_broker:license_and_permit_valid] 保險代理人、經紀人、公證人應有主管機關許可及執業證照
(assert (= license_and_permit_valid
   (and permit_obtained
        guarantee_deposit_paid
        insurance_purchased
        license_issued)))

; [insurance_broker:internal_operation_compliance] 經紀人公司及銀行依法令及主管機關規定訂定內部作業規範並落實執行
(assert (= internal_operation_compliance
   (and internal_operation_rules_established internal_operation_rules_executed)))

; [insurance_broker:duty_of_care_and_loyalty] 個人執業經紀人、經紀人公司及銀行應盡善良管理人之注意及忠實義務
(assert (= duty_of_care_and_loyalty (and duty_of_care duty_of_loyalty)))

; [insurance_broker:document_retention] 應將有關文件留存建檔備供查閱
(assert (= document_retention documents_retained))

; [insurance_broker:disclosure_of_contact_info] 電子保單出單時取得並提供要保人及被保險人聯絡方式
(assert (= disclosure_of_contact_info
   (and electronic_policy_issued
        contact_info_collected
        contact_info_provided_to_insurer)))

; [insurance_broker:pre_contract_understanding_and_report] 洽訂保險契約前充分瞭解基本資料、需求及風險，並提供書面分析報告及報酬收取標準
(assert (= pre_contract_understanding_and_report
   (and basic_info_understood
        needs_and_risks_assessed
        written_analysis_report_provided
        remuneration_disclosed)))

; [insurance_broker:shareholding_disclosure] 經紀人持有保險公司表決權股份超過10%或反之，洽訂契約前揭露該資訊
(assert (let ((a!1 (and (not (<= 10.0 (ite broker_shareholding_in_insurer 1.0 0.0)))
                (not (<= 10.0 (ite insurer_shareholding_in_broker 1.0 0.0))))))
(let ((a!2 (or (and (<= 10.0 (ite broker_shareholding_in_insurer 1.0 0.0))
                    disclosure_made_before_contract)
               (and (<= 10.0 (ite insurer_shareholding_in_broker 1.0 0.0))
                    disclosure_made_before_contract)
               a!1)))
  (= shareholding_disclosure a!2))))

; [insurance_broker:violation_of_management_rules] 違反保險法第163條第4項及第7項、及第165條第1項或第163條第5項準用規定
(assert (= violation_of_management_rules
   (or violate_article_163_4
       violate_article_163_7
       violate_article_165_1_or_163_5)))

; [insurance_broker:penalty_applicable] 違反管理規則應限期改正或處罰
(assert (= penalty_applicable violation_of_management_rules))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反管理規則時處罰
(assert (= penalty penalty_applicable))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= business_type_insurance_broker true))
(assert (= business_type_reinsurance_broker false))
(assert (= paid_in_capital 5000000.0))
(assert (= capital_adjustment_date 20180623))
(assert (= capital_adjustment_completed false))
(assert (= capital_adjustment_completed_after_transfer true))
(assert (= share_or_capital_transfer_ratio 0.0))
(assert (= transfer_due_to_inheritance false))
(assert (= capital_adjustment_within_6_months true))
(assert (= violate_article_163_4 false))
(assert (= violate_article_163_7 false))
(assert (= violate_article_165_1_or_163_5 false))
(assert (= violation_of_management_rules true))
(assert (= penalty_applicable true))
(assert (= permit_obtained false))
(assert (= guarantee_deposit_paid false))
(assert (= insurance_purchased false))
(assert (= license_issued false))
(assert (= license_and_permit_valid false))
(assert (= license_issue_date 0))
(assert (= basic_info_understood false))
(assert (= needs_and_risks_assessed false))
(assert (= written_analysis_report_provided false))
(assert (= remuneration_disclosed false))
(assert (= pre_contract_understanding_and_report false))
(assert (= contact_info_collected false))
(assert (= contact_info_provided_to_insurer false))
(assert (= electronic_policy_issued false))
(assert (= document_retention false))
(assert (= documents_retained false))
(assert (= duty_of_care false))
(assert (= duty_of_loyalty false))
(assert (= duty_of_care_and_loyalty false))
(assert (= internal_operation_rules_established false))
(assert (= internal_operation_rules_executed false))
(assert (= internal_operation_compliance false))
(assert (= disclosure_made_before_contract false))
(assert (= broker_shareholding_in_insurer false))
(assert (= insurer_shareholding_in_broker false))
(assert (= shareholding_disclosure true))
(assert (= capital_contribution_cash_only false))
(assert (= cash_contribution_only false))
(assert (= current_date 20190811))
(assert (= capital_compliance false))
(assert (= capital_requirement_met false))
(assert (= disclosure_of_contact_info false))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 16
; Total variables: 47
; Total facts: 47
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

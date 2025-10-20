; SMT2 file generated from compliance case automatic
; Case ID: case_255
; Generated at: 2025-10-19T11:29:35.931397
;
; This file can be executed with Z3:
;   z3 case_255.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const adjustment_period_and_extension Int)
(declare-const adjustment_period_years Int)
(declare-const application_documents_complete Bool)
(declare-const application_procedures_followed Bool)
(declare-const approved_investment_businesses Int)
(declare-const authority_measures_for_violation Bool)
(declare-const authority_opposition Bool)
(declare-const authority_orders_adjustment Bool)
(declare-const authority_orders_disposal Bool)
(declare-const banking_includes Bool)
(declare-const board_approval_ratio Real)
(declare-const board_attendance_ratio Real)
(declare-const business_scope_investment Bool)
(declare-const business_scope_management_of_invested_companies Bool)
(declare-const business_type_commercial_bank Bool)
(declare-const business_type_professional_bank Bool)
(declare-const business_type_trust_investment_company Bool)
(declare-const cancel_legal_meeting_resolution Bool)
(declare-const capital_reduction_application_submitted Bool)
(declare-const capital_reduction_approval Bool)
(declare-const capital_reduction_approval_granted Bool)
(declare-const central_authority_threshold Real)
(declare-const consumer_loan_amount_percentage Real)
(declare-const correction_order_issued Bool)
(declare-const credit_amount Real)
(declare-const credit_conditions Bool)
(declare-const credit_percentage_to_enterprise Real)
(declare-const days_since_application Int)
(declare-const director_or_supervisor_removed Bool)
(declare-const director_supervisor_removal_notification Bool)
(declare-const dispose_shares_completed Bool)
(declare-const dispose_shares_within_deadline Bool)
(declare-const dispose_subsidiary_shares Bool)
(declare-const each_extension_years Int)
(declare-const exceed_scope_adjustment_order Bool)
(declare-const extension_applied Bool)
(declare-const extension_times Int)
(declare-const fhc_officer_or_responsible_person_is_venture_investment_manager Bool)
(declare-const fhc_violation_or_risk Bool)
(declare-const full_collateral_provided Bool)
(declare-const futures_advisor Bool)
(declare-const futures_broker Bool)
(declare-const futures_includes Bool)
(declare-const futures_manager Bool)
(declare-const futures_trust Bool)
(declare-const has_interest_relation_with_responsible_or_credit_officer Bool)
(declare-const improvement_order_issued Bool)
(declare-const insurance_agent Bool)
(declare-const insurance_broker Bool)
(declare-const insurance_includes Bool)
(declare-const insurance_life Bool)
(declare-const insurance_property Bool)
(declare-const insurance_reinsurance_company Bool)
(declare-const investment_approval_timing Bool)
(declare-const investment_approved Bool)
(declare-const investment_banking Bool)
(declare-const investment_bill_finance Bool)
(declare-const investment_business_type_in_10_or_11 Bool)
(declare-const investment_business_type_in_1_to_9 Bool)
(declare-const investment_credit_card Bool)
(declare-const investment_fhc Bool)
(declare-const investment_foreign_financial_institutions Bool)
(declare-const investment_futures Bool)
(declare-const investment_insurance Bool)
(declare-const investment_other_financial_related_business Bool)
(declare-const investment_securities Bool)
(declare-const investment_trust Bool)
(declare-const investment_venture_capital Bool)
(declare-const investment_without_approval_prohibited Bool)
(declare-const is_major_shareholder Bool)
(declare-const is_officer Bool)
(declare-const is_responsible_person Bool)
(declare-const leveraged_trader Bool)
(declare-const license_revocation_requirements Bool)
(declare-const license_revoked Bool)
(declare-const loan_type_consumer Bool)
(declare-const loan_type_government Bool)
(declare-const major_shareholder_definition Bool)
(declare-const notify_ministry_of_economy Bool)
(declare-const other_necessary_measures Bool)
(declare-const penalty Bool)
(declare-const penalty_fine_imposed Bool)
(declare-const proceed_dissolution_and_liquidation Bool)
(declare-const prohibited_manager_role Bool)
(declare-const reduce_directors_to_meet_requirements Bool)
(declare-const remove_director_or_supervisor Bool)
(declare-const remove_manager_or_officer Bool)
(declare-const revoke_license Bool)
(declare-const secured_credit_requirements Bool)
(declare-const securities_broker Bool)
(declare-const securities_includes Bool)
(declare-const securities_investment_advisor Bool)
(declare-const securities_investment_trust Bool)
(declare-const shareholder_type_natural_person Bool)
(declare-const shareholding_including_spouse_and_minor_children Bool)
(declare-const shareholding_percentage Real)
(declare-const shares_not_counted_in_total Bool)
(declare-const shares_without_voting_rights Bool)
(declare-const similar_credit_conditions Bool)
(declare-const subsidiary_business_exceed_scope Bool)
(declare-const subsidiary_business_scope Bool)
(declare-const subsidiary_investment_exceed_scope Bool)
(declare-const suspend_subsidiary_business Bool)
(declare-const unsecured_credit_restriction Bool)
(declare-const use_fhc_name Bool)
(declare-const violation_investment_regulation Bool)
(declare-const violation_penalty_and_share_restriction Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bank:unsecured_credit_restriction] 銀行不得對持有實收資本3%以上之企業及相關人員為無擔保授信，消費者貸款及政府貸款除外
(assert (let ((a!1 (not (or has_interest_relation_with_responsible_or_credit_officer
                    (not (<= credit_percentage_to_enterprise 3.0))
                    is_major_shareholder
                    is_responsible_person
                    is_officer))))
(let ((a!2 (= (and (or loan_type_government
                       loan_type_consumer
                       (>= 3.0 consumer_loan_amount_percentage))
                   a!1)
              unsecured_credit_restriction)))
  (not a!2))))

; [bank:major_shareholder_definition] 主要股東定義及自然人股東持股計算
(assert (= major_shareholder_definition
   (and (<= 1.0 shareholding_percentage)
        shareholder_type_natural_person
        shareholding_including_spouse_and_minor_children)))

; [bank:secured_credit_requirements] 銀行對持有實收資本5%以上之企業及相關人員為擔保授信，應有十足擔保且條件不得優於同類授信
(assert (let ((a!1 (not (or has_interest_relation_with_responsible_or_credit_officer
                    is_major_shareholder
                    (not (<= credit_percentage_to_enterprise 5.0))
                    is_responsible_person
                    is_officer)))
      (a!2 (and full_collateral_provided
                (not (or similar_credit_conditions (not credit_conditions)))
                (or (not (>= credit_amount central_authority_threshold))
                    (and (<= (/ 6667.0 10000.0) board_attendance_ratio)
                         (<= (/ 3.0 4.0) board_approval_ratio))))))
  (= secured_credit_requirements (or a!1 a!2))))

; [fhc:subsidiary_business_scope] 金融控股公司子公司業務限於投資及被投資事業管理
(assert (= subsidiary_business_scope
   (and business_scope_investment
        business_scope_management_of_invested_companies)))

; [fhc:approved_investment_businesses] 金融控股公司得申請核准投資之事業範圍
(assert (= approved_investment_businesses
   (ite (or investment_insurance
            investment_credit_card
            investment_foreign_financial_institutions
            investment_trust
            investment_venture_capital
            investment_securities
            investment_futures
            investment_fhc
            investment_banking
            investment_bill_finance
            investment_other_financial_related_business)
        1
        0)))

; [fhc:banking_includes] 銀行業包括商業銀行、專業銀行及信託投資公司
(assert (= banking_includes
   (and business_type_commercial_bank
        business_type_professional_bank
        business_type_trust_investment_company)))

; [fhc:insurance_includes] 保險業包括財產保險、人身保險、再保險公司、保險代理人及經紀人
(assert (= insurance_includes
   (and insurance_property
        insurance_life
        insurance_reinsurance_company
        insurance_agent
        insurance_broker)))

; [fhc:securities_includes] 證券業包括證券商、證券投資信託事業、證券投資顧問事業
(assert (= securities_includes
   (and securities_broker
        securities_investment_trust
        securities_investment_advisor)))

; [fhc:futures_includes] 期貨業包括期貨商、槓桿交易商、期貨信託事業、期貨經理事業及期貨顧問事業
(assert (= futures_includes
   (and futures_broker
        leveraged_trader
        futures_trust
        futures_manager
        futures_advisor)))

; [fhc:investment_approval_timing] 金融控股公司投資申請未於期限內反對視為核准
(assert (= investment_approval_timing
   (or (and investment_business_type_in_1_to_9
            (>= 15 days_since_application)
            (not authority_opposition))
       (and investment_business_type_in_10_or_11
            (>= 30 days_since_application)
            (not authority_opposition)))))

; [fhc:investment_without_approval_prohibited] 金融控股公司及其關係企業未經核准不得進行投資行為
(assert (not (= investment_approved investment_without_approval_prohibited)))

; [fhc:violation_penalty_and_share_restriction] 違反投資規定者處罰且股份無表決權不計入已發行股份
(assert (= violation_penalty_and_share_restriction
   (or (not violation_investment_regulation)
       (and penalty_fine_imposed
            shares_without_voting_rights
            shares_not_counted_in_total
            authority_orders_disposal))))

; [fhc:exceed_scope_adjustment_order] 子公司業務或投資逾越規定者主管機關應限期命其調整
(assert (= exceed_scope_adjustment_order
   (or (not (or subsidiary_business_exceed_scope
                subsidiary_investment_exceed_scope))
       authority_orders_adjustment)))

; [fhc:adjustment_period_and_extension] 調整期限最長三年，必要時得申請延長二次，每次二年
(assert (let ((a!1 (and (>= 3 adjustment_period_years)
                (or (not extension_applied)
                    (and (>= 2 extension_times) (>= 2 each_extension_years))))))
  (= adjustment_period_and_extension (ite a!1 1 0))))

; [fhc:prohibited_manager_role] 金融控股公司負責人或職員不得擔任創業投資事業投資事業經理人
(assert (not (= fhc_officer_or_responsible_person_is_venture_investment_manager
        prohibited_manager_role)))

; [fhc:capital_reduction_approval] 金融控股公司子公司減資應事先申請核准並依主管機關定之程序辦理
(assert (= capital_reduction_approval
   (and capital_reduction_application_submitted
        capital_reduction_approval_granted
        application_documents_complete
        application_procedures_followed)))

; [fhc:authority_measures_for_violation] 主管機關對違反法令或有礙健全經營者得採取各項處分措施
(assert (= authority_measures_for_violation
   (or correction_order_issued
       cancel_legal_meeting_resolution
       remove_director_or_supervisor
       suspend_subsidiary_business
       revoke_license
       dispose_subsidiary_shares
       (not fhc_violation_or_risk)
       improvement_order_issued
       remove_manager_or_officer
       other_necessary_measures)))

; [fhc:director_supervisor_removal_notification] 解除董事監察人職務時通知經濟部廢止登記
(assert (= director_supervisor_removal_notification
   (or (not director_or_supervisor_removed) notify_ministry_of_economy)))

; [fhc:license_revocation_requirements] 廢止許可時應令金融控股公司於期限內處分股份及董事人數不符規定並不得再使用名稱
(assert (= license_revocation_requirements
   (or (not license_revoked)
       (and dispose_shares_within_deadline
            reduce_directors_to_meet_requirements
            (not use_fhc_name)
            (or dispose_shares_completed proceed_dissolution_and_liquidation)))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反銀行無擔保授信限制或擔保授信條件，或金融控股公司投資及經營規定時處罰
(assert (= penalty
   (or (not unsecured_credit_restriction)
       (not violation_penalty_and_share_restriction)
       (not prohibited_manager_role)
       (not investment_without_approval_prohibited)
       (not exceed_scope_adjustment_order)
       (not authority_measures_for_violation)
       (not license_revocation_requirements)
       (not secured_credit_requirements)
       (not capital_reduction_approval)
       (not director_supervisor_removal_notification))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= unsecured_credit_restriction false))
(assert (= credit_percentage_to_enterprise (/ 717.0 10.0)))
(assert (= is_officer true))
(assert (= has_interest_relation_with_responsible_or_credit_officer true))
(assert (= full_collateral_provided false))
(assert (= loan_type_consumer false))
(assert (= loan_type_government false))
(assert (= is_responsible_person false))
(assert (= shareholding_percentage 0.0))
(assert (= shareholder_type_natural_person false))
(assert (= shareholding_including_spouse_and_minor_children false))
(assert (= major_shareholder_definition false))
(assert (= secured_credit_requirements false))
(assert (= investment_approved true))
(assert (= violation_investment_regulation true))
(assert (= penalty_fine_imposed true))
(assert (= shares_without_voting_rights true))
(assert (= shares_not_counted_in_total true))
(assert (= authority_orders_disposal true))
(assert (= subsidiary_business_exceed_scope false))
(assert (= subsidiary_investment_exceed_scope false))
(assert (= authority_orders_adjustment false))
(assert (= extension_applied false))
(assert (= extension_times 0))
(assert (= adjustment_period_years 0))
(assert (= each_extension_years 0))
(assert (= adjustment_period_and_extension 0))
(assert (= fhc_officer_or_responsible_person_is_venture_investment_manager false))
(assert (= fhc_violation_or_risk true))
(assert (= correction_order_issued false))
(assert (= improvement_order_issued false))
(assert (= cancel_legal_meeting_resolution false))
(assert (= suspend_subsidiary_business false))
(assert (= remove_manager_or_officer true))
(assert (= remove_director_or_supervisor false))
(assert (= dispose_subsidiary_shares false))
(assert (= revoke_license false))
(assert (= other_necessary_measures false))
(assert (= director_or_supervisor_removed false))
(assert (= notify_ministry_of_economy false))
(assert (= license_revoked false))
(assert (= dispose_shares_within_deadline false))
(assert (= reduce_directors_to_meet_requirements false))
(assert (= use_fhc_name false))
(assert (= dispose_shares_completed false))
(assert (= proceed_dissolution_and_liquidation false))
(assert (= investment_business_type_in_1_to_9 false))
(assert (= investment_business_type_in_10_or_11 false))
(assert (= days_since_application 0))
(assert (= authority_opposition false))
(assert (= investment_fhc true))
(assert (= investment_banking true))
(assert (= investment_bill_finance false))
(assert (= investment_credit_card false))
(assert (= investment_trust false))
(assert (= investment_insurance false))
(assert (= investment_securities false))
(assert (= investment_futures false))
(assert (= investment_venture_capital false))
(assert (= investment_foreign_financial_institutions false))
(assert (= investment_other_financial_related_business false))
(assert (= banking_includes true))
(assert (= business_scope_investment true))
(assert (= business_scope_management_of_invested_companies true))
(assert (= business_type_commercial_bank true))
(assert (= business_type_professional_bank true))
(assert (= business_type_trust_investment_company true))
(assert (= insurance_property false))
(assert (= insurance_life false))
(assert (= insurance_reinsurance_company false))
(assert (= insurance_agent false))
(assert (= insurance_broker false))
(assert (= insurance_includes false))
(assert (= securities_broker false))
(assert (= securities_investment_trust false))
(assert (= securities_investment_advisor false))
(assert (= securities_includes false))
(assert (= futures_broker false))
(assert (= leveraged_trader false))
(assert (= futures_trust false))
(assert (= futures_manager false))
(assert (= futures_advisor false))
(assert (= futures_includes false))
(assert (= capital_reduction_application_submitted false))
(assert (= capital_reduction_approval false))
(assert (= capital_reduction_approval_granted false))
(assert (= application_documents_complete false))
(assert (= application_procedures_followed false))
(assert (= penalty true))
(assert (= approved_investment_businesses 0))
(assert (= authority_measures_for_violation false))
(assert (= board_approval_ratio 0.0))
(assert (= board_attendance_ratio 0.0))
(assert (= central_authority_threshold 0.0))
(assert (= consumer_loan_amount_percentage 0.0))
(assert (= credit_amount 0.0))
(assert (= credit_conditions false))
(assert (= director_supervisor_removal_notification false))
(assert (= exceed_scope_adjustment_order false))
(assert (= investment_approval_timing false))
(assert (= investment_without_approval_prohibited false))
(assert (= is_major_shareholder false))
(assert (= license_revocation_requirements false))
(assert (= prohibited_manager_role false))
(assert (= similar_credit_conditions false))
(assert (= subsidiary_business_scope false))
(assert (= violation_penalty_and_share_restriction false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 21
; Total variables: 107
; Total facts: 107
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

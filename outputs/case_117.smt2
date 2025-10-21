; SMT2 file generated from compliance case automatic
; Case ID: case_117
; Generated at: 2025-10-21T02:09:28.353912
;
; This file can be executed with Z3:
;   z3 case_117.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const CAR Real)
(declare-const NWR Real)
(declare-const capital_increase_or_improvement_plan_completed Bool)
(declare-const capital_level Int)
(declare-const company_law_369_11_compliant Bool)
(declare-const company_law_369_1_to_369_3_compliant Bool)
(declare-const company_law_369_9_compliant Bool)
(declare-const company_law_procedure_exempted Bool)
(declare-const contract_or_major_commitment_made Bool)
(declare-const deadline_extended_or_plan_resubmitted Bool)
(declare-const degree_of_kinship Int)
(declare-const equity_exchange_or_benefit_transfer Bool)
(declare-const financial_or_business_condition_significantly_deteriorated Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const inspection_rules_applied Bool)
(declare-const insured_interest_not_harmed Bool)
(declare-const insured_interest_protected Bool)
(declare-const is_assistant_manager Bool)
(declare-const is_deputy_general_manager Bool)
(declare-const is_director Bool)
(declare-const is_equivalent_position Bool)
(declare-const is_general_manager Bool)
(declare-const is_manager Bool)
(declare-const is_related_enterprise Bool)
(declare-const is_responsible_person_enterprise Bool)
(declare-const is_responsible_person_of_enterprise Bool)
(declare-const is_responsible_person_or_major_shareholder Bool)
(declare-const is_self_or_spouse Bool)
(declare-const is_subsidiary_responsible_person Bool)
(declare-const is_supervisor Bool)
(declare-const legal_person Bool)
(declare-const level_2_measures_executed Bool)
(declare-const level_3_measures_done Bool)
(declare-const level_3_measures_executed Bool)
(declare-const level_4_measures_done Bool)
(declare-const level_4_measures_executed Bool)
(declare-const major_shareholder_defined Bool)
(declare-const natural_person Bool)
(declare-const net_worth Real)
(declare-const other_major_financial_impact Bool)
(declare-const other_transaction_limit_complied Bool)
(declare-const other_transaction_limit_ok Bool)
(declare-const other_transaction_must_follow_procedures Bool)
(declare-const other_transaction_scope_defined_by_authority Bool)
(declare-const payment_amount Real)
(declare-const penalty Bool)
(declare-const person_type Int)
(declare-const procurement_law_exempted Bool)
(declare-const procurement_law_not_applicable Bool)
(declare-const prohibited_equity_exchange Bool)
(declare-const proxy_request_prohibited Bool)
(declare-const proxy_requester Bool)
(declare-const proxy_requester_agent Bool)
(declare-const receivership_procedure_exempted Bool)
(declare-const related_enterprise_scope_ok Bool)
(declare-const related_person_same Bool)
(declare-const related_person_scope_defined Bool)
(declare-const related_person_scope_ok Bool)
(declare-const reorganization_application_filed Bool)
(declare-const reorganization_application_ok Bool)
(declare-const responsible_person_defined Bool)
(declare-const risk_of_harming_insured_rights Bool)
(declare-const shareholding_percentage_including_spouse_and_minor_children Real)
(declare-const supervision_delegate_assigned Bool)
(declare-const supervision_delegate_ok Bool)
(declare-const supervision_inspection_applied Bool)
(declare-const supervision_limit Real)
(declare-const supervision_measures_applicable Bool)
(declare-const supervision_measures_deadline_extended Bool)
(declare-const supervision_restrictions_complied Bool)
(declare-const unable_to_fulfill_contracts Bool)
(declare-const unable_to_pay_debts Bool)
(declare-const voting_rights_evaluation_done Bool)
(declare-const voting_rights_evaluation_reported Bool)
(declare-const voting_rights_record_reported Bool)
(declare-const voting_rights_record_submitted Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:related_person_definition] 同一人定義為同一自然人或同一法人
(assert (= related_person_same
   (or (= person_type (ite legal_person 1 0))
       (= person_type (ite natural_person 1 0)))))

; [insurance:related_person_scope] 同一關係人範圍包含本人、配偶、二親等以內血親及本人或配偶為負責人之事業
(assert (= related_person_scope_ok
   (and is_self_or_spouse
        (>= 2 degree_of_kinship)
        is_responsible_person_of_enterprise)))

; [insurance:related_enterprise_scope] 同一關係企業範圍依公司法369-1至369-3、369-9及369-11規定
(assert (= related_enterprise_scope_ok
   (and company_law_369_1_to_369_3_compliant
        company_law_369_9_compliant
        company_law_369_11_compliant)))

; [insurance:other_transaction_limit_compliance] 保險業與利害關係人從事放款以外其他交易符合主管機關規定
(assert (= other_transaction_limit_ok
   (and other_transaction_scope_defined_by_authority
        other_transaction_limit_complied
        other_transaction_must_follow_procedures)))

; [insurance:prohibited_equity_exchange] 保險業不得與被投資公司或第三人以信託、委任或其他契約約定股權交換或利益輸送
(assert (not (= equity_exchange_or_benefit_transfer prohibited_equity_exchange)))

; [insurance:protect_insured_interest] 不得損及要保人、被保險人或受益人利益
(assert (= insured_interest_protected insured_interest_not_harmed))

; [insurance:voting_rights_evaluation] 出席被投資公司股東會前應作成行使表決權評估分析說明
(assert (= voting_rights_evaluation_done voting_rights_evaluation_reported))

; [insurance:voting_rights_record_reported] 股東會後應將行使表決權書面紀錄提報董事會
(assert (= voting_rights_record_reported voting_rights_record_submitted))

; [insurance:proxy_request_prohibition] 保險業及其從屬公司不得擔任被投資公司委託書徵求人或委託他人擔任
(assert (not (= (or proxy_requester proxy_requester_agent) proxy_request_prohibited)))

; [insurance:capital_level_classification] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未分類）
(assert (let ((a!1 (ite (and (<= 150.0 CAR) (not (<= 200.0 CAR)))
                2
                (ite (<= 200.0 CAR) 1 0))))
(let ((a!2 (ite (and (<= 50.0 CAR)
                     (not (<= 150.0 CAR))
                     (<= 0.0 NWR)
                     (not (<= 2.0 NWR)))
                3
                a!1)))
(let ((a!3 (ite (or (not (<= 0.0 net_worth)) (not (<= 50.0 CAR))) 4 a!2)))
  (= capital_level a!3)))))

; [insurance:capital_level_4_measures_executed] 資本嚴重不足等級4措施已執行
(assert (= level_4_measures_executed level_4_measures_done))

; [insurance:capital_level_3_measures_executed] 資本顯著不足等級3措施已執行
(assert (= level_3_measures_executed level_3_measures_done))

; [insurance:capital_level_2_measures_executed] 資本不足等級2措施已執行
(assert (= level_2_measures_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:supervision_measures] 主管機關對違反法令或有礙健全經營保險業得採取監管、接管、勒令停業清理或命令解散等處分
(assert (let ((a!1 (or (and (= 4 capital_level)
                    (not capital_increase_or_improvement_plan_completed))
               (and (not (= 4 capital_level))
                    financial_or_business_condition_significantly_deteriorated
                    (or unable_to_fulfill_contracts
                        risk_of_harming_insured_rights
                        unable_to_pay_debts)))))
  (= supervision_measures_applicable a!1)))

; [insurance:supervision_measures_deadline_extension] 主管機關得延長期限或重新提具增資、改善或合併計畫
(assert (= supervision_measures_deadline_extended deadline_extended_or_plan_resubmitted))

; [insurance:supervision_delegate] 主管機關得委託其他保險業、相關機構或專業人員擔任監管人、接管人、清理人或清算人
(assert (= supervision_delegate_ok supervision_delegate_assigned))

; [insurance:procurement_law_not_applicable] 主管機關委託相關機構或個人辦理受委託事項時，不適用政府採購法
(assert (= procurement_law_not_applicable procurement_law_exempted))

; [insurance:receivership_procedure_exemption] 保險業受接管或勒令停業清理時，不適用公司法臨時管理人或檢查人規定
(assert (= receivership_procedure_exempted company_law_procedure_exempted))

; [insurance:reorganization_application] 接管人依本法規定聲請重整，法院得合併審理或裁定
(assert (= reorganization_application_ok reorganization_application_filed))

; [insurance:supervision_restrictions] 保險業監管處分期間不得超過主管機關規定限額支付款項或處分財產等
(assert (= supervision_restrictions_complied
   (and (<= payment_amount supervision_limit)
        (not contract_or_major_commitment_made)
        (not other_major_financial_impact))))

; [insurance:supervision_inspection_applied] 監管人執行監管職務時準用檢查規定
(assert (= supervision_inspection_applied inspection_rules_applied))

; [insurance:related_person_scope_definition] 利害關係人範圍包括負責人、大股東及其相關企業等
(assert (= related_person_scope_defined
   (and is_responsible_person_or_major_shareholder
        is_responsible_person_enterprise
        is_related_enterprise
        is_subsidiary_responsible_person)))

; [insurance:responsible_person_definition] 負責人範圍包括董事、監察人、總經理、副總經理、協理、經理或相當職責人員
(assert (= responsible_person_defined
   (or is_assistant_manager
       is_equivalent_position
       is_supervisor
       is_manager
       is_general_manager
       is_director
       is_deputy_general_manager)))

; [insurance:major_shareholder_definition] 大股東指持有保險業已發行股份總數10%以上者，含配偶及未成年子女持股
(assert (= major_shareholder_defined
   (<= 10.0 shareholding_percentage_including_spouse_and_minor_children)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反資本等級規定且未執行對應措施，或違反其他法令規定時處罰
(assert (= penalty
   (or (not related_enterprise_scope_ok)
       (not other_transaction_limit_ok)
       (not supervision_delegate_ok)
       (not supervision_measures_applicable)
       (and (= 2 capital_level) (not level_2_measures_executed))
       (not voting_rights_record_reported)
       (not related_person_scope_defined)
       (and (= 3 capital_level) (not level_3_measures_executed))
       (not prohibited_equity_exchange)
       (not voting_rights_evaluation_done)
       (not proxy_request_prohibited)
       (not related_person_same)
       (not insured_interest_protected)
       (not responsible_person_defined)
       (and (= 4 capital_level) (not level_4_measures_executed))
       (not supervision_inspection_applied)
       (not major_shareholder_defined)
       (not related_person_scope_ok))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= CAR 120.0))
(assert (= NWR (/ 3.0 2.0)))
(assert (= capital_increase_or_improvement_plan_completed false))
(assert (= capital_level 3))
(assert (= company_law_369_1_to_369_3_compliant true))
(assert (= company_law_369_9_compliant true))
(assert (= company_law_369_11_compliant true))
(assert (= company_law_procedure_exempted false))
(assert (= contract_or_major_commitment_made false))
(assert (= deadline_extended_or_plan_resubmitted false))
(assert (= degree_of_kinship 3))
(assert (= equity_exchange_or_benefit_transfer true))
(assert (= financial_or_business_condition_significantly_deteriorated false))
(assert (= improvement_plan_executed false))
(assert (= improvement_plan_submitted false))
(assert (= inspection_rules_applied true))
(assert (= insured_interest_not_harmed false))
(assert (= insured_interest_protected false))
(assert (= is_assistant_manager false))
(assert (= is_deputy_general_manager false))
(assert (= is_director false))
(assert (= is_equivalent_position false))
(assert (= is_general_manager false))
(assert (= is_manager false))
(assert (= is_related_enterprise false))
(assert (= is_responsible_person_enterprise false))
(assert (= is_responsible_person_of_enterprise false))
(assert (= is_responsible_person_or_major_shareholder false))
(assert (= is_self_or_spouse false))
(assert (= is_subsidiary_responsible_person false))
(assert (= is_supervisor false))
(assert (= legal_person true))
(assert (= level_2_measures_executed false))
(assert (= level_3_measures_done false))
(assert (= level_3_measures_executed false))
(assert (= level_4_measures_done false))
(assert (= level_4_measures_executed false))
(assert (= major_shareholder_defined false))
(assert (= net_worth 100.0))
(assert (= other_major_financial_impact false))
(assert (= other_transaction_limit_complied false))
(assert (= other_transaction_limit_ok false))
(assert (= other_transaction_must_follow_procedures false))
(assert (= other_transaction_scope_defined_by_authority false))
(assert (= payment_amount 0.0))
(assert (= penalty true))
(assert (= person_type 1))
(assert (= procurement_law_exempted true))
(assert (= procurement_law_not_applicable true))
(assert (= prohibited_equity_exchange false))
(assert (= proxy_request_prohibited false))
(assert (= proxy_requester false))
(assert (= proxy_requester_agent false))
(assert (= receivership_procedure_exempted false))
(assert (= related_enterprise_scope_ok false))
(assert (= related_person_same false))
(assert (= related_person_scope_defined false))
(assert (= related_person_scope_ok false))
(assert (= reorganization_application_filed false))
(assert (= reorganization_application_ok false))
(assert (= responsible_person_defined false))
(assert (= risk_of_harming_insured_rights false))
(assert (= shareholding_percentage_including_spouse_and_minor_children 5.0))
(assert (= supervision_delegate_assigned false))
(assert (= supervision_delegate_ok false))
(assert (= supervision_inspection_applied true))
(assert (= supervision_limit 1000000.0))
(assert (= supervision_measures_applicable false))
(assert (= supervision_measures_deadline_extended false))
(assert (= supervision_restrictions_complied true))
(assert (= unable_to_fulfill_contracts false))
(assert (= unable_to_pay_debts false))
(assert (= voting_rights_evaluation_done false))
(assert (= voting_rights_evaluation_reported false))
(assert (= voting_rights_record_reported false))
(assert (= voting_rights_record_submitted false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 26
; Total variables: 77
; Total facts: 76
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

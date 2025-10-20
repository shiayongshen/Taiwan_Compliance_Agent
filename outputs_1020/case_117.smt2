; SMT2 file generated from compliance case automatic
; Case ID: case_117
; Generated at: 2025-10-19T08:27:44.044385
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
(declare-const benefit_transfer Bool)
(declare-const capital_level Int)
(declare-const capital_level_2_measures_executed Bool)
(declare-const capital_level_3_measures_completed Bool)
(declare-const capital_level_3_measures_executed Bool)
(declare-const capital_level_4_measures_completed Bool)
(declare-const capital_level_4_measures_executed Bool)
(declare-const capital_or_responsible_person_completed_capital_increase_or_improvement Bool)
(declare-const damage_to_policyholder Bool)
(declare-const equity_exchange_agreement Bool)
(declare-const financial_or_business_condition_significantly_deteriorated Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const include_spouse_and_minor_children Bool)
(declare-const loan_exceed_board_approval_or_limit Bool)
(declare-const loan_exceed_board_approval_penalty Bool)
(declare-const loan_without_sufficient_collateral_or_better_condition Bool)
(declare-const loan_without_sufficient_collateral_penalty Bool)
(declare-const loss_or_net_worth_accelerated_deterioration Bool)
(declare-const major_shareholder_definition Bool)
(declare-const net_worth Real)
(declare-const penalty Bool)
(declare-const prohibited_equity_exchange Bool)
(declare-const prohibited_proxy_requester Bool)
(declare-const proxy_requester_agent Bool)
(declare-const proxy_requester_self Bool)
(declare-const related_enterprise_company_law_applied Bool)
(declare-const related_party_definition Bool)
(declare-const related_party_related_enterprise_and_responsible_person_or_major_shareholder Bool)
(declare-const related_party_responsible_person_or_major_shareholder Bool)
(declare-const related_party_responsible_person_or_major_shareholder_enterprise Bool)
(declare-const related_party_scope_definition Bool)
(declare-const related_party_subsidiary_and_responsible_person Bool)
(declare-const related_person_blood_degree Int)
(declare-const related_person_responsible_enterprise Bool)
(declare-const related_person_self Bool)
(declare-const related_person_spouse Bool)
(declare-const responsible_person_assistant_manager Bool)
(declare-const responsible_person_definition Bool)
(declare-const responsible_person_deputy_general_manager Bool)
(declare-const responsible_person_director Bool)
(declare-const responsible_person_equivalent_position Bool)
(declare-const responsible_person_general_manager Bool)
(declare-const responsible_person_manager Bool)
(declare-const responsible_person_supervisor Bool)
(declare-const same_legal_person Bool)
(declare-const same_natural_person Bool)
(declare-const shareholder_is_natural_person Bool)
(declare-const shareholder_meeting_vote_documented Bool)
(declare-const shareholding_percentage Real)
(declare-const supervision_penalty_conditions Bool)
(declare-const unable_to_pay_debt_or_fulfill_contract Bool)
(declare-const violate_article_143 Bool)
(declare-const violate_article_143_5_or_143_6_measures Bool)
(declare-const violate_business_scope_regulations Bool)
(declare-const violate_fund_use_regulations Bool)
(declare-const violate_loan_or_other_transaction_limit_or_resolution Bool)
(declare-const violate_reserve_provision_regulations Bool)
(declare-const violation_article_143_5_6_penalty Bool)
(declare-const violation_article_143_penalty Bool)
(declare-const violation_business_scope_penalty Bool)
(declare-const violation_fund_use_penalty Bool)
(declare-const violation_loan_or_other_transaction_limit_penalty Bool)
(declare-const violation_reserve_penalty Bool)
(declare-const vote_evaluation_prepared Bool)
(declare-const vote_record_reported_to_board Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:related_party_definition] 同一人、同一關係人及同一關係企業定義
(assert (= related_party_definition
   (and (or same_natural_person same_legal_person)
        (or (>= 2 related_person_blood_degree)
            related_person_self
            related_person_spouse
            related_person_responsible_enterprise)
        related_enterprise_company_law_applied)))

; [insurance:prohibited_equity_exchange] 禁止保險業與被投資公司或第三人以信託、委任或其他契約約定股權交換或利益輸送
(assert (= prohibited_equity_exchange
   (and (not equity_exchange_agreement)
        (not benefit_transfer)
        (not damage_to_policyholder))))

; [insurance:shareholder_meeting_vote_documented] 股東會表決權評估分析及董事會提報
(assert (= shareholder_meeting_vote_documented
   (and vote_evaluation_prepared vote_record_reported_to_board)))

; [insurance:prohibited_proxy_requester] 保險業及其從屬公司不得擔任被投資公司委託書徵求人
(assert (= prohibited_proxy_requester
   (and (not proxy_requester_self) (not proxy_requester_agent))))

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
(assert (let ((a!1 (ite (and (<= 150.0 CAR) (not (<= 200.0 CAR)))
                2
                (ite (<= 200.0 CAR) 1 0))))
(let ((a!2 (ite (and (<= 50.0 CAR)
                     (not (<= 150.0 CAR))
                     (<= 0.0 NWR)
                     (not (<= 2.0 NWR)))
                3
                a!1)))
(let ((a!3 (ite (or (not (<= 50.0 CAR)) (not (<= 0.0 net_worth))) 4 a!2)))
  (= capital_level a!3)))))

; [insurance:capital_level_4_measures_executed] 資本嚴重不足等級措施已執行
(assert (= capital_level_4_measures_executed capital_level_4_measures_completed))

; [insurance:capital_level_3_measures_executed] 資本顯著不足等級措施已執行
(assert (= capital_level_3_measures_executed capital_level_3_measures_completed))

; [insurance:capital_level_2_measures_executed] 資本不足等級措施已執行
(assert (= capital_level_2_measures_executed
   (and improvement_plan_submitted improvement_plan_executed)))

; [insurance:supervision_penalty_conditions] 主管機關對資本嚴重不足且未完成增資或改善計畫者，得為接管等處分
(assert (= supervision_penalty_conditions
   (or (and (= 4 capital_level)
            (not capital_or_responsible_person_completed_capital_increase_or_improvement))
       (and financial_or_business_condition_significantly_deteriorated
            unable_to_pay_debt_or_fulfill_contract
            (not improvement_plan_approved))
       (and financial_or_business_condition_significantly_deteriorated
            unable_to_pay_debt_or_fulfill_contract
            loss_or_net_worth_accelerated_deterioration
            (not improvement_plan_executed)))))

; [insurance:violation_business_scope_penalty] 違反業務範圍規定處罰
(assert (= violation_business_scope_penalty violate_business_scope_regulations))

; [insurance:violation_reserve_penalty] 違反賠償準備金提存額度及方式規定處罰
(assert (= violation_reserve_penalty violate_reserve_provision_regulations))

; [insurance:violation_article_143_penalty] 違反第一百四十三條規定處罰
(assert (= violation_article_143_penalty violate_article_143))

; [insurance:violation_article_143_5_6_penalty] 違反第一百四十三條之五或主管機關依第一百四十三條之六措施處罰
(assert (= violation_article_143_5_6_penalty violate_article_143_5_or_143_6_measures))

; [insurance:violation_fund_use_penalty] 違反資金運用相關規定處罰或解除負責人職務
(assert (= violation_fund_use_penalty violate_fund_use_regulations))

; [insurance:loan_without_sufficient_collateral_penalty] 放款無十足擔保或條件優於其他同類放款對象者處刑罰
(assert (= loan_without_sufficient_collateral_penalty
   loan_without_sufficient_collateral_or_better_condition))

; [insurance:loan_exceed_board_approval_penalty] 擔保放款未經董事會三分之二出席及四分之三同意或違反放款限額規定處罰
(assert (= loan_exceed_board_approval_penalty loan_exceed_board_approval_or_limit))

; [insurance:violation_loan_or_other_transaction_limit_penalty] 違反放款或其他交易限額及決議程序規定處罰
(assert (= violation_loan_or_other_transaction_limit_penalty
   violate_loan_or_other_transaction_limit_or_resolution))

; [insurance:related_party_scope_definition] 利害關係人範圍定義
(assert (= related_party_scope_definition
   (or related_party_subsidiary_and_responsible_person
       related_party_responsible_person_or_major_shareholder
       related_party_responsible_person_or_major_shareholder_enterprise
       related_party_related_enterprise_and_responsible_person_or_major_shareholder)))

; [insurance:responsible_person_definition] 負責人範圍定義
(assert (= responsible_person_definition
   (or responsible_person_equivalent_position
       responsible_person_manager
       responsible_person_deputy_general_manager
       responsible_person_supervisor
       responsible_person_assistant_manager
       responsible_person_director
       responsible_person_general_manager)))

; [insurance:major_shareholder_definition] 大股東定義
(assert (= major_shareholder_definition
   (or (<= 10.0 shareholding_percentage)
       (and shareholder_is_natural_person include_spouse_and_minor_children))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反資本等級措施或違反相關法令規定時處罰
(assert (= penalty
   (or loan_without_sufficient_collateral_penalty
       violation_fund_use_penalty
       (and (= 3 capital_level) (not capital_level_3_measures_executed))
       loan_exceed_board_approval_penalty
       violation_loan_or_other_transaction_limit_penalty
       violation_article_143_penalty
       violation_reserve_penalty
       (and (= 4 capital_level) (not capital_level_4_measures_executed))
       violation_article_143_5_6_penalty
       (and (= 2 capital_level) (not capital_level_2_measures_executed))
       violation_business_scope_penalty)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= CAR 100.0))
(assert (= NWR 50.0))
(assert (= net_worth 50.0))
(assert (= benefit_transfer false))
(assert (= equity_exchange_agreement false))
(assert (= prohibited_equity_exchange true))
(assert (= vote_evaluation_prepared false))
(assert (= vote_record_reported_to_board false))
(assert (= shareholder_meeting_vote_documented false))
(assert (= proxy_requester_self false))
(assert (= proxy_requester_agent false))
(assert (= prohibited_proxy_requester true))
(assert (= related_party_definition true))
(assert (= same_natural_person true))
(assert (= same_legal_person false))
(assert (= related_person_self true))
(assert (= related_person_spouse true))
(assert (= related_person_blood_degree 2))
(assert (= related_person_responsible_enterprise true))
(assert (= related_enterprise_company_law_applied true))
(assert (= related_party_responsible_person_or_major_shareholder true))
(assert (= related_party_responsible_person_or_major_shareholder_enterprise true))
(assert (= related_party_related_enterprise_and_responsible_person_or_major_shareholder true))
(assert (= related_party_subsidiary_and_responsible_person true))
(assert (= related_party_scope_definition true))
(assert (= responsible_person_definition true))
(assert (= responsible_person_director true))
(assert (= responsible_person_supervisor false))
(assert (= responsible_person_general_manager false))
(assert (= responsible_person_deputy_general_manager false))
(assert (= responsible_person_assistant_manager false))
(assert (= responsible_person_manager false))
(assert (= responsible_person_equivalent_position false))
(assert (= major_shareholder_definition true))
(assert (= shareholding_percentage 15.0))
(assert (= shareholder_is_natural_person true))
(assert (= include_spouse_and_minor_children true))
(assert (= violate_business_scope_regulations true))
(assert (= violation_business_scope_penalty true))
(assert (= violate_reserve_provision_regulations false))
(assert (= violation_reserve_penalty false))
(assert (= violate_article_143 false))
(assert (= violation_article_143_penalty false))
(assert (= violate_article_143_5_or_143_6_measures false))
(assert (= violation_article_143_5_6_penalty false))
(assert (= violate_fund_use_regulations true))
(assert (= violation_fund_use_penalty true))
(assert (= loan_without_sufficient_collateral_or_better_condition false))
(assert (= loan_without_sufficient_collateral_penalty false))
(assert (= loan_exceed_board_approval_or_limit false))
(assert (= loan_exceed_board_approval_penalty false))
(assert (= violate_loan_or_other_transaction_limit_or_resolution true))
(assert (= violation_loan_or_other_transaction_limit_penalty true))
(assert (= capital_level_2_measures_executed false))
(assert (= capital_level_3_measures_completed false))
(assert (= capital_level_3_measures_executed false))
(assert (= capital_level_4_measures_completed false))
(assert (= capital_level_4_measures_executed false))
(assert (= capital_or_responsible_person_completed_capital_increase_or_improvement false))
(assert (= financial_or_business_condition_significantly_deteriorated false))
(assert (= unable_to_pay_debt_or_fulfill_contract false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_executed false))
(assert (= improvement_plan_submitted false))
(assert (= loss_or_net_worth_accelerated_deterioration false))
(assert (= penalty true))
(assert (= capital_level 0))
(assert (= damage_to_policyholder false))
(assert (= supervision_penalty_conditions false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 22
; Total variables: 69
; Total facts: 69
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

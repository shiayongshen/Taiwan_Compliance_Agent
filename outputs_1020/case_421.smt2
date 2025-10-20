; SMT2 file generated from compliance case automatic
; Case ID: case_421
; Generated at: 2025-10-19T15:29:27.284256
;
; This file can be executed with Z3:
;   z3 case_421.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const funds_misuse Bool)
(declare-const funds_misuse_flag Bool)
(declare-const insured_interest_not_harmed Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const internal_handling_compliance Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_system_established Bool)
(declare-const internal_handling_system_executed Bool)
(declare-const loan_guarantee_no_board_approval Bool)
(declare-const loan_guarantee_without_board_approval Bool)
(declare-const loan_limit_violation Bool)
(declare-const loan_limit_violation_flag Bool)
(declare-const loan_without_sufficient_collateral Bool)
(declare-const loan_without_sufficient_collateral_flag Bool)
(declare-const penalty Bool)
(declare-const prohibited_share_exchange Bool)
(declare-const protect_insured_interest Bool)
(declare-const proxy_solicitor_agent Bool)
(declare-const proxy_solicitor_prohibited Bool)
(declare-const proxy_solicitor_self Bool)
(declare-const share_exchange_agreement Bool)
(declare-const share_exchange_authorization Bool)
(declare-const share_exchange_commission_agreement Bool)
(declare-const share_exchange_other_contract Bool)
(declare-const share_exchange_other_method Bool)
(declare-const share_exchange_trust_agreement Bool)
(declare-const violate_article_138_2_related Bool)
(declare-const violate_article_138_related Bool)
(declare-const violate_article_143 Bool)
(declare-const violate_article_143_5_or_measures Bool)
(declare-const violate_article_148_1_or_2 Bool)
(declare-const violate_article_148_2_1 Bool)
(declare-const violate_article_148_2_2 Bool)
(declare-const violation_138_2_related Bool)
(declare-const violation_138_related Bool)
(declare-const violation_143 Bool)
(declare-const violation_143_5_or_measures Bool)
(declare-const violation_148_1_or_2 Bool)
(declare-const violation_148_2_1 Bool)
(declare-const violation_148_2_2 Bool)
(declare-const violation_148_3_1 Bool)
(declare-const violation_148_3_2 Bool)
(declare-const vote_evaluation_report_pre_meeting Bool)
(declare-const vote_evaluation_reported Bool)
(declare-const vote_record_reported Bool)
(declare-const vote_record_reported_to_board Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:prohibited_share_exchange] 不得與被投資公司或第三人以信託、委任或其他契約約定或以協議、授權或其他方法進行股權交換或利益輸送
(assert (not (= (or share_exchange_trust_agreement
            share_exchange_authorization
            share_exchange_commission_agreement
            share_exchange_other_contract
            share_exchange_agreement
            share_exchange_other_method)
        prohibited_share_exchange)))

; [insurance:protect_insured_interest] 不得損及要保人、被保險人或受益人之利益
(assert (= protect_insured_interest insured_interest_not_harmed))

; [insurance:vote_evaluation_reported] 出席被投資公司股東會前，應將行使表決權之評估分析作業作成說明
(assert (= vote_evaluation_reported vote_evaluation_report_pre_meeting))

; [insurance:vote_record_reported] 各該次股東會後，將行使表決權之書面紀錄提報董事會
(assert (= vote_record_reported vote_record_reported_to_board))

; [insurance:proxy_solicitor_prohibited] 不得擔任被投資公司之委託書徵求人或委託他人擔任委託書徵求人
(assert (= proxy_solicitor_prohibited
   (and (not proxy_solicitor_self) (not proxy_solicitor_agent))))

; [insurance:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [insurance:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [insurance:violation_138_related] 違反第一百三十八條相關業務範圍規定
(assert (= violation_138_related violate_article_138_related))

; [insurance:violation_138_2_related] 違反第一百三十八條之二相關賠償準備金提存額度、提存方式規定
(assert (= violation_138_2_related violate_article_138_2_related))

; [insurance:violation_143] 違反第一百四十三條規定
(assert (= violation_143 violate_article_143))

; [insurance:violation_143_5_or_measures] 違反第一百四十三條之五或主管機關依第一百四十三條之六各款規定所為措施
(assert (= violation_143_5_or_measures violate_article_143_5_or_measures))

; [insurance:funds_misuse] 資金運用違反相關規定
(assert (= funds_misuse funds_misuse_flag))

; [insurance:loan_without_sufficient_collateral] 放款無十足擔保或條件優於其他同類放款對象
(assert (= loan_without_sufficient_collateral loan_without_sufficient_collateral_flag))

; [insurance:loan_guarantee_without_board_approval] 擔保放款未經董事會三分之二以上董事出席及四分之三以上同意
(assert (= loan_guarantee_without_board_approval loan_guarantee_no_board_approval))

; [insurance:loan_limit_violation] 違反放款或其他交易限額規定
(assert (= loan_limit_violation loan_limit_violation_flag))

; [insurance:violation_148_1_or_2] 違反第一百四十八條之一第一項或第二項規定
(assert (= violation_148_1_or_2 violate_article_148_1_or_2))

; [insurance:violation_148_2_1] 違反第一百四十八條之二第一項規定，未提供說明文件或說明文件不實
(assert (= violation_148_2_1 violate_article_148_2_1))

; [insurance:violation_148_2_2] 違反第一百四十八條之二第二項規定，未依限報告或報告不實
(assert (= violation_148_2_2 violate_article_148_2_2))

; [insurance:violation_148_3_1] 違反第一百四十八條之三第一項規定，未建立或未執行內部控制或稽核制度
(assert (= violation_148_3_1
   (or (not internal_control_established) (not internal_control_executed))))

; [insurance:violation_148_3_2] 違反第一百四十八條之三第二項規定，未建立或未執行內部處理制度或程序
(assert (= violation_148_3_2
   (or (not internal_handling_established) (not internal_handling_executed))))

; [insurance:internal_control_executed] 內部控制及稽核制度確實執行
(assert (= internal_control_executed internal_control_system_executed))

; [insurance:internal_handling_executed] 內部處理制度及程序確實執行
(assert (= internal_handling_executed internal_handling_system_executed))

; [insurance:internal_control_compliance] 內部控制及稽核制度建立且執行
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_compliance] 內部處理制度及程序建立且執行
(assert (= internal_handling_compliance
   (and internal_handling_established internal_handling_executed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一相關規定時處罰
(assert (= penalty
   (or (not proxy_solicitor_prohibited)
       violation_148_3_2
       loan_guarantee_without_board_approval
       (not internal_handling_compliance)
       loan_without_sufficient_collateral
       (not internal_control_compliance)
       violation_148_3_1
       violation_148_2_1
       funds_misuse
       (not vote_evaluation_reported)
       (not vote_record_reported)
       violation_138_2_related
       violation_143_5_or_measures
       violation_148_1_or_2
       violation_138_related
       (not protect_insured_interest)
       violation_148_2_2
       (not prohibited_share_exchange)
       loan_limit_violation
       violation_143)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= share_exchange_trust_agreement false))
(assert (= share_exchange_commission_agreement false))
(assert (= share_exchange_other_contract false))
(assert (= share_exchange_agreement false))
(assert (= share_exchange_authorization false))
(assert (= share_exchange_other_method false))
(assert (= prohibited_share_exchange true))
(assert (= insured_interest_not_harmed true))
(assert (= protect_insured_interest true))
(assert (= vote_evaluation_report_pre_meeting false))
(assert (= vote_evaluation_reported false))
(assert (= vote_record_reported_to_board false))
(assert (= vote_record_reported false))
(assert (= proxy_solicitor_self false))
(assert (= proxy_solicitor_agent false))
(assert (= proxy_solicitor_prohibited true))
(assert (= internal_control_system_established true))
(assert (= internal_control_established true))
(assert (= internal_control_system_executed false))
(assert (= internal_control_executed false))
(assert (= internal_control_compliance false))
(assert (= internal_handling_system_established true))
(assert (= internal_handling_established true))
(assert (= internal_handling_system_executed false))
(assert (= internal_handling_executed false))
(assert (= internal_handling_compliance false))
(assert (= funds_misuse_flag true))
(assert (= funds_misuse true))
(assert (= loan_without_sufficient_collateral_flag false))
(assert (= loan_without_sufficient_collateral false))
(assert (= loan_guarantee_no_board_approval false))
(assert (= loan_guarantee_without_board_approval false))
(assert (= loan_limit_violation_flag false))
(assert (= loan_limit_violation false))
(assert (= violate_article_138_related false))
(assert (= violation_138_related false))
(assert (= violate_article_138_2_related false))
(assert (= violation_138_2_related false))
(assert (= violate_article_143 false))
(assert (= violation_143 false))
(assert (= violate_article_143_5_or_measures false))
(assert (= violation_143_5_or_measures false))
(assert (= violate_article_148_1_or_2 false))
(assert (= violation_148_1_or_2 false))
(assert (= violate_article_148_2_1 false))
(assert (= violation_148_2_1 false))
(assert (= violate_article_148_2_2 false))
(assert (= violation_148_2_2 false))
(assert (= violation_148_3_1 true))
(assert (= violation_148_3_2 true))
(assert (= penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 26
; Total variables: 51
; Total facts: 51
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

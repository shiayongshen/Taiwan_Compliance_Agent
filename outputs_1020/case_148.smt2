; SMT2 file generated from compliance case automatic
; Case ID: case_148
; Generated at: 2025-10-19T09:20:27.809754
;
; This file can be executed with Z3:
;   z3 case_148.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const loan_no_board_approval Bool)
(declare-const loan_no_sufficient_collateral Bool)
(declare-const loan_violate_limit Bool)
(declare-const loan_without_board_approval Bool)
(declare-const loan_without_sufficient_collateral Bool)
(declare-const owner_equity_total Real)
(declare-const penalty Bool)
(declare-const real_estate_investment_limit_ok Bool)
(declare-const real_estate_investment_use_and_income_ok Bool)
(declare-const real_estate_use_and_income Real)
(declare-const self_use_real_estate_investment Real)
(declare-const social_housing_rental_only Bool)
(declare-const total_funds Real)
(declare-const total_real_estate_investment Real)
(declare-const violate_138_1 Bool)
(declare-const violate_138_2 Bool)
(declare-const violate_138_2_2 Bool)
(declare-const violate_138_2_4 Bool)
(declare-const violate_138_2_5 Bool)
(declare-const violate_138_2_7 Bool)
(declare-const violate_138_3 Bool)
(declare-const violate_138_3_1 Bool)
(declare-const violate_138_3_2 Bool)
(declare-const violate_138_3_3 Bool)
(declare-const violate_138_5 Bool)
(declare-const violate_143 Bool)
(declare-const violate_143_5 Bool)
(declare-const violate_143_6_measures Bool)
(declare-const violate_146_1_1 Bool)
(declare-const violate_146_1_2 Bool)
(declare-const violate_146_1_3 Bool)
(declare-const violate_146_1_5 Bool)
(declare-const violate_146_1_6 Bool)
(declare-const violate_146_1_7 Bool)
(declare-const violate_146_2_1 Bool)
(declare-const violate_146_2_2 Bool)
(declare-const violate_146_2_4 Bool)
(declare-const violate_146_3_1 Bool)
(declare-const violate_146_3_2 Bool)
(declare-const violate_146_3_4 Bool)
(declare-const violate_146_4_1 Bool)
(declare-const violate_146_4_2 Bool)
(declare-const violate_146_4_3 Bool)
(declare-const violate_146_5_1_lacking_docs Bool)
(declare-const violate_146_5_1_unapproved Bool)
(declare-const violate_146_5_2 Bool)
(declare-const violate_146_5_3 Bool)
(declare-const violate_146_5_4 Bool)
(declare-const violate_146_6_1 Bool)
(declare-const violate_146_6_2 Bool)
(declare-const violate_146_6_3 Bool)
(declare-const violate_146_7_1 Bool)
(declare-const violate_146_7_3 Bool)
(declare-const violate_146_8 Bool)
(declare-const violate_146_9_1 Bool)
(declare-const violate_146_9_2 Bool)
(declare-const violate_146_9_3 Bool)
(declare-const violation_146_3 Bool)
(declare-const violation_146_4 Bool)
(declare-const violation_146_5 Bool)
(declare-const violation_146_6 Bool)
(declare-const violation_146_7 Bool)
(declare-const violation_146_9 Bool)
(declare-const violation_article_143 Bool)
(declare-const violation_article_143_5_or_measures Bool)
(declare-const violation_business_scope Bool)
(declare-const violation_fund_management Bool)
(declare-const violation_investment_conditions_146_1 Bool)
(declare-const violation_real_estate_investment_146_2 Bool)
(declare-const violation_reserve_fund Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:violation_business_scope] 違反第一百三十八條第一項、第三項、第五項或第二項有關業務範圍規定
(assert (= violation_business_scope
   (or violate_138_5 violate_138_2 violate_138_3 violate_138_1)))

; [insurance:violation_reserve_fund] 違反第一百三十八條之二第二項、第四項、第五項、第七項、第一百三十八條之三第一項、第二項或第三項有關賠償準備金提存額度及提存方式規定
(assert (= violation_reserve_fund
   (or violate_138_2_2
       violate_138_2_4
       violate_138_2_5
       violate_138_2_7
       violate_138_3_1
       violate_138_3_2
       violate_138_3_3)))

; [insurance:violation_article_143] 違反第一百四十三條規定
(assert (= violation_article_143 violate_143))

; [insurance:violation_article_143_5_or_measures] 違反第一百四十三條之五或主管機關依第一百四十三條之六各款規定所為措施
(assert (= violation_article_143_5_or_measures
   (or violate_143_5 violate_143_6_measures)))

; [insurance:violation_fund_management] 違反第一百四十六條相關專設帳簿管理、保存及投資資產運用規定或衍生性商品交易規定
(assert (= violation_fund_management
   (or violate_146_8
       violate_146_1_3
       violate_146_1_6
       violate_146_1_5
       violate_146_1_1
       violate_146_1_7)))

; [insurance:violation_investment_conditions_146_1] 違反第一百四十六條之一第一項、第二項、第三項或第五項投資條件、範圍、內容及規範，或違反第一百四十六條之五第三項或第四項規定
(assert (= violation_investment_conditions_146_1
   (or violate_146_1_1
       violate_146_1_2
       violate_146_1_3
       violate_146_1_5
       violate_146_5_3
       violate_146_5_4)))

; [insurance:violation_real_estate_investment_146_2] 違反第一百四十六條之二第一項、第二項或第四項不動產投資條件限制
(assert (= violation_real_estate_investment_146_2
   (or violate_146_2_1 violate_146_2_2 violate_146_2_4)))

; [insurance:violation_146_3] 違反第一百四十六條之三第一項、第二項或第四項規定
(assert (= violation_146_3 (or violate_146_3_1 violate_146_3_2 violate_146_3_4)))

; [insurance:violation_146_4] 違反第一百四十六條之四第一項、第二項或第三項投資規範或投資額度
(assert (= violation_146_4 (or violate_146_4_1 violate_146_4_2 violate_146_4_3)))

; [insurance:violation_146_5] 違反第一百四十六條之五第一項前段未經核准投資或未具備文件程序，或違反後段運用、投資範圍或限額規定
(assert (= violation_146_5
   (or violate_146_5_1_unapproved violate_146_5_1_lacking_docs violate_146_5_2)))

; [insurance:violation_146_6] 違反第一百四十六條之六第一項、第二項或第三項投資申報方式規定
(assert (= violation_146_6 (or violate_146_6_1 violate_146_6_2 violate_146_6_3)))

; [insurance:violation_146_9] 違反第一百四十六條之九第一項、第二項或第三項規定
(assert (= violation_146_9 (or violate_146_9_1 violate_146_9_2 violate_146_9_3)))

; [insurance:loan_without_sufficient_collateral] 依第一百四十六條之三第三項或第一百四十六條之八第一項規定放款無十足擔保或條件優於其他同類放款
(assert (= loan_without_sufficient_collateral loan_no_sufficient_collateral))

; [insurance:loan_without_board_approval] 擔保放款達主管機關規定金額以上，未經董事會三分之二以上董事出席及出席董事四分之三以上同意，或違反放款限額、總餘額規定
(assert (= loan_without_board_approval (or loan_no_board_approval loan_violate_limit)))

; [insurance:violation_146_7] 違反第一百四十六條之七第一項放款或其他交易限額規定，或第三項決議程序或限額規定
(assert (= violation_146_7 (or violate_146_7_1 violate_146_7_3)))

; [insurance:real_estate_investment_limit_ok] 不動產投資總額除自用不動產外不超過資金30%，且自用不動產不超過業主權益總額
(assert (let ((a!1 (and (<= (+ total_real_estate_investment
                       (* (- 1.0) self_use_real_estate_investment))
                    (* (/ 3.0 10.0) total_funds))
                (<= self_use_real_estate_investment owner_equity_total))))
  (= real_estate_investment_limit_ok a!1)))

; [insurance:real_estate_investment_use_and_income_ok] 不動產即時利用並有收益或依住宅法興辦社會住宅且僅供租賃
(assert (= real_estate_investment_use_and_income_ok
   (or (= real_estate_use_and_income 1.0) social_housing_rental_only)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一相關規定時處罰
(assert (= penalty
   (or violation_146_5
       violation_reserve_fund
       loan_without_board_approval
       violation_146_4
       violation_article_143
       violation_fund_management
       violation_146_7
       violation_146_6
       violation_146_9
       violation_business_scope
       loan_without_sufficient_collateral
       violation_real_estate_investment_146_2
       violation_146_3
       violation_article_143_5_or_measures
       violation_investment_conditions_146_1)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violate_146_2_1 true))
(assert (= violation_real_estate_investment_146_2 true))
(assert (= penalty true))
(assert (= violate_138_1 false))
(assert (= violate_138_2 false))
(assert (= violate_138_2_2 false))
(assert (= violate_138_2_4 false))
(assert (= violate_138_2_5 false))
(assert (= violate_138_2_7 false))
(assert (= violate_138_3 false))
(assert (= violate_138_3_1 false))
(assert (= violate_138_3_2 false))
(assert (= violate_138_3_3 false))
(assert (= violate_138_5 false))
(assert (= violate_143 false))
(assert (= violate_143_5 false))
(assert (= violate_143_6_measures false))
(assert (= violate_146_1_1 false))
(assert (= violate_146_1_2 false))
(assert (= violate_146_1_3 false))
(assert (= violate_146_1_5 false))
(assert (= violate_146_1_6 false))
(assert (= violate_146_1_7 false))
(assert (= violate_146_2_2 false))
(assert (= violate_146_2_4 false))
(assert (= violate_146_3_1 false))
(assert (= violate_146_3_2 false))
(assert (= violate_146_3_4 false))
(assert (= violate_146_4_1 false))
(assert (= violate_146_4_2 false))
(assert (= violate_146_4_3 false))
(assert (= violate_146_5_1_lacking_docs false))
(assert (= violate_146_5_1_unapproved false))
(assert (= violate_146_5_2 false))
(assert (= violate_146_5_3 false))
(assert (= violate_146_5_4 false))
(assert (= violate_146_6_1 false))
(assert (= violate_146_6_2 false))
(assert (= violate_146_6_3 false))
(assert (= violate_146_7_1 false))
(assert (= violate_146_7_3 false))
(assert (= violate_146_8 false))
(assert (= violate_146_9_1 false))
(assert (= violate_146_9_2 false))
(assert (= violate_146_9_3 false))
(assert (= loan_no_board_approval false))
(assert (= loan_no_sufficient_collateral false))
(assert (= loan_violate_limit false))
(assert (= loan_without_board_approval false))
(assert (= loan_without_sufficient_collateral false))
(assert (= owner_equity_total 0.0))
(assert (= real_estate_investment_limit_ok true))
(assert (= real_estate_investment_use_and_income_ok false))
(assert (= real_estate_use_and_income 0.0))
(assert (= self_use_real_estate_investment 0.0))
(assert (= social_housing_rental_only false))
(assert (= total_funds 0.0))
(assert (= total_real_estate_investment 0.0))
(assert (= violation_business_scope false))
(assert (= violation_reserve_fund false))
(assert (= violation_article_143 false))
(assert (= violation_article_143_5_or_measures false))
(assert (= violation_fund_management false))
(assert (= violation_investment_conditions_146_1 false))
(assert (= violation_146_3 false))
(assert (= violation_146_4 false))
(assert (= violation_146_5 false))
(assert (= violation_146_6 false))
(assert (= violation_146_7 false))
(assert (= violation_146_9 false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 19
; Total variables: 70
; Total facts: 70
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

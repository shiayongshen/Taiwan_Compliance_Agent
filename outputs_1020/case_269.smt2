; SMT2 file generated from compliance case automatic
; Case ID: case_269
; Generated at: 2025-10-19T11:47:05.687396
;
; This file can be executed with Z3:
;   z3 case_269.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const penalty Bool)
(declare-const violate_article_16_1 Bool)
(declare-const violate_article_19 Bool)
(declare-const violate_article_21_3 Bool)
(declare-const violate_article_28_1 Bool)
(declare-const violate_article_30_1_limit Bool)
(declare-const violate_article_31_1_limit Bool)
(declare-const violate_article_33_limit Bool)
(declare-const violate_article_41_limit Bool)
(declare-const violate_article_47_1 Bool)
(declare-const violate_article_47_2_business Bool)
(declare-const violate_article_47_2_capital Bool)
(declare-const violation_16_1 Bool)
(declare-const violation_19 Bool)
(declare-const violation_21_3 Bool)
(declare-const violation_28_1 Bool)
(declare-const violation_30_1_limit Bool)
(declare-const violation_31_1_limit Bool)
(declare-const violation_33_limit Bool)
(declare-const violation_41_limit Bool)
(declare-const violation_43_internal_control Bool)
(declare-const violation_47_business_restriction Bool)
(declare-const violation_47_capital_replenish Bool)
(declare-const violation_47_reporting Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [bill_finance:internal_control_established] 票券商已建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [bill_finance:internal_control_executed] 票券商已確實執行內部控制及稽核制度
(assert (= internal_control_executed internal_control_system_executed))

; [bill_finance:violation_16_1] 違反第十六條第一項規定
(assert (= violation_16_1 violate_article_16_1))

; [bill_finance:violation_19] 違反第十九條規定
(assert (= violation_19 violate_article_19))

; [bill_finance:violation_21_3] 違反第二十一條第三項規定，經營未經主管機關核定之業務
(assert (= violation_21_3 violate_article_21_3))

; [bill_finance:violation_28_1] 違反第二十八條第一項規定
(assert (= violation_28_1 violate_article_28_1))

; [bill_finance:violation_30_1_limit] 違反主管機關依第三十條第一項規定所為之限制
(assert (= violation_30_1_limit violate_article_30_1_limit))

; [bill_finance:violation_31_1_limit] 違反主管機關依第三十一條第一項規定所定之總餘額
(assert (= violation_31_1_limit violate_article_31_1_limit))

; [bill_finance:violation_33_limit] 違反主管機關依第三十三條規定所定之業務、財務比率或所為之限制或處置
(assert (= violation_33_limit violate_article_33_limit))

; [bill_finance:violation_41_limit] 違反主管機關依第四十一條規定所定之比率或所為之限制或處置
(assert (= violation_41_limit violate_article_41_limit))

; [bill_finance:violation_43_internal_control] 違反第四十三條規定，未建立內部控制及稽核制度或未確實執行
(assert (= violation_43_internal_control
   (or (not internal_control_established) (not internal_control_executed))))

; [bill_finance:violation_47_reporting] 違反第四十七條第一項規定，未立即函報財務報表及虧損原因
(assert (= violation_47_reporting violate_article_47_1))

; [bill_finance:violation_47_capital_replenish] 違反第四十七條第二項規定，未於限期內補足資本
(assert (= violation_47_capital_replenish violate_article_47_2_capital))

; [bill_finance:violation_47_business_restriction] 違反第四十七條第二項規定，未依限制營業、勒令停業之處分辦理
(assert (= violation_47_business_restriction violate_article_47_2_business))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一法定規定時處罰
(assert (= penalty
   (or violation_28_1
       violation_41_limit
       violation_33_limit
       violation_16_1
       violation_47_business_restriction
       violation_19
       violation_47_capital_replenish
       violation_21_3
       violation_47_reporting
       violation_30_1_limit
       violation_31_1_limit
       violation_43_internal_control)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= violate_article_16_1 false))
(assert (= violate_article_19 false))
(assert (= violate_article_21_3 false))
(assert (= violate_article_28_1 false))
(assert (= violate_article_30_1_limit false))
(assert (= violate_article_31_1_limit false))
(assert (= violate_article_33_limit false))
(assert (= violate_article_41_limit false))
(assert (= violate_article_47_1 false))
(assert (= violate_article_47_2_business false))
(assert (= violate_article_47_2_capital false))
(assert (= violation_16_1 false))
(assert (= violation_19 false))
(assert (= violation_21_3 false))
(assert (= violation_28_1 false))
(assert (= violation_30_1_limit false))
(assert (= violation_31_1_limit false))
(assert (= violation_33_limit false))
(assert (= violation_41_limit false))
(assert (= violation_43_internal_control true))
(assert (= violation_47_business_restriction false))
(assert (= violation_47_capital_replenish false))
(assert (= violation_47_reporting false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 16
; Total variables: 28
; Total facts: 28
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

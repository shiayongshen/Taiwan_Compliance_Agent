; SMT2 file generated from compliance case automatic
; Case ID: case_269
; Generated at: 2025-10-21T05:58:31.047109
;
; This file can be executed with Z3:
;   z3 case_269.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_restriction_or_suspension_executed Bool)
(declare-const capital_replenished_within_deadline Bool)
(declare-const financial_report_reported_immediately Bool)
(declare-const internal_control_compliance Bool)
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
(declare-const violation_16_1 Bool)
(declare-const violation_19 Bool)
(declare-const violation_21_3 Bool)
(declare-const violation_28_1 Bool)
(declare-const violation_30_1_limit Bool)
(declare-const violation_31_1_limit Bool)
(declare-const violation_33_limit Bool)
(declare-const violation_41_limit Bool)
(declare-const violation_43_internal_control Bool)
(declare-const violation_47_reporting Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [billfinance:internal_control_established] 票券商已建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [billfinance:internal_control_executed] 票券商已確實執行內部控制及稽核制度
(assert (= internal_control_executed internal_control_system_executed))

; [billfinance:internal_control_compliance] 票券商建立且確實執行內部控制及稽核制度
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [billfinance:violation_16_1] 違反第十六條第一項規定
(assert (= violation_16_1 violate_article_16_1))

; [billfinance:violation_19] 違反第十九條規定
(assert (= violation_19 violate_article_19))

; [billfinance:violation_21_3] 違反第二十一條第三項規定，經營未經主管機關核定之業務
(assert (= violation_21_3 violate_article_21_3))

; [billfinance:violation_28_1] 違反第二十八條第一項規定
(assert (= violation_28_1 violate_article_28_1))

; [billfinance:violation_30_1_limit] 違反主管機關依第三十條第一項規定所為之限制
(assert (= violation_30_1_limit violate_article_30_1_limit))

; [billfinance:violation_31_1_limit] 違反主管機關依第三十一條第一項規定所定之總餘額
(assert (= violation_31_1_limit violate_article_31_1_limit))

; [billfinance:violation_33_limit] 違反主管機關依第三十三條規定所定之業務、財務比率或所為之限制或處置
(assert (= violation_33_limit violate_article_33_limit))

; [billfinance:violation_41_limit] 違反主管機關依第四十一條規定所定之比率或所為之限制或處置
(assert (= violation_41_limit violate_article_41_limit))

; [billfinance:violation_43_internal_control] 違反第四十三條規定，未建立內部控制及稽核制度或未確實執行
(assert (= violation_43_internal_control
   (or (not internal_control_established) (not internal_control_executed))))

; [billfinance:violation_47_reporting] 違反第四十七條第一項規定，未立即函報財務報表及虧損原因；或同條第二項規定，未於限期內補足資本，或未依限制營業、勒令停業之處分辦理
(assert (= violation_47_reporting
   (or (not business_restriction_or_suspension_executed)
       (not capital_replenished_within_deadline)
       (not financial_report_reported_immediately))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反任一法定規定時處罰
(assert (= penalty
   (or violation_16_1
       violation_19
       violation_21_3
       violation_28_1
       violation_30_1_limit
       violation_31_1_limit
       violation_33_limit
       violation_41_limit
       violation_43_internal_control
       violation_47_reporting)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_control_compliance false))
(assert (= violate_article_16_1 false))
(assert (= violate_article_19 false))
(assert (= violate_article_21_3 false))
(assert (= violate_article_28_1 false))
(assert (= violate_article_30_1_limit false))
(assert (= violate_article_31_1_limit false))
(assert (= violate_article_33_limit false))
(assert (= violate_article_41_limit false))
(assert (= violation_16_1 false))
(assert (= violation_19 false))
(assert (= violation_21_3 false))
(assert (= violation_28_1 false))
(assert (= violation_30_1_limit false))
(assert (= violation_31_1_limit false))
(assert (= violation_33_limit false))
(assert (= violation_41_limit false))
(assert (= violation_43_internal_control true))
(assert (= violation_47_reporting false))
(assert (= penalty true))
(assert (= business_restriction_or_suspension_executed false))
(assert (= capital_replenished_within_deadline true))
(assert (= financial_report_reported_immediately true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 15
; Total variables: 27
; Total facts: 27
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

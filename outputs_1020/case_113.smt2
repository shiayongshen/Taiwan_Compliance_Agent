; SMT2 file generated from compliance case automatic
; Case ID: case_113
; Generated at: 2025-10-19T08:20:44.617032
;
; This file can be executed with Z3:
;   z3 case_113.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const business_plan_defined Bool)
(declare-const business_plan_prepared Bool)
(declare-const business_strategy_defined Bool)
(declare-const business_strategy_planned Bool)
(declare-const contract_terms_compliance Bool)
(declare-const contract_terms_level Int)
(declare-const foreign_cooperation_approved Bool)
(declare-const foreign_cooperation_performed Bool)
(declare-const illegal_foreign_cooperation Bool)
(declare-const illegal_foreign_cooperation_penalty Bool)
(declare-const internal_control_compliance Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_system_established Bool)
(declare-const internal_control_system_executed Bool)
(declare-const standard_contract_terms_level Int)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [electronic_payment:contract_terms_compliance] 電子支付機構業務定型化契約條款內容不得低於主管機關範本
(assert (= contract_terms_compliance
   (>= contract_terms_level standard_contract_terms_level)))

; [electronic_payment:internal_control_established] 建立內部控制制度
(assert (= internal_control_established internal_control_system_established))

; [electronic_payment:internal_control_executed] 內部控制制度持續有效執行
(assert (= internal_control_executed internal_control_system_executed))

; [electronic_payment:business_strategy_planned] 規劃整體經營策略、風險管理政策及指導準則
(assert (= business_strategy_planned business_strategy_defined))

; [electronic_payment:business_plan_prepared] 擬定經營計畫、風險管理程序及執行準則
(assert (= business_plan_prepared business_plan_defined))

; [electronic_payment:internal_control_compliance] 內部控制制度建立且持續有效執行
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [electronic_payment:illegal_foreign_cooperation] 未經主管機關核准與境外機構合作或協助境外機構於我國境內從事業務
(assert (= illegal_foreign_cooperation
   (and (not foreign_cooperation_approved) foreign_cooperation_performed)))

; [electronic_payment:illegal_foreign_cooperation_penalty] 違反第十五條第二項規定，未經核准與境外機構合作或協助者
(assert (= illegal_foreign_cooperation_penalty illegal_foreign_cooperation))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反定型化契約條款內容規定或未建立或執行內部控制制度或未經核准與境外機構合作
(assert (= penalty
   (or (not contract_terms_compliance)
       illegal_foreign_cooperation_penalty
       (not internal_control_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= contract_terms_compliance true))
(assert (= contract_terms_level 1))
(assert (= standard_contract_terms_level 1))
(assert (= foreign_cooperation_approved true))
(assert (= foreign_cooperation_performed false))
(assert (= illegal_foreign_cooperation false))
(assert (= illegal_foreign_cooperation_penalty false))
(assert (= internal_control_system_established true))
(assert (= internal_control_established true))
(assert (= internal_control_system_executed false))
(assert (= internal_control_executed false))
(assert (= internal_control_compliance false))
(assert (= business_strategy_defined false))
(assert (= business_strategy_planned false))
(assert (= business_plan_defined false))
(assert (= business_plan_prepared false))
(assert (= penalty true))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 10
; Total variables: 17
; Total facts: 17
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

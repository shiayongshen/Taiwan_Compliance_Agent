; SMT2 file generated from compliance case automatic
; Case ID: case_136
; Generated at: 2025-10-19T08:56:32.347627
;
; This file can be executed with Z3:
;   z3 case_136.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const aml_internal_control_established Bool)
(declare-const aml_internal_control_established_flag Bool)
(declare-const aml_internal_control_executed Bool)
(declare-const aml_internal_control_executed_flag Bool)
(declare-const business_improvement_plan_completed Bool)
(declare-const capital_adequacy_ratio Real)
(declare-const capital_increase_completed Bool)
(declare-const capital_level Int)
(declare-const customer_id_data_retention_years Int)
(declare-const customer_id_procedure_ok Bool)
(declare-const customer_id_procedure_performed Bool)
(declare-const financial_improvement_plan_completed Bool)
(declare-const improvement_plan_approved Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_ok Bool)
(declare-const internal_handling_established Bool)
(declare-const internal_handling_executed Bool)
(declare-const internal_handling_ok Bool)
(declare-const level_2_measures_executed Bool)
(declare-const level_3_measures_executed Bool)
(declare-const level_4_measures_executed Bool)
(declare-const merged Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const penalty Bool)
(declare-const transaction_record_retained Bool)
(declare-const transaction_record_retention_ok Bool)
(declare-const transaction_record_retention_years Int)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 保險業資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足, 0=未分類）
(assert (let ((a!1 (ite (and (<= 150.0 capital_adequacy_ratio)
                     (not (<= 200.0 capital_adequacy_ratio)))
                2
                (ite (<= 200.0 capital_adequacy_ratio) 1 0))))
(let ((a!2 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio))
                     (<= 0.0 net_worth_ratio)
                     (not (<= 2.0 net_worth_ratio)))
                3
                a!1)))
(let ((a!3 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                a!2)))
  (= capital_level a!3)))))

; [insurance:level_4_measures_executed] 資本嚴重不足等級措施已執行
(assert (= level_4_measures_executed
   (and (= 4 capital_level)
        capital_increase_completed
        financial_improvement_plan_completed
        business_improvement_plan_completed)))

; [insurance:level_3_measures_executed] 資本顯著不足等級措施已執行
(assert (= level_3_measures_executed
   (and (= 3 capital_level)
        improvement_plan_submitted
        improvement_plan_approved
        improvement_plan_executed)))

; [insurance:level_2_measures_executed] 資本不足等級措施已執行
(assert (let ((a!1 (and (= 2 capital_level)
                (or (and improvement_plan_submitted improvement_plan_executed)
                    (not (= 2 capital_level))))))
  (= level_2_measures_executed a!1)))

; [insurance:penalty_conditions] 處罰條件：資本嚴重不足且未完成增資或改善計畫，或資本顯著不足且未完成改善計畫，或資本不足且未完成改善計畫時處罰
(assert (= penalty
   (or (and (= 2 capital_level) (not level_2_measures_executed))
       (and (= 4 capital_level) (not level_4_measures_executed))
       (and (= 3 capital_level) (not level_3_measures_executed)))))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [insurance:internal_control_ok] 建立內部控制及稽核制度且確實執行
(assert (= internal_control_ok
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_ok] 建立內部處理制度及程序且確實執行
(assert (= internal_handling_ok
   (and internal_handling_established internal_handling_executed)))

; [meta:penalty_internal_control_handling] 處罰條件：未建立或未執行內部控制或內部處理制度時處罰
(assert (= penalty (or (not internal_control_ok) (not internal_handling_ok))))

; [aml:internal_control_established] 洗錢防制法規定建立洗錢防制內部控制與稽核制度
(assert (= aml_internal_control_established aml_internal_control_established_flag))

; [aml:internal_control_executed] 洗錢防制法規定執行洗錢防制內部控制與稽核制度
(assert (= aml_internal_control_executed aml_internal_control_executed_flag))

; [aml:penalty_conditions] 處罰條件：未建立或未執行洗錢防制內部控制與稽核制度時處罰
(assert (= penalty
   (or (not aml_internal_control_established)
       (not aml_internal_control_executed))))

; [aml:customer_id_procedure_ok] 已依洗錢防制法執行確認客戶身分程序並留存資料
(assert (= customer_id_procedure_ok
   (and customer_id_procedure_performed
        (<= 5.0 (to_real customer_id_data_retention_years)))))

; [aml:penalty_customer_id_procedure] 處罰條件：未依規定執行確認客戶身分程序或未留存資料時處罰
(assert (not (= customer_id_procedure_ok penalty)))

; [aml:transaction_record_retention_ok] 已留存必要交易紀錄且保存期限符合規定
(assert (= transaction_record_retention_ok
   (and transaction_record_retained
        (<= 5.0 (to_real transaction_record_retention_years)))))

; [aml:penalty_transaction_record_retention] 處罰條件：未留存必要交易紀錄或保存期限不足時處罰
(assert (not (= transaction_record_retention_ok penalty)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 100.0))
(assert (= net_worth 100.0))
(assert (= net_worth_ratio 100.0))
(assert (= capital_increase_completed false))
(assert (= financial_improvement_plan_completed false))
(assert (= business_improvement_plan_completed false))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_approved false))
(assert (= improvement_plan_executed false))
(assert (= internal_control_established false))
(assert (= internal_control_executed false))
(assert (= internal_handling_established false))
(assert (= internal_handling_executed false))
(assert (= aml_internal_control_established_flag false))
(assert (= aml_internal_control_executed_flag false))
(assert (= customer_id_procedure_performed false))
(assert (= customer_id_data_retention_years 0))
(assert (= transaction_record_retained false))
(assert (= transaction_record_retention_years 0))
(assert (= merged false))
(assert (= aml_internal_control_established false))
(assert (= aml_internal_control_executed false))
(assert (= capital_level 0))
(assert (= customer_id_procedure_ok false))
(assert (= internal_control_ok false))
(assert (= internal_handling_ok false))
(assert (= level_2_measures_executed false))
(assert (= level_3_measures_executed false))
(assert (= level_4_measures_executed false))
(assert (= penalty false))
(assert (= transaction_record_retention_ok false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 16
; Total variables: 31
; Total facts: 31
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

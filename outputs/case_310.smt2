; SMT2 file generated from compliance case automatic
; Case ID: case_310
; Generated at: 2025-10-21T06:55:40.524532
;
; This file can be executed with Z3:
;   z3 case_310.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_adequate Bool)
(declare-const capital_insufficient Bool)
(declare-const capital_level Int)
(declare-const capital_severely_insufficient Bool)
(declare-const capital_significantly_insufficient Bool)
(declare-const car_150_to_200 Bool)
(declare-const car_50_to_150 Bool)
(declare-const car_above_or_equal_200 Bool)
(declare-const car_below_50 Bool)
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
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const net_worth_ratio_above_or_equal_0 Bool)
(declare-const net_worth_ratio_above_or_equal_2 Bool)
(declare-const net_worth_ratio_above_or_equal_3 Bool)
(declare-const net_worth_ratio_below_0 Bool)
(declare-const net_worth_ratio_below_2 Bool)
(declare-const net_worth_ratio_low Bool)
(declare-const net_worth_ratio_prev Real)
(declare-const penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:internal_control_established] 建立內部控制及稽核制度
(assert (= internal_control_established internal_control_system_established))

; [insurance:internal_control_executed] 執行內部控制及稽核制度
(assert (= internal_control_executed internal_control_system_executed))

; [insurance:internal_handling_established] 建立內部處理制度及程序
(assert (= internal_handling_established internal_handling_system_established))

; [insurance:internal_handling_executed] 執行內部處理制度及程序
(assert (= internal_handling_executed internal_handling_system_executed))

; [insurance:capital_level] 資本等級分類（1=適足, 2=不足, 3=顯著不足, 4=嚴重不足）
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

; [insurance:capital_level_lower_net_worth] 淨值比率低於2%且未達3%之判斷
(assert (= net_worth_ratio_low
   (and (not (<= 3.0 net_worth_ratio)) (<= 2.0 net_worth_ratio))))

; [insurance:capital_level_net_worth_below_2] 淨值比率低於2%
(assert (not (= (<= 2.0 net_worth_ratio) net_worth_ratio_below_2)))

; [insurance:capital_level_net_worth_below_0] 淨值比率低於0
(assert (not (= (<= 0.0 net_worth_ratio) net_worth_ratio_below_0)))

; [insurance:capital_level_net_worth_above_or_equal_0] 淨值比率大於等於0
(assert (= net_worth_ratio_above_or_equal_0 (<= 0.0 net_worth_ratio)))

; [insurance:capital_level_net_worth_above_or_equal_2] 淨值比率大於等於2
(assert (= net_worth_ratio_above_or_equal_2 (<= 2.0 net_worth_ratio)))

; [insurance:capital_level_net_worth_above_or_equal_3] 淨值比率大於等於3
(assert (= net_worth_ratio_above_or_equal_3 (<= 3.0 net_worth_ratio)))

; [insurance:capital_level_car_150_to_200] 資本適足率介於150%至200%之間
(assert (= car_150_to_200
   (and (<= 150.0 capital_adequacy_ratio)
        (not (<= 200.0 capital_adequacy_ratio)))))

; [insurance:capital_level_car_50_to_150] 資本適足率介於50%至150%之間
(assert (= car_50_to_150
   (and (<= 50.0 capital_adequacy_ratio)
        (not (<= 150.0 capital_adequacy_ratio)))))

; [insurance:capital_level_car_below_50] 資本適足率低於50%
(assert (not (= (<= 50.0 capital_adequacy_ratio) car_below_50)))

; [insurance:capital_level_car_above_or_equal_200] 資本適足率大於等於200%
(assert (= car_above_or_equal_200 (<= 200.0 capital_adequacy_ratio)))

; [insurance:capital_level_net_worth_below_0_or_car_below_50] 資本嚴重不足條件
(assert (= capital_severely_insufficient
   (or (not (<= 50.0 capital_adequacy_ratio)) (not (<= 0.0 net_worth)))))

; [insurance:capital_level_net_worth_below_2_and_car_50_to_150] 資本顯著不足條件
(assert (= capital_significantly_insufficient
   (and (<= 50.0 capital_adequacy_ratio)
        (not (<= 150.0 capital_adequacy_ratio))
        (<= 0.0 net_worth_ratio)
        (not (<= 2.0 net_worth_ratio)))))

; [insurance:capital_level_car_150_to_200_only] 資本不足條件
(assert (= capital_insufficient
   (and (<= 150.0 capital_adequacy_ratio)
        (not (<= 200.0 capital_adequacy_ratio)))))

; [insurance:capital_level_adequate] 資本適足條件
(assert (= capital_adequate
   (and (<= 200.0 capital_adequacy_ratio)
        (or (<= 3.0 net_worth_ratio) (<= 3.0 net_worth_ratio_prev)))))

; [insurance:capital_level_final] 資本等級依低等級原則決定
(assert (let ((a!1 (ite (and (<= 200.0 capital_adequacy_ratio)
                     (or (<= 3.0 net_worth_ratio) (<= 3.0 net_worth_ratio_prev)))
                1
                0)))
(let ((a!2 (ite (and (<= 150.0 capital_adequacy_ratio)
                     (not (<= 200.0 capital_adequacy_ratio)))
                2
                a!1)))
(let ((a!3 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio))
                     (<= 0.0 net_worth_ratio)
                     (not (<= 2.0 net_worth_ratio)))
                3
                a!2)))
(let ((a!4 (ite (or (not (<= 0.0 net_worth))
                    (not (<= 50.0 capital_adequacy_ratio)))
                4
                a!3)))
  (= capital_level a!4))))))

; [insurance:internal_control_compliance] 內部控制及稽核制度建立且執行
(assert (= internal_control_compliance
   (and internal_control_established internal_control_executed)))

; [insurance:internal_handling_compliance] 內部處理制度及程序建立且執行
(assert (= internal_handling_compliance
   (and internal_handling_established internal_handling_executed)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：未建立或未執行內部控制或內部處理制度時處罰
(assert (= penalty
   (or (not internal_control_compliance) (not internal_handling_compliance))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= capital_adequacy_ratio 45.0))
(assert (= net_worth -1000000.0))
(assert (= net_worth_ratio -5.0))
(assert (= net_worth_ratio_prev -5.0))
(assert (= internal_control_system_established false))
(assert (= internal_control_system_executed false))
(assert (= internal_handling_system_established false))
(assert (= internal_handling_system_executed false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 24
; Total variables: 30
; Total facts: 8
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

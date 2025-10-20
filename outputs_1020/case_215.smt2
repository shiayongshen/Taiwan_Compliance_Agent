; SMT2 file generated from compliance case automatic
; Case ID: case_215
; Generated at: 2025-10-19T10:41:20.518570
;
; This file can be executed with Z3:
;   z3 case_215.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const capital_adequacy_ratio Real)
(declare-const capital_insufficient_measures_executed Bool)
(declare-const capital_level Int)
(declare-const capital_level_net_worth Real)
(declare-const capital_severely_insufficient_measures_executed Bool)
(declare-const capital_severely_insufficient_measures_executed_flag Bool)
(declare-const capital_significantly_insufficient_measures_executed Bool)
(declare-const capital_significantly_insufficient_measures_executed_flag Bool)
(declare-const conceal_or_destroy_documents Bool)
(declare-const conceal_or_destroy_documents_penalty Bool)
(declare-const improvement_plan_executed Bool)
(declare-const improvement_plan_submitted Bool)
(declare-const insufficient_and_no_measures Bool)
(declare-const late_or_false_report Bool)
(declare-const late_or_false_report_penalty Bool)
(declare-const net_worth Real)
(declare-const net_worth_ratio Real)
(declare-const net_worth_ratio_prev Real)
(declare-const no_response_or_false_response Bool)
(declare-const no_response_or_false_response_penalty Bool)
(declare-const penalty Bool)
(declare-const refuse_inspection Bool)
(declare-const refuse_inspection_penalty Bool)
(declare-const related_financial_institution_fail_provide Bool)
(declare-const related_financial_institution_penalty Bool)
(declare-const severe_insufficient_and_no_measures Bool)
(declare-const significant_insufficient_and_no_measures Bool)
(declare-const violate_148_1_2 Bool)
(declare-const violate_148_1_2_penalty Bool)
(declare-const violate_148_2_1 Bool)
(declare-const violate_148_2_1_penalty Bool)
(declare-const violate_148_2_2 Bool)
(declare-const violate_148_2_2_penalty Bool)
(declare-const violate_148_3_1 Bool)
(declare-const violate_148_3_1_penalty Bool)
(declare-const violate_148_3_2 Bool)
(declare-const violate_148_3_2_penalty Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [insurance:capital_level] 保險業資本等級分類（1=資本適足, 2=資本不足, 3=資本顯著不足, 4=資本嚴重不足）
(assert (let ((a!1 (or (and (not (<= 3.0 net_worth_ratio)) (<= 2.0 net_worth_ratio))
               (and (<= 150.0 capital_adequacy_ratio)
                    (not (<= 200.0 capital_adequacy_ratio)))))
      (a!2 (ite (and (<= 200.0 capital_adequacy_ratio)
                     (or (<= 3.0 net_worth_ratio) (<= 3.0 net_worth_ratio_prev)))
                1
                0)))
(let ((a!3 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio))
                     (<= 0.0 net_worth_ratio)
                     (not (<= 2.0 net_worth_ratio)))
                3
                (ite a!1 2 a!2))))
(let ((a!4 (ite (or (not (<= 50.0 capital_adequacy_ratio))
                    (not (<= 0.0 net_worth)))
                4
                a!3)))
  (= capital_level a!4)))))

; [insurance:capital_level_lowest_rule] 資本等級以較低等級為準
(assert (let ((a!1 (ite (and (<= 150.0 capital_adequacy_ratio)
                     (not (<= 200.0 capital_adequacy_ratio)))
                2
                (ite (<= 200.0 capital_adequacy_ratio) 1 0))))
(let ((a!2 (ite (and (<= 50.0 capital_adequacy_ratio)
                     (not (<= 150.0 capital_adequacy_ratio)))
                3
                a!1)))
  (= capital_level (ite (<= 50.0 capital_adequacy_ratio) a!2 4)))))

; [insurance:capital_level_net_worth] 淨值比率資本等級判定
(assert (let ((a!1 (ite (and (<= 0.0 net_worth_ratio) (not (<= 2.0 net_worth_ratio)))
                3.0
                0.0)))
  (= capital_level_net_worth (ite (<= 0.0 net_worth) a!1 4.0))))

; [insurance:capital_level_final] 資本等級以資本適足率與淨值比率較低等級為準
(assert (let ((a!1 (and (<= capital_level_net_worth (to_real capital_level))
                (not (<= (to_real capital_level) capital_level_net_worth)))))
  (= (to_real capital_level)
     (ite a!1 capital_level_net_worth (to_real capital_level)))))

; [insurance:capital_severely_insufficient_measures_executed] 資本嚴重不足等級措施已執行
(assert (= capital_severely_insufficient_measures_executed
   (and (= 4 capital_level)
        capital_severely_insufficient_measures_executed_flag)))

; [insurance:capital_significantly_insufficient_measures_executed] 資本顯著不足等級措施已執行
(assert (= capital_significantly_insufficient_measures_executed
   (and (= 3 capital_level)
        capital_significantly_insufficient_measures_executed_flag)))

; [insurance:capital_insufficient_measures_executed] 資本不足等級措施已執行
(assert (= capital_insufficient_measures_executed
   (and (= 2 capital_level)
        improvement_plan_submitted
        improvement_plan_executed)))

; [insurance:severe_insufficient_and_no_measures] 資本嚴重不足且未依規定完成增資、改善計畫或合併
(assert (= severe_insufficient_and_no_measures
   (and (= 4 capital_level)
        (not capital_severely_insufficient_measures_executed))))

; [insurance:significant_insufficient_and_no_measures] 資本顯著不足且未執行對應措施
(assert (= significant_insufficient_and_no_measures
   (and (= 3 capital_level)
        (not capital_significantly_insufficient_measures_executed))))

; [insurance:insufficient_and_no_measures] 資本不足且未執行對應措施
(assert (= insufficient_and_no_measures
   (and (= 2 capital_level) (not capital_insufficient_measures_executed))))

; [insurance:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：資本不足等級達一定程度且未執行對應措施時處罰
(assert (= penalty
   (or insufficient_and_no_measures
       severe_insufficient_and_no_measures
       significant_insufficient_and_no_measures)))

; [insurance:refuse_inspection_penalty] 拒絕檢查或拒絕開啟金庫或其他庫房
(assert (= refuse_inspection_penalty refuse_inspection))

; [insurance:conceal_or_destroy_documents_penalty] 隱匿或毀損帳冊文件
(assert (= conceal_or_destroy_documents_penalty conceal_or_destroy_documents))

; [insurance:no_response_or_false_response_penalty] 無故不答復或答復不實
(assert (= no_response_or_false_response_penalty no_response_or_false_response))

; [insurance:late_or_false_report_penalty] 逾期提報或提報不實、不全或未繳查核費用
(assert (= late_or_false_report_penalty late_or_false_report))

; [insurance:related_financial_institution_penalty] 關係企業或金融機構怠於提供資料
(assert (= related_financial_institution_penalty
   related_financial_institution_fail_provide))

; [meta:penalty_conditions_inspection] 處罰條件：違反檢查相關規定時處罰
(assert (= penalty
   (or refuse_inspection_penalty
       conceal_or_destroy_documents_penalty
       late_or_false_report_penalty
       related_financial_institution_penalty
       no_response_or_false_response_penalty)))

; [insurance:violate_148_1_2_penalty] 違反第一百四十八條之一第一項或第二項規定
(assert (= violate_148_1_2_penalty violate_148_1_2))

; [insurance:violate_148_2_1_penalty] 違反第一百四十八條之二第一項規定
(assert (= violate_148_2_1_penalty violate_148_2_1))

; [insurance:violate_148_2_2_penalty] 違反第一百四十八條之二第二項規定
(assert (= violate_148_2_2_penalty violate_148_2_2))

; [insurance:violate_148_3_1_penalty] 違反第一百四十八條之三第一項規定，未建立或未執行內部控制或稽核制度
(assert (= violate_148_3_1_penalty violate_148_3_1))

; [insurance:violate_148_3_2_penalty] 違反第一百四十八條之三第二項規定，未建立或未執行內部處理制度或程序
(assert (= violate_148_3_2_penalty violate_148_3_2))

; [meta:penalty_conditions_violation] 處罰條件：違反相關法條規定時處罰
(assert (= penalty
   (or violate_148_1_2_penalty
       violate_148_2_1_penalty
       violate_148_2_2_penalty
       violate_148_3_1_penalty
       violate_148_3_2_penalty)))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= conceal_or_destroy_documents true))
(assert (= violate_148_1_2 true))
(assert (= violate_148_2_1 false))
(assert (= violate_148_2_2 false))
(assert (= violate_148_3_1 false))
(assert (= violate_148_3_2 false))
(assert (= refuse_inspection false))
(assert (= no_response_or_false_response false))
(assert (= late_or_false_report false))
(assert (= related_financial_institution_fail_provide false))
(assert (= capital_adequacy_ratio 150.0))
(assert (= net_worth 1000000.0))
(assert (= net_worth_ratio 3.0))
(assert (= net_worth_ratio_prev 3.0))
(assert (= improvement_plan_submitted false))
(assert (= improvement_plan_executed false))
(assert (= capital_severely_insufficient_measures_executed_flag false))
(assert (= capital_significantly_insufficient_measures_executed_flag false))
(assert (= capital_insufficient_measures_executed false))
(assert (= capital_level 0))
(assert (= capital_level_net_worth 0.0))
(assert (= capital_severely_insufficient_measures_executed false))
(assert (= capital_significantly_insufficient_measures_executed false))
(assert (= conceal_or_destroy_documents_penalty false))
(assert (= insufficient_and_no_measures false))
(assert (= late_or_false_report_penalty false))
(assert (= no_response_or_false_response_penalty false))
(assert (= penalty false))
(assert (= refuse_inspection_penalty false))
(assert (= related_financial_institution_penalty false))
(assert (= severe_insufficient_and_no_measures false))
(assert (= significant_insufficient_and_no_measures false))
(assert (= violate_148_1_2_penalty false))
(assert (= violate_148_2_1_penalty false))
(assert (= violate_148_2_2_penalty false))
(assert (= violate_148_3_1_penalty false))
(assert (= violate_148_3_2_penalty false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 24
; Total variables: 37
; Total facts: 37
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

; SMT2 file generated from compliance case automatic
; Case ID: case_37
; Generated at: 2025-10-19T06:16:13.713308
;
; This file can be executed with Z3:
;   z3 case_37.smt2
;

(set-logic ALL)

; ============================================================
; Variable Declarations
; ============================================================

(declare-const behavior_37_10_flag Bool)
(declare-const behavior_37_11_flag Bool)
(declare-const behavior_37_12_flag Bool)
(declare-const behavior_37_13_flag Bool)
(declare-const behavior_37_14_flag Bool)
(declare-const behavior_37_15_flag Bool)
(declare-const behavior_37_16_flag Bool)
(declare-const behavior_37_17_flag Bool)
(declare-const behavior_37_18_flag Bool)
(declare-const behavior_37_19_flag Bool)
(declare-const behavior_37_1_flag Bool)
(declare-const behavior_37_20_flag Bool)
(declare-const behavior_37_21_flag Bool)
(declare-const behavior_37_22_flag Bool)
(declare-const behavior_37_2_flag Bool)
(declare-const behavior_37_3_flag Bool)
(declare-const behavior_37_4_flag Bool)
(declare-const behavior_37_5_flag Bool)
(declare-const behavior_37_6_flag Bool)
(declare-const behavior_37_7_flag Bool)
(declare-const behavior_37_8_flag Bool)
(declare-const behavior_37_9_flag Bool)
(declare-const honest_and_credit_principle Bool)
(declare-const internal_control_compliant Bool)
(declare-const internal_control_established Bool)
(declare-const internal_control_established_flag Bool)
(declare-const internal_control_executed Bool)
(declare-const internal_control_updated Bool)
(declare-const internal_control_updated_flag Bool)
(declare-const penalty Bool)
(declare-const prohibited_behavior_37_1 Bool)
(declare-const prohibited_behavior_37_10 Bool)
(declare-const prohibited_behavior_37_11 Bool)
(declare-const prohibited_behavior_37_12 Bool)
(declare-const prohibited_behavior_37_13 Bool)
(declare-const prohibited_behavior_37_14 Bool)
(declare-const prohibited_behavior_37_15 Bool)
(declare-const prohibited_behavior_37_16 Bool)
(declare-const prohibited_behavior_37_17 Bool)
(declare-const prohibited_behavior_37_18 Bool)
(declare-const prohibited_behavior_37_19 Bool)
(declare-const prohibited_behavior_37_2 Bool)
(declare-const prohibited_behavior_37_20 Bool)
(declare-const prohibited_behavior_37_21 Bool)
(declare-const prohibited_behavior_37_22 Bool)
(declare-const prohibited_behavior_37_3 Bool)
(declare-const prohibited_behavior_37_4 Bool)
(declare-const prohibited_behavior_37_5 Bool)
(declare-const prohibited_behavior_37_6 Bool)
(declare-const prohibited_behavior_37_7 Bool)
(declare-const prohibited_behavior_37_8 Bool)
(declare-const prohibited_behavior_37_9 Bool)
(declare-const responsible_person_behavior_10_flag Bool)
(declare-const responsible_person_behavior_11_flag Bool)
(declare-const responsible_person_behavior_12_flag Bool)
(declare-const responsible_person_behavior_13_flag Bool)
(declare-const responsible_person_behavior_14_flag Bool)
(declare-const responsible_person_behavior_15_flag Bool)
(declare-const responsible_person_behavior_16_flag Bool)
(declare-const responsible_person_behavior_17_flag Bool)
(declare-const responsible_person_behavior_18_flag Bool)
(declare-const responsible_person_behavior_19_flag Bool)
(declare-const responsible_person_behavior_1_flag Bool)
(declare-const responsible_person_behavior_20_flag Bool)
(declare-const responsible_person_behavior_21_flag Bool)
(declare-const responsible_person_behavior_22_flag Bool)
(declare-const responsible_person_behavior_23_flag Bool)
(declare-const responsible_person_behavior_24_flag Bool)
(declare-const responsible_person_behavior_2_flag Bool)
(declare-const responsible_person_behavior_3_flag Bool)
(declare-const responsible_person_behavior_4_flag Bool)
(declare-const responsible_person_behavior_5_flag Bool)
(declare-const responsible_person_behavior_6_flag Bool)
(declare-const responsible_person_behavior_7_flag Bool)
(declare-const responsible_person_behavior_8_flag Bool)
(declare-const responsible_person_behavior_9_flag Bool)
(declare-const responsible_person_honest Bool)
(declare-const responsible_person_prohibited_1 Bool)
(declare-const responsible_person_prohibited_10 Bool)
(declare-const responsible_person_prohibited_11 Bool)
(declare-const responsible_person_prohibited_12 Bool)
(declare-const responsible_person_prohibited_13 Bool)
(declare-const responsible_person_prohibited_14 Bool)
(declare-const responsible_person_prohibited_15 Bool)
(declare-const responsible_person_prohibited_16 Bool)
(declare-const responsible_person_prohibited_17 Bool)
(declare-const responsible_person_prohibited_18 Bool)
(declare-const responsible_person_prohibited_19 Bool)
(declare-const responsible_person_prohibited_2 Bool)
(declare-const responsible_person_prohibited_20 Bool)
(declare-const responsible_person_prohibited_21 Bool)
(declare-const responsible_person_prohibited_22 Bool)
(declare-const responsible_person_prohibited_23 Bool)
(declare-const responsible_person_prohibited_24 Bool)
(declare-const responsible_person_prohibited_3 Bool)
(declare-const responsible_person_prohibited_4 Bool)
(declare-const responsible_person_prohibited_5 Bool)
(declare-const responsible_person_prohibited_6 Bool)
(declare-const responsible_person_prohibited_7 Bool)
(declare-const responsible_person_prohibited_8 Bool)
(declare-const responsible_person_prohibited_9 Bool)
(declare-const violation_178_1_1 Bool)
(declare-const violation_178_1_1_flag Bool)
(declare-const violation_178_1_2 Bool)
(declare-const violation_178_1_2_flag Bool)
(declare-const violation_178_1_3 Bool)
(declare-const violation_178_1_3_flag Bool)
(declare-const violation_178_1_4 Bool)
(declare-const violation_178_1_5 Bool)
(declare-const violation_178_1_5_flag Bool)
(declare-const violation_178_1_6 Bool)
(declare-const violation_178_1_6_flag Bool)
(declare-const violation_178_1_7 Bool)
(declare-const violation_178_1_7_flag Bool)
(declare-const violation_56 Bool)
(declare-const violation_56_flag Bool)
(declare-const violation_mild Bool)

; ============================================================
; Constraints (Legal Rules)
; ============================================================

; [securities:violation_178_1_1] 違反證券交易法第14條第3項、第14條之一第1項、第14條之一第3項、第21條之一第5項、第58條、第61條、第69條第1項、第79條、第141條、第144條、第145條第2項、第147條、第152條、第159條、第165條之一或第165條之二準用相關規定
(assert (= violation_178_1_1 violation_178_1_1_flag))

; [securities:violation_178_1_2] 未依主管機關命令提出帳簿、表冊、文件或其他資料，或規避、妨礙、拒絕檢查
(assert (= violation_178_1_2 violation_178_1_2_flag))

; [securities:violation_178_1_3] 未依規定製作、申報、公告、備置或保存帳簿、表冊、傳票、財務報告或其他業務文件
(assert (= violation_178_1_3 violation_178_1_3_flag))

; [securities:violation_178_1_4] 證券商或第十八條第一項事業未確實執行內部控制制度
(assert (not (= internal_control_executed violation_178_1_4)))

; [securities:violation_178_1_5] 第十八條第一項事業違反同條第二項規則有關財務、業務或管理規定
(assert (= violation_178_1_5 violation_178_1_5_flag))

; [securities:violation_178_1_6] 證券商違反第22條第4項、第44條第4項、第60條第2項、第62條第2項、第70條有關財務、業務或管理規定
(assert (= violation_178_1_6 violation_178_1_6_flag))

; [securities:violation_178_1_7] 證券櫃檯買賣中心違反第62條第2項規定、證券商同業公會違反第90條規定、證券交易所違反第93條、第95條、第102條規定有關財務、業務或管理規定
(assert (= violation_178_1_7 violation_178_1_7_flag))

; [securities:violation_56] 證券商董事、監察人及受僱人違反法令影響業務正常執行
(assert (= violation_56 violation_56_flag))

; [securities:internal_control_established] 證券商依規定建立內部控制制度
(assert (= internal_control_established internal_control_established_flag))

; [securities:internal_control_updated] 內部控制制度於限期內完成變更
(assert (= internal_control_updated internal_control_updated_flag))

; [securities:internal_control_compliant] 證券商內部控制制度符合經營法令、章程及相關規定
(assert (= internal_control_compliant
   (and internal_control_established
        internal_control_updated
        internal_control_executed)))

; [securities:prohibited_behavior_37_1] 證券商不得提供有價證券漲跌判斷以勸誘客戶買賣
(assert (not (= behavior_37_1_flag prohibited_behavior_37_1)))

; [securities:prohibited_behavior_37_2] 證券商不得約定或提供特定利益或負擔損失以勸誘客戶買賣
(assert (not (= behavior_37_2_flag prohibited_behavior_37_2)))

; [securities:prohibited_behavior_37_3] 證券商不得提供帳戶供客戶申購、買賣有價證券
(assert (not (= behavior_37_3_flag prohibited_behavior_37_3)))

; [securities:prohibited_behavior_37_4] 證券商不得對客戶提供虛偽、詐騙或足致他人誤信之有價證券資訊
(assert (not (= behavior_37_4_flag prohibited_behavior_37_4)))

; [securities:prohibited_behavior_37_5] 證券商不得接受客戶對買賣有價證券之種類、數量、價格及買進或賣出之全權委託
(assert (not (= behavior_37_5_flag prohibited_behavior_37_5)))

; [securities:prohibited_behavior_37_6] 證券商不得接受客戶以同一帳戶為同種有價證券買進與賣出或賣出與買進相抵之交割（不含37-1規定例外）
(assert (not (= behavior_37_6_flag prohibited_behavior_37_6)))

; [securities:prohibited_behavior_37_7] 證券商不得接受客戶以不同帳戶為同一種有價證券買進與賣出或賣出與買進相抵之交割
(assert (not (= behavior_37_7_flag prohibited_behavior_37_7)))

; [securities:prohibited_behavior_37_8] 證券商不得於營業場所外設置固定場所接受有價證券買賣委託
(assert (not (= behavior_37_8_flag prohibited_behavior_37_8)))

; [securities:prohibited_behavior_37_9] 證券商不得於營業場所外設置固定場所辦理受託契約或有價證券買賣交割
(assert (not (= behavior_37_9_flag prohibited_behavior_37_9)))

; [securities:prohibited_behavior_37_10] 證券商不得受理未辦妥受託契約之客戶買賣有價證券
(assert (not (= behavior_37_10_flag prohibited_behavior_37_10)))

; [securities:prohibited_behavior_37_11] 證券商不得受理本公司董事、監察人、受僱人代理他人開戶、申購、買賣或交割有價證券
(assert (not (= behavior_37_11_flag prohibited_behavior_37_11)))

; [securities:prohibited_behavior_37_12] 證券商不得受理非本人開戶（本會另有規定除外）
(assert (not (= behavior_37_12_flag prohibited_behavior_37_12)))

; [securities:prohibited_behavior_37_13] 證券商不得受理非本人或未具客戶委任書之代理人申購、買賣或交割有價證券（特定三方契約除外）
(assert (not (= behavior_37_13_flag prohibited_behavior_37_13)))

; [securities:prohibited_behavior_37_14] 證券商知悉客戶利用未公開重大消息或操縱市場意圖仍接受委託買賣
(assert (not (= behavior_37_14_flag prohibited_behavior_37_14)))

; [securities:prohibited_behavior_37_15] 證券商利用客戶名義或帳戶申購、買賣有價證券
(assert (not (= behavior_37_15_flag prohibited_behavior_37_15)))

; [securities:prohibited_behavior_37_16] 證券商非依法令所為之查詢洩露客戶委託事項及業務秘密
(assert (not (= behavior_37_16_flag prohibited_behavior_37_16)))

; [securities:prohibited_behavior_37_17] 證券商挪用客戶有價證券或款項
(assert (not (= behavior_37_17_flag prohibited_behavior_37_17)))

; [securities:prohibited_behavior_37_18] 證券商代客戶保管有價證券、款項、印鑑或存摺
(assert (= prohibited_behavior_37_18 behavior_37_18_flag))

; [securities:prohibited_behavior_37_19] 證券商未經本會核准辦理有價證券買賣之融資或融券，提供款項或有價證券供客戶交割
(assert (not (= behavior_37_19_flag prohibited_behavior_37_19)))

; [securities:prohibited_behavior_37_20] 證券商違反對證券交易市場之交割義務
(assert (not (= behavior_37_20_flag prohibited_behavior_37_20)))

; [securities:prohibited_behavior_37_21] 證券商利用非證券商人員招攬業務或給付不合理佣金
(assert (not (= behavior_37_21_flag prohibited_behavior_37_21)))

; [securities:prohibited_behavior_37_22] 證券商其他違反證券管理法令或本會規定應為或不得為之行為
(assert (not (= behavior_37_22_flag prohibited_behavior_37_22)))

; [securities:responsible_person_honest] 證券商負責人及業務人員執行業務應本誠實及信用原則
(assert (= responsible_person_honest honest_and_credit_principle))

; [securities:responsible_person_prohibited_1] 負責人及業務人員不得以職務消息從事上市或上櫃有價證券買賣交易活動
(assert (not (= responsible_person_behavior_1_flag responsible_person_prohibited_1)))

; [securities:responsible_person_prohibited_2] 負責人及業務人員不得非依法令查詢洩漏客戶委託事項及其他秘密
(assert (not (= responsible_person_behavior_2_flag responsible_person_prohibited_2)))

; [securities:responsible_person_prohibited_3] 負責人及業務人員不得受理客戶對買賣有價證券之種類、數量、價格及買進或賣出之全權委託
(assert (not (= responsible_person_behavior_3_flag responsible_person_prohibited_3)))

; [securities:responsible_person_prohibited_4] 負責人及業務人員不得對客戶作贏利保證或分享利益之證券買賣
(assert (not (= responsible_person_behavior_4_flag responsible_person_prohibited_4)))

; [securities:responsible_person_prohibited_5] 負責人及業務人員不得約定與客戶共同承擔買賣有價證券之交易損益
(assert (not (= responsible_person_behavior_5_flag responsible_person_prohibited_5)))

; [securities:responsible_person_prohibited_6] 負責人及業務人員不得同時以自己計算為買入或賣出之相對行為
(assert (not (= responsible_person_behavior_6_flag responsible_person_prohibited_6)))

; [securities:responsible_person_prohibited_7] 負責人及業務人員不得利用客戶名義或帳戶申購、買賣有價證券
(assert (not (= responsible_person_behavior_7_flag responsible_person_prohibited_7)))

; [securities:responsible_person_prohibited_8] 負責人及業務人員不得以他人或親屬名義供客戶申購、買賣有價證券
(assert (not (= responsible_person_behavior_8_flag responsible_person_prohibited_8)))

; [securities:responsible_person_prohibited_9] 負責人及業務人員不得與客戶有借貸款項、有價證券或為借貸媒介
(assert (not (= responsible_person_behavior_9_flag responsible_person_prohibited_9)))

; [securities:responsible_person_prohibited_10] 負責人及業務人員辦理承銷或買賣有價證券時有隱瞞、詐欺或足以致人誤信行為
(assert (not (= responsible_person_behavior_10_flag responsible_person_prohibited_10)))

; [securities:responsible_person_prohibited_11] 負責人及業務人員挪用或代客戶保管有價證券、款項、印鑑或存摺
(assert (not (= responsible_person_behavior_11_flag responsible_person_prohibited_11)))

; [securities:responsible_person_prohibited_12] 負責人及業務人員受理未辦妥受託契約之客戶買賣有價證券
(assert (not (= responsible_person_behavior_12_flag responsible_person_prohibited_12)))

; [securities:responsible_person_prohibited_13] 負責人及業務人員未依據客戶委託事項及條件執行有價證券買賣
(assert (not (= responsible_person_behavior_13_flag responsible_person_prohibited_13)))

; [securities:responsible_person_prohibited_14] 負責人及業務人員向客戶或不特定多數人提供有價證券漲跌判斷以勸誘買賣
(assert (not (= responsible_person_behavior_14_flag responsible_person_prohibited_14)))

; [securities:responsible_person_prohibited_15] 負責人及業務人員向不特定多數人推介買賣特定股票（承銷有價證券除外）
(assert (not (= responsible_person_behavior_15_flag responsible_person_prohibited_15)))

; [securities:responsible_person_prohibited_16] 負責人及業務人員接受客戶以同一或不同帳戶為同種有價證券買賣相抵交割（信用交易資券相抵及同日現券相抵除外）
(assert (not (= responsible_person_behavior_16_flag responsible_person_prohibited_16)))

; [securities:responsible_person_prohibited_17] 負責人及業務人員代理他人開戶、申購、買賣或交割有價證券（法定代理人除外）
(assert (not (= responsible_person_behavior_17_flag responsible_person_prohibited_17)))

; [securities:responsible_person_prohibited_18] 負責人及業務人員受理本公司董事、監察人、受僱人代理他人開戶、申購、買賣或交割有價證券
(assert (not (= responsible_person_behavior_18_flag responsible_person_prohibited_18)))

; [securities:responsible_person_prohibited_19] 負責人及業務人員受理非本人開戶（本會另有規定除外）
(assert (not (= responsible_person_behavior_19_flag responsible_person_prohibited_19)))

; [securities:responsible_person_prohibited_20] 負責人及業務人員受理非本人或未具客戶委任書之代理人申購、買賣或交割有價證券（特定三方契約除外）
(assert (not (= responsible_person_behavior_20_flag responsible_person_prohibited_20)))

; [securities:responsible_person_prohibited_21] 負責人及業務人員知悉客戶利用未公開重大消息或操縱市場行為仍接受委託買賣
(assert (not (= responsible_person_behavior_21_flag responsible_person_prohibited_21)))

; [securities:responsible_person_prohibited_22] 負責人及業務人員辦理有價證券承銷業務人員與發行公司或相關人員有獲取不當利益約定
(assert (not (= responsible_person_behavior_22_flag responsible_person_prohibited_22)))

; [securities:responsible_person_prohibited_23] 負責人及業務人員招攬、媒介、促銷未經核准有價證券或衍生性商品
(assert (not (= responsible_person_behavior_23_flag responsible_person_prohibited_23)))

; [securities:responsible_person_prohibited_24] 負責人及業務人員其他違反證券管理法令或本會規定不得為之行為
(assert (not (= responsible_person_behavior_24_flag responsible_person_prohibited_24)))

; [meta:penalty_default_false] 預設不處罰
(assert (not penalty))

; [meta:penalty_conditions] 處罰條件：違反證券交易法第178-1條各款規定或第56條規定，且情節非輕微時處罰
(assert (= penalty
   (and (or violation_178_1_1
            violation_178_1_2
            violation_178_1_3
            violation_178_1_4
            violation_178_1_5
            violation_178_1_6
            violation_178_1_7
            violation_56)
        (not violation_mild))))

; ============================================================
; Facts (Case Specific)
; ============================================================

(assert (= violation_178_1_4 true))
(assert (= internal_control_executed false))
(assert (= violation_178_1_1 true))
(assert (= violation_56 true))
(assert (= behavior_37_3_flag true))
(assert (= responsible_person_behavior_9_flag true))
(assert (= responsible_person_prohibited_9 true))
(assert (= responsible_person_prohibited_7 true))
(assert (= responsible_person_behavior_7_flag true))
(assert (= violation_mild false))
(assert (= penalty true))
(assert (= internal_control_established true))
(assert (= internal_control_updated false))
(assert (= internal_control_established_flag true))
(assert (= internal_control_updated_flag false))
(assert (= internal_control_compliant false))
(assert (= honest_and_credit_principle false))
(assert (= responsible_person_honest false))
(assert (= behavior_37_1_flag false))
(assert (= behavior_37_2_flag false))
(assert (= behavior_37_4_flag false))
(assert (= behavior_37_5_flag false))
(assert (= behavior_37_6_flag false))
(assert (= behavior_37_7_flag false))
(assert (= behavior_37_8_flag false))
(assert (= behavior_37_9_flag false))
(assert (= behavior_37_10_flag false))
(assert (= behavior_37_11_flag false))
(assert (= behavior_37_12_flag false))
(assert (= behavior_37_13_flag false))
(assert (= behavior_37_14_flag false))
(assert (= behavior_37_15_flag false))
(assert (= behavior_37_16_flag false))
(assert (= behavior_37_17_flag false))
(assert (= behavior_37_18_flag false))
(assert (= behavior_37_19_flag false))
(assert (= behavior_37_20_flag false))
(assert (= behavior_37_21_flag false))
(assert (= behavior_37_22_flag false))
(assert (= responsible_person_behavior_1_flag false))
(assert (= responsible_person_behavior_2_flag false))
(assert (= responsible_person_behavior_3_flag false))
(assert (= responsible_person_behavior_4_flag false))
(assert (= responsible_person_behavior_5_flag false))
(assert (= responsible_person_behavior_6_flag false))
(assert (= responsible_person_behavior_8_flag false))
(assert (= responsible_person_behavior_10_flag false))
(assert (= responsible_person_behavior_11_flag false))
(assert (= responsible_person_behavior_12_flag false))
(assert (= responsible_person_behavior_13_flag false))
(assert (= responsible_person_behavior_14_flag false))
(assert (= responsible_person_behavior_15_flag false))
(assert (= responsible_person_behavior_16_flag false))
(assert (= responsible_person_behavior_17_flag false))
(assert (= responsible_person_behavior_18_flag false))
(assert (= responsible_person_behavior_19_flag false))
(assert (= responsible_person_behavior_20_flag false))
(assert (= responsible_person_behavior_21_flag false))
(assert (= responsible_person_behavior_22_flag false))
(assert (= responsible_person_behavior_23_flag false))
(assert (= responsible_person_behavior_24_flag false))
(assert (= responsible_person_prohibited_1 false))
(assert (= responsible_person_prohibited_2 false))
(assert (= responsible_person_prohibited_3 false))
(assert (= responsible_person_prohibited_4 false))
(assert (= responsible_person_prohibited_5 false))
(assert (= responsible_person_prohibited_6 false))
(assert (= responsible_person_prohibited_8 false))
(assert (= responsible_person_prohibited_10 false))
(assert (= responsible_person_prohibited_11 false))
(assert (= responsible_person_prohibited_12 false))
(assert (= responsible_person_prohibited_13 false))
(assert (= responsible_person_prohibited_14 false))
(assert (= responsible_person_prohibited_15 false))
(assert (= responsible_person_prohibited_16 false))
(assert (= responsible_person_prohibited_17 false))
(assert (= responsible_person_prohibited_18 false))
(assert (= responsible_person_prohibited_19 false))
(assert (= responsible_person_prohibited_20 false))
(assert (= responsible_person_prohibited_21 false))
(assert (= responsible_person_prohibited_22 false))
(assert (= responsible_person_prohibited_23 false))
(assert (= responsible_person_prohibited_24 false))
(assert (= prohibited_behavior_37_1 false))
(assert (= prohibited_behavior_37_2 false))
(assert (= prohibited_behavior_37_3 true))
(assert (= prohibited_behavior_37_4 false))
(assert (= prohibited_behavior_37_5 false))
(assert (= prohibited_behavior_37_6 false))
(assert (= prohibited_behavior_37_7 false))
(assert (= prohibited_behavior_37_8 false))
(assert (= prohibited_behavior_37_9 false))
(assert (= prohibited_behavior_37_10 false))
(assert (= prohibited_behavior_37_11 false))
(assert (= prohibited_behavior_37_12 false))
(assert (= prohibited_behavior_37_13 false))
(assert (= prohibited_behavior_37_14 false))
(assert (= prohibited_behavior_37_15 false))
(assert (= prohibited_behavior_37_16 false))
(assert (= prohibited_behavior_37_17 false))
(assert (= prohibited_behavior_37_18 false))
(assert (= prohibited_behavior_37_19 false))
(assert (= prohibited_behavior_37_20 false))
(assert (= prohibited_behavior_37_21 false))
(assert (= prohibited_behavior_37_22 false))
(assert (= violation_178_1_1_flag true))
(assert (= violation_178_1_2_flag false))
(assert (= violation_178_1_3_flag false))
(assert (= violation_178_1_5_flag false))
(assert (= violation_178_1_6_flag false))
(assert (= violation_178_1_7_flag false))
(assert (= violation_56_flag true))
(assert (= violation_178_1_2 false))
(assert (= violation_178_1_3 false))
(assert (= violation_178_1_5 false))
(assert (= violation_178_1_6 false))
(assert (= violation_178_1_7 false))

; ============================================================
; Check Satisfiability
; ============================================================

(check-sat)
(get-model)

; ============================================================
; Additional Information
; ============================================================
; Total constraints: 60
; Total variables: 117
; Total facts: 117
;
; Expected result:
;   - If UNSAT: Case violates legal rules
;   - If SAT: Case complies with legal rules (or error in constraints)

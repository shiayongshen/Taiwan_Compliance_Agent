from autogen import AssistantAgent

ENCODER_SYS_PROMPT = """你是【SMT 編碼器】。你將拿到：
- ConstraintSpec[]：每條有 id/desc/expr(S-expr)
- VarSpec[] 與 facts

請產出 Z3 片段（Python）或回傳 IR，以利落地。
**此階段只生成 constraint，不做最小違反集合。**"""

def make_smt_encoder(llm_config):
    return AssistantAgent(
        name="SMTEncoder",
        system_message=ENCODER_SYS_PROMPT,
        llm_config=llm_config,
    )

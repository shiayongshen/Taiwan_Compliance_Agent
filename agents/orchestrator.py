from autogen import AssistantAgent
from .statute_parser import make_statute_parser
from .case_mapper import make_case_mapper
from .smt_encoder import make_smt_encoder

def build_team(llm_config):
    return {
        "parser": make_statute_parser(llm_config),
        "mapper": make_case_mapper(llm_config),
        "encoder": make_smt_encoder(llm_config),
        "orchestrator": AssistantAgent(
            name="Orchestrator",
            system_message="你是總控：依序呼叫 StatuteParser 與 CaseMapper，最後交給 SMTEncoder。",
            llm_config=llm_config,
        )
    }

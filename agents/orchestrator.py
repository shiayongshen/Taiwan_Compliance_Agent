from autogen import AssistantAgent
from .statute_parser import make_statute_parser
from .case_mapper import make_case_mapper
from .smt_encoder import make_smt_encoder
from .solver import build_solver

def build_team(llm_config):
    return {
        "parser": make_statute_parser(llm_config),
        "mapper": make_case_mapper(llm_config),
        "orchestrator": AssistantAgent(
            name="Orchestrator",
            system_message="你是總控：依序呼叫 StatuteParser 與 CaseMapper",
            llm_config=llm_config,
        )
    }
